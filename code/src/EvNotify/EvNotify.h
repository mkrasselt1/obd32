#ifndef EVNOTIFY_H
#define EVNOTIFY_H

#include <HTTPClient.h>
#include "../VehicleData/vehicle_data.h"

#define evnotify_url_base "https://app.evnotify.de/"
#define evnotify_url_login evnotify_url_base "login"
#define evnotify_url_location evnotify_url_base "location"
#define evnotify_url_soc evnotify_url_base "soc"
#define evnotify_url_extended evnotify_url_base "extended"
#define evnotify_header_useragend "obd32-board"

#define evnotify_akey_length 6
#define evnotify_token_length 20

class EvNotify{
    public:
        void init(const char* akey, const char* token);
        void sendSOC();
    private:
        HTTPClient https;
        vehicle_data_struct vdata;
        char akey[evnotify_akey_length];
        char token[evnotify_token_length];
        uint16_t sendHttp(const char* url, const char * data);
};
#endif