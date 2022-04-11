#include "vga.h"

extern void kmain() {
   /*
   int _cont = 0;
   while (!_cont);
   */
   vga_clear();
   vga_display_str("Hello world", BLUE | BRIGHT, 250);

   while (1) {
      asm("hlt");
   }
}
