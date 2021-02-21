#pragma once

typedef struct vehicle_data_struct {
	float soc_bms;
	float soc_display;
	float aux_battery_voltage;
	float battery_inlet_temperature;
	float battery_max_temperature;
	float battery_min_temperature;
	float cumulative_energy_charged;
	float cumulative_energy_discharged;
	bool  charging;
	bool  normal_charge_port;
	bool  rapid_charge_port;
	float dc_battery_current;
	float dc_battery_power;
	float dc_battery_voltage;
	float soh;
	float external_temperature;
	float odo;
} vehicle_data_t;
