#include "kernel.h"
#include <stdint-gcc.h>
#include "ps2.h"
#include "vga.h"
#include "memory.h"

static inline uint8_t inb(uint16_t port) {
   uint8_t ret;
   asm volatile ( "inb %1, %0"
   : "=a"(ret)
   : "Nd"(port) );
   return ret;
}

static inline void outb(uint16_t port, uint8_t val) {
   asm volatile ( "outb %0, %1" : : "a"(val), "Nd"(port) );
}

void ps2_send_cmd(uint8_t cmd) {
   uint8_t status = inb(PS2_STATUS_PORT);
   printk("ps2_send_cmd: %hx...", cmd);
   
   while (PS2_STATUS_INPUT & status) {
      status = inb(PS2_STATUS_PORT);
   }
   outb(PS2_CMD_PORT, cmd); 

   printk("done\n");
}

uint8_t ps2_read_data() {
   uint8_t data;
   uint8_t status = inb(PS2_STATUS_PORT);
   printk("ps2_read_data...");
   
   while (!(PS2_STATUS_OUTPUT & status)) {
      status = inb(PS2_STATUS_PORT);
   }
   data = inb(PS2_DATA_PORT);

   printk("done (%hx)\n", data);
   return data;
}

void ps2_write_data(uint8_t data) {
   uint8_t status = inb(PS2_STATUS_PORT);
   printk("ps2_write_data: %hx...", data);

   while (PS2_STATUS_INPUT & status) {
      status = inb(PS2_STATUS_PORT);
   }
   outb(PS2_DATA_PORT, data); 

   printk("done\n");
}

void ps2_init() {
   uint8_t response, config;

   /* Disable ports */
   ps2_send_cmd(PS2CMD_DISABLEP1);
   ps2_send_cmd(PS2CMD_DISABLEP2);

   /* Flush output buffer */
   inb(PS2_DATA_PORT);

   /* Modify config byte */
   ps2_send_cmd(PS2CMD_GETCONFIG);
   config = ps2_read_data();

   /* Disable all interrupts and clocks */
   config &= ~(PS2_CONFIG_P1INTEN);
   config &= ~(PS2_CONFIG_P2INTEN);
   config &= ~(PS2_CONFIG_TRANS);
   config &= ~(PS2_CONFIG_P1CLK);
   config &= ~(PS2_CONFIG_P2CLK);

   ps2_send_cmd(PS2CMD_SETCONFIG);
   ps2_write_data(config);

   /* Self test */
   ps2_send_cmd(PS2CMD_SELFTEST);
   if ((response = ps2_read_data()) == PS2RSP_ST_PASS) {
      printk("passed self-test\n");
   }
   else if (response == PS2RSP_ST_FAIL) {
      printk("failed self-test\n");
   }
   else {
      printk("unknown response from self-test: %hx\n", response);
   }

   /* Test ports individually */
   ps2_send_cmd(PS2CMD_TESTP1);
   response = ps2_read_data();
   if (response == PS2RSP_TESTP1_PASS) {
      printk("PS/2 Port 1 OK\n");
   }
   else {
      printk("PS/2 Port 1 failed test\n");
   }

   /* Config: enable port 1 clock and interrupts */
   ps2_send_cmd(PS2CMD_GETCONFIG);
   config = ps2_read_data();

   config |= PS2_CONFIG_P1INTEN;
   config |= PS2_CONFIG_P1CLK;

   ps2_send_cmd(PS2CMD_SETCONFIG);
   ps2_write_data(config);

   /* Enable port 1 */
   ps2_send_cmd(PS2CMD_ENABLEP1);
}

/* Returns 0 on success, -1 on failure. 
 */
int kb_init() {
   uint8_t response;
   int retries;
   ps2_write_data(KBCMD_RESET);

   for (retries = 3; retries > 0; --retries) {
      response = ps2_read_data();
      if (response == KBRSP_ACK) {
         break;
      }
      else if (response != KBRSP_RESEND) {
         printk("Unknown response with keyboard reset: %hx\n", response);
      }
      else {
         printk("Resending keyboard reset command.\n");
      }
   }

   if (retries == 0) {
      printk("Too many retries when resetting keyboard.\n");
      return -1;
   }

   response = ps2_read_data();
   if (response != KBRSP_ST_PASS) {
      printk("Keyboard reset failed: %hx\n", response);
      return -1;
   }

   response = ps2_read_data();
   printk("  key: %hx\n", response);
   response = ps2_read_data();
   printk("  key: %hx\n", response);
   response = ps2_read_data();
   printk("  key: %hx\n", response);
   response = ps2_read_data();
   printk("  key: %hx\n", response);
   response = ps2_read_data();
   printk("  key: %hx\n", response);
   response = ps2_read_data();
   printk("  key: %hx\n", response);

   return 0;
}

/* Parses a scancode and populates kp. Blocks until an entire scancode is read.
 * Returns 1 on success, 0 on failure. 
 */
int get_key(KeyPacket *kp) {
   static uint8_t 
   /*
   static uint8_t caps = 0, shift = 0;
   uint8_t fourbyte = 0;
   */
   uint8_t sc;

   uint8_t incomplete = 1;
   uint8_t i = 0;

   while (incomplete) {
      sc = ps2_read_data();
      i++;

      if (
         /* 2-byte sequence: press */
         case 0xE0:
            break;
         /* 2-byte sequence: release */
         case 0xF0:
            break;
         case 0xE1:
      }
   }

   return 1;
}
