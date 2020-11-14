//#include <Arduino.h>
#include <inttypes.h>
#include <stdlib.h>

typedef struct vehicle_data {
} vehicle_data_t;

int isotp_cmd(uint16_t can_rx, uint16_t can_tx, const char* cmd, uint8_t cmd_len,
               void* data, size_t data_len);
