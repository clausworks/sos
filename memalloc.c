#include <stdint-gcc.h>
#include "memalloc.h"
#include "io.h"
#include "kernel.h"

void print_tags() {
   MBTagHeader *hdr;
   uint8_t *ptr = multiboot_pointer; /* copy to increment */
   int align_diff;

   ptr += 8; /* move past fixed header */

   do {
      hdr = (MBTagHeader *)ptr;

      align_diff = 8 - (hdr->size % 8);

      ptr += hdr->size + align_diff; /* 8-byte aligned */
   } while (hdr->type != 0 || hdr->size != 8);
}

void print_mem_regions() {
}
