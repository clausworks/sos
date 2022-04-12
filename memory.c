#include "kernel.h"
#include "memory.h"
#include <stdint-gcc.h>

void *memset(void *dst, int c, size_t n) {
   uint8_t *data = (uint8_t *)dst;
   c = c & 0xFF; /* only keep lowest byte */
   int i;
   
   for (i = 0; i < n; ++i) {
      *data = c;
      data++;
   }

   return dst;
}

/* Copies n bytes from src to dest. Memory regions may overlap.
 */
void *memcpy(void *dest, const void *src, size_t n) {
   uint8_t *d = (uint8_t *)dest, *s = (uint8_t *)src;
   int i;
   
   /* Change copy direction (relevant if memory regions overlap) */
   if (src > dest) {
      for (i = 0; i < n; ++i) {
         d[i] = s[i];
      }
   }
   else if (src < dest) {
      for (i = n - 1; i >= 0; --i) {
         d[i] = s[i];
      }
   }

   return dest;
}

size_t strlen(const char *s) {
   int i;
   for (i = 0; s[i] != 0; ++i);
   return i;
}

char *strcpy(char *dest, const char *src) {
   memcpy(dest, src, strlen(src) + 1);
   return dest;
}

int strcmp(const char *s1, const char *s2) {
   int diff = 0;
   char *shorter = (char *)((strlen(s1) < strlen(s2)) ? s1 : s2);
   
   for (; *shorter != 0; shorter++, s1++, s2++) {
      if ((diff = *s1 - *s2) != 0) {
         return diff; /* different strings */
      }
   }

   /* One or both point to null character */
   return *s1 - *s2;
}

const char *strchr(const char *s, int c) {
   int i;

   for (i = 0; s[i] != 0; ++i) {
      if (s[i] == c) {
         return s + i;
      }
   }

   /* Handle matching null character */
   if (s[i] == c) {
      return s + i;
   }

   return NULL;
}

/* NOT IMPLEMENTED */
char *strdup(const char *s) {
   return 0;
}
