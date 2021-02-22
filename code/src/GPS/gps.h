#ifndef GPS_STRUCT_H
#define GPS_STRUCT_H

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

#endif