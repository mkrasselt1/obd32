#include <Arduino.h>
#include <inttypes.h>
#include <stdio.h>
#include "../../OBD2/obd2.h"
#include "../src/HEXDUMP/hexdump.h"
#include "../vehicle_data.h"

extern OBD2Reader OBD2ReaderService;
#pragma pack(push, 1)
struct {
	uint8_t  pad0[6];
	uint8_t  soc_bms;                       // *.5
	uint8_t  available_charge_power[2];     // *.01
	uint8_t  available_discharge_power[2];  // *.01
	uint8_t  bms_bits1;
	uint8_t  dc_battery_current[2];         // *.1
	uint8_t  dc_battery_voltage[2];         // *.1
	int8_t   battery_max_temperature;
	int8_t   battery_min_temperature;
	int8_t   cell_temps[5];                 // cell blocks 1 - 5
	uint8_t  pad1;
   int8_t   battery_inlet_temperature;
   uint8_t  max_cell_voltage;              // *.02
   uint8_t  max_cell_voltage_number;
   uint8_t  min_cell_voltage;              // *.02
   uint8_t  min_cell_voltage_number;
   uint8_t  fan_status;
   uint8_t  fan_rpm;                       // *100
   uint8_t  aux_battery_voltage;           // *.1
   uint8_t  cumulative_charge_current[4];     // *.1
   uint8_t  cumulative_discharge_current[4];  // *.1
   uint8_t  cumulative_energy_charged[4];     // *.1
   uint8_t  cumulative_energy_discharged[4];  // *.1
   uint8_t  operating_seconds[4];
   uint8_t  bms_bits2;
   uint8_t  inverter_capacitor_voltage[2];
   int16_t  drive_motor_speeds[2];
   uint8_t  isolation_resistance[2];
} b2101; // cmd: 21 01; rx: 0x7ec; tx: 0x7e4

struct {
	uint8_t  pad0[6];
	uint8_t  cell_voltages[32];              // *.02; cells 1 - 32
} b2102; // cmd: 21 02; rx: 0x7ec; tx: 0x7e4
struct {
	uint8_t  pad0[6];
	uint8_t  cell_voltages[32];              // *.02; cells 33 - 64
} b2103; // cmd: 21 03; rx: 0x7ec; tx: 0x7e4
struct {
	uint8_t  pad0[6];
	uint8_t  cell_voltages[32];              // *.02; cells 65 - 96
} b2104; // cmd: 21 04; rx: 0x7ec; tx: 0x7e4

struct {
	uint8_t  pad0[11];
	int8_t   cell_temps[7];                  // cell blocks 6 - 12
	uint8_t  pad1[4];
	uint8_t  cell_voltage_deviation;         // *.02
	uint8_t  pad2;
	uint8_t  airbag_wire_duty;
	int8_t   battery_heater_temperatures[2];
	uint8_t  soh[2];                         // *.1
	uint8_t  max_cell_deterioration_cell;
	uint8_t  max_cell_deterioration_percent[2]; // *.1
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
	uint8_t  pad0[9];
	uint8_t  odo[3];                         // & 0x0fff
	uint8_t  pad1[3];
} b22b002; // cmd: 22 b0 02; rx: 0x7ce; tx: 0x7c6
#pragma pack(pop)

const uint8_t cmd2101[] = {0x21, 0x01};
const uint8_t cmd2102[] = {0x21, 0x02};
const uint8_t cmd2103[] = {0x21, 0x03};
const uint8_t cmd2104[] = {0x21, 0x04};
const uint8_t cmd2105[] = {0x21, 0x05};
const uint8_t cmd22b002[] = {0x22, 0xb0, 0x02};
const uint8_t cmd2180[] = {0x21, 0x80};

void decode_ioniq_bev(vehicle_data_t* vdata) {
	OBD2ReaderService.isotp_cmd(0x7ec, 0x7e4, cmd2101, sizeof(cmd2101), (uint8_t*)&b2101, sizeof(b2101));
	OBD2ReaderService.isotp_cmd(0x7ec, 0x7e4, cmd2102, sizeof(cmd2102), (uint8_t*)&b2102, sizeof(b2102));
	OBD2ReaderService.isotp_cmd(0x7ec, 0x7e4, cmd2103, sizeof(cmd2103), (uint8_t*)&b2103, sizeof(b2103));
	OBD2ReaderService.isotp_cmd(0x7ec, 0x7e4, cmd2104, sizeof(cmd2104), (uint8_t*)&b2104, sizeof(b2104));
	OBD2ReaderService.isotp_cmd(0x7ec, 0x7e4, cmd2105, sizeof(cmd2105), (uint8_t*)&b2105, sizeof(b2105));
	OBD2ReaderService.isotp_cmd(0x7ee, 0x7e6, cmd2180, sizeof(cmd2180), (uint8_t*)&b2180, sizeof(b2180)); // might fail, how to handle?
	OBD2ReaderService.isotp_cmd(0x7ce, 0x7c6, cmd22b002, sizeof(cmd22b002), (uint8_t*)&b22b002, sizeof(b22b002));

	hexdump(b2101.dc_battery_voltage, 2, 8);

	vdata->soc_bms = b2101.soc_bms * .5;
	vdata->soc_display = b2105.soc_display * .5;
	vdata->aux_battery_voltage = b2101.aux_battery_voltage * .1;
	vdata->battery_inlet_temperature = b2101.battery_inlet_temperature * 1.0;
	vdata->battery_max_temperature = b2101.battery_max_temperature * 1.0;
	vdata->battery_min_temperature = b2101.battery_min_temperature * 1.0;
	vdata->cumulative_energy_charged = ((uint32_t)b2101.cumulative_energy_charged[3]
			                            | (uint32_t)b2101.cumulative_energy_charged[2] << 8
			                            | (uint32_t)b2101.cumulative_energy_charged[1] << 16
			                            | (uint32_t)b2101.cumulative_energy_charged[0] << 24) * .1;
	vdata->cumulative_energy_discharged = ((uint32_t)b2101.cumulative_energy_discharged[3]
			                               | (uint32_t)b2101.cumulative_energy_discharged[2] << 8
			                               | (uint32_t)b2101.cumulative_energy_discharged[1] << 16
			                               | (uint32_t)b2101.cumulative_energy_discharged[0] << 24) * .1;
	vdata->charging = (b2101.bms_bits1 & 0x80) != 0;
	vdata->normal_charge_port = (b2101.bms_bits1 & 0x20) != 0;
	vdata->rapid_charge_port = (b2101.bms_bits1 & 0x40) != 0;
	vdata->dc_battery_current = ((uint16_t)b2101.dc_battery_current[1]
			                     | (uint16_t)b2101.dc_battery_current[0] << 8) * .1;
	vdata->dc_battery_voltage = ((uint16_t)b2101.dc_battery_voltage[1]
			                     | (uint16_t)b2101.dc_battery_voltage[0] << 8) * .1;
	vdata->dc_battery_power = vdata->dc_battery_current * vdata->dc_battery_voltage / 1000.0;
	vdata->soh = ((uint32_t)b2105.soh[1]
			      | (uint32_t)b2105.soh[0] << 8) * .1;
	vdata->external_temperature = b2180.external_temperature * .5 - 40;
	vdata->odo = ((uint32_t)b22b002.odo[2]
			      | (uint32_t)b22b002.odo[1] << 8
			      | (uint32_t)b22b002.odo[0] << 16);

};

// vim: ts=3 sw=3
