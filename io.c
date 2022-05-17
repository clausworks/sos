#include "kernel.h"
#include <stdint-gcc.h>
#include <stdarg.h>
#include "io.h"
#include "memory.h"
#include "interrupt.h"

uint16_t *const VGA_BASE = (uint16_t *)0xb8000;
int vga_cursor = 0;
SerialState ser_state = {0};

/* Inline assembly functions from
 * https://wiki.osdev.org/Inline_Assembly/Examples
 */

uint8_t inb(uint16_t port) {
   uint8_t ret;
   asm volatile ( "inb %1, %0"
   : "=a"(ret)
   : "Nd"(port) );
   return ret;
}

void outb(uint16_t port, uint8_t val) {
   asm volatile ( "outb %0, %1" : : "a"(val), "Nd"(port) );
}

/* For PIC */
void io_wait(void) {
    outb(0x80, 0);
}

/*****************************************************************************/
/* VGA INTERFACE */

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
   int enable_int = 0;

   if (interrupts_enabled()) {
      CLI;
      enable_int = 1;
   }

   for (i = 0; i < VGA_H * VGA_W; ++i) {
      ser_write_char(' ');
      vga_display_char(' ', DEFAULT_ATTR);
   }
   vga_cursor = 0;

   if (enable_int) {
      STI;
   }
}

/* Write a null-terminated string, beginning at the specified cursor location.
 */
void vga_display_str(const char *str, uint16_t attr) {
   int i;
   for (i = 0; str[i] != 0; ++i) {
      ser_write_char(str[i]);
      vga_display_char(str[i], attr);
   }
}

/*****************************************************************************/
/* SERIAL INTERFACE */

void ser_init() {
   uint8_t byte;

   /* Set baud rate: 115200 */
   byte = inb(SER_LCR);
   byte |= (1 << 7);
   outb(SER_LCR, byte);
   outb(SER_DLL, 1);
   outb(SER_DLM, 0);
   byte = inb(SER_LCR);
   byte &= ~(1 << 7);
   outb(SER_LCR, byte);

   /* Config: 8N1 */
   byte = inb(SER_LCR);
   byte &= ~(0xF);
   byte |= 3;
   outb(SER_LCR, byte);

   /* Interrupts: TX and LINE */
   byte = 0x06;
   outb(SER_IER, byte);
   
   /* System interrupt config */
   irq_set_handler(INT_SER, irq_ser, NULL);
   pic_clrmask(PIC_SER_LINE);
}

void ser_begin_tx() {
   /* ISR sets idle, but synchronous call doesn't */
   if (!ser_state.idle) {
      ser_state.idle = (inb(SER_LSR) & SER_LSR_IDLE) ? 1 : 0;
   }

   if (ser_state.idle) {
      /* Buffer isn't empty */
      if (ser_state.start != ser_state.end) {
         outb(SER_DR, ser_state.buff[ser_state.start]);
         ser_state.start = (ser_state.start + 1) % SER_BUFF_SIZE;
         ser_state.idle = 0;
      }
   }
}

void irq_ser(int irq, int err, void *arg) {
   uint8_t byte;

   /* Interrupt type */
   byte = inb(SER_IIR) & SER_IIR_INT_Msk;
   if (byte == SER_IIR_LINE_Val) {
      inb(SER_LSR); /* clear interrupt */
   }
   else if (byte == SER_IIR_TX_Val) {
      ser_state.idle = 1;
      ser_begin_tx();
   }

   pic_eoi(PIC_SER_LINE);
}

void ser_write_char(char c) {
   int enable_int = 0;

   if (interrupts_enabled()) {
      CLI;
      enable_int = 1;
   }

   /* Check if buffer has room */
   if (ser_state.start != (ser_state.end + 1) % SER_BUFF_SIZE) {
      ser_state.buff[ser_state.end] = c;
      ser_state.end = (ser_state.end + 1) % SER_BUFF_SIZE;
      ser_begin_tx();
   }

   if (enable_int) {
      STI;
   }
}

void ser_write_str(char *str) {
   while (*str != 0) {
      ser_write_char(*str++);
   }
}

/*****************************************************************************/
/* PRINTK FUNCTIONS */

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

   ser_write_str(++c);
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
      ser_write_char('0');
      vga_display_char('0', DEFAULT_ATTR);
      return;
   }

   /* fill in digits backwards */
   for (i = 0, c = &buffer[UDEC_BUFLEN - 2]; x != 0; x /= base, ++i, --c) {
      digit = x % base;
      *c = '0' + digit;
   }
   
   ser_write_str(++c);
   vga_display_str(++c, DEFAULT_ATTR);
}

void print_dec(long long x) {
   if (x >= 0) {
      print_udec(x);
   }
   else {
      ser_write_char('-');
      vga_display_char('-', DEFAULT_ATTR);
      print_udec(-x);
   }
}

void print_char(char c) {
   ser_write_char(c);
   vga_display_char(c, DEFAULT_ATTR);
}

int __attribute__((format (printf, 1, 2))) printk(const char *fmt, ...) {
   va_list args;
   const char *c;

   va_start(args, fmt);
   /* loop through each character */
   for (c = fmt; *c; ++c) {
      /* regular characters */
      if (*c != '%') {
         ser_write_char(*c);
         vga_display_char(*c, DEFAULT_ATTR);
         continue;
      }
      switch (*(++c)) {
      case '%':
         ser_write_char('%');
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
         print_char(va_arg(args, int));
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
         ser_write_str(va_arg(args, char *));
         vga_display_str(va_arg(args, char *), DEFAULT_ATTR);
         break;
      default:
         return -1;
      }
   }
   return 0;
}
