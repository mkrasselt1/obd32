EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L power:+5VA #PWR?
U 1 1 6068D080
P 2000 800
AR Path="/6068D080" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/6068D080" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 2000 650 50  0001 C CNN
F 1 "+5VA" V 2000 900 50  0000 L CNN
F 2 "" H 2000 800 50  0001 C CNN
F 3 "" H 2000 800 50  0001 C CNN
	1    2000 800 
	0    1    1    0   
$EndComp
$Comp
L Connector:USB_C_Receptacle_USB2.0 J?
U 1 1 6068D086
P 950 1400
AR Path="/6068D086" Ref="J?"  Part="1" 
AR Path="/6067BC63/6068D086" Ref="J2"  Part="1" 
F 0 "J2" H 1057 2267 50  0000 C CNN
F 1 "USB_C_Receptacle_USB2.0" H 1057 2176 50  0000 C CNN
F 2 "USB_C_Receptacle_JAE_DX07S016JA1:USB_C_Receptacle_JAE_DX07S016JA1" H 1100 1400 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1100 1400 50  0001 C CNN
	1    950  1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6068D08C
P 950 2300
AR Path="/6068D08C" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/6068D08C" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 950 2050 50  0001 C CNN
F 1 "GND" H 955 2127 50  0000 C CNN
F 2 "" H 950 2300 50  0001 C CNN
F 3 "" H 950 2300 50  0001 C CNN
	1    950  2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6068D092
P 650 2300
AR Path="/6068D092" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/6068D092" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 650 2050 50  0001 C CNN
F 1 "GND" H 655 2127 50  0000 C CNN
F 2 "" H 650 2300 50  0001 C CNN
F 3 "" H 650 2300 50  0001 C CNN
	1    650  2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6068D098
P 2150 1000
AR Path="/6068D098" Ref="R?"  Part="1" 
AR Path="/6067BC63/6068D098" Ref="R14"  Part="1" 
F 0 "R14" V 2050 900 50  0000 C CNN
F 1 "5.1K" V 2050 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2080 1000 50  0001 C CNN
F 3 "~" H 2150 1000 50  0001 C CNN
	1    2150 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6068D09E
P 2150 1100
AR Path="/6068D09E" Ref="R?"  Part="1" 
AR Path="/6067BC63/6068D09E" Ref="R15"  Part="1" 
F 0 "R15" V 2050 1200 50  0000 C CNN
F 1 "5.1K" V 2050 1000 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2080 1100 50  0001 C CNN
F 3 "~" H 2150 1100 50  0001 C CNN
	1    2150 1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 1100 2300 1050
$Comp
L power:GND #PWR?
U 1 1 6068D0A5
P 2300 1050
AR Path="/6068D0A5" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/6068D0A5" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 2300 800 50  0001 C CNN
F 1 "GND" H 2305 877 50  0000 C CNN
F 2 "" H 2300 1050 50  0001 C CNN
F 3 "" H 2300 1050 50  0001 C CNN
	1    2300 1050
	0    -1   -1   0   
$EndComp
Connection ~ 2300 1050
Wire Wire Line
	2300 1050 2300 1000
Wire Wire Line
	1550 1400 1550 1350
Wire Wire Line
	1550 1500 1550 1550
Text GLabel 2300 1350 2    50   BiDi ~ 0
USB_D-
Text GLabel 2300 1550 2    50   BiDi ~ 0
USB_D+
$Comp
L Power_Protection:SP0503BAHT D?
U 1 1 6068D0B1
P 1800 1900
AR Path="/6068D0B1" Ref="D?"  Part="1" 
AR Path="/6067BC63/6068D0B1" Ref="D6"  Part="1" 
F 0 "D6" H 2005 1946 50  0000 L CNN
F 1 "SP0503BAHT" H 2005 1855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-143" H 2025 1850 50  0001 L CNN
F 3 "http://www.littelfuse.com/~/media/files/littelfuse/technical%20resources/documents/data%20sheets/sp05xxba.pdf" H 1925 2025 50  0001 C CNN
	1    1800 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6068D0B7
P 1800 2100
AR Path="/6068D0B7" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/6068D0B7" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 1800 1850 50  0001 C CNN
F 1 "GND" H 1805 1927 50  0000 C CNN
F 2 "" H 1800 2100 50  0001 C CNN
F 3 "" H 1800 2100 50  0001 C CNN
	1    1800 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1350 1800 1350
Connection ~ 1550 1350
Wire Wire Line
	1550 1350 1550 1300
Wire Wire Line
	2000 1550 1900 1550
Connection ~ 1550 1550
Wire Wire Line
	1550 1550 1550 1600
Wire Wire Line
	1900 1700 1900 1550
Connection ~ 1900 1550
Wire Wire Line
	1900 1550 1550 1550
Wire Wire Line
	1800 1700 1800 1350
Connection ~ 1800 1350
Wire Wire Line
	1800 1350 2000 1350
Wire Wire Line
	1550 1100 2000 1100
Wire Wire Line
	2000 1000 1550 1000
Wire Wire Line
	2000 800  1700 800 
Wire Wire Line
	1700 1700 1700 800 
Connection ~ 1700 800 
Wire Wire Line
	1700 800  1550 800 
Text HLabel 5250 2250 2    50   Input ~ 0
UART_TX
Text HLabel 5250 2150 2    50   Output ~ 0
UART_RX
Text HLabel 5250 2550 2    50   Output ~ 0
DTR
$Comp
L Device:R R?
U 1 1 606DB9AD
P 2150 1350
AR Path="/606DB9AD" Ref="R?"  Part="1" 
AR Path="/6067BC63/606DB9AD" Ref="R16"  Part="1" 
F 0 "R16" V 2050 1450 50  0000 C CNN
F 1 "27R" V 2050 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2080 1350 50  0001 C CNN
F 3 "~" H 2150 1350 50  0001 C CNN
	1    2150 1350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 606DBCCD
P 2150 1550
AR Path="/606DBCCD" Ref="R?"  Part="1" 
AR Path="/6067BC63/606DBCCD" Ref="R19"  Part="1" 
F 0 "R19" V 2050 1650 50  0000 C CNN
F 1 "27R" V 2050 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2080 1550 50  0001 C CNN
F 3 "~" H 2150 1550 50  0001 C CNN
	1    2150 1550
	0    -1   -1   0   
$EndComp
Text GLabel 3850 2450 0    50   BiDi ~ 0
USB_D-
Text GLabel 3850 2550 0    50   BiDi ~ 0
USB_D+
$Comp
L power:GND #PWR?
U 1 1 60775518
P 4150 1600
AR Path="/60775518" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/60775518" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 4150 1350 50  0001 C CNN
F 1 "GND" H 4155 1427 50  0000 C CNN
F 2 "" H 4150 1600 50  0001 C CNN
F 3 "" H 4150 1600 50  0001 C CNN
	1    4150 1600
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 60777F5E
P 4300 1600
F 0 "C1" V 4050 1600 50  0000 C CNN
F 1 "100nF" V 4150 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4338 1450 50  0001 C CNN
F 3 "~" H 4300 1600 50  0001 C CNN
	1    4300 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 6077958A
P 4450 1200
F 0 "C3" V 4200 1200 50  0000 C CNN
F 1 "100nF" V 4300 1200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4488 1050 50  0001 C CNN
F 3 "~" H 4450 1200 50  0001 C CNN
	1    4450 1200
	-1   0    0    1   
$EndComp
Text HLabel 5250 2350 2    50   Output ~ 0
RTS
$Comp
L power:+5VA #PWR?
U 1 1 607703B0
P 4450 1600
AR Path="/607703B0" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/607703B0" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 4450 1450 50  0001 C CNN
F 1 "+5VA" V 4450 1700 50  0000 L CNN
F 2 "" H 4450 1600 50  0001 C CNN
F 3 "" H 4450 1600 50  0001 C CNN
	1    4450 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 1850 4450 1600
Connection ~ 4450 1600
$Comp
L power:GND #PWR?
U 1 1 60A1A88A
P 4450 1050
AR Path="/60A1A88A" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/60A1A88A" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 4450 800 50  0001 C CNN
F 1 "GND" H 4455 877 50  0000 C CNN
F 2 "" H 4450 1050 50  0001 C CNN
F 3 "" H 4450 1050 50  0001 C CNN
	1    4450 1050
	-1   0    0    1   
$EndComp
$Comp
L Interface_USB:FT231XQ U1
U 1 1 60A2080B
P 4550 2750
F 0 "U1" H 4950 3650 50  0000 C CNN
F 1 "FT231XQ" H 4950 3550 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-20-1EP_4x4mm_P0.5mm_EP2.5x2.5mm" H 5900 1950 50  0001 C CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT231X.pdf" H 4550 2750 50  0001 C CNN
	1    4550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1850 4800 1850
Wire Wire Line
	4800 1850 4800 1350
Wire Wire Line
	4800 1350 4450 1350
Wire Wire Line
	3850 1350 3850 2150
Connection ~ 4450 1350
Wire Wire Line
	4450 1350 3850 1350
Wire Wire Line
	3850 2750 3400 2750
Wire Wire Line
	3400 2750 3400 2150
Wire Wire Line
	3400 2150 3850 2150
Connection ~ 3850 2150
NoConn ~ 5250 2450
NoConn ~ 5250 2650
NoConn ~ 5250 2750
NoConn ~ 5250 2850
NoConn ~ 5250 3050
NoConn ~ 5250 3150
NoConn ~ 5250 3250
NoConn ~ 5250 3350
$Comp
L power:GND #PWR?
U 1 1 609B6B97
P 4550 3650
AR Path="/609B6B97" Ref="#PWR?"  Part="1" 
AR Path="/6067BC63/609B6B97" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 4550 3400 50  0001 C CNN
F 1 "GND" H 4555 3477 50  0000 C CNN
F 2 "" H 4550 3650 50  0001 C CNN
F 3 "" H 4550 3650 50  0001 C CNN
	1    4550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3650 4550 3650
Connection ~ 4550 3650
Wire Wire Line
	4550 3650 4650 3650
$EndSCHEMATC
