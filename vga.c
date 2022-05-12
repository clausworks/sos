#include <stdint-gcc.h>
#include <stdarg.h>
#include "vga.h"
#include "memory.h"
#include "interrupt.h"

uint16_t *const VGA_BASE = (uint16_t *)0xb8000;
int vga_cursor = 0;

/* Write a character with the specified attributes at the location given by
 * vga_cursor.
 */
void vga_display_char(char c, uint16_t attr) {
   int enable_int = 0;
   if (interrupts_enabled()) {
      CLI;
      enable_int = 1;
   }

   switch (c) {
   case '\n':
      vga_cursor = vga_cursor + (VGA_W - vga_cursor % VGA_W); /* CRLF */
      break;
   case '\r':
      vga_cursor %= VGA_W; /* just CR */
      break;
   case '\t':
      vga_cursor = vga_cursor + (TAB_WIDTH - vga_cursor % TAB_WIDTH);
      break;
   default:
      *vga_addr = c | attr;
      vga_cursor++;
      break;
   }
   
   /* Scroll if needed */
   if (vga_cursor >= VGA_W * VGA_H) {
      memcpy(VGA_BASE, VGA_BASE + VGA_W, sizeof(uint16_t) * VGA_W * (VGA_H - 1));
      memset(VGA_BASE + (VGA_H - 1) * VGA_W, 0, sizeof(uint16_t) * VGA_W);
      vga_cursor -= VGA_W;
   }

   if (enable_int) {
      STI;
   }
}

/* Clear the display.
 */
void vga_clear() {
   int i;
   for (i = 0; i < VGA_H * VGA_W; ++i) {
      vga_display_char(' ', DEFAULT_ATTR);
   }
   vga_cursor = 0;
}

/* Write a null-terminated string, beginning at the specified cursor location.
 */
void vga_display_str(const char *str, uint16_t attr) {
   int i;
   for (i = 0; str[i] != 0; ++i) {
      vga_display_char(str[i], attr);
   }
}


/* printk helper functions */

void print_base_n(unsigned long long x, int base, int width) {
   char buffer[HEX_BUFLEN] = {0};
   char *c;
   int i, digit;
   
   for (i = 0, c = &buffer[HEX_BUFLEN - 2]; x; x /= base, ++i, --c) {
      digit = x % base;
      if (digit >= 10) {
         *c = 'a' + digit - 10;
      }
      else {
         *c = '0' + digit;
      }
   }

   /* fill in leading zeros, if necessary */
   for (; i < width; ++i, --c) {
      *c = '0';
   }

   vga_display_str(++c, DEFAULT_ATTR);
}

void print_hex(unsigned long long x, int width) {
   print_base_n(x, 16, width);
}

void print_bin(unsigned long long x, int width) {
   print_base_n(x, 2, width);
}

void print_udec(unsigned long long x) {
   char buffer[UDEC_BUFLEN] = {0};
   char *c;
   int i, digit, base = 10;

   if (x == 0) {
      vga_display_char('0', DEFAULT_ATTR);
      return;
   }

   /* fill in digits backwards */
   for (i = 0, c = &buffer[UDEC_BUFLEN - 2]; x != 0; x /= base, ++i, --c) {
      digit = x % base;
      *c = '0' + digit;
   }

   vga_display_str(++c, DEFAULT_ATTR);
}

void print_dec(long long x) {
   if (x >= 0) {
      print_udec(x);
   }
   else {
      vga_display_char('-', DEFAULT_ATTR);
      print_udec(-x);
   }
}

int __attribute__((format (printf, 1, 2))) printk(const char *fmt, ...) {
   va_list args;
   const char *c;

   va_start(args, fmt);
   /* loop through each character */
   for (c = fmt; *c; ++c) {
      /* regular characters */
      if (*c != '%') {
         vga_display_char(*c, DEFAULT_ATTR);
         continue;
      }
      switch (*(++c)) {
      case '%':
         vga_display_char('%', DEFAULT_ATTR);
         break;
      case 'd':
         print_dec(va_arg(args, int));
         break;
      case 'u':
         print_udec(va_arg(args, unsigned int));
         break;
      case 'x':
         print_hex(va_arg(args, unsigned), 8);
         break;
      case 'c':
         vga_display_char(va_arg(args, int), DEFAULT_ATTR);
         break;
      case 'p':
         print_hex(va_arg(args, uintptr_t), 16);
         break;
      case 'h':
         switch (*(++c)) {
         case 'd':
            print_dec((short)va_arg(args, int));
            break;
         case 'u':
            print_udec((unsigned short)va_arg(args, int));
            break;
         case 'x':
            print_hex((unsigned short)va_arg(args, unsigned), 4);
            break;
         default:
            return -1;
         }
         break;
      case 'l':
         switch (*(++c)) {
         case 'd':
            print_dec(va_arg(args, long));
            break;
         case 'u':
            print_udec(va_arg(args, unsigned long));
            break;
         case 'x':
            print_hex(va_arg(args, unsigned long), 16);
            break;
         default:
            return -1;
         }
         break;
      case 'q':
         switch (*(++c)) {
         case 'd':
            print_dec(va_arg(args, long long));
            break;
         case 'u':
            print_udec(va_arg(args, unsigned long long));
            break;
         case 'x':
            print_hex(va_arg(args, unsigned long long), 16);
            break;
         default:
            return -1;
         }
         break;
      case 's':
         vga_display_str(va_arg(args, char *), DEFAULT_ATTR);
         break;
      default:
         return -1;
      }
   }
   return 0;
}
