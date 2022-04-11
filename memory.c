#include "memory.h"
#include <stdint.h>

void *memset_(void *dst, int c, SIZE_T n) {
   uint8_t *data = (uint8_t *)dst;
   c = c & 0xFF; /* only keep lowest byte */
   int i;
   
   for (i = 0; i < n; ++i) {
      *data = c;
      data++;
   }

   return dst;
}

void *memcpy_(void *dest, const void *src, SIZE_T n) {
   uint8_t *d = (uint8_t *)dest, *s = (uint8_t *)src;
   int i;
   
   for (i = 0; i < n; ++i) {
      *d = *s;
      d++;
      s++;
   }

   return dest;
}

SIZE_T strlen_(const char *s) {
   char *t = (char *)s;
   while (*(t++) != '\0');
   return t - s;
}

char *strcpy_(char *dest, const char *src) {
   char *c = dest;
   while ((*(c++) = *(src++)) != '\0');
   return dest;
}

int strcmp_(const char *s1, const char *s2) {
   int diff = 0;
   char *shorter = (char *)((strlen_(s1) < strlen_(s2)) ? s1 : s2);
   
   for (; *shorter != 0; shorter++, s1++, s2++) {
      if ((diff = *s1 - *s2) != 0) {
         return diff; /* different strings */
      }
   }

   /* One or both point to null character */
   return *s1 - *s2;
}

const char *strchr_(const char *s, int c) {
   int i;

   for (i = 0; s[i] != 0; ++i) {
      if (s[i] == c) {
         return i;
      }
   }

   return -1;
}

/* NOT IMPLEMENTED */
char *strdup_(const char *s) {
   return 0;
}
