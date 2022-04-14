#include "kernel.h"
#include <stdint-gcc.h>
#include "ps2.h"
#include "vga.h"
#include "memory.h"

static uint8_t inb(uint16_t port) {
   uint8_t ret;
   asm volatile ( "inb %1, %0"
   : "=a"(ret)
   : "Nd"(port) );
   return ret;
}

static void outb(uint16_t port, uint8_t val) {
   asm volatile ( "outb %0, %1" : : "a"(val), "Nd"(port) );
}

void ps2_send_cmd(uint8_t cmd) {
   uint8_t status = inb(PS2_CMD_PORT);
   printk("ps2_send_cmd: %hx...", cmd);
   
   while (PS2_STATUS_INPUT & status) {
      status = inb(PS2_STATUS_PORT);
   }
   outb(PS2_DATA_PORT, cmd); 

   printk("done\n");
}

uint8_t ps2_read_data() {
   uint8_t data;
   uint8_t status = inb(PS2_CMD_PORT);
   printk("ps2_read_data...");
   
   while (!(PS2_STATUS_OUTPUT & status)) {
      status = inb(PS2_STATUS_PORT);
   }
   data = inb(PS2_DATA_PORT);

   printk("done (%hx)\n", data);
   return data;
}

void ps2_write_data(uint8_t data) {
   uint8_t status = inb(PS2_CMD_PORT);
   printk("ps2_write_data: %hx...", data);

   while (PS2_STATUS_INPUT & status) {
      status = inb(PS2_STATUS_PORT);
   }
   outb(PS2_DATA_PORT, data); 

   printk("done\n");
}

void ps2_init() {
   int dual_port;
   uint8_t response, config;

   /* Disable ports */
   ps2_send_cmd(PS2CMD_DISABLE_P1);
   ps2_send_cmd(PS2CMD_DISABLE_P2);

   /* Flush output buffer */
   inb(PS2_DATA_PORT);

   /* Set config byte */
   ps2_send_cmd(PS2CMD_GETCONFIG);
   config = ps2_read_data();

   config &= ~(PS2_CONFIG_P1INTEN);
   config &= ~(PS2_CONFIG_P2INTEN);
   config &= ~(PS2_CONFIG_TRANS);
   dual_port = config & PS2_CONFIG_P2CLK; /* check whether second port exists */
   printk("dual_port: %s\n", (dual_port) ? "yes" : "no");

   ps2_send_cmd(PS2CMD_SETCONFIG);
   ps2_write_data(config);

   /* Self test */
   ps2_send_cmd(PS2CMD_SELFTEST);
   if ((response = ps2_read_data()) == PS2RESP_ST_PASS) {
      printk("passed self-test\n");
   }
   else if (response == PS2RESP_ST_FAIL) {
      printk("failed self-test\n");
   }
   else {
      printk("unknown response from self-test: %hx\n", response);
   }
}
