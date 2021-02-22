#include "EvNotify.h"

#include <ArduinoJson.h>
#include <WiFiClientSecure.h>
#include <HTTPClient.h>
#include "ca_root.h"

WiFiClientSecure *client = new WiFiClientSecure;
DynamicJsonDocument doc(1024);
    

void EvNotify::init(const char* akey, const char* token){
    memcpy (&akey, EvNotify::akey, evnotify_akey_length);
    memcpy(&token, EvNotify::token, evnotify_token_length);
    client->setCACert(root_ca);
};

void EvNotify::sendSOC(){
    https.begin(evnotify_url_soc, root_ca);
    https.addHeader("Content-Type", "application/json");
    doc["akey"]     = akey;
    doc["token"]    = token;
    doc["bms"]      = vdata->soc_bms;
    doc["display"]  = vdata->soc_display;
    char message[200];
    serializeJson(doc, message);
    sendHttp(evnotify_url_soc, message);
};

void EvNotify::sendLocation(){
    https.begin(evnotify_url_soc, root_ca);
    https.addHeader("Content-Type", "application/json");
    doc["akey"]     = akey;
    doc["token"]    = token;
    doc["location"]["latitude"]     = location->latitude;
    doc["location"]["longitude"]    = location->longitude;
    doc["location"]["speed"]        = location->speed;
    char message[200];
    serializeJson(doc, message);
    sendHttp(evnotify_url_soc, message);
};

void EvNotify::sendExtended(){
    https.begin(evnotify_url_soc, root_ca);
    https.addHeader("Content-Type", "application/json");
    doc["akey"]     = akey;
    doc["token"]    = token;
    doc["soh"]                  = vdata->soh;
    doc["charging"]             = vdata->charging;
    doc["rapidChargePort"]      = vdata->rapid_charge_port;
    doc["normalChargePort"]     = vdata->normal_charge_port;
    doc["slowChargePort"]       = 0;
    doc["auxBatteryVoltage"]    = vdata->aux_battery_voltage;
    doc["dcBatteryVoltage"]     = vdata->dc_battery_voltage;
    doc["dcBatteryCurrent"]     = vdata->dc_battery_current;
    doc["dcBatteryPower"]       = vdata->dc_battery_power;
    doc["cumulativeEnergyCharged"]  = vdata->cumulative_energy_charged;
    doc["cumulativeEnergyDischarged"] = vdata->cumulative_energy_discharged;
    doc["batteryMinTemperature"]    = vdata->battery_min_temperature;
    doc["batteryMaxTemperature"]    = vdata->battery_max_temperature;
    doc["batteryInletTemperature"]  = vdata->battery_inlet_temperature;
    doc["externalTemperature"]      = vdata->external_temperature;
    doc["odo"]                  = vdata->odo;
    char message[400];
    serializeJson(doc, message);
    sendHttp(evnotify_url_soc, message);
};

uint16_t EvNotify::sendHttp(const char* url, const char* data){
    https.begin(evnotify_url_soc, root_ca);
    https.addHeader("Content-Type", "application/json");
    https.POST(data);
    https.end();
    return 1;
};
