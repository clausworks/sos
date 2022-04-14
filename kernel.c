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

void printk_demo() {
   char *s1 = "Hello ";
   char *s2 = "World!";
   printk("Integer: %d\n", 0xFFFFFFFF);
   printk("Integer: %d\n", 0x123);
   printk("Unsigned: %u\n", 0xFFFFFFFF);
   printk("Hex: %x\n\n", 0xFFFFFFFF);
   printk("Hex: %x\n\n", 0xABCD);

   printk("Character: %c, %c, %c\n", 'a', '\t', 'B');
   printk("String:\n\t(s1) %s\n\t(s2) %s\n", s1, s2);
   printk("Pointer: (s1) %p, (s2), %p\n\n", s1, s2);

   printk("SHORT\n");
   printk("\tInteger: %hd\n", 0x8000);
   printk("\tInteger: %hd\n", 0x80000);
   printk("\tUnsigned: %hu\n", 0x8000);
   printk("\tHex: %hx\n\n", 0xABCDE);
   printk("\tHex: %hx\n\n", 0xAB);
}

void printk_demo2() {
   printk("LONG\n");
   printk("\tInteger: %ld\n", 0xABCD1234567890EF);
   printk("\tUnsigned: %lu\n", 0xABCD1234567890EF);
   printk("\tHex: %lx\n\n", 0xABCD1234567890EF);

   printk("QUAD\n");
   printk("\tInteger: %qd\n", 0xABCD1234567890EFLL);
   printk("\tUnsigned: %qu\n", 0xABCD1234567890EFLL);
   printk("\tHex: %qx\n\n", 0xABCD1234567890EFLL);

   printk("%s went to the store at %hu Main Street" 
      " to buy %d gallons of 2%% milk.", 
      "Bobby", 12, 2);

/*
   printk("BINARY:\n");
   printk("short: %hb\n", 0xFFFF);
   printk("regular: %hb\n", 0x55553333);
   printk("long: %lb\n", 0x1234567890ABCDEF);
   */
}

extern void kmain() {
/*
   int _cont = 0;
   while (!_cont);
*/

   /*
   init_msg();
   */

   vga_clear();
   /*
   printk_demo();
   printk_demo2();
   */


   /* Demonstrate scrolling */
   for (int i = 0; i < VGA_H; ++i) {
      printk("%d\t\t\t\t\t\t\t%c\n", i, 'A' + i);
   }
   printk("new line...\n");

   
   while (1) {
      asm("hlt");
   }
}
