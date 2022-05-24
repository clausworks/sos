#ifndef MEMALLOCH
#define MEMALLOCH

extern uint8_t *multiboot_pointer;

typedef struct MBGenericTag {
   uint32_t type;
   uint32_t size;
} __attribute__((packed)) MBGenericTag;

typedef struct MMapTag {
   MBGenericTag generic;
   uint32_t info_size;
   uint32_t info_version;
} __attribute__((packed)) MMapTag;

typedef struct MMapInfo {
   uint64_t start;
   uint64_t length;
   uint32_t type;
   uint32_t reserved;
} __attribute__((packed)) MMapInfo;

typedef struct ELFSymbolsTag {
   MBGenericTag generic;
   uint32_t num_hdrs;
   uint32_t hdr_size;
   uint32_t str_tab_index;
} __attribute__((packed)) ELFSymbolsTag;

typedef struct ELFHeader {
   uint32_t name;
   int32_t type;
   uint64_t flags;
   uint64_t addr;
   uint64_t offset;
   uint64_t size;
   uint32_t tab_index_link;
   uint32_t extra_info;
   uint64_t alignment;
   uint64_t iff;
} __attribute__((packed)) ELFHeader;

typedef struct FreePageNode {
   struct FreePageNode *next;
   struct FreePageNode *prev;
} FreePageNode;

typedef struct vaddr_t {
   uint64_t phys : 12;
   uint64_t pt : 9;
   uint64_t pd : 9;
   uint64_t pdp : 9;
   uint64_t pml4 : 9;
   uint64_t sext : 24;
} __attribute__((packed)) vaddr_t;

typedef struct PTE {
   uint64_t present : 1;
   uint64_t write : 1;
   uint64_t user : 1;
   uint64_t pwt : 1;
   uint64_t pcd : 1;
   uint64_t accessed : 1;
   uint64_t dirty : 1;
   uint64_t size : 1;
   uint64_t global : 1;
   uint64_t : 3;
   uint64_t addr : 40;
   uint64_t : 12; /* not using NX bit */
} __attribute__((packed)) PageTableEntry;

#define MBTAG_MMAP_TYPE 6
#define MB_MMAP_INFO_TYPE 1
#define MBTAG_ELF_TYPE 9

#define FRAME_START_ADDR 0x100000 /* 1M */
#define FRAME_SIZE 0x1000 /* 4K */
#define FRAME_START (FRAME_START_ADDR / FRAME_SIZE)

/* Number of pages */
#define NUMP_DIRECT_MAP 64
#define NUMP_KERNEL_STACK 16
#define NUMP_KERNEL_HEAP 16
#define ENTRIES_PER_PT 512

/* Offsets */
#define PML4_OFF_DIRECT 0
#define PML4_OFF_

/* Physical */
void mmu_pf_alloc_init(void);
void *mmu_pf_alloc(void);
void mmu_pf_free(void *);
/* Virtual */
void *mmu_alloc_page(void);
void *mmu_alloc_pages(int num);
void mmu_free_page(void *);
void mmu_free_pages(void *, int);

void _stress_test_pf_allocator(void);
void _test_pf_allocator(void);

#endif
