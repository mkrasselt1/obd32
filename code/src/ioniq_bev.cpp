#include <inttypes.h>
#include <stdio.h>
#include "obd.h"

#pragma pack(push, 1)
struct {
	uint8_t  pad0[6];
	uint8_t  soc_bms;                       // *.5
	uint16_t available_charge_power;        // *.01
	uint16_t available_discharge_power;     // *.01
	uint8_t  bms_bits1;
	int16_t  dc_battery_current;            // *.1
	uint16_t dc_byttery_voltage;            // *.1
	int8_t   battery_max_temperature;
	int8_t   battery_min_temperature;
	int8_t   cell_temps[5];                  // cell blocks 1 - 5
	uint8_t  pad1;
        int8_t   battery_inlet_temperature;
        uint8_t  max_cell_voltage;              // *.02
        uint8_t  max_cell_voltage_number;
        uint8_t  min_cell_voltage;              // *.02
        uint8_t  min_cell_voltage_number;
        uint8_t  fan_status;
        uint8_t  fan_rpm;                       // *100
        uint8_t  aux_battery_voltage;           // *.1
        uint32_t cumulative_charge_current;     // *.1
        uint32_t cumulative_discharge_current;  // *.1
        uint32_t cumulative_energy_charged;     // *.1
        uint32_t cumulative_energy_discharged;  // *.1
        uint32_t operating_seconds;
        uint8_t  bms_bits2;
        uint16_t inverter_capacitor_voltage;
        int16_t  drive_motor_speeds[2];
        uint16_t isolation_resistance;
} b2101; // cmd: 21 01; rx: 0x7ec; tx: 0x7e4

struct {
	uint8_t  pad0[6];
	int8_t   cell_voltages[32];              // *.02; cells 1 - 32
} b2102; // cmd: 21 02; rx: 0x7ec; tx: 0x7e4
struct {
	uint8_t  pad0[6];
	int8_t   cell_voltages[32];              // *.02; cells 33 - 64
} b2103; // cmd: 21 03; rx: 0x7ec; tx: 0x7e4
struct {
	uint8_t  pad0[6];
	int8_t   cell_voltages[32];              // *.02; cells 65 - 96
} b2104; // cmd: 21 04; rx: 0x7ec; tx: 0x7e4

struct {
	uint8_t  pad0[11];
	int8_t   cell_temps[7];                  // cell blocks 6 - 12
	uint8_t  pad1[4];
	uint8_t  cell_voltage_deviation;         // *.02
	uint8_t  pad2;
	uint8_t  airbag_wire_duty;
	int8_t   battery_heater_temperatures[2];
	uint16_t soh;                            // *.1
	uint8_t  max_cell_deterioration_cell;
	uint16_t max_cell_deterioration_percent; // *.1
	uint8_t  min_cell_deterioration_cell;
	uint8_t  soc_display;                    // *.5
	uint8_t  pad3[11];
} b2105; // cmd: 21 05; rx: 0x7ec; tx: 0x7e4

struct {
	uint8_t  pad0[14];
	int8_t   external_temperature;           // *.5 -40
	uint8_t  pad1[10];
} b2180; // cmd: 21 80; rx: 0x7ee; tx: 0x7e6

struct {
	uint8_t  pad0[8];
	int32_t  odo;                            // & 0x0fff
	uint8_t  pad1[3];
} b22b002; // cmd: 22 b0 02; rx: 0x7ce; tx: 0x7c6
#pragma pack(pop)

void decode_ioniq_bev() {
	isotp_cmd(0x7ec, 0x7e4, "\x21\x01", 2, &b2101, sizeof(b2101));
	isotp_cmd(0x7ec, 0x7e4, "\x21\x02", 2, &b2102, sizeof(b2102));
	isotp_cmd(0x7ec, 0x7e4, "\x21\x03", 2, &b2103, sizeof(b2103));
	isotp_cmd(0x7ec, 0x7e4, "\x21\x04", 2, &b2104, sizeof(b2104));
	isotp_cmd(0x7ec, 0x7e4, "\x21\x05", 2, &b2105, sizeof(b2105));
	isotp_cmd(0x7ce, 0x7c6, "\x22\xb0\x02", 3, &b22b002, sizeof(b22b002));

	isotp_cmd(0x7ee, 0x7e6, "\x21\x80", 2, &b2180, sizeof(b2180)); // might fail, how to handle?

};

int main() {
	decode_ioniq_bev();
}

// vim: ts=3 sw=3
