#include <Arduino.h>
#include <CAN.h> // the OBD2 library depends on the CAN library
#include <OBD2.h>
#include <SPI.h>
#include <WiFi.h>
#include <PubSubClient.h>

	
//Wifi Credentials
const char* ssid = "AP";
const char* password =  "PW";
#define mqtt_server "SERVERNAME_OR_IP"
#define mqtt_port 1883
#define mqtt_user "USERNAME"
#define mqtt_password "PASSWORD"

// array of PID's to print values of
const int PIDS[] = {
  ENGINE_RPM,
  VEHICLE_SPEED,
  THROTTLE_POSITION,
};
const int NUM_PIDS = sizeof(PIDS) / sizeof(PIDS[0]);

void printPID(int pid);
WiFiClient espClient;
PubSubClient mqtt(espClient);

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (!Serial);
  //Start Wifi
  Serial.println("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  } 
  Serial.println("OK!");
  //Start CAN
  while (true) {
    if (!OBD2.begin()) {
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
}

void loop() {
  for (int i = 0; i < NUM_PIDS; i++) { printPID(PIDS[i]); }
  Serial.println();
  delay(100);
  mqtt.loop();
}

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