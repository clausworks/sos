#ifndef IOH
#define IOH

#include <stdint-gcc.h>

uint8_t inb(uint16_t);
void outb(uint16_t, uint8_t);
void io_wait(void);

#endif
