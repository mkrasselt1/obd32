#ifndef EVNOTIFY_SENDER_H
#define EVNOTIFY_SENDER_H


#include <HTTPClient.h>
#include "../VehicleData/vehicle_data.h"
#include "../GPS/gps.h"

#define evnotify_url_base "https://app.evnotify.de/"
#define evnotify_url_login evnotify_url_base "login"
#define evnotify_url_location evnotify_url_base "location"
#define evnotify_url_soc evnotify_url_base "soc"
#define evnotify_url_extended evnotify_url_base "extended"
#define evnotify_header_useragend "obd32-board"

#define evnotify_akey_length 6
#define evnotify_token_length 20

class EvNotifySender{
    public:
        static bool init(const char* akey, const char* token);
        static bool start();
        static void sendSOC();
        static void sendLocation();
        static void sendExtended();
        static void sendNotify(bool abort);
        const char* getModuleName();
    private:
        static HTTPClient https;
        static vehicle_data_struct* vdata;
        static GpsDataState_t* location;
        static char akey[evnotify_akey_length];
        static char token[evnotify_token_length];
        static uint16_t sendHttp(const char* url, const char * data);
        static void EvNotifyThread(void* args);
};
#endif