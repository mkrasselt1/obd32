#include <Arduino.h>
#include <inttypes.h>
#include <stdio.h>

void hexdump(uint8_t *mem, size_t len, uint8_t cols) {
    //Serial.printf("\r\n[HEXDUMP] Address: 0x%08X len: 0x%X (%d)", mem, len, len);
    for(size_t i = 0; i < len; i++) {
        if(i > 0 && i % cols == 0) {
            //Serial.printf("\r\n[0x%08X] 0x%08X: ", mem, i);
            Serial.println();
        }
        Serial.printf("%02X ", *mem);
        mem++;
    }
    Serial.printf(" (%d)", len);
    Serial.println();
}
