#include <Arduino.h>
#include <CAN.h>
#include <WiFi.h>
#include <WiFiMulti.h>
#include <ESPAsync_WiFiManager.h>
#include <DNSServer.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
#include <TinyGPS++.h>
#include "obd.h"
#include "ioniq_bev.h"
#include "vehicle_data.h"
#include "pins.h"
#include "setup.h"

//Wifi Credentials
const char* ap_ssid = "OBD32";
const char* ap_password =  "secret";
const char* sta_ssid = "AP";
const char* sta_password =  "PW";
#define mqtt_server "SERVERNAME_OR_IP"
#define mqtt_port 1883
#define mqtt_user "USERNAME"
#define mqtt_password "PASSWORD"

#define AP_SSID "OBD32_Setup"
#define AP_PWD ""

#define I2C_SPEED 100000 // 100kHz

#define STATE_NORMAL 1
#define STATE_SETUP 1<<1
#define STATE_SETUP_RUNNING 1<<3

WiFiMulti wifiMulti;
WiFiClient espClient;
PubSubClient mqtt(espClient);
TwoWire I2C = TwoWire(0);
Adafruit_BMP280 bmp;
int state = 0;

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

   while (!Serial);

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


   if (digitalRead(GPIO_BTN1) == LOW) {
      WiFi.mode(WIFI_AP);
      WiFi.softAP(AP_SSID, AP_PWD);
   }

   WiFi.begin(sta_ssid, sta_password);

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

   Serial.println("Setup done.");
}

void loop()
{
   if (state & STATE_SETUP) {
      if (! (state & STATE_SETUP_RUNNING)) {
         initSetup();
      }
   }
   //vehicle_data_t vdata;
   //decode_ioniq_bev(&vdata);

   mqtt.loop();
}
// vim: sw=3 sts=3 expandtab
