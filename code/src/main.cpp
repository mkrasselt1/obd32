#include <Arduino.h>
#include <CAN.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
#include <TinyGPS++.h>
#include "obd.h"
#include "ioniq_bev.h"
#include "vehicle_data.h"
#include "pins.h"

//Wifi Credentials
const char* ap_ssid = "OBD32";
const char* ap_password =  "secret";
const char* sta_ssid = "AP";
const char* sta_password =  "PW";
#define mqtt_server "SERVERNAME_OR_IP"
#define mqtt_port 1883
#define mqtt_user "USERNAME"
#define mqtt_password "PASSWORD"

#define I2C_SPEED 100000; // 100kHz

WiFiClient espClient;
PubSubClient mqtt(espClient);
TwoWire I2C = TwoWire(0);
Adafruit_BMP280 bmp;

void setup() {
  pinMode(GPIO_BTN1, INPUT_PULLUP);
  pinMode(GPIO_USB_EN, OUTPUT);
  pinMode(GPIO_LED_R, OUTPUT);
  pinMode(GPIO_LED_G, OUTPUT);
  pinMode(GPIO_LED_B, OUTPUT);

  Serial.begin(115200);
  Serial2.begin(9600, SERIAL_8N1, GPIO_GPS_RX, GPIO_GPS_TX);

  //I2C.begin(GPIO_I2C0_SDA, GPIO_I2C0_SCL, I2C_SPEED);
  //if(bme.begin(&I2C));
  //bmp.readTemperature()
  //bmp.readPressure()

  WiFi.mode(WIFI_AP_STA);     // concurrent AP and STA mode. AP for setup
  WiFi.softAP(ap_ssid, ap_password);
  WiFi.begin(sta_ssid, sta_password);

  while (!Serial);

  //Start Wifi
  Serial.print("Connecting to WiFi ");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  //Start CAN
  CAN.setPins(GPIO_CAN_RX, GPIO_CAN_TX);
  while (true) {
    if (!CAN.begin(CAN_BUS_SPEED)) {
      Serial.println(F("Can init failed!"));
    } else {
      Serial.println(F("Can init success")); break;
    }
  }

  //MQTT
  mqtt.setServer(mqtt_server, mqtt_port);
  if (mqtt.connect("odb32", mqtt_user, mqtt_password)) {
    mqtt.publish("odb32/status","running");
    mqtt.subscribe("odb32/settings");
  }

  Serial.println("Setup done.");
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

  mqtt.loop();
}

