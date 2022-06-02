#include <stdint-gcc.h>
#include "kmalloc.h"
#include "io.h"

void kmalloc_init() {
   /* sizes array must end with 0 */
   uint64_t sizes[KM_NUM_SIZES] = {32, 64, 128, 256, 512, 1024, 2048};
   KMPool pools[KM_NUM_SIZES];
   int i, j;
   uint8_t *offset = 0;
   KMFreeList *node;

   for (i = 0; i < KM_NUM_SIZES; ++i) {
      pools[i].head = (KMFreeList *)mmu_alloc_heap_page();
      pools[i].max_size = sizes[i];
      pools[i].avail = FRAME_SIZE / sizes[i];
      offset = (uint8_t *)pools[i].head;
      node = *offset;
      for (j = 1; j < pools[i].avail; ++j) {

         offset += sizes[i];
      }
   }
}

void *kmalloc(uint64_t size) {
   return NULL;
}

void kfree(void *addr) {
}
