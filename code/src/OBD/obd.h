//#include <Arduino.h>
#include <inttypes.h>
#include <stdlib.h>

#define CAN_PIN_RX 4
#define CAN_PIN_TX 5
#define CAN_BUS_SPEED 500E3

#define CAN_MAX_FRAME_LEN 8
#define CAN_DEFAULT_READ_TIMEOUT 500

void isotp_cmd(uint16_t can_rx, uint16_t can_tx, const uint8_t* cmd, size_t cmd_len,
              uint8_t* data_buf, size_t data_len);

