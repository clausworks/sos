#include "kernel.h"
#include "memory.h"
#include "memalloc.h"
#include "interrupt.h"
#include "isr.h"
#include "io.h"
#include "ps2.h"
#include "proc.h"
#include <stdint-gcc.h>

IDTEntry global_idt[IDT_NUM_ENTRIES];
IRQEntry c_idt[IDT_NUM_ENTRIES];

TSS tss;
uint64_t alt_stack_df[ALT_STACK_WORDS] = {0};
uint64_t alt_stack_gp[ALT_STACK_WORDS] = {0};
uint64_t alt_stack_pf[ALT_STACK_WORDS] = {0};
uint64_t alt_stack_exit[ALT_STACK_WORDS] = {0};

void *syscall_table[NUM_SYSCALLS];


/* osdev.org PIC remap: https://wiki.osdev.org/PIC */
void remap_pic(int offset1, int offset2) {
   unsigned char a1, a2;

   a1 = inb(PIC1_DATA);
   a2 = inb(PIC2_DATA);

   outb(PIC1_COMMAND, ICW1_INIT | ICW1_ICW4);
   io_wait();
   outb(PIC2_COMMAND, ICW1_INIT | ICW1_ICW4);
   io_wait();
   outb(PIC1_DATA, offset1);
   io_wait();
   outb(PIC2_DATA, offset2);
   io_wait();
   outb(PIC1_DATA, 4);
   io_wait();
   outb(PIC2_DATA, 2);
   io_wait();

   outb(PIC1_DATA, ICW4_8086);
   io_wait();
   outb(PIC2_DATA, ICW4_8086);
   io_wait();

   outb(PIC1_DATA, a1);
   outb(PIC2_DATA, a2);
}

void tss_init() {
   uint64_t tss_addr = (uint64_t)&tss;
   uint64_t *gdt = (uint64_t *)&gdt64;
   TSSDescriptor *tss_desc = (TSSDescriptor *)(gdt + TSS_GDT_INDEX);

   /* TSS Selector */
   TSSSelector tss_sel = {0};
   tss_sel.index = TSS_GDT_INDEX;

   /* TSS Descriptor */
   memset(tss_desc, 0, sizeof(TSSDescriptor));
   tss_desc->type = TSS_DESC_TYPE;
   tss_desc->present = 1;
   tss_desc->seg_lim_15_0 = (sizeof(TSS) - 1) & 0xFFFF;
   tss_desc->seg_lim_19_16 = ((sizeof(TSS) - 1) >> 16) & 0xF;
   tss_desc->base_addr_15_0 = tss_addr & 0xFFFF;
   tss_desc->base_addr_23_16 = (tss_addr >> 16) & 0xFF;
   tss_desc->base_addr_31_24 = (tss_addr >> 24) & 0xFF;
   tss_desc->base_addr_63_32 = (tss_addr >> 32) & 0xFFFFFFFF;

   /* TSS */
   memset(&tss, 0, sizeof(TSS));
   tss.ist[IST_DF - 1] = (uint64_t)(alt_stack_df + ALT_STACK_WORDS - 1);
   tss.ist[IST_GP - 1] = (uint64_t)(alt_stack_gp + ALT_STACK_WORDS - 1);
   tss.ist[IST_PF - 1] = (uint64_t)(alt_stack_pf + ALT_STACK_WORDS - 1);
   tss.iomap_base = sizeof(TSS) - 2;

   /* Enable */
   asm("ltr %0" :: "m"(tss_sel));
}

void irq_init() {
   int i;
   IDTR idtr = {0};
   uint64_t addr;

   /* Disable interrupts */
   CLI;

   /* Remap PIC interrupts */
   remap_pic(INT_PIC1_BASE, INT_PIC2_BASE); 

   /* Create global IDT */
   memset(global_idt, 0, sizeof(IDTEntry) * IDT_NUM_ENTRIES);
   for (i = 0; i < IDT_NUM_ENTRIES; ++i) {
      addr = (uint64_t)asm_isr_offsets[i];
      global_idt[i].type = IDT_TYPE_INTGATE;
      global_idt[i].present = 1;
      global_idt[i].target = CODE_SEG_SELECTOR; /* MAGIC NUMBER */
      global_idt[i].offset_15_0 = 0xFFFF & addr;
      global_idt[i].offset_31_16 = 0xFFFF & (addr >> 16);
      global_idt[i].offset_63_32 = 0xFFFFFFFF & (addr >> 32);
   }

   /* Set IST entries for special stacks */
   global_idt[EXC_DF].ist = IST_DF;
   global_idt[EXC_GP].ist = IST_GP;
   global_idt[EXC_PF].ist = IST_PF;

   /* Disable all PIC interrupts */
   for (i = 0; i < 16; ++i) {
      pic_setmask(i);
   }

   /* Load IDT */
   idtr.base = (uint64_t)global_idt;
   idtr.limit = sizeof(IDTEntry) * IDT_NUM_ENTRIES;
   asm("lidt %0" :: "m"(idtr));

   /* Register interrupt handlers */
   irq_set_handler(EXC_DE, irq_de, NULL);
   irq_set_handler(EXC_DF, irq_df, NULL);
   irq_set_handler(EXC_GP, irq_gp, NULL);

   /* Set up multiple stacks */
   tss_init();
}

void irq_set_handler(int irq, irq_handler_t handler, void *arg) {
   if (irq < 0 || irq >= IDT_NUM_ENTRIES) {
      printk("irq_set_handler: invalid IRQ number (#%d)\n", irq);
   }
   if (handler == NULL) {
      printk("irq_set_handler: null handler (#%d)\n", irq);
   }
   c_idt[irq].handler = handler;
   c_idt[irq].arg = arg;
}

int interrupts_enabled() {
    unsigned long flags;
    asm volatile ( "pushf\n\t"
                   "pop %0"
                   : "=g"(flags) );
    return flags & (1 << 9);
}

/* PIC functions (from OSDev Wiki) */

void pic_eoi(uint8_t irq) {
	if(irq >= 8) {
		outb(PIC2_COMMAND,PIC_EOI);
   }

	outb(PIC1_COMMAND,PIC_EOI);
}

void pic_setmask(uint8_t irq) {
    uint16_t port;
    uint8_t value;

    if(irq < 8) {
        port = PIC1_DATA;
    } else {
        port = PIC2_DATA;
        irq -= 8;
    }
    value = inb(port) | (1 << irq);
    outb(port, value);
}

void pic_clrmask(uint8_t irq) {
    uint16_t port;
    uint8_t value;

    if(irq < 8) {
        port = PIC1_DATA;
    } else {
        port = PIC2_DATA;
        irq -= 8;
    }
    value = inb(port) & ~(1 << irq);
    outb(port, value);
}

/* C interrupt handlers */

void handle_asm_irq(int irq, int err, Context *saved_context) {
   if (cur_proc != NULL) {
      memcpy(&cur_proc->regs, saved_context, sizeof(Context));
   }

   if (irq < 0 || irq >= IDT_NUM_ENTRIES) {
      printk("handle_asm_irq: invalid IRQ number (#%d)\n", irq);
      HLT;
   }
   if (c_idt[irq].handler == NULL) {
      printk("Unhandled interrupt: #%d. Halting CPU.\n", irq);
      HLT;
   }

   c_idt[irq].handler(irq, err, c_idt[irq].arg);
   
   if (cur_proc != NULL && next_proc != NULL && cur_proc != next_proc) {
      memcpy(&cur_proc->regs, &next_proc->regs, sizeof(Context));
   }
}

void irq_de(int irq, int err, void *arg) {
   printk("Divide by zero exception\n");
}

void irq_df(int irq, int err, void *arg) {
   printk("Double fault (error 0x%x)\n", err);
   HLT;
}

void irq_gp(int irq, int err, void *arg) {
   printk("General protection fault (error 0x%x)\n", err);
   HLT;
}

/* System Calls */

void syscall_init() {
   /* Trap stack */
   tss.ist[IST_EXIT - 1] = (uint64_t)(alt_stack_exit + ALT_STACK_WORDS - 1);
   
   /* IDT */
   global_idt[TRAP_EXIT].ist = IST_EXIT;
   global_idt[TRAP_EXIT].type = IDT_TYPE_TRAPGATE;

   irq_set_handler(TRAP_SYSCALL, syscall_handler, NULL);
   printk("syscall_init\n");
}

void register_syscall(int num, void *fn) {
   syscall_table[num] = fn;
}

void syscall_handler(int irq, int err, void *arg) {
   int call_num = cur_proc->regs.r9;  /* r9 set by the system call stub */
   /* TODO: figure out how to pass args */
   printk("about to jump\n");
   asm volatile ("call *%0" :: "dN"(syscall_table[call_num]) :);
   printk("back here!\n");
}
