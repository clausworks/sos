ENTRY(start)

SECTIONS {
   . = 1M;

   .boot :
   {
      /* place multiboot header at beginning */
      *(.multiboot_header)
   }

   .text :
   {
      *(.text)
   }
}
