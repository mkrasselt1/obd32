#include "./gps.h"


TinyGPSPlus GPSReceiver::gps;
HardwareSerial GPSReceiver::GPS_serial(2);
GpsDataState_t gpsState = {};

bool GPSReceiver::init(int gps_rx_pin, int gps_tx_pin){
    GPS_serial.begin(9600, SERIAL_8N1);
    return true;
};

bool GPSReceiver::start()
{
    xTaskCreate(GPSReceiverThread, "EvNotify", 1024, NULL, 1, NULL);
    return true;
}

void GPSReceiver::GPSReceiverThread(void* args){
    while(true){
        while (GPS_serial.available() > 0) {
            gps.encode(GPS_serial.read());
        }
    }
}

