#include <Arduino.h>
#include <CAN.h>
#include <inttypes.h>
#include <stdlib.h>
#include <assert.h>
#include "obd.h"
#include "../src/HEXDUMP/hexdump.h"
#include "../src/VehicleData/vehicle_data.h"

#define DEBUG false

const uint8_t CanFlowMsg[] = {0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};

struct can_frame {
	uint32_t can_id;
	size_t length;
	uint8_t data[CAN_MAX_FRAME_LEN];
};

void read_frame(uint16_t can_rx, uint16_t timeout, struct can_frame* buffer) {
	// Busy wait for response

	CAN.filter(can_rx);

	timeout = timeout + millis();
	size_t packet_size = 0;
	while (millis() < timeout && !packet_size) {
		packet_size = CAN.parsePacket();
	}

	assert (packet_size <= CAN_MAX_FRAME_LEN);

	buffer->can_id = CAN.packetId();
	buffer->length = packet_size;
	CAN.readBytes(buffer->data, buffer->length);
}

void read_frame(uint32_t can_rx, struct can_frame* buffer) {
	read_frame(can_rx, CAN_DEFAULT_READ_TIMEOUT, buffer);
}

void isotp_cmd(uint32_t can_rx, uint32_t can_tx, const uint8_t* cmd, size_t cmd_len, uint8_t* data_buf, size_t data_buf_len) {

	assert(cmd_len < CAN_MAX_FRAME_LEN);

	struct can_frame frame;

	memcpy(frame.data+1, cmd, cmd_len);
	frame.data[0] = cmd_len;
	memset(frame.data + cmd_len + 1, 0, 7 - cmd_len);
	frame.length = 8;

#ifdef DEBUG
	Serial.print("Send frame:     ");
	hexdump(frame.data, frame.length, 8);
#endif

	CAN.beginPacket(can_tx);
	CAN.write(frame.data, frame.length);
	CAN.endPacket();

	size_t msg_len = 0;         // length of all frames combined
	size_t payload_len = 0;     // length of iso-tp payload of current frame
	uint8_t last_frame_idx = 0;
	uint8_t frame_idx = 0;
	uint16_t data_offset = 0;
	while(data_offset < msg_len || msg_len == 0) {
		// We need to read all frames from buffer. Too small target buffers are handled
		read_frame(can_rx, &frame);
#if DEBUG
		Serial.print("Received frame: ");
		hexdump(frame.data, frame.length, 8);
#endif

		switch (frame.data[0] & 0xf0) {  // frame_type
			case 0x00:                    // single frame
				msg_len = frame.data[0] & 0x0f;
				memcpy(data_buf, frame.data + 1, min(msg_len, data_buf_len));
				data_offset = msg_len;
				break;
			case 0x10:                    // first frame
				assert(data_offset == 0);  // if data_offset != 0 we have already seen the first frame
				msg_len = (frame.data[0] & 0x0f) + frame.data[1];
				memcpy(data_buf, frame.data + 2, min(frame.length - 2, data_buf_len));
				data_offset = frame.length - 2;
				last_frame_idx = 0;
#if DEBUG
				Serial.print("Send frame:     ");
				hexdump((uint8_t*)&CanFlowMsg, sizeof(CanFlowMsg), 8);
#endif
				CAN.beginPacket(can_tx);
				CAN.write(CanFlowMsg, sizeof(CanFlowMsg));
				CAN.endPacket();
				break;
			case 0x20:                    // continuation frame
				frame_idx = frame.data[0] & 0x0f;
				assert((last_frame_idx + 1) % 0x10 == frame_idx); // misordered frame received ?!?
				payload_len = min(7, (uint16_t)msg_len - data_offset);
				if (data_offset < data_buf_len)	// Avoid copying past the target buffer
					memcpy(data_buf + data_offset, frame.data + 1, min(payload_len, data_buf_len - data_offset));
				data_offset += payload_len;
				last_frame_idx = frame_idx;
				break;
			case 0x30:                    // flow control frame
				// Flow control frame, cannot handle, since we are asking we should never see this
				assert(false);
				break;
		}
	}

	assert(data_offset == msg_len);	// Check if we got the amount of data we expected from the first frame
}

// vim: ts=3 sw=3
