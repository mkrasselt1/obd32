EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L RF_Module:ESP32-WROOM-32 U4
U 1 1 5FC2C0AB
P 5800 2400
F 0 "U4" H 6150 4200 50  0000 C CNN
F 1 "ESP32-WROOM-32" H 6150 4100 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 5800 900 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 5500 2450 50  0001 C CNN
	1    5800 2400
	1    0    0    -1  
$EndComp
$Comp
L Interface_USB:CP2102N-A01-GQFN24 U2
U 1 1 5FC30699
P 2400 2100
F 0 "U2" H 2400 3500 50  0000 C CNN
F 1 "CP2102N-A01-GQFN24" H 2400 3350 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-24-1EP_4x4mm_P0.5mm_EP2.6x2.6mm" H 2850 1300 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2102n-datasheet.pdf" H 2450 1050 50  0001 C CNN
	1    2400 2100
	1    0    0    -1  
$EndComp
Text GLabel 9450 2650 0    50   Input ~ 0
CAN_RX
Text GLabel 9450 2550 0    50   Output ~ 0
CAN_TX
Text GLabel 6400 1600 2    50   Input ~ 0
CAN_TX
Text GLabel 6400 1700 2    50   Output ~ 0
CAN_RX
Text GLabel 10850 2600 2    50   BiDi ~ 0
CAN_H
Text GLabel 10150 1350 0    50   BiDi ~ 0
CAN_H
Text GLabel 10850 2900 2    50   BiDi ~ 0
CAN_L
Text GLabel 10650 1350 2    50   BiDi ~ 0
CAN_L
$Comp
L Interface_CAN_LIN:MCP2562-E-MF U6
U 1 1 5FC3AAAB
P 9950 2750
F 0 "U6" H 9600 3300 50  0000 C CNN
F 1 "MCP2562-E-MF" H 9600 3200 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_3x3mm_P0.65mm_EP1.55x2.4mm" H 9950 2250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/25167A.pdf" H 9950 2750 50  0001 C CNN
	1    9950 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5FC3C3B2
P 9950 2100
F 0 "#PWR0101" H 9950 1950 50  0001 C CNN
F 1 "+5V" H 9965 2273 50  0000 C CNN
F 2 "" H 9950 2100 50  0001 C CNN
F 3 "" H 9950 2100 50  0001 C CNN
	1    9950 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5FC3D04E
P 8800 2850
F 0 "#PWR0102" H 8800 2700 50  0001 C CNN
F 1 "+3.3V" V 8815 2978 50  0000 L CNN
F 2 "" H 8800 2850 50  0001 C CNN
F 3 "" H 8800 2850 50  0001 C CNN
	1    8800 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 5FC3DA30
P 5800 1000
F 0 "#PWR0103" H 5800 850 50  0001 C CNN
F 1 "+3.3V" H 5815 1173 50  0000 C CNN
F 2 "" H 5800 1000 50  0001 C CNN
F 3 "" H 5800 1000 50  0001 C CNN
	1    5800 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FC44E3A
P 2400 3000
F 0 "#PWR0104" H 2400 2750 50  0001 C CNN
F 1 "GND" H 2405 2827 50  0000 C CNN
F 2 "" H 2400 3000 50  0001 C CNN
F 3 "" H 2400 3000 50  0001 C CNN
	1    2400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3000 2500 3000
Connection ~ 2400 3000
$Comp
L power:GND #PWR0105
U 1 1 5FC4596A
P 5800 3800
F 0 "#PWR0105" H 5800 3550 50  0001 C CNN
F 1 "GND" H 5805 3627 50  0000 C CNN
F 2 "" H 5800 3800 50  0001 C CNN
F 3 "" H 5800 3800 50  0001 C CNN
	1    5800 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FC46006
P 9950 3150
F 0 "#PWR0106" H 9950 2900 50  0001 C CNN
F 1 "GND" H 9955 2977 50  0000 C CNN
F 2 "" H 9950 3150 50  0001 C CNN
F 3 "" H 9950 3150 50  0001 C CNN
	1    9950 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5FC4768D
P 3100 6250
F 0 "R3" H 3030 6204 50  0000 R CNN
F 1 "100K" H 3030 6295 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3030 6250 50  0001 C CNN
F 3 "~" H 3100 6250 50  0001 C CNN
	1    3100 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	10450 2650 10550 2650
Wire Wire Line
	10550 2650 10550 2600
Wire Wire Line
	10450 2850 10550 2850
Wire Wire Line
	10550 2850 10550 2900
Text GLabel 9450 2950 0    50   Input ~ 0
CAN_SHDN
Text GLabel 6400 2200 2    50   Output ~ 0
CAN_SHDN
$Comp
L power:+BATT #PWR0107
U 1 1 5FC49C05
P 10650 1550
F 0 "#PWR0107" H 10650 1400 50  0001 C CNN
F 1 "+BATT" V 10665 1678 50  0000 L CNN
F 2 "" H 10650 1550 50  0001 C CNN
F 3 "" H 10650 1550 50  0001 C CNN
	1    10650 1550
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Top_Bottom J3
U 1 1 5FC4D4C6
P 10350 1150
F 0 "J3" H 10400 1667 50  0000 C CNN
F 1 "Conn_02x08_Top_Bottom" H 10400 1576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 10350 1150 50  0001 C CNN
F 3 "~" H 10350 1150 50  0001 C CNN
	1    10350 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5FC4FCEB
P 10150 1150
F 0 "#PWR0108" H 10150 900 50  0001 C CNN
F 1 "GND" V 10155 1022 50  0000 R CNN
F 2 "" H 10150 1150 50  0001 C CNN
F 3 "" H 10150 1150 50  0001 C CNN
	1    10150 1150
	0    1    1    0   
$EndComp
$Comp
L Device:C C14
U 1 1 5FC50A73
P 10100 2250
F 0 "C14" V 10352 2250 50  0000 C CNN
F 1 "100nF" V 10261 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10138 2100 50  0001 C CNN
F 3 "~" H 10100 2250 50  0001 C CNN
	1    10100 2250
	0    -1   -1   0   
$EndComp
Connection ~ 9950 2250
Wire Wire Line
	9950 2250 9950 2100
Wire Wire Line
	9950 2250 9950 2350
$Comp
L power:GND #PWR0109
U 1 1 5FC52C28
P 10250 2250
F 0 "#PWR0109" H 10250 2000 50  0001 C CNN
F 1 "GND" V 10255 2122 50  0000 R CNN
F 2 "" H 10250 2250 50  0001 C CNN
F 3 "" H 10250 2250 50  0001 C CNN
	1    10250 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C13
U 1 1 5FC53C3D
P 8800 3000
F 0 "C13" H 9150 3000 50  0000 R CNN
F 1 "100nF" H 9150 3100 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8838 2850 50  0001 C CNN
F 3 "~" H 8800 3000 50  0001 C CNN
	1    8800 3000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5FC54AF3
P 8800 3150
F 0 "#PWR0110" H 8800 2900 50  0001 C CNN
F 1 "GND" H 8805 2977 50  0000 C CNN
F 2 "" H 8800 3150 50  0001 C CNN
F 3 "" H 8800 3150 50  0001 C CNN
	1    8800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2850 8800 2850
Connection ~ 8800 2850
Wire Wire Line
	9850 3150 9950 3150
Connection ~ 9950 3150
Text GLabel 6400 3500 2    50   Output ~ 0
USB_EN
Text GLabel 9100 5700 0    50   Input ~ 0
USB_EN
$Comp
L power:+5V #PWR0111
U 1 1 5FC59AB7
P 8650 5600
F 0 "#PWR0111" H 8650 5450 50  0001 C CNN
F 1 "+5V" V 8665 5728 50  0000 L CNN
F 2 "" H 8650 5600 50  0001 C CNN
F 3 "" H 8650 5600 50  0001 C CNN
	1    8650 5600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5VP #PWR0112
U 1 1 5FC5A7D2
P 9850 5600
F 0 "#PWR0112" H 9850 5450 50  0001 C CNN
F 1 "+5VP" V 9865 5728 50  0000 L CNN
F 2 "" H 9850 5600 50  0001 C CNN
F 3 "" H 9850 5600 50  0001 C CNN
	1    9850 5600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5FC5B885
P 9400 6000
F 0 "#PWR0113" H 9400 5750 50  0001 C CNN
F 1 "GND" H 9405 5827 50  0000 C CNN
F 2 "" H 9400 6000 50  0001 C CNN
F 3 "" H 9400 6000 50  0001 C CNN
	1    9400 6000
	1    0    0    -1  
$EndComp
$Comp
L Power_Management:SiP32431DR3 U5
U 1 1 5FC5C4C4
P 9400 5700
F 0 "U5" H 9400 6067 50  0000 C CNN
F 1 "SiP32431DR3" H 9400 5976 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 9400 6150 50  0001 C CNN
F 3 "http://www.vishay.com.hk/docs/66597/sip32431.pdf" H 9400 5700 50  0001 C CNN
	1    9400 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5FC5FB2F
P 9750 5750
F 0 "C12" H 9865 5796 50  0000 L CNN
F 1 "100nF" H 9865 5705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9788 5600 50  0001 C CNN
F 3 "~" H 9750 5750 50  0001 C CNN
	1    9750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 5600 9750 5600
Connection ~ 9750 5600
Wire Wire Line
	9750 5600 9700 5600
Wire Wire Line
	9100 5600 8650 5600
$Comp
L Device:C C11
U 1 1 5FC6208B
P 8650 5750
F 0 "C11" H 8300 5750 50  0000 L CNN
F 1 "100nF" H 8300 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8688 5600 50  0001 C CNN
F 3 "~" H 8650 5750 50  0001 C CNN
	1    8650 5750
	1    0    0    -1  
$EndComp
Connection ~ 8650 5600
$Comp
L Connector:USB_A J4
U 1 1 5FC639DD
P 10500 5800
F 0 "J4" H 10557 6267 50  0000 C CNN
F 1 "USB_A" H 10557 6176 50  0000 C CNN
F 2 "Connector_USB:USB_A_Molex_105057_Vertical" H 10650 5750 50  0001 C CNN
F 3 " ~" H 10650 5750 50  0001 C CNN
	1    10500 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+5VP #PWR0114
U 1 1 5FC64C05
P 10800 5600
F 0 "#PWR0114" H 10800 5450 50  0001 C CNN
F 1 "+5VP" V 10815 5728 50  0000 L CNN
F 2 "" H 10800 5600 50  0001 C CNN
F 3 "" H 10800 5600 50  0001 C CNN
	1    10800 5600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5FC6515B
P 10500 6200
F 0 "#PWR0115" H 10500 5950 50  0001 C CNN
F 1 "GND" H 10505 6027 50  0000 C CNN
F 2 "" H 10500 6200 50  0001 C CNN
F 3 "" H 10500 6200 50  0001 C CNN
	1    10500 6200
	1    0    0    -1  
$EndComp
Text GLabel 6400 1300 2    50   Output ~ 0
UART_TX
Text GLabel 6400 1500 2    50   Input ~ 0
UART_RX
Text GLabel 3000 1800 2    50   Input ~ 0
UART_TX
Text GLabel 3000 1900 2    50   Output ~ 0
UART_RX
$Comp
L Connector:USB_C_Receptacle_USB2.0 J1
U 1 1 5FC6E36D
P 1200 4150
F 0 "J1" H 1307 5017 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1307 4926 50  0000 C CNN
F 2 "Connector_USB:USB_C_Receptacle_HRO_TYPE-C-31-M-12" H 1350 4150 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1350 4150 50  0001 C CNN
	1    1200 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5FC7145E
P 1200 5050
F 0 "#PWR0116" H 1200 4800 50  0001 C CNN
F 1 "GND" H 1205 4877 50  0000 C CNN
F 2 "" H 1200 5050 50  0001 C CNN
F 3 "" H 1200 5050 50  0001 C CNN
	1    1200 5050
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0117
U 1 1 5FC72034
P 900 5050
F 0 "#PWR0117" H 900 4800 50  0001 C CNN
F 1 "Earth" H 900 4900 50  0001 C CNN
F 2 "" H 900 5050 50  0001 C CNN
F 3 "~" H 900 5050 50  0001 C CNN
	1    900  5050
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0118
U 1 1 5FC72A82
P 10400 6200
F 0 "#PWR0118" H 10400 5950 50  0001 C CNN
F 1 "Earth" H 10400 6050 50  0001 C CNN
F 2 "" H 10400 6200 50  0001 C CNN
F 3 "~" H 10400 6200 50  0001 C CNN
	1    10400 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5FC75E7D
P 1950 3750
F 0 "R5" V 1850 3650 50  0000 C CNN
F 1 "5K1" V 1850 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1880 3750 50  0001 C CNN
F 3 "~" H 1950 3750 50  0001 C CNN
	1    1950 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5FC76BCD
P 1950 3850
F 0 "R6" V 1850 3750 50  0000 C CNN
F 1 "5K1" V 1850 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1880 3850 50  0001 C CNN
F 3 "~" H 1950 3850 50  0001 C CNN
	1    1950 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5FC77051
P 2200 3750
F 0 "#PWR0119" H 2200 3500 50  0001 C CNN
F 1 "GND" H 2205 3577 50  0000 C CNN
F 2 "" H 2200 3750 50  0001 C CNN
F 3 "" H 2200 3750 50  0001 C CNN
	1    2200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3850 2100 3750
Wire Wire Line
	2100 3750 2200 3750
Connection ~ 2100 3750
Wire Wire Line
	1800 4050 1800 4150
Wire Wire Line
	1800 4250 1800 4350
Text GLabel 1800 4100 2    50   BiDi ~ 0
USB_D-
Text GLabel 1800 4300 2    50   BiDi ~ 0
USB_D+
Text GLabel 1800 2600 0    50   BiDi ~ 0
USB_D-
Text GLabel 1800 2500 0    50   BiDi ~ 0
USB_D+
$Comp
L power:+5VA #PWR0120
U 1 1 5FC7A1DE
P 1800 3550
F 0 "#PWR0120" H 1800 3400 50  0001 C CNN
F 1 "+5VA" V 1800 3700 50  0000 L CNN
F 2 "" H 1800 3550 50  0001 C CNN
F 3 "" H 1800 3550 50  0001 C CNN
	1    1800 3550
	0    1    1    0   
$EndComp
$Comp
L power:+5VA #PWR0121
U 1 1 5FC7AC0E
P 1800 2400
F 0 "#PWR0121" H 1800 2250 50  0001 C CNN
F 1 "+5VA" V 1800 2550 50  0000 L CNN
F 2 "" H 1800 2400 50  0001 C CNN
F 3 "" H 1800 2400 50  0001 C CNN
	1    1800 2400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5VA #PWR0122
U 1 1 5FC7B315
P 6150 6400
F 0 "#PWR0122" H 6150 6250 50  0001 C CNN
F 1 "+5VA" H 6050 6550 50  0000 L CNN
F 2 "" H 6150 6400 50  0001 C CNN
F 3 "" H 6150 6400 50  0001 C CNN
	1    6150 6400
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 5FC7C5C6
P 5650 6400
F 0 "#PWR0123" H 5650 6250 50  0001 C CNN
F 1 "+5V" H 5650 6550 50  0000 C CNN
F 2 "" H 5650 6400 50  0001 C CNN
F 3 "" H 5650 6400 50  0001 C CNN
	1    5650 6400
	-1   0    0    1   
$EndComp
$Comp
L power:+BATT #PWR0124
U 1 1 5FC7D71E
P 650 6000
F 0 "#PWR0124" H 650 5850 50  0001 C CNN
F 1 "+BATT" H 550 6150 50  0000 L CNN
F 2 "" H 650 6000 50  0001 C CNN
F 3 "" H 650 6000 50  0001 C CNN
	1    650  6000
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 5FC7F7B5
P 5900 6100
F 0 "D2" H 5900 5883 50  0000 C CNN
F 1 "D_Schottky" H 5900 5974 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 5900 6100 50  0001 C CNN
F 3 "~" H 5900 6100 50  0001 C CNN
	1    5900 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 6400 6150 6100
Wire Wire Line
	6150 6100 6050 6100
Wire Wire Line
	5750 6100 5650 6100
Wire Wire Line
	5650 6100 5650 6400
$Comp
L Device:D_Schottky D1
U 1 1 5FC82973
P 5400 6100
F 0 "D1" H 5400 6317 50  0000 C CNN
F 1 "D_Schottky" H 5400 6226 50  0000 C CNN
F 2 "Diode_SMD:D_SMA" H 5400 6100 50  0001 C CNN
F 3 "~" H 5400 6100 50  0001 C CNN
	1    5400 6100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 6100 5650 6100
Connection ~ 5650 6100
$Comp
L Device:C C1
U 1 1 5FC8A393
P 650 7000
F 0 "C1" H 765 7046 50  0000 L CNN
F 1 "10µF" H 765 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 688 6850 50  0001 C CNN
F 3 "~" H 650 7000 50  0001 C CNN
	1    650  7000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5FC8B858
P 1450 7000
F 0 "C3" H 1565 7046 50  0000 L CNN
F 1 "1µF" H 1565 6955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1488 6850 50  0001 C CNN
F 3 "~" H 1450 7000 50  0001 C CNN
	1    1450 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5FC8C6CA
P 1850 7150
F 0 "#PWR0125" H 1850 6900 50  0001 C CNN
F 1 "GND" H 1855 6977 50  0000 C CNN
F 2 "" H 1850 7150 50  0001 C CNN
F 3 "" H 1850 7150 50  0001 C CNN
	1    1850 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  7150 1250 7150
Wire Wire Line
	1850 7150 1850 6600
Connection ~ 1850 7150
Connection ~ 1450 7150
Wire Wire Line
	1450 7150 1850 7150
Wire Wire Line
	1850 6600 1950 6600
Connection ~ 650  6000
Wire Wire Line
	650  6000 650  6850
$Comp
L Device:C C4
U 1 1 5FC90AA1
P 2400 5950
F 0 "C4" H 2515 5996 50  0000 L CNN
F 1 "100nF" H 2515 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2438 5800 50  0001 C CNN
F 3 "~" H 2400 5950 50  0001 C CNN
	1    2400 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6000 2250 5800
Wire Wire Line
	2250 5800 2400 5800
Wire Wire Line
	2250 6100 2400 6100
$Comp
L Device:L L1
U 1 1 5FC94856
P 2850 6100
F 0 "L1" V 2669 6100 50  0000 C CNN
F 1 "8µH" V 2760 6100 50  0000 C CNN
F 2 "Inductor_SMD:L_Coilcraft_XxL4040" H 2850 6100 50  0001 C CNN
F 3 "~" H 2850 6100 50  0001 C CNN
	1    2850 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 6100 2400 6100
Connection ~ 2400 6100
Wire Wire Line
	3000 6100 3100 6100
Wire Wire Line
	10550 2600 10750 2600
Wire Wire Line
	10550 2900 10750 2900
Wire Wire Line
	3100 6400 2950 6400
Wire Wire Line
	2950 6400 2950 6300
Wire Wire Line
	2950 6300 2250 6300
$Comp
L Device:R R4
U 1 1 5FC986FF
P 3100 6550
F 0 "R4" H 3030 6504 50  0000 R CNN
F 1 "24.9K" H 3030 6595 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3030 6550 50  0001 C CNN
F 3 "~" H 3100 6550 50  0001 C CNN
	1    3100 6550
	-1   0    0    1   
$EndComp
Connection ~ 3100 6400
Wire Wire Line
	1850 7150 3100 7150
Wire Wire Line
	3100 7150 3100 6700
$Comp
L Device:C C5
U 1 1 5FCA811A
P 3500 6250
F 0 "C5" H 3615 6296 50  0000 L CNN
F 1 "22µF" H 3615 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3538 6100 50  0001 C CNN
F 3 "~" H 3500 6250 50  0001 C CNN
	1    3500 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5FCA856A
P 3900 6250
F 0 "C6" H 4015 6296 50  0000 L CNN
F 1 "22µF" H 4015 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3938 6100 50  0001 C CNN
F 3 "~" H 3900 6250 50  0001 C CNN
	1    3900 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5FCA8EA8
P 4300 6250
F 0 "C7" H 4415 6296 50  0000 L CNN
F 1 "22µF" H 4415 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4338 6100 50  0001 C CNN
F 3 "~" H 4300 6250 50  0001 C CNN
	1    4300 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5FCA9057
P 4700 6250
F 0 "C8" H 4815 6296 50  0000 L CNN
F 1 "22µF" H 4815 6205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4738 6100 50  0001 C CNN
F 3 "~" H 4700 6250 50  0001 C CNN
	1    4700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 6100 3500 6100
Connection ~ 3100 6100
Connection ~ 3500 6100
Wire Wire Line
	3500 6100 3900 6100
Connection ~ 3900 6100
Wire Wire Line
	3900 6100 4300 6100
Connection ~ 4300 6100
Wire Wire Line
	4300 6100 4700 6100
Wire Wire Line
	3100 7150 3500 7150
Wire Wire Line
	3500 7150 3500 6400
Connection ~ 3100 7150
Wire Wire Line
	3500 6400 3900 6400
Connection ~ 3500 6400
Connection ~ 3900 6400
Wire Wire Line
	3900 6400 4300 6400
Connection ~ 4300 6400
Wire Wire Line
	4300 6400 4700 6400
Wire Wire Line
	4700 6100 5250 6100
Connection ~ 4700 6100
$Comp
L Device:C C2
U 1 1 5FCD811D
P 1450 5700
F 0 "C2" H 1700 5700 50  0000 R CNN
F 1 "220nF" H 1700 5800 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1488 5550 50  0001 C CNN
F 3 "~" H 1450 5700 50  0001 C CNN
	1    1450 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5FCDA43F
P 1450 5550
F 0 "#PWR0126" H 1450 5300 50  0001 C CNN
F 1 "GND" H 1455 5377 50  0000 C CNN
F 2 "" H 1450 5550 50  0001 C CNN
F 3 "" H 1450 5550 50  0001 C CNN
	1    1450 5550
	-1   0    0    1   
$EndComp
Wire Wire Line
	650  6000 1250 6000
Wire Wire Line
	1450 5850 1450 6000
$Comp
L Device:R R2
U 1 1 5FCDE3B5
P 1250 6450
F 0 "R2" H 1180 6404 50  0000 R CNN
F 1 "100K" H 1180 6495 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1180 6450 50  0001 C CNN
F 3 "~" H 1250 6450 50  0001 C CNN
	1    1250 6450
	1    0    0    -1  
$EndComp
Connection ~ 1250 7150
Wire Wire Line
	1250 7150 1450 7150
$Comp
L Device:R R1
U 1 1 5FCE2389
P 1250 6150
F 0 "R1" H 1180 6104 50  0000 R CNN
F 1 "876K" H 1180 6195 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1180 6150 50  0001 C CNN
F 3 "~" H 1250 6150 50  0001 C CNN
	1    1250 6150
	1    0    0    -1  
$EndComp
Connection ~ 1250 6000
Wire Wire Line
	1250 6000 1450 6000
Wire Wire Line
	1250 6300 1450 6300
Wire Wire Line
	1450 6300 1450 6200
Connection ~ 1250 6300
Wire Wire Line
	1250 6600 1250 7150
Wire Wire Line
	1450 6400 1450 6850
Connection ~ 1450 6000
Connection ~ 1850 6600
$Comp
L Regulator_Switching:LMR33630ADDA U1
U 1 1 5FC856DD
P 1850 6200
F 0 "U1" H 1850 6667 50  0000 C CNN
F 1 "LMR33630ADDA" H 1850 6576 50  0000 C CNN
F 2 "Package_SO:Texas_HSOP-8-1EP_3.9x4.9mm_P1.27mm_ThermalVias" H 1850 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmr33630.pdf" H 1850 6100 50  0001 C CNN
	1    1850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2100 1800 2400
Connection ~ 1800 2400
Wire Wire Line
	5200 1200 5200 1000
Wire Wire Line
	5200 1000 5800 1000
Connection ~ 5800 1000
$Comp
L Connector:Micro_SD_Card J2
U 1 1 5FCEB0B3
P 10150 4500
F 0 "J2" H 10100 5217 50  0000 C CNN
F 1 "Micro_SD_Card" H 10100 5126 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5" H 11300 4800 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 10150 4500 50  0001 C CNN
	1    10150 4500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0127
U 1 1 5FCEE9B8
P 10950 5100
F 0 "#PWR0127" H 10950 4850 50  0001 C CNN
F 1 "Earth" H 10950 4950 50  0001 C CNN
F 2 "" H 10950 5100 50  0001 C CNN
F 3 "~" H 10950 5100 50  0001 C CNN
	1    10950 5100
	1    0    0    -1  
$EndComp
Text GLabel 9250 4200 0    50   BiDi ~ 0
SD_DAT2
Text GLabel 9250 4300 0    50   BiDi ~ 0
SD_DAT3
Text GLabel 9250 4800 0    50   BiDi ~ 0
SD_DAT0
Text GLabel 9250 4900 0    50   BiDi ~ 0
SD_DAT1
$Comp
L power:GND #PWR0128
U 1 1 5FCEFDF8
P 9250 4700
F 0 "#PWR0128" H 9250 4450 50  0001 C CNN
F 1 "GND" V 9255 4527 50  0000 C CNN
F 2 "" H 9250 4700 50  0001 C CNN
F 3 "" H 9250 4700 50  0001 C CNN
	1    9250 4700
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0129
U 1 1 5FCF0DD9
P 9250 4500
F 0 "#PWR0129" H 9250 4350 50  0001 C CNN
F 1 "+3.3V" V 9265 4628 50  0000 L CNN
F 2 "" H 9250 4500 50  0001 C CNN
F 3 "" H 9250 4500 50  0001 C CNN
	1    9250 4500
	0    -1   -1   0   
$EndComp
Text GLabel 9250 4400 0    50   BiDi ~ 0
SD_CMD
Text GLabel 9250 4600 0    50   BiDi ~ 0
SD_CLK
Text GLabel 5200 2600 0    50   BiDi ~ 0
SD_DAT2
Text GLabel 5200 2700 0    50   BiDi ~ 0
SD_DAT3
Text GLabel 5200 2900 0    50   BiDi ~ 0
SD_CMD
Text GLabel 5200 2800 0    50   BiDi ~ 0
SD_CLK
Text GLabel 5200 2400 0    50   BiDi ~ 0
SD_DAT0
Text GLabel 5200 2500 0    50   BiDi ~ 0
SD_DAT1
$Comp
L power:GND #PWR0130
U 1 1 5FD10D99
P 4950 1700
F 0 "#PWR0130" H 4950 1450 50  0001 C CNN
F 1 "GND" H 4955 1527 50  0000 C CNN
F 2 "" H 4950 1700 50  0001 C CNN
F 3 "" H 4950 1700 50  0001 C CNN
	1    4950 1700
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0131
U 1 1 5FD11B7C
P 4950 1100
F 0 "#PWR0131" H 4950 950 50  0001 C CNN
F 1 "+BATT" H 4850 1250 50  0000 L CNN
F 2 "" H 4950 1100 50  0001 C CNN
F 3 "" H 4950 1100 50  0001 C CNN
	1    4950 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5FD123F3
P 4950 1550
F 0 "R8" H 4880 1504 50  0000 R CNN
F 1 "27K" H 4880 1595 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4880 1550 50  0001 C CNN
F 3 "~" H 4950 1550 50  0001 C CNN
	1    4950 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5FD12C00
P 4950 1250
F 0 "R7" H 4880 1204 50  0000 R CNN
F 1 "100K" H 4880 1295 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4880 1250 50  0001 C CNN
F 3 "~" H 4950 1250 50  0001 C CNN
	1    4950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1400 4950 1400
Connection ~ 4950 1400
$Comp
L Regulator_Linear:AP1117-33 U3
U 1 1 5FD19394
P 4850 7100
F 0 "U3" H 4850 7342 50  0000 C CNN
F 1 "AP1117-33" H 4850 7251 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4850 7300 50  0001 C CNN
F 3 "http://www.diodes.com/datasheets/AP1117.pdf" H 4950 6850 50  0001 C CNN
	1    4850 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5FD1C569
P 4850 7400
F 0 "#PWR0132" H 4850 7150 50  0001 C CNN
F 1 "GND" H 4855 7227 50  0000 C CNN
F 2 "" H 4850 7400 50  0001 C CNN
F 3 "" H 4850 7400 50  0001 C CNN
	1    4850 7400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0133
U 1 1 5FD1D7BE
P 4450 7100
F 0 "#PWR0133" H 4450 6950 50  0001 C CNN
F 1 "+5V" V 4465 7228 50  0000 L CNN
F 2 "" H 4450 7100 50  0001 C CNN
F 3 "" H 4450 7100 50  0001 C CNN
	1    4450 7100
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5FD1EF0A
P 5250 7100
F 0 "#PWR0134" H 5250 6950 50  0001 C CNN
F 1 "+3.3V" V 5265 7228 50  0000 L CNN
F 2 "" H 5250 7100 50  0001 C CNN
F 3 "" H 5250 7100 50  0001 C CNN
	1    5250 7100
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5FD201F4
P 5200 7250
F 0 "C10" H 5315 7296 50  0000 L CNN
F 1 "22µF" H 5315 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5238 7100 50  0001 C CNN
F 3 "~" H 5200 7250 50  0001 C CNN
	1    5200 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5FD20CA7
P 4500 7250
F 0 "C9" H 4200 7300 50  0000 L CNN
F 1 "10µF" H 4200 7200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4538 7100 50  0001 C CNN
F 3 "~" H 4500 7250 50  0001 C CNN
	1    4500 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 7100 4500 7100
Connection ~ 4500 7100
Wire Wire Line
	4500 7100 4550 7100
Wire Wire Line
	4500 7400 4850 7400
Connection ~ 4850 7400
Wire Wire Line
	4850 7400 5200 7400
Wire Wire Line
	5150 7100 5200 7100
Connection ~ 5200 7100
Wire Wire Line
	5200 7100 5250 7100
$Comp
L Device:R R9
U 1 1 5FCE1B50
P 10750 2750
F 0 "R9" H 10680 2704 50  0000 R CNN
F 1 "120R" H 10680 2795 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10680 2750 50  0001 C CNN
F 3 "~" H 10750 2750 50  0001 C CNN
	1    10750 2750
	1    0    0    -1  
$EndComp
Connection ~ 10750 2600
Wire Wire Line
	10750 2600 10850 2600
Connection ~ 10750 2900
Wire Wire Line
	10750 2900 10850 2900
Wire Wire Line
	9750 6000 9400 6000
Wire Wire Line
	9750 5900 9750 6000
Connection ~ 9400 6000
Wire Wire Line
	9400 6000 8650 6000
Wire Wire Line
	8650 5900 8650 6000
$EndSCHEMATC
