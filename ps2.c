#include "kernel.h"
#include <stdint-gcc.h>
#include "ps2.h"
#include "vga.h"
#include "memory.h"

uint8_t *const ps2_command = (uint8_t *)0x64;
PS2Status *const ps2_status = (PS2Status *)0x64;
uint8_t *const ps2_data = (uint8_t *)0x60;

void ps2_send_cmd(uint8_t cmd, uint8_t *resp) {
   printk("ps2_send_cmd: %hx\n", cmd);
   while (ps2_status->input_full);
   *ps2_command = cmd;
}

void ps2_write_data(uint8_t data) {
   printk("ps2_write_data: %hx\n", data);
   while (ps2_status->input_full);
   *ps2_data = data;
}

void ps2_init() {
   int dual_port;
   uint8_t response, data;
   PS2Config *config;

   /* Disable ports */
   ps2_send_cmd(PS2CMD_DISABLE_P1, NULL);
   ps2_send_cmd(PS2CMD_DISABLE_P2, NULL);

   /* Flush output buffer */
   while (!ps2_status->output_full);
   response = *ps2_data;

   /* Set config byte */
   ps2_send_cmd(PS2CMD_GETCONFIG, &response);

   data = response; /* make copy */
   config = (PS2Config *)&data; /* modify copy */
   config->p1_int_en = 0;
   config->p2_int_en = 0;
   config->p1_trans = 0;
   dual_port = config->p2_clk; /* check whether second port exists */
   printk("dual_port: %s\n", (dual_port) ? "yes" : "no");

   ps2_send_cmd(PS2CMD_SETCONFIG, &response);
   ps2_write_data(data);

   /* Self test */
   ps2_send_cmd(PS2CMD_SELFTEST, &response);
   if (response == PS2RESP_ST_PASS) {
      printk("passed self-test\n");
   }
   else if (response == PS2RESP_ST_FAIL) {
      printk("failed self-test\n");
   }
   else {
      printk("unknown response from self-test\n");
   }
}
