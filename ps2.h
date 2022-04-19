#ifndef PS2H
#define PS2H

#define PS2_CMD_PORT 0x64
#define PS2_STATUS_PORT PS2_CMD_PORT
#define PS2_DATA_PORT 0x60

#define PS2CMD_RCONFIG 0x20
#define PS2CMD_ENABLEP1 0xAE
#define PS2CMD_DISABLEP1 0xAD
#define PS2CMD_DISABLEP2 0xA7
#define PS2CMD_GETCONFIG 0x20
#define PS2CMD_SETCONFIG 0x60
#define PS2CMD_SELFTEST 0xAA
#define PS2CMD_TESTP1 0xAB
#define PS2CMD_TESTP2 0xA9

#define PS2RSP_ST_FAIL 0xFC
#define PS2RSP_ST_PASS 0x55
#define PS2RSP_TESTP1_PASS 0x00
#define PS2RSP_TESTP2_PASS 0x00

#define PS2_STATUS_OUTPUT 1
#define PS2_STATUS_INPUT (1 << 1)

#define PS2_CONFIG_P1INTEN (1 << 0)
#define PS2_CONFIG_P2INTEN (1 << 1)
#define PS2_CONFIG_P1CLK (1 << 4)
#define PS2_CONFIG_P2CLK (1 << 5)
#define PS2_CONFIG_TRANS (1 << 6)

#define KBCMD_RESET 0xFF

#define KBRSP_ACK 0xFA
#define KBRSP_ECHO 0xEE
#define KBRSP_RESEND 0xFE
#define KBRSP_ST_PASS 0xAA

void ps2_init(void);
int kb_init(void);

typedef struct KeyPacket {
   char ascii;
   uint8_t shift;
   uint8_t caps;
   uint8_t pressed;
   uint8_t scancode[6]; /* scan code; byte 0 is first byte */
} KeyPacket;

#endif
