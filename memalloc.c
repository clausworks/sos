#include <stdint-gcc.h>
#include "memory.h"
#include "memalloc.h"
#include "io.h"
#include "kernel.h"
#include "interrupt.h"

FreePageNode *free_pages_list = NULL;

struct {
   int free_start; /* kernel starting frame */
   int unused_start; /* first unused frame (kernel uses frames) */
   int num_free;
} frame_info;

uint64_t kheap_next = 0; /* not void * because we want to increment it */

/*****************************************************************************/
/* PAGE FRAME ALLOCATOR */

/* Set start/length of memory segment to use for page frames.
 * Note that this only returns a single contiguous block. It is assumed that the
 * first block beginning with FRAME_START_ADDR (1M by default) is large enough
 * for the kernel and user programs.
 */
static void parse_mmap(uint8_t *ptr) {
   int offset = sizeof(MMapTag);
   MMapTag *tag = (MMapTag *)ptr;
   MMapInfo *info; 
   uint64_t tmp_ptr; 

   for (; offset < tag->generic.size; offset += tag->info_size) {
      info = (MMapInfo *)(ptr + offset);
      
      /*
      printk("[%d] start: %lx\tlength: %lx  %ld\n", info->type, info->start, 
         info->start + info->length, info->length);
      */

      /* Use first contiguous block above 1M */
      if (info->type == 1 && info->start >= FRAME_START_ADDR) {
         tmp_ptr = info->start;
         /* Align start to frame boundary */
         if (tmp_ptr % FRAME_SIZE != 0) {
            tmp_ptr += FRAME_SIZE - (tmp_ptr % FRAME_SIZE);
         }
         frame_info.free_start = tmp_ptr / FRAME_SIZE;
         frame_info.num_free = info->length / FRAME_SIZE;
         /* Ignore partial last frame (if present) */
         if (info->length % FRAME_SIZE) {
            frame_info.num_free -= 1;
         }
         break;
      }
   }
   printk("Frames start at %lx; %d frames\n", 
      tmp_ptr, frame_info.num_free);
}

/* Assume kernel allocation starts at FRAME_START_ADDR. Find the last frame used
 * by the kernel and return its number.
 */
static void parse_elf(uint8_t *ptr) {
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
   printk("First unused (free) frame: %d\n", endf + 1);
   frame_info.unused_start = endf + 1;
}

/* Init the page frame allocator */
void mmu_pf_alloc_init() {
   MBGenericTag *tag_hdr;
   uint8_t *ptr = multiboot_pointer; /* copy to increment */
   int align_diff;
   int i;
   FreePageNode *n;

   ptr += 8; /* move past fixed header */

   do {
      tag_hdr = (MBGenericTag *)ptr;

      switch (tag_hdr->type) {
         case MBTAG_MMAP_TYPE:
            parse_mmap(ptr);
            break;
         case MBTAG_ELF_TYPE:
            parse_elf(ptr);
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
   free_pages_list = (FreePageNode *)((uint64_t)frame_info.unused_start * FRAME_SIZE);
   n = free_pages_list;
   /*for (i = frame_info.unused_start; i < frame_info.unused_start + 5 - 1; ++i) {*/
   for (i = frame_info.unused_start; i < frame_info.num_free - 1; ++i) {
      n->next = (FreePageNode *)((uint8_t *)n + FRAME_SIZE);
      n->prev = (FreePageNode *)((uint8_t *)n - FRAME_SIZE);
      n = n->next;
   }
   /* Make first and last point to each other */
   n->prev = (FreePageNode *)((uint8_t *)n - FRAME_SIZE);
   n->next = free_pages_list;
   free_pages_list->prev = n;
   n = free_pages_list;
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
      HLT;
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

/*****************************************************************************/
/* VIRTUAL PAGE ALLOCATOR */

static inline PTE *get_pt_cr3() {
   PTE *page_table;
   asm volatile ("mov %%cr3, %0" : "=r"(page_table) ::);
   return page_table;
}

static inline void set_pt_cr3(void *page_table) {
   asm volatile ("mov %0, %%cr3" :: "dN"(page_table) :);
}

static inline void *get_addr_cr2() {
   void *addr;
   asm volatile ("mov %%cr2, %0" : "=r"(addr) ::);
   return addr;
}

static void pte_init(PTE *page, void *next) {
   page->present = 1;
   page->write = 1;
   page->user = 0;
   page->addr = (uint64_t)next;
}

static inline void *get_addr(PTE *pte) {
   uint64_t addr = pte->addr;
   return (void *)addr;
}

static inline PTE *get_lower_level(PTE *pte) {
   return (PTE *)get_addr(pte);
}

static PTE *vaddr_to_pte(PTE *page_table, vaddr_t vaddr, int alloc) {
   PTE *pml4e, *pdpe, *pde, *pte;
   void *addr;
   int enable_ints;

   if (interrupts_enabled()) {
      enable_ints = 1;
      CLI;
   }
   
   /* PML4 entry: must be allocated during init */
   pml4e = page_table + vaddr.pml4;
   if (!pml4e->present) {
      if (enable_ints) STI;
      return NULL;
   }
   pdpe = get_lower_level(pml4e) + vaddr.pdp;

   /* PDP entry: can be allocated on-demand */
   if (!pdpe->present && !alloc) {
      if (enable_ints) STI;
      return NULL;
   }
   if (!pdpe->present && alloc) {
      printk("alloc PDPE/PD: PDP %d, PD %d\n", vaddr.pdp, vaddr.pd);
      printk("\t%lx\n", vaddr.addr);
      addr = mmu_pf_alloc();
      pte_init(pdpe, addr);
   }
   pde = get_lower_level(pdpe) + vaddr.pd;
   
   /* PD entry: can be allocated on-demand */
   if (!pde->present && !alloc) {
      if (enable_ints) STI;
      return NULL;
   }
   if (!pde->present && alloc) {
      printk("alloc PDE/PT: PD %d, PT %d\n", vaddr.pd, vaddr.pt);
      printk("\t%lx\n", vaddr.addr);
      addr = mmu_pf_alloc();
      pte_init(pde, addr);
   }
   pte = get_lower_level(pde) + vaddr.pt;

   if (enable_ints) STI;
   return pte;
}

void mmu_pt_init() {
   uint64_t i;
   PTE *pdp;
   PTE *pte;
   vaddr_t vaddr;

   static PTE *page_table; /* kernel page table */

   /* Top level */
   page_table = mmu_pf_alloc();
   memset(page_table, 0, FRAME_SIZE);

   /* Direct mapping (64*4K) */
   pdp = mmu_pf_alloc();
   memset(pdp, 0, FRAME_SIZE);
   pte_init(page_table + PML4_OFF_DIRECT, pdp);

   /*
   pd = mmu_pf_alloc();
   memset(pd, 0, FRAME_SIZE);
   pte_init(pdp, pd);
   */
   
   /* Initialize direct map PT's */
   /*
   pf = (uint8_t *)FRAME_START_ADDR;
   for (i = 0; i < NUMP_DIRECT_MAP; ++i) {
      pt = mmu_pf_alloc();
      memset(pt, 0, FRAME_SIZE);
      pte_init(pd + i, pt);
      */
      /* Fill each PT with direct-map frames */
      /*
      for (j = 0; j < ENTRIES_PER_PT; ++j) {
         pte_init(pt + j, pf);
         pf += FRAME_SIZE;
      }
   }
   */

   /* Set page 0 to "not present" */
   vaddr.addr = 0;
   pte = vaddr_to_pte(page_table, vaddr, 1);
   pte->present = 0;

   for (i = 1; i < frame_info.free_start + frame_info.num_free; ++i) {
      vaddr.addr = i * FRAME_SIZE;
      pte_init(vaddr_to_pte(page_table, vaddr, 1), (void *)vaddr.addr);
   }

   /* Kernel Heap */
   pdp = mmu_pf_alloc();
   memset(pdp, 0, FRAME_SIZE);
   pte_init(page_table + PML4_OFF_KHEAP, pdp);

   kheap_next = KHEAP_BASE;

   irq_set_handler(EXC_PF, irq_pf, page_table);

   /* Change page table */
   set_pt_cr3(page_table);
}

/* Allocate a page from the heap. 
 * Set a page as present, but not demanded */
void *mmu_alloc_page() {
   PTE *pte;
   vaddr_t vaddr;
   int enable_ints = 0;

   if (interrupts_enabled()) {
      enable_ints = 1;
      CLI;
   }

   vaddr.addr = kheap_next;
   kheap_next += FRAME_SIZE;

   pte = vaddr_to_pte(get_pt_cr3(), vaddr, 1);
   
   if (pte == NULL) {
      printk("mmu_alloc_page failed: %lx\n", vaddr.addr);
      if (enable_ints) {
         STI;
      }
      return NULL;
   }

   pte->present = 1;
   pte->write = 1;
   pte->user = 0;
   pte->demand = 1; /* get physical frame on next access */

   if (enable_ints) {
      STI;
   }

   return (void *)vaddr.addr;
}

/* Allocate n (n >= 1) pages contiguously. */
void *mmu_alloc_pages(int n) {
   int i;
   void *start = mmu_alloc_page();
   int enable_ints = 0;

   if (interrupts_enabled()) {
      enable_ints = 1;
      CLI;
   }

   for (i = 1; i < n; ++i) {
      /* These are guaranteed to be contiguous because mmu_alloc_page simply
       * increments kheap_next with each run. */
      mmu_alloc_page();
   }

   if (enable_ints) {
      STI;
   }

   return start;
}

/* Free a page from the heap.
 * Set a page as not present, and free the associated frame */
void mmu_free_page(void *addr) {
   vaddr_t vaddr;
   PTE *pte;
   int enable_ints = 0;

   if (interrupts_enabled()) {
      enable_ints = 1;
      CLI;
   }

   vaddr.addr = (uint64_t)addr;
   pte = vaddr_to_pte(get_pt_cr3(), vaddr, 0);

   if (pte == NULL) {
      printk("mmu_free_page failed: %p\n", addr);
      if (enable_ints) {
         STI;
      }
      return;
   }
   
   /* Free the physical frame */
   mmu_pf_free(get_lower_level(pte));
   /* Set not present, etc. */
   memset(pte, 0, sizeof(PTE));

   if (enable_ints) {
      STI;
   }
}

void mmu_free_pages(void *addr, int n) {
   uint8_t *page = addr;
   int i;
   int enable_ints = 0;

   if (interrupts_enabled()) {
      enable_ints = 1;
      CLI;
   }

   for (i = 0; i < n; ++i) {
      mmu_free_page(page);
      page += FRAME_SIZE;
   }
   if (enable_ints) {
      STI;
   }
}

/* When a page fault occurs:
 * 1. If the page is present but not demanded, allocate frame
 * 2. If the page is not present, or the demand bit is not set, throw an error
 */
void irq_pf(int irq, int err, void *arg) {
   PTE *page_table = get_pt_cr3();
   vaddr_t vaddr;
   PTE *pte;
  
   vaddr.addr = (uint64_t)get_addr_cr2(); 
   pte = vaddr_to_pte(page_table, vaddr, 0);

   if (pte != NULL && pte->demand) {
      pte->demand = 0;
      pte->addr = (uint64_t)mmu_pf_alloc();
   }
   else {
      printk("Page fault at %lx\n\terror %d (%x)\n\ttable %p\n",
         vaddr.addr, err, err, page_table); 
      HLT;
   }
}

/*****************************************************************************/
/* TEST CASES */

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
