#include "kernel.h"
#include "memory.h"
#include "ps2.h"
#include "interrupt.h"
#include "io.h"
#include "memalloc.h"
#include "kmalloc.h"
#include "proc.h"

void init_msg() {
   vga_clear();
   vga_display_str("Welcome to the ", BLUE | BRIGHT);
   vga_display_str("S", RED | BRIGHT);
   vga_display_str("OS ", BLUE | BRIGHT);
   vga_display_str("O", RED |BRIGHT);
   vga_display_str("perating ", BLUE | BRIGHT);
   vga_display_str("S", RED | BRIGHT);
   vga_display_str("ystem", BLUE | BRIGHT);
   vga_display_char('\n', DEFAULT_ATTR);
}

extern void kmain() {
   
   int _cont = 0;
   while (!_cont);
   
   
   CLI;
   
   irq_init();

   init_msg();
   printk("\n\n");

   ps2_init();
   kb_init();
   ser_init();
   mmu_pf_alloc_init();
   mmu_pt_init();
   kmalloc_init();
   /*
   syscall_init();
   proc_init();
   */

   /*
   syscall_init();
   */

   /* Enable interrupts */
   STI;
   /*
   printk("done\n");

   yield();
   */

   /*
   asm("int $0x21"::);
   */


   /*
   _test_kmalloc_basic();
   _test_kmalloc_multipage();
   */

   while (1) {
      HLT;
   }
}
