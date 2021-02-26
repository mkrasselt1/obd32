#include "EvNotify.h"

extern EvNotifySender EvNotify;

#include <ArduinoJson.h>
#include <WiFiClientSecure.h>
#include <HTTPClient.h>
#include "ca_root.h"

WiFiClientSecure *client = new WiFiClientSecure;
DynamicJsonDocument doc(1024);
    
HTTPClient EvNotifySender::https;
vehicle_data_struct* EvNotifySender::vdata;
GpsDataState_t* EvNotifySender::location;
char EvNotifySender::akey[evnotify_akey_length];
char EvNotifySender::token[evnotify_token_length];

const char* EvNotifySender::getModuleName()
{
    return "EvNotify";
}


bool EvNotifySender::init(const char* user_akey, const char* user_token){
    memcpy (&user_akey, akey, evnotify_akey_length);
    memcpy(&user_token, token, evnotify_token_length);
    client->setCACert(root_ca);
    return true;
};

bool EvNotifySender::start()
{
    xTaskCreate(EvNotifyThread, "EvNotify", 1024, NULL, 1, NULL);
    return true;
}


void EvNotifySender::sendNotify(bool abort){
    https.begin(evnotify_url_soc, root_ca);
    https.addHeader("Content-Type", "application/json");
    doc["akey"]     = akey;
    doc["token"]    = token;
    doc["abort"]      = abort;
    char message[150];
    serializeJson(doc, message);
    sendHttp(evnotify_url_soc, message);
}

void EvNotifySender::sendSOC(){
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

void EvNotifySender::sendLocation(){
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

void EvNotifySender::sendExtended(){
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

uint16_t EvNotifySender::sendHttp(const char* url, const char* data){
    https.begin(evnotify_url_soc, root_ca);
    https.addHeader("Content-Type", "application/json");
    https.POST(data);
    https.end();
    return 1;
};

void EvNotifySender::EvNotifyThread(void* args)
{
    long lastsend = 0;
    while (true){
        if(millis()-lastsend>=5000){
            EvNotify.sendSOC();
        }
        vTaskDelay(500 / portTICK_PERIOD_MS);
    }    
};

EvNotifySender EvNotify;
