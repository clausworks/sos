#ifndef KMALLOCH
#define KMALLOCH

#include <stdint-gcc.h>

typedef struct _KMFreeList {
   struct _KMFreeList *next;
} KMFreeList;

typedef struct KMPool {
   uint64_t max_size;
   int avail;
   KMFreeList *head;
} KMPool;

typedef struct KMHeader {
   KMPool *pool;
   uint64_t size;
} __attribute__((packed)) KMHeader;

#define KM_NUM_SIZES 7

void kmalloc_init(void);
void *kmalloc(uint64_t size);
void kfree(void *);

#endif
