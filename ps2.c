#include "kernel.h"
#include <stdint-gcc.h>
#include "ps2.h"
#include "memory.h"
#include "io.h"
#include "proc.h"

static ScanMapping scmap[0xFF];
//static ScanMapping scmap_ext[0xFF];
static Process *kb_blocked_head = NULL;
int keep_blocking = 1;

struct {
   char buff[KB_BUFF_SIZE];
   int read;
   int write;
} kb_buff = {0};

/* Writing increments write index to next open spot */
static void kb_buff_write(char c) {
   /* Only add if buffer has space */
   if (kb_buff.write != (kb_buff.read + 1) % KB_BUFF_SIZE) {
      kb_buff.buff[kb_buff.write] = c;
      kb_buff.write = (kb_buff.write + 1) % KB_BUFF_SIZE;
   }
}

/* Returns the character, or -1 if nothing is available */
static int kb_buff_read() {
   char c_ret;
   if (kb_buff.read == kb_buff.write) {
      return -1;
   }
   c_ret = kb_buff.buff[kb_buff.read];
   kb_buff.read = (kb_buff.read + 1) % KB_BUFF_SIZE;
   return c_ret;
}

void getc() {
   int c;
   CLI;
   printk("getc: about to block\n");
   while (kb_buff.read == kb_buff.write) {
      printk("   (in loop)\n");
      proc_block_on(&kb_blocked_head);
      CLI;
   }
   if ((c = kb_buff_read()) == -1) {
      printk("getc: kb_buff_read failed\n");
   }
   else {
      printk("getc: read from buffer: [%c]\n", (char)c);
   }
   STI;
}

void print_keyboard(void *arg) {
   while (1) {
      getc();
   }
}

void ps2_cmd(uint8_t cmd) {
   uint8_t status = inb(PS2_STATUS_PORT);
#ifdef DEBUG
   printk("ps2_cmd: %hx...", cmd);
#endif
   
   while (PS2_STATUS_INPUT & status) {
      status = inb(PS2_STATUS_PORT);
   }
   outb(PS2_CMD_PORT, cmd); 

#ifdef DEBUG
   printk("done\n");
#endif
}

uint8_t ps2_read_poll() {
   uint8_t data;
   uint8_t status = inb(PS2_STATUS_PORT);
#ifdef DEBUG
   printk("ps2_read_poll...");
#endif
   
   while (!(PS2_STATUS_OUTPUT & status)) {
      status = inb(PS2_STATUS_PORT);
   }
   data = inb(PS2_DATA_PORT);
#ifdef DEBUG
   printk("done (%hx)\n", data);
#endif
   return data;
}

int ps2_read() {
   uint8_t data;
   uint8_t status = inb(PS2_STATUS_PORT);
   
   if (PS2_STATUS_OUTPUT & status) {
      data = inb(PS2_DATA_PORT);
   }
   else {
      //printk("ps2_read: data not available\n");
      return -1;
   }
   
   return data;
}

void ps2_write_poll(uint8_t data) {
   uint8_t status = inb(PS2_STATUS_PORT);
#ifdef DEBUG
   printk("ps2_write_poll: %hx...", data);
#endif

   while (PS2_STATUS_INPUT & status) {
      status = inb(PS2_STATUS_PORT);
   }
   outb(PS2_DATA_PORT, data); 
#ifdef DEBUG
   printk("done\n");
#endif
}

void ps2_init() {
   uint8_t response, config;

   /* Disable ports */
   ps2_cmd(PS2CMD_DISABLEP1);
   ps2_cmd(PS2CMD_DISABLEP2);

   /* Flush output buffer */
   inb(PS2_DATA_PORT);

   /* Modify config byte */
   ps2_cmd(PS2CMD_GETCONFIG);
   config = ps2_read_poll();

   /* Disable all interrupts and clocks */
   config &= ~(PS2_CONFIG_P1INTEN);
   config &= ~(PS2_CONFIG_P2INTEN);
   config &= ~(PS2_CONFIG_TRANS);
   config &= ~(PS2_CONFIG_P1CLK);
   config &= ~(PS2_CONFIG_P2CLK);

   ps2_cmd(PS2CMD_SETCONFIG);
   ps2_write_poll(config);

   /* Self test */
   ps2_cmd(PS2CMD_SELFTEST);
   if ((response = ps2_read_poll()) == PS2RSP_ST_PASS) {
      printk("passed self-test\n");
   }
   else if (response == PS2RSP_ST_FAIL) {
      printk("failed self-test\n");
   }
   else {
      printk("unknown response from self-test: %hx\n", response);
   }

   /* Test ports individually */
   ps2_cmd(PS2CMD_TESTP1);
   response = ps2_read_poll();
   if (response == PS2RSP_TESTP1_PASS) {
      printk("PS/2 Port 1 OK\n");
   }
   else {
      printk("PS/2 Port 1 failed test\n");
   }

   /* Config: enable port 1 clock and interrupts */
   ps2_cmd(PS2CMD_GETCONFIG);
   config = ps2_read_poll();

   config |= PS2_CONFIG_P1INTEN;
   config |= PS2_CONFIG_P1CLK;

   ps2_cmd(PS2CMD_SETCONFIG);
   ps2_write_poll(config);

   /* Enable port 1 */
   ps2_cmd(PS2CMD_ENABLEP1);

   /* Set interrupt handler */
   
   irq_set_handler(INT_PS2, irq_kb, NULL);
   pic_clrmask(PIC_PS2_LINE);
   
}

/* Returns 0 on success, -1 on failure. 
 */
int kb_init() {
   uint8_t response;
   int retries;
   ps2_write_poll(KBCMD_RESET);

   for (retries = 3; retries > 0; --retries) {
      response = ps2_read_poll();
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

   response = ps2_read_poll();
   if (response != KBRSP_ST_PASS) {
      printk("Keyboard reset failed: %hx\n", response);
      return -1;
   }

   init_scmap();

   return 0;
}

/* Parses a scancode and populates kp. Blocks until an entire scancode is read.
 * Returns 1 on success, 0 on failure. 
 */
int get_key(KeyPacket *kp, int poll) {
   static uint8_t caps = 0, shift = 0;
   uint8_t extended = 0;
   uint8_t breakcode = 0;
   uint8_t complete = 0;
   int sc;
   uint8_t i = 0;

   memset(kp, 0, sizeof(KeyPacket));

   while (!complete) {
      if (poll) {
         sc = ps2_read_poll();
      }
      else {
         if ((sc = ps2_read()) == -1) {
            return 0;
         }
      }
      kp->scancode[i++] = sc;
      if (sc == 0xF0) {
         breakcode = 1;
         continue;
      }
      else if (sc == 0xE0) {
         extended = 1;
         continue;
      }

      kp->pressed = !breakcode;

      if (!extended && scmap[sc].lower != 0) {
         kp->ascii = (shift || caps) ? scmap[sc].upper : scmap[sc].lower;
         complete = 1;
      }
      else if (!extended) {
         complete = 1;
         switch (sc) {
         case SC_RSHIFT:
         case SC_LSHIFT:
            shift = !breakcode;
            break;
         case SC_CAPS:
            if (breakcode) {
               caps = !caps;
            }
            break;
         case SC_ENTER:
            kp->ascii = '\n';
            break;
         default:
            return 0;
         }
      }
      else {
         return 0;
      }
   }
   return 1;
}

void irq_kb(int irq, int err, void *arg) {
   KeyPacket kp;
   printk("in isr\n");
   if (get_key(&kp, 0)) {
      if (kp.ascii) {
         if (kp.pressed) {
            //printk("%c", kp.ascii);
            kb_buff_write(kp.ascii);
            proc_unblock_head(&kb_blocked_head);
         }
      }
   }
   printk("out of isr\n");
   pic_eoi(PIC_PS2_LINE);
}

void init_scmap() {
   memset(scmap, 0, sizeof(ScanMapping) * 0xFF);
   scmap[0x1C].lower = 'a';
   scmap[0x1C].upper = 'A';
   scmap[0x32].lower = 'b';
   scmap[0x32].upper = 'B';
   scmap[0x21].lower = 'c';
   scmap[0x21].upper = 'C';
   scmap[0x23].lower = 'd';
   scmap[0x23].upper = 'D';
   scmap[0x24].lower = 'e';
   scmap[0x24].upper = 'E';
   scmap[0x2B].lower = 'f';
   scmap[0x2B].upper = 'F';
   scmap[0x34].lower = 'g';
   scmap[0x34].upper = 'G';
   scmap[0x33].lower = 'h';
   scmap[0x33].upper = 'H';
   scmap[0x43].lower = 'i';
   scmap[0x43].upper = 'I';
   scmap[0x3B].lower = 'j';
   scmap[0x3B].upper = 'J';
   scmap[0x42].lower = 'k';
   scmap[0x42].upper = 'K';
   scmap[0x4B].lower = 'l';
   scmap[0x4B].upper = 'L';
   scmap[0x3A].lower = 'm';
   scmap[0x3A].upper = 'M';
   scmap[0x31].lower = 'n';
   scmap[0x31].upper = 'N';
   scmap[0x44].lower = 'o';
   scmap[0x44].upper = 'O';
   scmap[0x4D].lower = 'p';
   scmap[0x4D].upper = 'P';
   scmap[0x15].lower = 'q';
   scmap[0x15].upper = 'Q';
   scmap[0x2D].lower = 'r';
   scmap[0x2D].upper = 'R';
   scmap[0x1B].lower = 's';
   scmap[0x1B].upper = 'S';
   scmap[0x2C].lower = 't';
   scmap[0x2C].upper = 'T';
   scmap[0x3C].lower = 'u';
   scmap[0x3C].upper = 'U';
   scmap[0x2A].lower = 'v';
   scmap[0x2A].upper = 'V';
   scmap[0x1D].lower = 'w';
   scmap[0x1D].upper = 'W';
   scmap[0x22].lower = 'x';
   scmap[0x22].upper = 'X';
   scmap[0x35].lower = 'y';
   scmap[0x35].upper = 'Y';
   scmap[0x1A].lower = 'z';
   scmap[0x1A].upper = 'Z';
   scmap[0x16].lower = '1';
   scmap[0x16].upper = '!';
   scmap[0x1E].lower = '2';
   scmap[0x1E].upper = '@';
   scmap[0x26].lower = '3';
   scmap[0x26].upper = '#';
   scmap[0x25].lower = '4';
   scmap[0x25].upper = '$';
   scmap[0x2E].lower = '5';
   scmap[0x2E].upper = '%';
   scmap[0x36].lower = '6';
   scmap[0x36].upper = '^';
   scmap[0x3D].lower = '7';
   scmap[0x3D].upper = '&';
   scmap[0x3E].lower = '8';
   scmap[0x3E].upper = '*';
   scmap[0x46].lower = '9';
   scmap[0x46].upper = '(';
   scmap[0x45].lower = '0';
   scmap[0x45].upper = ')';
   scmap[0x4E].lower = '-';
   scmap[0x4E].upper = '_';
   scmap[0x55].lower = '=';
   scmap[0x55].upper = '+';
   scmap[0x54].lower = '[';
   scmap[0x54].upper = '{';
   scmap[0x5B].lower = ']';
   scmap[0x5B].upper = '}';
   scmap[0x5D].lower = '\\';
   scmap[0x5D].upper = '|';
   scmap[0x4C].lower = ';';
   scmap[0x4C].upper = ':';
   scmap[0x52].lower = '\'';
   scmap[0x52].upper = '\"';
   scmap[0x0E].lower = '`';
   scmap[0x0E].upper = '~';
   scmap[0x41].lower = ',';
   scmap[0x41].upper = '<';
   scmap[0x49].lower = '.';
   scmap[0x49].upper = '>';
   scmap[0x4A].lower = '/';
   scmap[0x4A].upper = '?';

   /* additional mappings */
   scmap[0x29].lower = ' ';
   scmap[0x29].upper = ' ';
}
