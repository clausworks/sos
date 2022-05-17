#ifndef MEMALLOCH
#define MEMALLOCH

extern uint8_t *multiboot_pointer;

typedef struct MBTagHeader {
   uint32_t type;
   uint32_t size;
} __attribute__((packed)) MBTagHeader;

typedef struct MMapTag {
   uint32_t entry_size;
   uint32_t entry_version;
} __attribute__((packed)) MMapTag;

typedef struct MMapEntry {
   uint64_t start;
   uint64_t length;
   uint32_t type;
   uint32_t reserved;
} __attribute__((packed)) MMapEntry;

typedef struct ELFSymbolsTag {
   uint32_t num_hdrs;
   uint32_t hdr_size;
   uint32_t str_tab_index;
} __attribute__((packed)) ELFsymbolsTag;

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

#define TAG_MMAP_TYPE 6
#define MMAP_INFO_TYPE 1

void print_tags(void);

#endif
