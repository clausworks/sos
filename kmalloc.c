#include "kernel.h"
#include <stdint-gcc.h>
#include "kmalloc.h"
#include "memalloc.h"
#include "io.h"

const uint64_t km_block_sizes[KM_NUM_SIZES] = {32, 64, 128, 256, 512, 1024, 2048};
KMPool pools[KM_NUM_SIZES] = {0};

/* On creation or if a pool runs out of free nodes, the head pointer will be
 * null. Allocate a new page and update the pool's head pointer.
 */
static void extend_pool(KMPool *pool) {
   uint8_t *byteptr; /* for nodes */
   int j;

   if (pool->head != NULL) {
      printk("extend_pool: head pointer non-null\n");
      return;
   }

   pool->head = (KMFreeList *)mmu_alloc_heap_page();
   pool->avail += FRAME_SIZE / pool->max_size;
   byteptr = (uint8_t *)pool->head;
   /* Initialize the linked list of free blocks */
   for (j = 1; j < pool->avail; ++j) {
      /* At the beginning of each block, set a free list node */
      ((KMFreeList *)byteptr)->next = (KMFreeList *)(byteptr + pool->max_size);
      byteptr += pool->max_size;
   }
   /* Last node gets a null pointer */
   ((KMFreeList *)byteptr)->next = NULL;
}

void kmalloc_init() {
   int i;

   /* Allocate a page for each pool */
   for (i = 0; i < KM_NUM_SIZES; ++i) {
      pools[i].max_size = km_block_sizes[i];
      extend_pool(&pools[i]);
   }
}

void *kmalloc(uint64_t size) {
   int i;
   KMHeader *hdr;
   for (i = 0; i < KM_NUM_SIZES; ++i) {
      if (size <= km_block_sizes[i] - sizeof(KMHeader)) {
         printk("kmalloc: allocating %ld-byte block (actual %ld)\n",
            km_block_sizes[i], km_block_sizes[i] - sizeof(KMHeader));
         break;
      }
   }

   /* Allocate from i-th pool */
   hdr = (KMHeader *)(pools[i].head);
   pools[i].head = pools[i].head->next; /* remove block from list */
   if (pools[i].head == NULL) {
      extend_pool(&pools[i]);
   }

   hdr->pool = &pools[i];
   hdr->size = size;
   return hdr + 1; /* increment past header */
}

void kfree(void *addr) {
}
