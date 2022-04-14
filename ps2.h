#ifndef PS2H
#define PS2H

#define PS2CMD_RCONFIG 0x20
#define PS2CMD_DISABLE_P1 0xAD
#define PS2CMD_DISABLE_P2 0xA7
#define PS2CMD_GETCONFIG 0x20
#define PS2CMD_SETCONFIG 0x60
#define PS2CMD_SELFTEST 0xAA
#define PS2RESP_ST_FAIL 0xFC
#define PS2RESP_ST_PASS 0x55

typedef struct PS2Status {
   uint8_t output_full : 1;
   uint8_t input_full : 1;
   uint8_t system_flag : 1;
   uint8_t command : 1;
   uint8_t : 2;
   uint8_t timeout_err : 1;
   uint8_t parity_err : 1;
} PS2Status;

typedef struct PS2Config {
   uint8_t p1_int_en : 1;
   uint8_t p2_int_en : 1;
   uint8_t system_flag : 1;
   uint8_t : 1;
   uint8_t p1_clk : 1;
   uint8_t p2_clk : 1;
   uint8_t p1_trans : 1;
   uint8_t : 1;
} PS2Config;

void ps2_init(void);

#endif
