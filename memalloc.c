#include <stdint-gcc.h>
#include "memalloc.h"
#include "io.h"
#include "kernel.h"
#include "interrupt.h"

FreePageNode *free_pages_list = NULL;

/* Set start/length of memory segment to use for page frames.
 * Note that this only returns a single contiguous block. It is assumed that the
 * first block beginning with FRAME_START_ADDR (1M by default) is large enough
 * for the kernel and user programs.
 */
static void parse_mmap(uint8_t *ptr, void **start, int *num_frames) {
   int offset = sizeof(MMapTag);
   MMapTag *tag = (MMapTag *)ptr;
   MMapInfo *info; 
   uint64_t tmp_ptr = (uint64_t)*start;

   for (; offset < tag->generic.size; offset += tag->info_size) {
      info = (MMapInfo *)(ptr + offset);
      
      /* Use first contiguous block above 1M */
      if (info->type == 1 && info->start >= FRAME_START_ADDR) {
         tmp_ptr = info->start;
         /* Align start to frame boundary */
         if (tmp_ptr % FRAME_SIZE != 0) {
            tmp_ptr += FRAME_SIZE - (tmp_ptr % FRAME_SIZE);
         }
         *num_frames = info->length / FRAME_SIZE;
         /* Ignore partial last frame (if present) */
         if (info->length % FRAME_SIZE) {
            *num_frames -= 1;
         }
         break;
      }
   }
   printk("Frames start at %lx; %d frames\n", tmp_ptr, *num_frames);
   *start = (void *)tmp_ptr;
}

/* Assume kernel allocation starts at FRAME_START_ADDR. Find the last frame used
 * by the kernel and return its number.
 */
static int parse_elf(uint8_t *ptr) {
   int offset = sizeof(ELFSymbolsTag);
   ELFSymbolsTag *tag = (ELFSymbolsTag *)ptr;
   ELFHeader *hdr; 
   int endf, new_endf;

   endf = FRAME_START;

   for (; offset < tag->generic.size; offset += tag->hdr_size) {
      hdr = (ELFHeader *)(ptr + offset);
      /* Update kernel end frame */
      new_endf = (hdr->addr + hdr->size) / FRAME_SIZE;
      if (new_endf > endf) {
         endf = new_endf;
      }
   }
   printk("First free frame: %d\n", endf + 1);
   return endf + 1;
}

/* Init the page frame allocator */
void mmu_pf_alloc_init() {
   MBGenericTag *tag_hdr;
   uint8_t *ptr = multiboot_pointer; /* copy to increment */
   int align_diff;
   void *start_seg_addr;
   int total_frames;
   int first_unused_frame;
   int i;
   FreePageNode *n;

   ptr += 8; /* move past fixed header */

   do {
      tag_hdr = (MBGenericTag *)ptr;

      switch (tag_hdr->type) {
         case MBTAG_MMAP_TYPE:
            parse_mmap(ptr, &start_seg_addr, &total_frames);
            break;
         case MBTAG_ELF_TYPE:
            first_unused_frame = parse_elf(ptr);
            break;
         default:
            break;
      }
      
      /* Tags are aligned on 8-byte boundaries */
      if (tag_hdr->size % 8 == 0) {
         align_diff = 0;
      }
      else {
         align_diff = 8 - (tag_hdr->size % 8);
      }
      ptr += tag_hdr->size + align_diff;
   } while (tag_hdr->type != 0 || tag_hdr->size != 8); /* T=0, S=8: end tag */

   /* Initialize free frames */
   /*
   printk("ALLOCATING FRAMES\n");
   printk("n                next             prev\n");
   */
   free_pages_list = (FreePageNode *)((uint64_t)first_unused_frame * FRAME_SIZE);
   n = free_pages_list;
   /*for (i = first_unused_frame; i < total_frames - 1; ++i) {*/
   for (i = first_unused_frame; i < first_unused_frame + 5 - 1; ++i) {
      n->next = (FreePageNode *)((uint8_t *)n + FRAME_SIZE);
      n->prev = (FreePageNode *)((uint8_t *)n - FRAME_SIZE);
      /*
      printk("%p %p %p\n", n, n->next, n->prev);
      */
      n = n->next;
   }
   /* Make first and last point to each other */
   n->prev = (FreePageNode *)((uint8_t *)n - FRAME_SIZE);
   n->next = free_pages_list;
   free_pages_list->prev = n;
   /*
   printk("%p %p %p\n", n, n->next, n->prev);
   */
   n = free_pages_list;
   /*
   printk("%p %p %p\n", n, n->next, n->prev);
   */
}

void *mmu_pf_alloc() {
   void *allocated_page;
   int enable_int = 0;
   if (interrupts_enabled()) {
      CLI;
      enable_int = 1;
   }

   /* No more unallocated pages */
   if (!free_pages_list) {
      printk("pf alloc failed\n");
      return NULL;
   }

   allocated_page = free_pages_list;
   free_pages_list->prev->next = free_pages_list->next;
   free_pages_list->next->prev = free_pages_list->prev;

   /* We just allocated the last page */
   if (free_pages_list->next == free_pages_list
      && free_pages_list->prev == free_pages_list) {
      free_pages_list = NULL;
   }
   else {
      free_pages_list = free_pages_list->next;
   }

   if (enable_int) {
      STI;
   }
   return allocated_page;
}

void mmu_pf_free(void *pf) {
   FreePageNode *fp_node = pf;
   int enable_int = 0;
   if (interrupts_enabled()) {
      CLI;
      enable_int = 1;
   }

   /* First free page */
   if (free_pages_list == NULL) {
      free_pages_list = fp_node;
      fp_node->next = fp_node;
      fp_node->prev = fp_node;
   }
   else {
      fp_node->next = free_pages_list;
      fp_node->prev = free_pages_list->prev;
      free_pages_list->prev->next = fp_node;
      free_pages_list->prev = fp_node;
   }
   
   if (enable_int) {
      STI;
   }
}

void _fill_pf(void *pf) {
   int i;
   uint64_t *data = (uint64_t *)pf;
   for (i = 0; i < FRAME_SIZE / sizeof(uint64_t); ++i) {
      data[i] = (uint64_t)pf;
   }
}

void _verify_pf(void *pf) {
   int i;
   uint64_t *data = (uint64_t *)pf;
   for (i = 0; i < FRAME_SIZE / sizeof(uint64_t); ++i) {
      if (data[i] != (uint64_t)pf) {
         printk("Verify failed:\n");
         printk("\taddr = %p\n", pf);
         printk("\tdata = %lx\n", data[i]);
         printk("\toff  = %d\n", i);
         return;
      }
   }
}

void _stress_test_pf_allocator() {
   int i, j;
   uint8_t *pf;
   void *p = mmu_pf_alloc();
   pf = p; /* first page */
   
   _fill_pf(p);
   
   i = 0;
   while ((p = mmu_pf_alloc()) != NULL) {
      _fill_pf(p);
      ++i;
   }
   
   for (j = 0; j < i; ++j) {
      _verify_pf(pf);
      mmu_pf_free(pf);
      pf += FRAME_SIZE;
   }
   printk("Success\n");
}

/* Assumes only 5 page frames available */
void _test_pf_allocator() {
   void *p[10];
   int i;

   for (i = 0; i < 6; ++i) {
      p[i] = mmu_pf_alloc();
      printk("Allocated %p\n", p[i]);
   }

   mmu_pf_free(p[2]);
   printk("Freed %p\n", p[2]);

   p[2] = mmu_pf_alloc();
   printk("Allocated %p\n", p[2]);

   mmu_pf_free(p[4]);
   printk("Freed %p\n", p[4]);

   mmu_pf_free(p[1]);
   printk("Freed %p\n", p[1]);

   p[4] = mmu_pf_alloc();
   printk("Allocated %p\n", p[4]);

   p[1] = mmu_pf_alloc();
   printk("Allocated %p\n", p[1]);

   for (i = 0; i < 5; ++i) {
      mmu_pf_free(p[i]);
      printk("Freed %p\n", p[i]);
   }
}
