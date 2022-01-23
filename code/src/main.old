#include <Arduino.h>
#include <CAN.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <WiFiMulti.h>
#include <DNSServer.h>
#include <ArduinoJson.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_BMP3XX.h"
#include "../src/OBD2/obd2.h"
#include "../src/VehicleData/Hyundai_Ioniq/ioniq_bev.h"
#include "../src/VehicleData/vehicle_data.h"
#include "../src/GPS/gps.h"
#include "../src/EvNotify/EvNotify.h"
#include "pins.h"

//Wifi Credentials
//const char* ap_ssid = "OBD32";
//const char* ap_password =  "secret";
const char* ap_ssid = "WERKSTATT";
const char* ap_password =  "MsZL1uV5KJHL";
const char* sta_ssid = "AP";
const char* sta_password =  "PW";

#define vers "0.0.1"

#define I2C_SPEED 100000 // 100kHz

#define STATE_NORMAL 1
#define STATE_SETUP 1<<1
#define STATE_SETUP_RUNNING 1<<3
#define evnotify_akey "bfddba"
#define evnotify_token "ccf59da76a0caa94cb4a"
#define CAN_PIN_RX 4
#define CAN_PIN_TX 5

WiFiMulti wifiMulti;
WiFiClient espClient;
WiFiClientSecure espClientSecure;
TwoWire I2C = TwoWire(0);
Adafruit_BMP3XX bmp;
HTTPClient http;

extern EvNotifySender EvNotify;
extern GPSReceiver GPS;

int state = 0;

void setup() {
   pinMode(GPIO_BTN1, INPUT_PULLUP);
   pinMode(GPIO_USB_EN, OUTPUT);
   pinMode(GPIO_LED_R, OUTPUT);
   pinMode(GPIO_LED_G, OUTPUT);
   pinMode(GPIO_LED_B, OUTPUT);

   Serial.begin(115200);
   while (!Serial);

   if (digitalRead(GPIO_BTN1) == LOW) {
      WiFi.mode(WIFI_AP);
      WiFi.softAP(ap_ssid, ap_password);
   }else {
      //Start Wifi
      WiFi.begin(sta_ssid, sta_password);
      Serial.println("Connecting to WiFi");
      while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
      }
      Serial.println("WiFi connected");
      Serial.println("IP address: ");
      Serial.println(WiFi.localIP());

      EvNotify.init(evnotify_akey, evnotify_token);
      GPS.init(GPIO_GPS_RX, GPIO_GPS_TX);
      //Call once data is Ready
      EvNotify.start();
      GPS.start();
      Serial.println("Setup done.");
   }


   //I2C.begin(GPIO_I2C0_SDA, GPIO_I2C0_SCL, I2C_SPEED);
   //if(bme.begin(&I2C));
   //bmp.readTemperature()
   //bmp.readPressure()


   //Start CAN
   CAN.setPins(GPIO_CAN_RX, GPIO_CAN_TX);
   while (true) {
      if (!CAN.begin(CAN_BUS_SPEED)) {
      	 Serial.println(F("Can init failed!"));
      } else {
      	 Serial.println(F("Can init success")); break;
      }
   }   while (!Serial);

  // businessLogic::init(vers);
}

void loop(){
  vehicle_data_t vdata;
  decode_ioniq_bev(&vdata);
}
// vim: sw=3 sts=3 expandtab
