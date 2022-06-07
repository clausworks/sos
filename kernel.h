#ifndef KERNELH
#define KERNELH

#define NULL 0

#define CODE_SEG_SELECTOR 8 /* GDT byte offset */

#define HLT asm("hlt")

#define QUOTE(s) str(s)
#define str(s) #s

#endif
