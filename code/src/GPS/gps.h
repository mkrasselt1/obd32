#ifndef GPS_STRUCT_H
#define GPS_STRUCT_H

#include <TinyGPS++.h>

//GPS Stuff
typedef struct{
  double originLat;
  double originLon;
  double originAlt;
  double distMax;
  double dist;
  double altMax;
  double altMin;
  double spdMax;
  double prevDist;
  double latitude;
  double longitude;
  double speed;
}GpsDataState_t;

class GPSReceiver{
  public:
    static bool init(int gps_rx_pin, int gps_tx_pin);
    static bool start();
        
  private:
    static TinyGPSPlus gps;
    static HardwareSerial GPS_serial;
    static void GPSReceiverThread(void* args);
};

#endif