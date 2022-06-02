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

uint8_t *kheap_next = 0; /* not void * because we want to increment it */
uint8_t *kstack_next = 0;

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
   CLI_COND;

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

   /*printk("allocated page %p\n", allocated_page);*/
   STI_COND;
   return allocated_page;
}

void mmu_pf_free(void *pf) {
   FreePageNode *fp_node = pf;
   CLI_COND;

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
   
   STI_COND;
}

/*****************************************************************************/
/* VIRTUAL PAGE ALLOCATOR */

static inline void invlpg(void* m) {
    /* Clobber memory to avoid optimizer re-ordering access before invlpg,
     * which may cause nasty bugs. */
    asm volatile ( "invlpg (%0)" : : "b"(m) : "memory" );
}

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

static inline void set_addr(PTE *pte, void *addr) {
   pte->addr = ((uint64_t)addr) >> 12;
}

static inline void *get_addr(PTE *pte) {
   uint64_t addr = pte->addr;
   addr = addr << 12;
   return (void *)addr;
}

static void pte_init(PTE *page, void *next) {
   page->present = 1;
   page->write = 1;
   page->user = 0;
   set_addr(page, next);
}

static inline PTE *get_lower_level(PTE *pte) {
   return (PTE *)get_addr(pte);
}

static PTE *vaddr_to_pte(PTE *page_table, vaddr_t vaddr, int alloc) {
   PTE *pml4e, *pdpe, *pde, *pte;
   void *addr;
   CLI_COND;
   
   /* PML4 entry: must be allocated during init */
   pml4e = page_table + vaddr.pml4;
   if (!pml4e->present) {
      STI_COND;
      return NULL;
   }
   pdpe = get_lower_level(pml4e) + vaddr.pdp;

   /* PDP entry: can be allocated on-demand */
   if (!pdpe->present && !alloc) {
      STI_COND;
      return NULL;
   }
   if (!pdpe->present && alloc) {
      /*printk("alloc PDPE/PD: PDP %d, PD %d\n", vaddr.pdp, vaddr.pd);*/
      /*printk("\t%lx\n", vaddr.addr);*/
      addr = mmu_pf_alloc();
      memset(addr, 0, FRAME_SIZE);
      pte_init(pdpe, addr);
   }
   pde = get_lower_level(pdpe) + vaddr.pd;
   
   /* PD entry: can be allocated on-demand */
   if (!pde->present && !alloc) {
      STI_COND;
      return NULL;
   }
   if (!pde->present && alloc) {
      /*printk("alloc PDE/PT: PD %d, PT %d\n", vaddr.pd, vaddr.pt);*/
      /*printk("\t%lx\n", vaddr.addr);*/
      addr = mmu_pf_alloc();
      memset(addr, 0, FRAME_SIZE);
      pte_init(pde, addr);
   }
   pte = get_lower_level(pde) + vaddr.pt;

   STI_COND;
   return pte;
}

void mmu_pt_init() {
   uint64_t i;
   PTE *pdp;
   PTE *pte;
   vaddr_t vaddr;
   PTE *page_table; /* kernel page table */

   irq_set_handler(EXC_PF, irq_pf, NULL);

   /* Top level */
   page_table = mmu_pf_alloc();
   memset(page_table, 0, FRAME_SIZE);

   /* Direct mapping (64*4K) */
   pdp = mmu_pf_alloc();
   memset(pdp, 0, FRAME_SIZE);
   pte_init(page_table + PML4_OFF_DIRECT, pdp);

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

   kheap_next = (uint8_t *)KHEAP_BASE;

   /* Kernel stacks */
   pdp = mmu_pf_alloc();
   memset(pdp, 0, FRAME_SIZE);
   pte_init(page_table + PML4_OFF_KSTACK, pdp);

   kstack_next = (uint8_t *)KSTACK_BASE;

   /* Change page table */
   set_pt_cr3(page_table);
   printk("Page table changed: 0x%p\n", page_table);
}

/* Allocate a page at the given virtual address.
 * - addr is aligned to page boundary
 * - present bit set to 0, causing a page fault on first access
 * - if demand is true, then the page fault handler will allocate a
 * corresponding frame on the first access */
static void *mmu_alloc_page(void *addr, int demand) {
   PTE *pte;
   vaddr_t vaddr;
   CLI_COND;

   vaddr.addr = (uint64_t)addr;
   if (vaddr.phys != 0) {
      printk("mmu_alloc_page: aligning %p to 4K boundary\n", addr);
      vaddr.phys = 0;
   }

   pte = vaddr_to_pte(get_pt_cr3(), vaddr, 1);
   
   if (pte == NULL) {
      printk("mmu_alloc_page failed: %lx\n", vaddr.addr);
      STI_COND;
      return NULL;
   }

   pte->present = 0;
   pte->write = 1;
   pte->user = 0;
   pte->demand = demand; /* get physical frame on next access */

   STI_COND;

   return (void *)vaddr.addr;
}

/* Allocate a page from the heap. 
 * Set a page as present, but not demanded */
void *mmu_alloc_heap_page() {
   void *addr;
   CLI_COND;

   addr = mmu_alloc_page(kheap_next, 1);
   kheap_next += FRAME_SIZE;

   STI_COND;
   return addr;
}

/* Allocate n (n >= 1) pages contiguously. */
void *mmu_alloc_heap_pages(int n) {
   int i;
   void *start = mmu_alloc_heap_page();
   CLI_COND;

   for (i = 1; i < n; ++i) {
      /* These are guaranteed to be contiguous because mmu_alloc_page simply
       * increments kheap_next with each run. */
      mmu_alloc_heap_page();
   }

   STI_COND;
   return start;
}

/* Create a kernel stack and return a pointer to the top of the stack.
 * Two additional pages will be used (upper and lower bounds) to prevent
 * a stack overflow or underflow.
 */
void *mmu_alloc_stack() {
   uint64_t *addr;
   int i;
   CLI_COND;
   
   /* bottom of stack: don't demand */
   addr = mmu_alloc_page(kstack_next, 0);
   printk("  stack bottom %p\n", addr);
   kstack_next += FRAME_SIZE;

   /* middle pages: present */
   for (i = 2; i < NUMP_KSTACK; ++i) {
      addr = mmu_alloc_page(kstack_next, 1);
      kstack_next += FRAME_SIZE;
   }
   printk("  stack top usable page %p\n", addr);

   /* top of stack: don't demand */
   addr = mmu_alloc_page(kstack_next, 0);
   printk("  stack top page base %p\n", addr);
   addr -= 1; /* top of top present page */
   printk("  stack top %p\n", addr);
   kstack_next += FRAME_SIZE;

   STI_COND;
   return addr;
}

/* Free a page (stack or heap).
 * Set a page as not present, and free the associated frame */
static void mmu_free_page(void *addr) {
   vaddr_t vaddr;
   PTE *pte;
   CLI_COND;

   vaddr.addr = (uint64_t)addr;
   pte = vaddr_to_pte(get_pt_cr3(), vaddr, 0);

   if (pte == NULL) {
      printk("mmu_free_page failed: %p\n", addr);
      STI_COND;
      return;
   }
   
   /* Free the physical frame, if present */
   if (pte->present) {
      mmu_pf_free(get_lower_level(pte));
   }
   /* Invalidate page to clear from TLB */
   invlpg(addr);
   /* Set not present, etc. */
   memset(pte, 0, sizeof(PTE));

   STI_COND;
}

void mmu_free_heap_page(void *addr) {
   mmu_free_page(addr);
}

void mmu_free_heap_pages(void *addr, int n) {
   uint8_t *page = addr;
   int i;
   CLI_COND;

   for (i = 0; i < n; ++i) {
      mmu_free_page(page);
      page += FRAME_SIZE;
   }
   STI_COND;
}

/* Free a stack frame and associated frames. */
void mmu_free_stack(void *sp) {
   vaddr_t sp_base;
   int i;
   CLI_COND;

   /* Adjust address to first usable page of given stack */
   sp_base.addr = (uint64_t)sp;
   sp_base.phys = 0;
   sp_base.pt = 1;

   for (i = 2; i < NUMP_KSTACK; ++i) {
      mmu_free_page((void *)sp_base.addr);
      sp_base.pt += 1;
   }
   /* last page is already not present */
   STI_COND;
}

/* When a page fault occurs:
 * 1. If the page is present but not demanded, allocate frame
 * 2. If the page is not present, or the demand bit is not set, throw an error
 */
void irq_pf(int irq, int err, void *arg) {
   PTE *page_table = get_pt_cr3();
   void *addr;
   vaddr_t vaddr;
   PTE *pte;
  
   vaddr.addr = (uint64_t)get_addr_cr2(); 
   pte = vaddr_to_pte(page_table, vaddr, 0);

   if (pte != NULL && pte->demand) {
      pte->present = 1;
      pte->demand = 0;
      addr = mmu_pf_alloc();
      memset(addr, 0, FRAME_SIZE);
      set_addr(pte, addr);
   }
   else {
      printk("Page fault at %lx\n\terror %d (%x)\n\ttable %p\n",
         vaddr.addr, err, err, page_table); 
      HLT;
   }
}

/*****************************************************************************/
/* TEST CASES: VIRTUAL PAGE ALLOCATOR */

void _fill(void *vaddr, uint64_t nwords) {
   int i;
   uint64_t *data = (uint64_t *)vaddr;
   for (i = 0; i < nwords; ++i) {
      data[i] = (uint64_t)vaddr;
   }
}

void _verify(void *vaddr, uint64_t nwords) {
   int i;
   uint64_t *data = (uint64_t *)vaddr;
   for (i = 0; i < nwords; ++i) {
      if (data[i] != (uint64_t)vaddr) {
         printk("Verify failed:\n");
         printk("\taddr   = %p\n", &data[i]);
         printk("\tactual = %lx\n", data[i]);
         printk("\texpect = %p\n", vaddr);
         return;
      }
   }
}

void _stress_test_paging() {
   uint64_t *single, *multiple, *mixed1, *mixed2;
   PTE *pte;
   vaddr_t vaddr;
   
   printk("\n");
   single = mmu_alloc_heap_page();
   _fill(single, FRAME_SIZE / sizeof(uint64_t));
   _verify(single, FRAME_SIZE / sizeof(uint64_t));
   mmu_free_heap_page(single);
   printk("test 1: 1 page @ %p\n", single);

   printk("\n");
   multiple = mmu_alloc_heap_pages(100);
   _fill(multiple, 100 * FRAME_SIZE / sizeof(uint64_t));
   _verify(multiple, 100 * FRAME_SIZE / sizeof(uint64_t));
   mmu_free_heap_pages(multiple, 100);
   printk("test 2: 100 pages @ %p\n", multiple);

   printk("\n");
   mixed1 = mmu_alloc_heap_pages(10);
   mixed2 = mmu_alloc_heap_pages(10);
   _fill(mixed1, 10 * FRAME_SIZE / sizeof(uint64_t));
   _fill(mixed2, 10 * FRAME_SIZE / sizeof(uint64_t));
   _verify(mixed2, 10 * FRAME_SIZE / sizeof(uint64_t));
   _verify(mixed1, 10 * FRAME_SIZE / sizeof(uint64_t));
   mmu_free_heap_pages(mixed1, 10);
   mmu_free_heap_pages(mixed2, 10);
   printk("test 3: two sets of 10\n\t@ %p\n\t@ %p\n", mixed1, mixed2);

   printk("\n");
   printk("test 4: access freed page @ %p\n", single);
   vaddr.addr = (uint64_t)single;
   pte = vaddr_to_pte(get_pt_cr3(), vaddr, 0);
   printk("pte = %p\n", pte);
   *single = 10;

   printk("test 5: access null pointer\n");
   single = 0;
   *single = 10;

   printk("Done\n");
}

void _test_stack_alloc() {
   uint64_t *sp;
   /*
   int i;
   */
   printk("\n");
   sp = mmu_alloc_stack();
   *sp = 0;

   /*
   printk("freeing\n");
   mmu_free_stack(sp);
   *sp = 0;
   */

   /**(sp + 1) = 0;*/ /* page fault */

   /* stack overflow: write until we hit a page fault */
   /*
   for (i = 0; i >= 0; ++i) {
      sp[-i] = 0;
   }
   */
}

/*****************************************************************************/
/* TEST CASES: PAGE FRAME ALLOCATOR */

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
