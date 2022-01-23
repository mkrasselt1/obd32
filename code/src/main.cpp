#include <Arduino.h>
#include <Update.h>
#include "FS.h"
#include "SPIFFS.h"
#include "Wifi.h"
#include <WiFiClient.h>
#include <ESPmDNS.h>
#include <AsyncTCP.h>
#include <ESPAsyncWebServer.h>
#include "pins.h"

const char *sta_ssid = "obd32";
const char *sta_password = "obd32";
const char *host = "obd32";

unsigned long previousMillis = 0; // will store last time LED was updated
const long interval = 150;        // interval at which to blink (milliseconds)
int ledState = 0;                 // ledState used to set the LED
bool leddirection = false;           // direction of leds
bool shouldReboot = false;        //flag to use from web update to reboot the ESP

// Create AsyncWebServer object on port 80
AsyncWebServer server(80);
AsyncWebSocket ws("/ws");
AsyncEventSource events("/events"); // event source (Server-Sent events)

void notifyClients()
{
    ws.textAll(String(ledState));
}

void handleWebSocketMessage(void *arg, uint8_t *data, size_t len)
{
    AwsFrameInfo *info = (AwsFrameInfo *)arg;
    if (info->final && info->index == 0 && info->len == len && info->opcode == WS_TEXT)
    {
        data[len] = 0;
        if (strcmp((char *)data, "toggle") == 0)
        {
            ledState = !ledState;
            notifyClients();
        }
    }
}

void onEvent(AsyncWebSocket *server, AsyncWebSocketClient *client, AwsEventType type,
             void *arg, uint8_t *data, size_t len)
{
    switch (type)
    {
    case WS_EVT_CONNECT:
        Serial.printf("WebSocket client #%u connected from %s\n", client->id(), client->remoteIP().toString().c_str());
        break;
    case WS_EVT_DISCONNECT:
        Serial.printf("WebSocket client #%u disconnected\n", client->id());
        break;
    case WS_EVT_DATA:
        handleWebSocketMessage(arg, data, len);
        break;
    case WS_EVT_PONG:
    case WS_EVT_ERROR:
        break;
    }
}

// Replaces placeholder with LED state value
String processor(const String &var)
{
    Serial.println(var);
    if (var == "STATE")
    {
        Serial.print(ledState);
        return String(ledState);
    }
    return String();
}

void onRequest(AsyncWebServerRequest *request)
{
    //Handle Unknown Request
    request->send(404);
}

void setup()
{
    Serial.begin(115200);

    pinMode(GPIO_BTN1, INPUT_PULLUP);
    pinMode(GPIO_USB_EN, OUTPUT);
    pinMode(GPIO_LED_R, OUTPUT);
    pinMode(GPIO_LED_G, OUTPUT);
    pinMode(GPIO_LED_B, OUTPUT);

    // Initialize SPIFFS
    if (!SPIFFS.begin(true))
    {
        Serial.println("An Error has occurred while mounting SPIFFS");
        return;
    }

    WiFi.begin(sta_ssid, sta_password);
    Serial.println("Connecting to WiFi");
    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial.print(".");
    }
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());

    /*use mdns for host name resolution*/
    if (!MDNS.begin(host))
    { //http://esp32.local
        Serial.println("Error setting up MDNS responder!");
        while (1)
        {
            delay(1000);
        }
    }

    Serial.println("mDNS responder started");

    // Route for root / web page
    server.serveStatic("/", SPIFFS, "/")
        .setDefaultFile("index.html")
        .setAuthentication("obd32", "obd32");

    /*handling uploading firmware file */

    // upload a file to /upload
    server.on(
        "/update", HTTP_POST, [](AsyncWebServerRequest *request)
        {
            shouldReboot = !Update.hasError();
            AsyncWebServerResponse *response = request->beginResponse(200, "text/plain", shouldReboot ? "OK" : "FAIL");
            response->addHeader("Connection", "close");
            request->send(response);
        },
        [](AsyncWebServerRequest *request, String filename, size_t index, uint8_t *data, size_t len, bool final)
        {
            if (!index)
            {
                Serial.printf("Update Start: %s\n", filename.c_str());
                //Update.runAsync(true);
                if (filename == "spiffs.bin")
                {
                    // size_t fsSize = ((size_t)&_FS_end - (size_t)&_FS_start);
                    size_t fsSize = SPIFFS.totalBytes();
                    SPIFFS.end();
                    SPIFFS.begin();
                    if (!Update.begin(fsSize, U_SPIFFS)) //start with max available size
                    {
                        Update.printError(Serial);
                    }
                }
                else if (filename == "firmware.bin")
                {
                    if (!Update.begin((ESP.getFreeSketchSpace() - 0x1000) & 0xFFFFF000))
                    {
                        Update.printError(Serial);
                    }
                }
                else
                {
                    Serial.println("Filename not matching");
                }
            }
            if (!Update.hasError())
            {
                if (Update.write(data, len) != len)
                {
                    Update.printError(Serial);
                }
            }
            if (final)
            {
                if (Update.end(true))
                {
                    Serial.printf("Update Success: %uB\n", index + len);
                }
                else
                {
                    Update.printError(Serial);
                }
            }
        });
    server.begin();
}

void loop()
{
    ws.cleanupClients();
    delay(1);
    if (shouldReboot)
    {
        Serial.println("Rebooting...");
        delay(100);
        ESP.restart();
    }
    static char temp[128];
    sprintf(temp, "Seconds since boot: %u", millis() / 1000);
    events.send(temp, "time"); //send event "time"

    //loop to blink without delay
    unsigned long currentMillis = millis();
    if (currentMillis - previousMillis >= interval)
    {
        // save the last time you blinked the LED
        previousMillis = currentMillis;
        if(leddirection){
            ledState--;
        }else{
            ledState++;
        }
        
        digitalWrite(GPIO_LED_R, false);
        digitalWrite(GPIO_LED_G, false);
        digitalWrite(GPIO_LED_B, false);
        switch (ledState)
        {
        case 1:
            digitalWrite(GPIO_LED_R, true);
            break;
        case 2:
            digitalWrite(GPIO_LED_G, true);
            break;
        case 3:
            digitalWrite(GPIO_LED_B, true);
            break;
        default:
            leddirection=!leddirection;
            if(leddirection){
                ledState=4;
            }else{
                ledState=0;
            }
        }
        // set the LED with the ledState of the variable:

        Serial.print("Set LED to: ");
        Serial.println(ledState);
    }
}