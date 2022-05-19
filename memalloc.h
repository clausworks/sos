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

#define MBTAG_MMAP_TYPE 6
#define MB_MMAP_INFO_TYPE 1
#define MBTAG_ELF_TYPE 9

#define FRAME_START_ADDR 0x100000 /* 1M */
#define FRAME_SIZE 0x1000 /* 4K */
#define FRAME_START (FRAME_START_ADDR / FRAME_SIZE)

void mmu_pf_alloc_init(void);
void *mmu_pf_alloc(void);
void mmu_pf_free(void *);
void _stress_test_pf_allocator(void);
void _test_pf_allocator(void);

#endif
