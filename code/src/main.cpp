#include <Arduino.h>
#include <CAN.h>
#include "obd.h"
#include "ioniq_bev.h"
#include "vehicle_data.h"

void setup() {
  Serial.begin(115200);

  while (!Serial);

  CAN.setPins(CAN_PIN_RX, CAN_PIN_TX);
  //Start CAN
  while (true) {
    if (!CAN.begin(CAN_BUS_SPEED)) {
      Serial.println(F("Can init failed!"));
    } else {
      Serial.println(F("Can init success")); break;
    }
  }

  Serial.println("Setup done");
}

void loop()
{
  vehicle_data_t vdata;
  decode_ioniq_bev(&vdata);
  Serial.print("SOC_BMS:                    ");
  Serial.println(vdata.soc_bms);
  Serial.print("SOC_DISPLAY:                ");
  Serial.println(vdata.soc_display);
  Serial.print("auxBatteryVoltage:          ");
  Serial.println(vdata.aux_battery_voltage);
  Serial.print("batteryInletTemperature:    ");
  Serial.println(vdata.battery_inlet_temperature);
  Serial.print("batteryMaxTemperature:      ");
  Serial.println(vdata.battery_max_temperature);
  Serial.print("batteryMinTemperature:      ");
  Serial.println(vdata.battery_min_temperature);
  Serial.print("cumulativeEnergyCharged:    ");
  Serial.println(vdata.cumulative_energy_charged);
  Serial.print("cumulativeEnergyDischarged: ");
  Serial.println(vdata.cumulative_energy_discharged);
  Serial.print("charging:                   ");
  Serial.println(vdata.charging);
  Serial.print("normalChargePort:           ");
  Serial.println(vdata.normal_charge_port);
  Serial.print("rapidChargePort:            ");
  Serial.println(vdata.rapid_charge_port);
  Serial.print("dcBatteryCurrent:           ");
  Serial.println(vdata.dc_battery_current);
  Serial.print("dcBatteryPower:             ");
  Serial.println(vdata.dc_battery_power);
  Serial.print("dcBatteryVoltage:           ");
  Serial.println(vdata.dc_battery_voltage);
  Serial.print("soh:                        ");
  Serial.println(vdata.soh);
  Serial.print("externalTemperature:        ");
  Serial.println(vdata.external_temperature);
  Serial.print("odo:                        ");
  Serial.println(vdata.odo);
  Serial.println();
  sleep(1);
}

#if 0
void printPID(int pid) {
  // print PID name
  Serial.print(OBD2.pidName(pid));
  Serial.print(F(" = "));

  // read the PID value
  float pidValue = OBD2.pidRead(pid);

  if (isnan(pidValue)) {
    Serial.print("error");
  } else {
    char topic[20] = "obd32";
    char sub_topic[20];
    char result[8];
    dtostrf(pidValue, 6, 2, result);
    OBD2.pidName(pid).toCharArray(sub_topic, 20);
    strcat(topic, "/");
    strcat(topic, sub_topic);
    // print value with units
    mqtt.publish(topic, result);

    Serial.print(pidValue);
    Serial.print(F(" "));
    Serial.print(OBD2.pidUnits(pid));
  }
  Serial.print("; ");
}
#endif
