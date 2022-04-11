#include <stdint.h>
#include "vga.h"

uint16_t *const VGA_BASE = (uint16_t *)0xb8000;
int vga_cursor = 0;

/* Write a character with the specified attributes at the location given by
 * vga_cursor.
 */
void vga_display_char(char c, uint16_t attr, int cursor) {
   *(VGA_BASE + cursor) = c | attr;
}

/* Clear the display.
 */
void vga_clear() {
   int i;
   for (i = 0; i < VGA_H * VGA_W; ++i) {
      vga_display_char(' ', WHITE, i);
   }
}

/* Write a null-terminated string, beginning at the specified cursor location.
 */
void vga_display_str(const char *str, uint16_t attr, int cursor) {
   int i;
   for (i = 0; str[i] != 0; ++i) {
      vga_display_char(str[i], attr, cursor + i);
   }
}


