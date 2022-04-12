#include "vga.h"
#include "memory.h"

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
/*
   int _cont = 0;
   while (!_cont);
*/

   /*
   init_msg();
   */

   for (int i = 0; i < VGA_H; ++i) {
      printk("%d\t\t\t\t\t\t\t%c\n", i, 'A' + i);
   }

   printk("new line...\n");

   
   while (1) {
      asm("hlt");
   }
}
