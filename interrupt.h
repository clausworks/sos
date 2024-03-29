#ifndef INTERRUPTH
#define INTERRUPTH

#include <stdint-gcc.h>
#include "proc.h"

typedef void (*irq_handler_t)(int, int, void *);

typedef struct IDTEntry {
   uint16_t offset_15_0;
   uint16_t target;
   uint16_t ist : 3;
   uint16_t : 5;
   uint16_t type : 4;
   uint16_t : 1;
   uint16_t dpl : 2;
   uint16_t present : 1;
   uint16_t offset_31_16;
   uint32_t offset_63_32;
   uint32_t reserved;
} __attribute__((packed)) IDTEntry;

typedef struct IDTR {
   uint16_t limit;
   uint64_t base;
} __attribute__((packed)) IDTR;

typedef struct IRQHandlerEntry {
   void *arg;
   irq_handler_t handler;
} IRQEntry;

typedef struct TSSSelector {
   uint16_t rpl : 2;
   uint16_t ti : 1;
   uint16_t index : 13;
} __attribute__((packed)) TSSSelector;

typedef struct TSSDescriptor {
   uint16_t seg_lim_15_0;
   uint16_t base_addr_15_0;
   uint8_t base_addr_23_16;
   uint8_t type : 4;
   uint8_t : 1;
   uint8_t dpl : 2;
   uint8_t present : 1;
   uint8_t seg_lim_19_16 : 4;
   uint8_t avl : 1;
   uint8_t : 2;
   uint8_t g : 1;
   uint8_t base_addr_31_24;
   uint32_t base_addr_63_32;
   uint32_t reserved;
} __attribute__((packed)) TSSDescriptor;

typedef struct TSS {
   uint32_t reserved_00;
   uint64_t rsp0;
   uint64_t rsp1;
   uint64_t rsp2;
   uint64_t reserved_1C;
   uint64_t ist[7];
   uint64_t reserved_5C;
   uint16_t reserved_64;
   uint16_t iomap_base;
} __attribute__((packed)) TSS;


#define TSS_DESC_TYPE 9
#define ALT_STACK_WORDS 0x1000
#define TSS_GDT_INDEX 2 

#define IDT_NUM_ENTRIES 256
#define IDT_TYPE_INTGATE 0xE
#define IDT_TYPE_TRAPGATE 0xF

/* Exception vectors */
#define EXC_DE 0
#define EXC_DF 8
#define EXC_GP 13
#define EXC_PF 14
#define TRAP_SYSCALL 0x80
#define TRAP_EXIT 0x81

/* IST Entries */
#define IST_NUM_STACKS 4
#define IST_DF 1
#define IST_GP 2
#define IST_PF 3
#define IST_EXIT 4

/* System calls */
#define NUM_SYSCALLS 16
#define SYSCALL_YIELD 0
/* Note: exit has its own interrupt number */

/* Macros for osdev.org PIC remap function */
#define ICW1_ICW4 0x01d
#define ICW1_SINGLE 0x02
#define ICW1_INTERVAL4 0x04
#define ICW1_LEVEL 0x08
#define ICW1_INIT 0x10
#define ICW4_8086 0x01
#define ICW4_AUTO 0x02
#define ICW4_BUF_SLAVE 0x08
#define ICW4_BUF_MASTER 0x0C
#define ICW4_SFNM 0x10

/* More PIC macros */
#define PIC_EOI 0x20
#define PIC1 0x20 /* IO base address for master PIC */
#define PIC2 0xA0 /* IO base address for slave PIC */
#define PIC1_COMMAND PIC1
#define PIC1_DATA (PIC1+1)
#define PIC2_COMMAND PIC2
#define PIC2_DATA (PIC2+1)

#define INT_PIC1_BASE 0x20
#define INT_PIC2_BASE 0x28

#define CLI asm("cli")
#define STI asm("sti")

#define CLI_COND \
   int _enable_ints = 0;\
   if (interrupts_enabled()) {\
      _enable_ints = 1;\
      CLI;\
   }

#define STI_COND \
   if (_enable_ints) {\
      STI;\
   }

void irq_init(void);
void pic_setmask(uint8_t irq);
void pic_clrmask(uint8_t irq);
void pic_eoi(uint8_t irq);
void handle_asm_irq(int, int, Context *);
int interrupts_enabled(void);

void syscall_init();
void register_syscall(int, void *);
void syscall_handler(int, int, void *);

void irq_set_handler(int irq, irq_handler_t handler, void *arg);

/* Interrupt handlers */
void irq_de(int, int, void *);
void irq_df(int, int, void *);
void irq_gp(int, int, void *);
void irq_kb(int, int, void *);

/* GDT */
extern uint64_t gdt64;

#endif
