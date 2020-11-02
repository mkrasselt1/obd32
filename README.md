# obd32
The goal of this project is to create a esp32 based pcb and software to
catch and submit automotive data from obd2 ports of supported vehicles 
to a given (list of ) endpoints(s). 

Anyone is free to join our goal to make the hardware reliable and affordable.

current plan conatins the featureset of:
- esp32 based microprocessor
- direct canbus via tranciever chip MCP2562-e
- wifi connection to hotsport or
- onboard switchable usb port for lte-wifi-router 
- bluetooth connection compatible with elm327ds
- micro sd card slot for configuration, logging and cache
- ota updates via github releases
- build in webfrontend
- low power sleep mode (canbus activity and battery voltage)
- gps for location and altitude sync
- communication protocolls: https-post, websocket, mqtt

