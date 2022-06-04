#include "kernel.h"
#include <stdint-gcc.h>
#include "kmalloc.h"
#include "memalloc.h"
#include "io.h"
#include "interrupt.h"

const uint64_t km_block_sizes[KM_NUM_SIZES] = {32, 64, 128, 256, 512, 1024, 2048};
KMPool pools[KM_NUM_SIZES] = {0};
struct {
   uint64_t b_used;
   uint64_t b_requested;
} km_stats;

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
   int _extended = 0;
   int i;
   int num_pages;
   KMHeader *hdr;
   CLI_COND;

   for (i = 0; i < KM_NUM_SIZES; ++i) {
      if (size <= km_block_sizes[i] - sizeof(KMHeader)) {
         break;
      }
   }

   /* Allocate whole pages */
   if (i == KM_NUM_SIZES) {
      num_pages = (size + sizeof(KMHeader)) / FRAME_SIZE;
      if ((size + sizeof(KMHeader)) % FRAME_SIZE != 0) {
         num_pages++;
      }
      hdr = (KMHeader *)mmu_alloc_heap_pages(num_pages);
      hdr->size = size;
      hdr->pool = NULL;

      printk("kmalloc: %p: %d pages for %ld bytes of data\n",
         hdr + 1, num_pages, size);

      km_stats.b_requested += size;
      km_stats.b_used += num_pages * FRAME_SIZE;

      STI_COND;
      return hdr + 1;
   }

   /* Allocate from i-th pool */
   hdr = (KMHeader *)(pools[i].head);
   pools[i].head = pools[i].head->next; /* remove block from list */
   pools[i].avail -= 1;
   if (pools[i].head == NULL) {
      extend_pool(&pools[i]);
      _extended = 1;
   }

   km_stats.b_requested += size;
   km_stats.b_used += pools[i].max_size;

   hdr->pool = &pools[i];
   hdr->size = size;

   printk("kmalloc: %p: %ld-byte block (actual %ld); data is %ldB\n",
      hdr + 1, km_block_sizes[i], km_block_sizes[i] - sizeof(KMHeader), size);

   if (_extended) printk("  kmalloc: pool extended\n");

   STI_COND;
   return hdr + 1; /* increment past header */
}

void kfree(void *addr) {
   uint8_t *byteptr = (uint8_t *)addr;
   int num_pages;
   KMHeader *hdr;
   KMPool *pool;
   KMFreeList *new_head;
   CLI_COND;

   byteptr -= sizeof(KMHeader);
   hdr = (KMHeader *)byteptr;

   if (hdr->size > KM_MAX_USABLE) {
      num_pages = (hdr->size + sizeof(KMHeader)) / FRAME_SIZE;
      if ((hdr->size + sizeof(KMHeader)) % FRAME_SIZE != 0) {
         num_pages++;
      }
      printk("kfree: %p: %ld bytes from %d pages\n",
         addr, hdr->size, num_pages);
      mmu_free_heap_pages(hdr, num_pages);
      STI_COND;
      return;
   }

   new_head = (KMFreeList *)byteptr;

   printk("kfree: %p: %ld bytes from %ld-byte block pool\n",
      addr, hdr->size, hdr->pool->max_size);

   km_stats.b_requested -= hdr->size;
   km_stats.b_used -= hdr->pool->max_size;

   pool = hdr->pool; /* we overwrite the header */
   new_head->next = pool->head;
   pool->head = new_head;
   pool->avail += 1;

   STI_COND;
}

/*****************************************************************************/
/* TEST CASES */

void km_pool_stats(KMPool *pool) {
   printk("pool (%ldB): %d blocks free\n", pool->max_size, pool->avail);
}

void _test_kmalloc_basic() {
   void *addr;
   void *p[KM_NUM_SIZES];
   int i;

   printk("basic allocation: 10 bytes\n");

   /* list head manipulation */
   p[0] = kmalloc(10);
   kfree(p[0]);
   p[1] = kmalloc(10);
   kfree(p[1]);
   printk("p1 (%p) == p2 (%p)  [%d]\n", p[0], p[1], p[1] == p[0]);

   /* allocating multiple nodes */
   for (i = 0; i < 5; ++i) {
      p[i] = kmalloc(10);
   }
   for (i = 0; i < 5; ++i) {
      kfree(p[i]);
   }
   addr = kmalloc(10);
   printk("equality check: %s\n", (addr == p[4]) ? "pass" : "fail");
   kfree(addr);

   /* all different sizes */
   printk("\nall sizes\n");
   for (i = 0; i < KM_NUM_SIZES; ++i) {
      p[i] = kmalloc(km_block_sizes[i] - sizeof(KMHeader));
      kfree(p[i]);
   }

   /* extending pool */
   printk("\nextending pool\n");
   km_pool_stats(&pools[KM_NUM_SIZES - 1]);
   for (i = 0; i < KM_NUM_SIZES; ++i) {
      p[i] = kmalloc(2000);
   }
   for (i = 0; i < KM_NUM_SIZES; ++i) {
      kfree(p[i]);
   }
   km_pool_stats(&pools[KM_NUM_SIZES - 1]);
}

void _test_kmalloc_multipage() {
   void *p[10];
   p[0] = kmalloc(2048 - 16);
   p[1] = kmalloc(2048 - 16 + 1);
   p[2] = kmalloc(4096); /* 2 pages */
   p[3] = kmalloc(0x2000 - 0x10); /* 2 pages */
   p[4] = kmalloc(0x2000 - 0xF); /* 3 pages */

   kfree(p[4]);
   kfree(p[3]);
   kfree(p[1]);
   kfree(p[0]);
   kfree(p[2]);
}
