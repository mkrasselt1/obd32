#ifndef OBD2_READER_H
#define OBD2_READER_H

#include <Arduino.h>
#include <inttypes.h>
#include <stdlib.h>
#include <assert.h>
#include <CAN.h>
#include "../VehicleData/vehicle_data.h"
#include "../src/HEXDUMP/hexdump.h"


#define CAN_BUS_SPEED 500E3

#define CAN_MAX_FRAME_LEN 8
#define CAN_DEFAULT_READ_TIMEOUT 500

extern ESP32SJA1000Class Can;
const uint8_t CanFlowMsg[] = {0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

struct can_frame {
	uint32_t can_id;
	size_t length;
	uint8_t data[CAN_MAX_FRAME_LEN];
};

class OBD2Reader{
    public:
        static bool init();
        static bool start();
        const char* getModuleName();
        static void isotp_cmd(uint32_t can_rx, uint32_t can_tx, const uint8_t* cmd, size_t cmd_len, uint8_t* data_buf, size_t data_len);
    private:
        static vehicle_data_struct* vdata;
        static uint16_t sendHttp(const char* url, const char * data);
        static void read_frame_timeout(uint16_t can_rx, can_frame* buffer, uint16_t timeout);
        static void read_frame(uint32_t can_rx, can_frame* buffer);
};
#endif