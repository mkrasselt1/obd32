EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
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
L Connector:Micro_SD_Card J6
U 1 1 602683EF
P 2000 1350
F 0 "J6" H 1950 2067 50  0000 C CNN
F 1 "Micro_SD_Card" H 1950 1976 50  0000 C CNN
F 2 "Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5" H 3150 1650 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 2000 1350 50  0001 C CNN
	1    2000 1350
	1    0    0    -1  
$EndComp
Text GLabel 1100 1050 0    50   BiDi ~ 0
SD_DAT2_s
Text GLabel 1100 1150 0    50   BiDi ~ 0
SD_DAT3_s
Text GLabel 1100 1650 0    50   BiDi ~ 0
SD_DAT0_s
Text GLabel 1100 1750 0    50   BiDi ~ 0
SD_DAT1_s
Text GLabel 1100 1250 0    50   BiDi ~ 0
SD_CMD_s
Text GLabel 1100 1450 0    50   BiDi ~ 0
SD_CLK_s
$Comp
L RF_GPS:MAX-M8W U9
U 1 1 6026D2D5
P 1800 4200
F 0 "U9" H 2100 3450 50  0000 C CNN
F 1 "MAX-M8W" H 2100 3350 50  0000 C CNN
F 2 "RF_GPS:ublox_MAX" H 2200 3550 50  0001 C CNN
F 3 "https://www.u-blox.com/sites/default/files/MAX-M8-FW3_DataSheet_%28UBX-15031506%29.pdf" H 1800 4200 50  0001 C CNN
	1    1800 4200
	1    0    0    -1  
$EndComp
Text GLabel 2150 2800 2    50   Output ~ 0
GPS_TX_s
Text GLabel 1650 2800 0    50   Input ~ 0
GPS_RX_s
Text GLabel 1200 3800 0    50   Input ~ 0
GPS_TX_s
Text GLabel 1200 3900 0    50   Output ~ 0
GPS_RX_s
Wire Wire Line
	1700 3500 1600 3500
NoConn ~ 1200 4100
NoConn ~ 1200 4200
NoConn ~ 1200 4400
NoConn ~ 2400 4500
Wire Wire Line
	1800 3500 1700 3500
Connection ~ 1700 3500
NoConn ~ 1200 4500
NoConn ~ 1200 4600
$Comp
L Device:R R18
U 1 1 6027C7E7
P 1950 3300
F 0 "R18" V 1743 3300 50  0000 C CNN
F 1 "10R" V 1834 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1880 3300 50  0001 C CNN
F 3 "~" H 1950 3300 50  0001 C CNN
	1    1950 3300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D7
U 1 1 60289A1D
P 2950 4050
F 0 "D7" V 2904 4130 50  0000 L CNN
F 1 "D_Zener" V 2995 4130 50  0000 L CNN
F 2 "Diode_SMD:D_0201_0603Metric" H 2950 4050 50  0001 C CNN
F 3 "~" H 2950 4050 50  0001 C CNN
	1    2950 4050
	0    -1   -1   0   
$EndComp
Text GLabel 1650 2400 0    50   BiDi ~ 0
SD_DAT2_s
Text GLabel 2150 2400 2    50   BiDi ~ 0
SD_DAT3_s
Text GLabel 1650 2500 0    50   BiDi ~ 0
SD_CMD_s
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J5
U 1 1 6028E605
P 1850 2600
F 0 "J5" H 1900 3017 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 1900 2926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 1850 2600 50  0001 C CNN
F 3 "~" H 1850 2600 50  0001 C CNN
	1    1850 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3400 1900 3400
Wire Wire Line
	1900 3400 1900 3500
Text GLabel 2150 2500 2    50   BiDi ~ 0
SD_CLK_s
Text GLabel 1650 2600 0    50   BiDi ~ 0
SD_DAT0_s
Text GLabel 2150 2600 2    50   BiDi ~ 0
SD_DAT1_s
Connection ~ 1600 3500
$Comp
L power:GND1 #PWR060
U 1 1 60638009
P 1100 1550
F 0 "#PWR060" H 1100 1300 50  0001 C CNN
F 1 "GND1" V 1105 1422 50  0000 R CNN
F 2 "" H 1100 1550 50  0001 C CNN
F 3 "" H 1100 1550 50  0001 C CNN
	1    1100 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND1 #PWR066
U 1 1 60638B83
P 2800 1950
F 0 "#PWR066" H 2800 1700 50  0001 C CNN
F 1 "GND1" V 2805 1822 50  0000 R CNN
F 2 "" H 2800 1950 50  0001 C CNN
F 3 "" H 2800 1950 50  0001 C CNN
	1    2800 1950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND1 #PWR063
U 1 1 6063947C
P 1800 4900
F 0 "#PWR063" H 1800 4650 50  0001 C CNN
F 1 "GND1" H 1805 4727 50  0000 C CNN
F 2 "" H 1800 4900 50  0001 C CNN
F 3 "" H 1800 4900 50  0001 C CNN
	1    1800 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND1 #PWR065
U 1 1 60639BA0
P 2500 3900
F 0 "#PWR065" H 2500 3650 50  0001 C CNN
F 1 "GND1" H 2505 3727 50  0000 C CNN
F 2 "" H 2500 3900 50  0001 C CNN
F 3 "" H 2500 3900 50  0001 C CNN
	1    2500 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND1 #PWR064
U 1 1 6063A693
P 2150 2700
F 0 "#PWR064" H 2150 2450 50  0001 C CNN
F 1 "GND1" V 2155 2572 50  0000 R CNN
F 2 "" H 2150 2700 50  0001 C CNN
F 3 "" H 2150 2700 50  0001 C CNN
	1    2150 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 3500 2400 3500
$Comp
L Jumper:SolderJumper_2_Bridged JP3
U 1 1 6063BD5D
P 2250 3300
F 0 "JP3" H 2250 3505 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 2600 3400 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 2250 3300 50  0001 C CNN
F 3 "~" H 2250 3300 50  0001 C CNN
	1    2250 3300
	1    0    0    -1  
$EndComp
$Comp
L U.FL-R-SMT-101:U.FL-R-SMT-101 J7
U 1 1 60642EAB
P 3050 4000
F 0 "J7" H 3578 3953 60  0000 L CNN
F 1 "U.FL-R-SMT-101" H 3578 3847 60  0000 L CNN
F 2 "U.FL-R-SMT-101:U.FL-R-SMT-101" H 3450 3840 60  0001 C CNN
F 3 "" H 3050 4000 60  0000 C CNN
	1    3050 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4200 3050 4200
Wire Wire Line
	2400 4200 2950 4200
Connection ~ 2950 4200
Wire Wire Line
	3050 4100 3050 4000
Wire Wire Line
	3050 3900 2950 3900
Connection ~ 3050 4000
Wire Wire Line
	3050 4000 3050 3900
Wire Wire Line
	2950 3900 2500 3900
Connection ~ 2950 3900
$Comp
L power:+3.3VA #PWR061
U 1 1 60287101
P 1600 3500
F 0 "#PWR061" H 1600 3350 50  0001 C CNN
F 1 "+3.3VA" H 1615 3673 50  0000 C CNN
F 2 "" H 1600 3500 50  0001 C CNN
F 3 "" H 1600 3500 50  0001 C CNN
	1    1600 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR059
U 1 1 60287ED4
P 1100 1350
F 0 "#PWR059" H 1100 1200 50  0001 C CNN
F 1 "+3.3VA" V 1100 1500 50  0000 L CNN
F 2 "" H 1100 1350 50  0001 C CNN
F 3 "" H 1100 1350 50  0001 C CNN
	1    1100 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3VA #PWR062
U 1 1 602885B1
P 1650 2700
F 0 "#PWR062" H 1650 2550 50  0001 C CNN
F 1 "+3.3VA" V 1650 2850 50  0000 L CNN
F 2 "" H 1650 2700 50  0001 C CNN
F 3 "" H 1650 2700 50  0001 C CNN
	1    1650 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 3300 1800 3400
Wire Wire Line
	2400 3500 2400 3300
$EndSCHEMATC
