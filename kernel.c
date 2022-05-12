#include "vga.h"
#include "memory.h"
#include "ps2.h"
#include "interrupt.h"

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
   /*KeyPacket kp;*/
/*
   int _cont = 0;
   while (!_cont);
   */

   irq_init();

   init_msg();

   ps2_init();
   kb_init();
   printk("\n\n");

   /* Enable interrupts */
   STI;

   /*
   while (1) {
      if (get_key(&kp)) {
         if (kp.pressed && kp.ascii) {
            printk("%c", kp.ascii);
         }
      }
   }
   */

   while (1) {
      asm("hlt");
   }
}
