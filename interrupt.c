#include "kernel.h"
#include "memory.h"
#include "vga.h"
#include "interrupt.h"
#include "isr.h"
#include "io.h"
#include "ps2.h"
#include <stdint-gcc.h>

IDTEntry global_idt[IDT_NUM_ENTRIES];
IRQEntry c_idt[IDT_NUM_ENTRIES];

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

   /* Disable all PIC interrupts except PS/2 controller */
   for (i = 0; i < 8; ++i) {
      pic_setmask(i);
   }
   pic_clrmask(PIC_PS2_LINE);

   /* Load IDT */
   idtr.base = (uint64_t)global_idt;
   idtr.limit = sizeof(IDTEntry) * IDT_NUM_ENTRIES;
   asm("lidt %0" :: "m"(idtr));

   /* Register interrupt handlers */
   irq_set_handler(EXC_DE, irq_de, NULL);
   irq_set_handler(EXC_DF, irq_df, NULL);
   irq_set_handler(EXC_GP, irq_gp, NULL);
   irq_set_handler(EXC_PF, irq_pf, NULL);
   irq_set_handler(INT_PS2, irq_kb, NULL);
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

void handle_asm_irq(int irq, int err) {
   if (irq < 0 || irq >= IDT_NUM_ENTRIES) {
      printk("handle_asm_irq: invalid IRQ number (#%d)\n", irq);
   }
   if (c_idt[irq].handler == NULL) {
      printk("handle_asm_irq: null handler (#%d)\n", irq);
   }

   c_idt[irq].handler(irq, err, c_idt[irq].arg);
}

int interrupts_enabled() {
    unsigned long flags;
    asm volatile ( "pushf\n\t"
                   "pop %0"
                   : "=g"(flags) );
    return flags & (1 << 9);
}

/* PIC functions */

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

void irq_de(int irq, int err, void *arg) {
   printk("Divide by zero exception\n");
}

void irq_df(int irq, int err, void *arg) {
   printk("Double fault (error 0x%x)\n", err);
}

void irq_gp(int irq, int err, void *arg) {
   printk("General protection fault (error 0x%x)\n", err);
}

void irq_pf(int irq, int err, void *arg) {
   printk("Page fault (error 0x%x)\n", err);
}

void irq_kb(int irq, int err, void *arg) {
   KeyPacket kp;
   /*printk("Keyboard interrupt\n");*/
   if (get_key(&kp)) {
      if (kp.pressed && kp.ascii) {
         printk("%c", kp.ascii);
      }
   }
   else {
      printk("get_key failed\n");
   }
   pic_eoi(PIC_PS2_LINE);
}