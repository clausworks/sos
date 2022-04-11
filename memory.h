#ifndef MEMORY_H
#define MEMORY_H

#include <stdint.h>

#define SIZE_T uint32_t

void *memset_(void *dst, int c, SIZE_T n);
void *memcpy_(void *dest, const void *src, SIZE_T n);
SIZE_T strlen_(const char *s);
char *strcpy_(char *dest, const char *src);
int strcmp_(const char *s1, const char *s2);
const char *strchr_(const char *s, int c);
char *strdup_(const char *s);

#endif
