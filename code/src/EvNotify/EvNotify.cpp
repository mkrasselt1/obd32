#include <Arduino.h>
#include <ArduinoJson.h>
#include <WiFiClientSecure.h>
#include <HTTPClient.h>
#include "EvNotify.h"
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
    doc["bms"]      = vdata.soc_bms;
    doc["display"]  = vdata.soc_display;
    char message[200];
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
