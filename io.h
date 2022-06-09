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

/* Alternate definitions for Snakes */
#define VGA_BLACK 0x00
#define VGA_BLUE 0x01
#define VGA_GREEN 0x02
#define VGA_CYAN 0x03
#define VGA_RED 0x04
#define VGA_PURPLE 0x05
#define VGA_ORANGE 0x06
#define VGA_LIGHT_GREY 0x07
#define VGA_DARK_GREY 0x08
#define VGA_BRIGHT_BLUE 0x09
#define VGA_BRIGHT_GREEN 0x0A
#define VGA_BRIGHT_CYAN 0x0B
#define VGA_MAGENTA 0x0C
#define VGA_BRIGHT_PURPLE 0x0D
#define VGA_YELLOW 0x0E
#define VGA_WHITE 0x0F

#define TAB_WIDTH 8
#define HEX_BUFLEN 17
#define UDEC_BUFLEN 21

#define PIC_SER_LINE 4
#define INT_SER (INT_PIC1_BASE + PIC_SER_LINE)
#define SER_PORT 0x3F8
#define SER_DR SER_PORT
#define SER_IER (SER_PORT + 1)
#define SER_IIR (SER_PORT + 2)
#define SER_LCR (SER_PORT + 3)
#define SER_LSR (SER_PORT + 5)
#define SER_DLL SER_PORT
#define SER_DLM (SER_PORT + 1)

#define SER_IIR_INT_Msk (7 << 1)
#define SER_IIR_LINE_Val (3 << 1)
#define SER_IIR_TX_Val (1 << 1)
#define SER_LSR_IDLE (1 << 6)

#define SER_BUFF_SIZE 256

typedef struct SerialState {
   char buff[SER_BUFF_SIZE];
   int start;
   int end;
   int idle;
} SerialState;

void vga_clear(void);
void vga_display_char(char, uint16_t);
void vga_display_str(const char *, uint16_t);
int __attribute__((format (printf, 1, 2))) printk(const char *fmt, ...);

/* For Snakes */
void vga_display_attr_char(int x, int y, char c, int fg, int bg);
int vga_row_count(void);
int vga_col_count(void);

void ser_init();
void ser_write_char(char);
void ser_write_str(char *);

uint8_t inb(uint16_t);
void outb(uint16_t, uint8_t);
void io_wait(void);
void irq_ser(int, int, void *);

#endif
