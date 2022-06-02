#include "kernel.h"
#include <stdint-gcc.h>
#include "kmalloc.h"
#include "memalloc.h"
#include "io.h"

/* On creation or if a pool runs out of free nodes, the head pointer will be
 * null. Allocate a new page and return */
static KMFreeList *extend_pool(KMPool *pool) {
}

void kmalloc_init() {
   /* sizes array must end with 0 */
   uint64_t sizes[KM_NUM_SIZES] = {32, 64, 128, 256, 512, 1024, 2048};
   KMPool pools[KM_NUM_SIZES];
   int i, j;
   uint8_t *byteptr; /* for nodes */

   /* Allocate a page for each pool */
   for (i = 0; i < KM_NUM_SIZES; ++i) {
      pools[i].head = (KMFreeList *)mmu_alloc_heap_page();
      pools[i].max_size = sizes[i];
      pools[i].avail = FRAME_SIZE / sizes[i];
      byteptr = (uint8_t *)pools[i].head;
      /* Initialize the linked list of free blocks */
      for (j = 1; j < pools[i].avail; ++j) {
         /* At the beginning of each block, set a free list node */
         ((KMFreeList *)byteptr)->next = (KMFreeList *)(byteptr + sizes[i]);
         byteptr += sizes[i];
      }
      /* Last node gets a null pointer */
      ((KMFreeList *)byteptr)->next = NULL;
   }
}

void *kmalloc(uint64_t size) {
   return NULL;
}

void kfree(void *addr) {
}
