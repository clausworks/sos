#ifndef IOH
#define IOH

#include <stdint-gcc.h>

#define VGA_H 25
#define VGA_W 80
#define vga_col (vga_cursor / VGA_W)
#define vga_row (vga_cursor % VGA_W)
#define vga_addr (VGA_BASE + vga_cursor)

#define BLACK 0x0000
#define BLUE 0x0100
#define GREEN 0x0200
#define CYAN 0x0300
#define RED 0x0400
#define MAGENTA 0x0500
#define BROWN 0x0600
#define GRAY 0x0700
#define WHITE 0x0f00
#define BG_BLACK 0x0000
#define BG_BLUE 0x1000
#define BG_GREEN 0x2000
#define BG_CYAN 0x3000
#define BG_RED 0x4000
#define BG_MAGENTA 0x5000
#define BG_BROWN 0x6000
#define BG_GRAY 0x7000
#define BRIGHT 0x0800
#define BG_BRIGHT 0x8000
#define DEFAULT_ATTR WHITE

#define TAB_WIDTH 8
#define HEX_BUFLEN 17
#define UDEC_BUFLEN 21

void vga_clear(void);
void vga_display_char(char, uint16_t);
void vga_display_str(const char *, uint16_t);
int __attribute__((format (printf, 1, 2))) printk(const char *fmt, ...);

uint8_t inb(uint16_t);
void outb(uint16_t, uint8_t);
void io_wait(void);

#endif
