subtitle "Microchip MPLAB XC8 C Compiler v2.40 (Free license) build 20220703182018 Og1 "

pagewidth 120

	opt flic

	processor	16F877A
include "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\16f877a.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 55 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INDF equ 00h ;# 
# 62 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR0 equ 01h ;# 
# 69 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCL equ 02h ;# 
# 76 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
STATUS equ 03h ;# 
# 162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
FSR equ 04h ;# 
# 169 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTA equ 05h ;# 
# 219 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTB equ 06h ;# 
# 281 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTC equ 07h ;# 
# 343 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTD equ 08h ;# 
# 405 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTE equ 09h ;# 
# 437 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 457 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INTCON equ 0Bh ;# 
# 535 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 597 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 637 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 644 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 651 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 658 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T1CON equ 010h ;# 
# 733 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR2 equ 011h ;# 
# 740 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T2CON equ 012h ;# 
# 811 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPBUF equ 013h ;# 
# 818 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON equ 014h ;# 
# 888 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1 equ 015h ;# 
# 895 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1L equ 015h ;# 
# 902 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1H equ 016h ;# 
# 909 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP1CON equ 017h ;# 
# 967 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCSTA equ 018h ;# 
# 1062 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXREG equ 019h ;# 
# 1069 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1076 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1097 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1155 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1258 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1328 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISA equ 085h ;# 
# 1378 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISB equ 086h ;# 
# 1440 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISC equ 087h ;# 
# 1502 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISD equ 088h ;# 
# 1564 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISE equ 089h ;# 
# 1621 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1683 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1723 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCON equ 08Eh ;# 
# 1757 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1819 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PR2 equ 092h ;# 
# 1826 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPADD equ 093h ;# 
# 1833 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2002 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXSTA equ 098h ;# 
# 2083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SPBRG equ 099h ;# 
# 2090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2160 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2225 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2232 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2291 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2298 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2305 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2312 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2319 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2364 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON2 equ 018Dh ;# 
# 55 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INDF equ 00h ;# 
# 62 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR0 equ 01h ;# 
# 69 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCL equ 02h ;# 
# 76 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
STATUS equ 03h ;# 
# 162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
FSR equ 04h ;# 
# 169 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTA equ 05h ;# 
# 219 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTB equ 06h ;# 
# 281 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTC equ 07h ;# 
# 343 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTD equ 08h ;# 
# 405 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTE equ 09h ;# 
# 437 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 457 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INTCON equ 0Bh ;# 
# 535 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 597 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 637 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 644 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 651 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 658 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T1CON equ 010h ;# 
# 733 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR2 equ 011h ;# 
# 740 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T2CON equ 012h ;# 
# 811 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPBUF equ 013h ;# 
# 818 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON equ 014h ;# 
# 888 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1 equ 015h ;# 
# 895 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1L equ 015h ;# 
# 902 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1H equ 016h ;# 
# 909 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP1CON equ 017h ;# 
# 967 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCSTA equ 018h ;# 
# 1062 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXREG equ 019h ;# 
# 1069 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1076 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1097 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1155 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1258 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1328 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISA equ 085h ;# 
# 1378 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISB equ 086h ;# 
# 1440 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISC equ 087h ;# 
# 1502 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISD equ 088h ;# 
# 1564 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISE equ 089h ;# 
# 1621 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1683 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1723 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCON equ 08Eh ;# 
# 1757 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1819 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PR2 equ 092h ;# 
# 1826 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPADD equ 093h ;# 
# 1833 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2002 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXSTA equ 098h ;# 
# 2083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SPBRG equ 099h ;# 
# 2090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2160 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2225 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2232 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2291 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2298 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2305 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2312 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2319 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2364 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON2 equ 018Dh ;# 
# 55 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INDF equ 00h ;# 
# 62 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR0 equ 01h ;# 
# 69 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCL equ 02h ;# 
# 76 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
STATUS equ 03h ;# 
# 162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
FSR equ 04h ;# 
# 169 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTA equ 05h ;# 
# 219 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTB equ 06h ;# 
# 281 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTC equ 07h ;# 
# 343 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTD equ 08h ;# 
# 405 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTE equ 09h ;# 
# 437 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 457 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INTCON equ 0Bh ;# 
# 535 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 597 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 637 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 644 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 651 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 658 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T1CON equ 010h ;# 
# 733 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR2 equ 011h ;# 
# 740 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T2CON equ 012h ;# 
# 811 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPBUF equ 013h ;# 
# 818 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON equ 014h ;# 
# 888 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1 equ 015h ;# 
# 895 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1L equ 015h ;# 
# 902 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1H equ 016h ;# 
# 909 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP1CON equ 017h ;# 
# 967 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCSTA equ 018h ;# 
# 1062 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXREG equ 019h ;# 
# 1069 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1076 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1097 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1155 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1258 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1328 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISA equ 085h ;# 
# 1378 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISB equ 086h ;# 
# 1440 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISC equ 087h ;# 
# 1502 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISD equ 088h ;# 
# 1564 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISE equ 089h ;# 
# 1621 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1683 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1723 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCON equ 08Eh ;# 
# 1757 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1819 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PR2 equ 092h ;# 
# 1826 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPADD equ 093h ;# 
# 1833 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2002 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXSTA equ 098h ;# 
# 2083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SPBRG equ 099h ;# 
# 2090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2160 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2225 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2232 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2291 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2298 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2305 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2312 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2319 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2364 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON2 equ 018Dh ;# 
# 55 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INDF equ 00h ;# 
# 62 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR0 equ 01h ;# 
# 69 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCL equ 02h ;# 
# 76 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
STATUS equ 03h ;# 
# 162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
FSR equ 04h ;# 
# 169 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTA equ 05h ;# 
# 219 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTB equ 06h ;# 
# 281 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTC equ 07h ;# 
# 343 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTD equ 08h ;# 
# 405 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PORTE equ 09h ;# 
# 437 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCLATH equ 0Ah ;# 
# 457 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
INTCON equ 0Bh ;# 
# 535 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR1 equ 0Ch ;# 
# 597 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIR2 equ 0Dh ;# 
# 637 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1 equ 0Eh ;# 
# 644 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1L equ 0Eh ;# 
# 651 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR1H equ 0Fh ;# 
# 658 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T1CON equ 010h ;# 
# 733 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TMR2 equ 011h ;# 
# 740 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
T2CON equ 012h ;# 
# 811 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPBUF equ 013h ;# 
# 818 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON equ 014h ;# 
# 888 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1 equ 015h ;# 
# 895 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1L equ 015h ;# 
# 902 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR1H equ 016h ;# 
# 909 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP1CON equ 017h ;# 
# 967 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCSTA equ 018h ;# 
# 1062 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXREG equ 019h ;# 
# 1069 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
RCREG equ 01Ah ;# 
# 1076 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2 equ 01Bh ;# 
# 1083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2L equ 01Bh ;# 
# 1090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCPR2H equ 01Ch ;# 
# 1097 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CCP2CON equ 01Dh ;# 
# 1155 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESH equ 01Eh ;# 
# 1162 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON0 equ 01Fh ;# 
# 1258 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
OPTION_REG equ 081h ;# 
# 1328 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISA equ 085h ;# 
# 1378 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISB equ 086h ;# 
# 1440 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISC equ 087h ;# 
# 1502 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISD equ 088h ;# 
# 1564 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TRISE equ 089h ;# 
# 1621 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE1 equ 08Ch ;# 
# 1683 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PIE2 equ 08Dh ;# 
# 1723 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PCON equ 08Eh ;# 
# 1757 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPCON2 equ 091h ;# 
# 1819 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
PR2 equ 092h ;# 
# 1826 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPADD equ 093h ;# 
# 1833 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SSPSTAT equ 094h ;# 
# 2002 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
TXSTA equ 098h ;# 
# 2083 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
SPBRG equ 099h ;# 
# 2090 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CMCON equ 09Ch ;# 
# 2160 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
CVRCON equ 09Dh ;# 
# 2225 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADRESL equ 09Eh ;# 
# 2232 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
ADCON1 equ 09Fh ;# 
# 2291 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATA equ 010Ch ;# 
# 2298 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADR equ 010Dh ;# 
# 2305 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEDATH equ 010Eh ;# 
# 2312 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EEADRH equ 010Fh ;# 
# 2319 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON1 equ 018Ch ;# 
# 2364 "C:/Program Files/Microchip/MPLABX/v6.00/packs/Microchip/PIC16Fxxx_DFP/1.3.42/xc8\pic\include\proc\pic16f877a.h"
EECON2 equ 018Dh ;# 
	debug_source C
	FNCALL	_main,_CompareStrings
	FNCALL	_main,_ConcatToPacket
	FNCALL	_main,_ConvertToString
	FNCALL	_main,_SplitPacket
	FNCALL	_main,_UART_TxString
	FNCALL	_main,_init_PIC
	FNCALL	_main,_lcdPrint
	FNCALL	_main,_lcdSend
	FNCALL	_main,_read_NumPad
	FNCALL	_read_NumPad,_CompareStrings
	FNCALL	_read_NumPad,___awmod
	FNCALL	_read_NumPad,___wmul
	FNCALL	_read_NumPad,_eeprom_write
	FNCALL	_read_NumPad,_rand
	FNCALL	_read_NumPad,_srand
	FNCALL	_CompareStrings,_Length
	FNCALL	_init_PIC,_ConvertToString
	FNCALL	_init_PIC,_Fill
	FNCALL	_init_PIC,_UART_init
	FNCALL	_init_PIC,_eeprom_read
	FNCALL	_init_PIC,_init_LCD
	FNCALL	_init_PIC,_init_NumPad
	FNCALL	_init_PIC,_init_Timer0
	FNCALL	_init_PIC,_lcdPrint
	FNCALL	_init_PIC,_lcdSend
	FNCALL	_lcdPrint,_lcdSend
	FNCALL	_init_LCD,_lcdSend
	FNCALL	_UART_init,___aldiv
	FNCALL	_Fill,_Length
	FNCALL	_ConvertToString,___aldiv
	FNCALL	_ConvertToString,___almod
	FNCALL	_ConvertToString,___lmul
	FNCALL	_ConvertToString,_pow
	FNCALL	_pow,___wmul
	FNCALL	_UART_TxString,_UART_TxChar
	FNCALL	_UART_TxString,___awmod
	FNCALL	_UART_TxString,___wmul
	FNCALL	_UART_TxString,_rand
	FNCALL	_UART_TxString,_srand
	FNCALL	_rand,___lmul
	FNCALL	_SplitPacket,_Length
	FNCALL	_SplitPacket,_strcopy
	FNCALL	_ConcatToPacket,_strcat
	FNCALL	_strcat,_Length
	FNROOT	_main
	FNCALL	_IRS,i1_UART_TxString
	FNCALL	i1_UART_TxString,i1_UART_TxChar
	FNCALL	i1_UART_TxString,i1___awmod
	FNCALL	i1_UART_TxString,i1___wmul
	FNCALL	i1_UART_TxString,i1_rand
	FNCALL	i1_UART_TxString,i1_srand
	FNCALL	i1_rand,i1___lmul
	FNCALL	intlevel1,_IRS
	global	intlevel1
	FNROOT	intlevel1
	global	_randx
	global	_maxFail
	global	_initialize
	global	_keypressed
psect	idataBANK0,class=CODE,space=0,delta=2,noexec
global __pidataBANK0
__pidataBANK0:
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	3

;initializer for _randx
	retlw	01h
	retlw	0
	retlw	0
	retlw	0

psect	idataBANK1,class=CODE,space=0,delta=2,noexec
global __pidataBANK1
__pidataBANK1:
	file	"main.c"
	line	114

;initializer for _maxFail
	retlw	03h
	line	99

;initializer for _initialize
	retlw	01h
	line	92

;initializer for _keypressed
	retlw	063h
	global	_keys
psect	strings,class=STRING,delta=2,noexec
global __pstrings
__pstrings:
stringtab:
	global    __stringtab
__stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
	global __stringbase
__stringbase:
	retlw	0
psect	strings
	global    __end_of__stringtab
__end_of__stringtab:
	file	"main.c"
	line	86
_keys:
	retlw	02Ah
	retlw	037h
	retlw	034h
	retlw	031h
	retlw	030h
	retlw	038h
	retlw	035h
	retlw	032h
	retlw	023h
	retlw	039h
	retlw	036h
	retlw	033h
	global __end_of_keys
__end_of_keys:
	global	_rowMask
psect	strings
	file	"main.c"
	line	77
_rowMask:
	retlw	01h
	retlw	02h
	retlw	04h
	retlw	08h
	global __end_of_rowMask
__end_of_rowMask:
	global	_colMask
psect	strings
	file	"main.c"
	line	69
_colMask:
	retlw	0FEh
	retlw	0FDh
	retlw	0FBh
	global __end_of_colMask
__end_of_colMask:
	global	_keys
	global	_rowMask
	global	_colMask
	global	_seconds
	global	_milliseconds
	global	_old_i_id
	global	_pr_succ
	global	_pr_err_max
	global	_pr_err_len
	global	_pr_start
	global	_fail
	global	_success
	global	_recieved
	global	_old_iT
	global	_iS
	global	_PIC_ID
	global	_num_rand
	global	_i_id
	global	_compare
	global	_iT
	global	_type
	global	_source
	global	_keyf
	global	_rowScan
	global	_colScan
	global	_dato
	global	_old_num_rand
	global	_datoTastierino
	global	_datoSeriale
	global	_packet
	global	_id_dest
	global	_INTCONbits
_INTCONbits	set	0xB
	global	_STATUSbits
_STATUSbits	set	0x3
	global	_RCREG
_RCREG	set	0x1A
	global	_TXREG
_TXREG	set	0x19
	global	_PIR1
_PIR1	set	0xC
	global	_RCSTA
_RCSTA	set	0x18
	global	_PORTB
_PORTB	set	0x6
	global	_PORTD
_PORTD	set	0x8
	global	_PORTEbits
_PORTEbits	set	0x9
	global	_TMR0
_TMR0	set	0x1
	global	_INTCON
_INTCON	set	0xB
	global	_T0IF
_T0IF	set	0x5A
	global	_RCIF
_RCIF	set	0x65
	global	_PIE1
_PIE1	set	0x8C
	global	_SPBRG
_SPBRG	set	0x99
	global	_TXSTA
_TXSTA	set	0x98
	global	_TRISC
_TRISC	set	0x87
	global	_TRISB
_TRISB	set	0x86
	global	_TRISEbits
_TRISEbits	set	0x89
	global	_TRISD
_TRISD	set	0x88
	global	_OPTION_REG
_OPTION_REG	set	0x81
	global	_EEDATA
_EEDATA	set	0x10C
	global	_EEADR
_EEADR	set	0x10D
	global	_EECON2
_EECON2	set	0x18D
	global	_EECON1
_EECON1	set	0x18C
	global	_EECON1bits
_EECON1bits	set	0x18C
	
STR_17:	
	retlw	35	;'#'
	retlw	61	;'='
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	102	;'f'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	42	;'*'
	retlw	61	;'='
	retlw	99	;'c'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	99	;'c'
	retlw	46	;'.'
	retlw	0
	retlw	0
	retlw	0
psect	strings
	
STR_9:	
	retlw	73	;'I'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	99	;'c'
	retlw	105	;'i'
	retlw	32	;' '
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	101	;'e'
	retlw	0
	retlw	0
psect	strings
	
STR_7:	
	retlw	35	;'#'
	retlw	61	;'='
	retlw	99	;'c'
	retlw	111	;'o'
	retlw	110	;'n'
	retlw	102	;'f'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	42	;'*'
	retlw	61	;'='
	retlw	99	;'c'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	99	;'c'
	retlw	46	;'.'
	retlw	0
	retlw	0
psect	strings
	
STR_19:	
	retlw	77	;'M'
	retlw	73	;'I'
	retlw	78	;'N'
	retlw	61	;'='
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	44	;','
	retlw	77	;'M'
	retlw	65	;'A'
	retlw	88	;'X'
	retlw	61	;'='
	retlw	50	;'2'
	retlw	53	;'5'
	retlw	48	;'0'
	retlw	0
	retlw	0
psect	strings
	
STR_18:	
	retlw	73	;'I'
	retlw	110	;'n'
	retlw	115	;'s'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	73	;'I'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	80	;'P'
	retlw	73	;'I'
	retlw	67	;'C'
	retlw	58	;':'
	retlw	0
	retlw	0
psect	strings
	
STR_15:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	97	;'a'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	0
	retlw	0
psect	strings
	
STR_13:	
	retlw	67	;'C'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	0
	retlw	0
psect	strings
	
STR_3:	
	retlw	73	;'I'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	61	;'='
	retlw	32	;' '
	retlw	51	;'3'
	retlw	32	;' '
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	0
	retlw	0
psect	strings
	
STR_10:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	118	;'v'
	retlw	105	;'i'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
	retlw	0
psect	strings
	
STR_11:	
	retlw	66	;'B'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	118	;'v'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	117	;'u'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	33	;'!'
	retlw	0
	retlw	0
psect	strings
	
STR_6:	
	retlw	73	;'I'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	83	;'S'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	118	;'v'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	0
	retlw	0
psect	strings
	
STR_1:	
	retlw	80	;'P'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	105	;'i'
	retlw	32	;' '
	retlw	39	;'''
	retlw	35	;'#'
	retlw	39	;'''
	retlw	0
	retlw	0
psect	strings
	
STR_5:	
	retlw	73	;'I'
	retlw	68	;'D'
	retlw	32	;' '
	retlw	62	;'>'
	retlw	32	;' '
	retlw	50	;'2'
	retlw	53	;'5'
	retlw	48	;'0'
	retlw	0
	retlw	0
psect	strings
	
STR_2:	
	retlw	69	;'E'
	retlw	82	;'R'
	retlw	82	;'R'
	retlw	79	;'O'
	retlw	82	;'R'
	retlw	69	;'E'
	retlw	0
	retlw	0
psect	strings
	
STR_16:	
	retlw	49	;'1'
	retlw	47	;'/'
	retlw	48	;'0'
	retlw	0
psect	strings
	
STR_12:	
	retlw	49	;'1'
	retlw	47	;'/'
	retlw	49	;'1'
	retlw	0
psect	strings
	
STR_8:	
	retlw	50	;'2'
	retlw	0
psect	strings
STR_4	equ	STR_2+0
STR_14	equ	STR_10+0
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config FOSC = "HS"
	config WDTE = "OFF"
	config PWRTE = "ON"
	config BOREN = "ON"
	config LVP = "ON"
	config CPD = "OFF"
	config WRT = "OFF"
	config CP = "OFF"
	file	"dist/default/production\Project_Work.X.production.s"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_seconds:
       ds      4

_milliseconds:
       ds      4

_old_i_id:
       ds      2

_pr_succ:
       ds      1

_pr_err_max:
       ds      1

_pr_err_len:
       ds      1

_pr_start:
       ds      1

_fail:
       ds      1

_success:
       ds      1

_recieved:
       ds      1

_old_iT:
       ds      1

_iS:
       ds      1

_PIC_ID:
       ds      4

psect	dataBANK0,class=BANK0,space=1,noexec
global __pdataBANK0
__pdataBANK0:
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	3
_randx:
       ds      4

psect	bssBANK1,class=BANK1,space=1,noexec
global __pbssBANK1
__pbssBANK1:
_num_rand:
       ds      2

_i_id:
       ds      2

_compare:
       ds      1

_iT:
       ds      1

_type:
       ds      1

_source:
       ds      1

_keyf:
       ds      1

_rowScan:
       ds      1

_colScan:
       ds      1

psect	dataBANK1,class=BANK1,space=1,noexec
global __pdataBANK1
__pdataBANK1:
	file	"main.c"
	line	114
_maxFail:
       ds      1

psect	dataBANK1
	file	"main.c"
	line	99
_initialize:
       ds      1

psect	dataBANK1
	file	"main.c"
	line	92
_keypressed:
       ds      1

psect	bssBANK3,class=BANK3,space=1,noexec
global __pbssBANK3
__pbssBANK3:
_old_num_rand:
       ds      2

_datoTastierino:
       ds      17

_datoSeriale:
       ds      17

_packet:
       ds      15

_id_dest:
       ds      4

psect	bssBANK2,class=BANK2,space=1,noexec
global __pbssBANK2
__pbssBANK2:
_dato:
       ds      50

	file	"dist/default/production\Project_Work.X.production.s"
	line	#
; Initialize objects allocated to BANK1
	global __pidataBANK1
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	fcall	__pidataBANK1+0		;fetch initializer
	movwf	__pdataBANK1+0&07fh		
	fcall	__pidataBANK1+1		;fetch initializer
	movwf	__pdataBANK1+1&07fh		
	fcall	__pidataBANK1+2		;fetch initializer
	movwf	__pdataBANK1+2&07fh		
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	line	#
psect clrtext,class=CODE,delta=2
global clear_ram0
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram0:
	clrwdt			;clear the watchdog before getting into this loop
clrloop0:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop0		;do the next byte

; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2,merge=1
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+037h)
	fcall	clear_ram0
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK2)
	movwf	fsr
	movlw	low((__pbssBANK2)+032h)
	fcall	clear_ram0
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2,merge=1
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+0Bh)
	fcall	clear_ram0
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2,merge=1
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+017h)
	fcall	clear_ram0
psect cinit,class=CODE,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK3,class=BANK3,space=1,noexec
global __pcstackBANK3
__pcstackBANK3:
	global	ConvertToString@temp
ConvertToString@temp:	; 2 bytes @ 0x0
	ds	2
	global	ConvertToString@j
ConvertToString@j:	; 2 bytes @ 0x2
	ds	2
	global	ConvertToString@i
ConvertToString@i:	; 2 bytes @ 0x4
	ds	2
	global	ConvertToString@n_cifre
ConvertToString@n_cifre:	; 1 bytes @ 0x6
	ds	1
??_init_PIC:	; 1 bytes @ 0x7
	ds	2
	global	init_PIC@id
init_PIC@id:	; 2 bytes @ 0x9
	ds	2
	global	main@num_rand_s
main@num_rand_s:	; 16 bytes @ 0xB
	ds	16
psect	cstackBANK1,class=BANK1,space=1,noexec
global __pcstackBANK1
__pcstackBANK1:
?_lcdSend:	; 1 bytes @ 0x0
??_init_NumPad:	; 1 bytes @ 0x0
??_init_Timer0:	; 1 bytes @ 0x0
??_eeprom_read:	; 1 bytes @ 0x0
?_strcopy:	; 1 bytes @ 0x0
?_eeprom_write:	; 1 bytes @ 0x0
?_srand:	; 1 bytes @ 0x0
??_UART_TxChar:	; 1 bytes @ 0x0
	global	?_Length
?_Length:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___almod
?___almod:	; 4 bytes @ 0x0
	global	lcdSend@tipo
lcdSend@tipo:	; 1 bytes @ 0x0
	global	strcopy@source
strcopy@source:	; 1 bytes @ 0x0
	global	eeprom_write@value
eeprom_write@value:	; 1 bytes @ 0x0
	global	Length@str
Length@str:	; 2 bytes @ 0x0
	global	srand@x
srand@x:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___almod@divisor
___almod@divisor:	; 4 bytes @ 0x0
	ds	1
??_lcdSend:	; 1 bytes @ 0x1
??_strcopy:	; 1 bytes @ 0x1
??_eeprom_write:	; 1 bytes @ 0x1
	global	UART_TxChar@ch
UART_TxChar@ch:	; 1 bytes @ 0x1
	global	eeprom_read@addr
eeprom_read@addr:	; 1 bytes @ 0x1
	ds	1
??_srand:	; 1 bytes @ 0x2
??_Length:	; 1 bytes @ 0x2
	global	eeprom_write@addr
eeprom_write@addr:	; 1 bytes @ 0x2
	ds	1
	global	lcdSend@dato
lcdSend@dato:	; 1 bytes @ 0x3
	ds	1
?_lcdPrint:	; 1 bytes @ 0x4
??_init_LCD:	; 1 bytes @ 0x4
	global	strcopy@dest
strcopy@dest:	; 1 bytes @ 0x4
	global	lcdPrint@str
lcdPrint@str:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___almod@dividend
___almod@dividend:	; 4 bytes @ 0x4
	ds	1
	global	Length@len
Length@len:	; 2 bytes @ 0x5
	global	strcopy@n
strcopy@n:	; 2 bytes @ 0x5
	ds	1
??_lcdPrint:	; 1 bytes @ 0x6
	ds	1
??_SplitPacket:	; 1 bytes @ 0x7
?_CompareStrings:	; 1 bytes @ 0x7
??_Fill:	; 1 bytes @ 0x7
	global	?_strcat
?_strcat:	; 2 bytes @ 0x7
	global	strcat@source
strcat@source:	; 2 bytes @ 0x7
	global	CompareStrings@str2
CompareStrings@str2:	; 2 bytes @ 0x7
	ds	1
??___lmul:	; 1 bytes @ 0x8
??___almod:	; 1 bytes @ 0x8
	global	Fill@length
Fill@length:	; 2 bytes @ 0x8
	ds	1
??_CompareStrings:	; 1 bytes @ 0x9
??_strcat:	; 1 bytes @ 0x9
	global	___almod@counter
___almod@counter:	; 1 bytes @ 0x9
	global	lcdPrint@n
lcdPrint@n:	; 2 bytes @ 0x9
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	ds	1
	global	Fill@id
Fill@id:	; 1 bytes @ 0xA
	global	___almod@sign
___almod@sign:	; 1 bytes @ 0xA
	global	SplitPacket@len
SplitPacket@len:	; 2 bytes @ 0xA
	ds	2
	global	SplitPacket@part
SplitPacket@part:	; 5 bytes @ 0xC
	ds	1
	global	?_rand
?_rand:	; 2 bytes @ 0xD
	global	CompareStrings@i
CompareStrings@i:	; 1 bytes @ 0xD
	ds	1
	global	strcat@dest
strcat@dest:	; 1 bytes @ 0xE
	global	CompareStrings@str1
CompareStrings@str1:	; 1 bytes @ 0xE
	ds	1
??_rand:	; 1 bytes @ 0xF
	global	strcat@n
strcat@n:	; 2 bytes @ 0xF
	ds	2
	global	strcat@length_dest
strcat@length_dest:	; 2 bytes @ 0x11
	global	SplitPacket@section
SplitPacket@section:	; 2 bytes @ 0x11
	ds	2
?_ConcatToPacket:	; 1 bytes @ 0x13
	global	ConcatToPacket@str
ConcatToPacket@str:	; 2 bytes @ 0x13
	global	SplitPacket@i_part
SplitPacket@i_part:	; 2 bytes @ 0x13
	ds	1
	global	?___awmod
?___awmod:	; 2 bytes @ 0x14
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x14
	ds	1
	global	ConcatToPacket@delim
ConcatToPacket@delim:	; 1 bytes @ 0x15
	global	SplitPacket@pkt
SplitPacket@pkt:	; 1 bytes @ 0x15
	ds	1
??_ConcatToPacket:	; 1 bytes @ 0x16
	global	SplitPacket@i
SplitPacket@i:	; 2 bytes @ 0x16
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x16
	ds	1
	global	ConcatToPacket@packet_length
ConcatToPacket@packet_length:	; 2 bytes @ 0x17
	ds	1
??___awmod:	; 1 bytes @ 0x18
	ds	1
	global	ConcatToPacket@pkt
ConcatToPacket@pkt:	; 1 bytes @ 0x19
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x19
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x1A
	ds	1
	global	?___wmul
?___wmul:	; 2 bytes @ 0x1B
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x1B
	ds	2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x1D
	ds	2
??___wmul:	; 1 bytes @ 0x1F
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x1F
	ds	2
??_read_NumPad:	; 1 bytes @ 0x21
?_UART_TxString:	; 1 bytes @ 0x21
	global	?_pow
?_pow:	; 2 bytes @ 0x21
	global	pow@exp
pow@exp:	; 1 bytes @ 0x21
	global	UART_TxString@is_ACK
UART_TxString@is_ACK:	; 1 bytes @ 0x21
	ds	1
??_UART_TxString:	; 1 bytes @ 0x22
	ds	1
??_pow:	; 1 bytes @ 0x23
	global	UART_TxString@n
UART_TxString@n:	; 2 bytes @ 0x23
	ds	2
	global	pow@b
pow@b:	; 1 bytes @ 0x25
	global	UART_TxString@str
UART_TxString@str:	; 1 bytes @ 0x25
	ds	1
	global	pow@i
pow@i:	; 2 bytes @ 0x26
	ds	2
	global	pow@n
pow@n:	; 2 bytes @ 0x28
	ds	2
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x2A
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x2A
	ds	1
	global	read_NumPad@id
read_NumPad@id:	; 2 bytes @ 0x2B
	ds	3
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x2E
	ds	4
??___aldiv:	; 1 bytes @ 0x32
	ds	1
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x33
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x34
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0x35
	ds	4
?_ConvertToString:	; 1 bytes @ 0x39
?_UART_init:	; 1 bytes @ 0x39
	global	ConvertToString@n
ConvertToString@n:	; 4 bytes @ 0x39
	global	UART_init@baudrate
UART_init@baudrate:	; 4 bytes @ 0x39
	ds	4
??_UART_init:	; 1 bytes @ 0x3D
	global	ConvertToString@str
ConvertToString@str:	; 2 bytes @ 0x3D
	ds	2
??_ConvertToString:	; 1 bytes @ 0x3F
	ds	3
??_main:	; 1 bytes @ 0x42
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
?_init_PIC:	; 1 bytes @ 0x0
?_read_NumPad:	; 1 bytes @ 0x0
?_SplitPacket:	; 1 bytes @ 0x0
?_init_LCD:	; 1 bytes @ 0x0
?_init_NumPad:	; 1 bytes @ 0x0
?_init_Timer0:	; 1 bytes @ 0x0
?_eeprom_read:	; 1 bytes @ 0x0
?_Fill:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
?_UART_TxChar:	; 1 bytes @ 0x0
?_IRS:	; 1 bytes @ 0x0
?i1_UART_TxChar:	; 1 bytes @ 0x0
??i1_UART_TxChar:	; 1 bytes @ 0x0
?i1_srand:	; 1 bytes @ 0x0
	global	?i1___lmul
?i1___lmul:	; 4 bytes @ 0x0
	global	i1srand@x
i1srand@x:	; 2 bytes @ 0x0
	global	i1___lmul@multiplier
i1___lmul@multiplier:	; 4 bytes @ 0x0
	ds	1
	global	i1UART_TxChar@ch
i1UART_TxChar@ch:	; 1 bytes @ 0x1
	ds	1
??i1_srand:	; 1 bytes @ 0x2
	ds	2
	global	i1___lmul@multiplicand
i1___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	4
??i1___lmul:	; 1 bytes @ 0x8
	ds	1
	global	i1___lmul@product
i1___lmul@product:	; 4 bytes @ 0x9
	ds	4
??i1___awmod:	; 1 bytes @ 0xD
	ds	1
??i1___wmul:	; 1 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
	global	?i1_rand
?i1_rand:	; 2 bytes @ 0x0
	ds	2
??i1_rand:	; 1 bytes @ 0x2
	ds	5
	global	?i1___awmod
?i1___awmod:	; 2 bytes @ 0x7
	global	i1___awmod@divisor
i1___awmod@divisor:	; 2 bytes @ 0x7
	ds	2
	global	i1___awmod@dividend
i1___awmod@dividend:	; 2 bytes @ 0x9
	ds	2
	global	i1___awmod@counter
i1___awmod@counter:	; 1 bytes @ 0xB
	ds	1
	global	i1___awmod@sign
i1___awmod@sign:	; 1 bytes @ 0xC
	ds	1
	global	?i1___wmul
?i1___wmul:	; 2 bytes @ 0xD
	global	i1___wmul@multiplier
i1___wmul@multiplier:	; 2 bytes @ 0xD
	ds	2
	global	i1___wmul@multiplicand
i1___wmul@multiplicand:	; 2 bytes @ 0xF
	ds	2
	global	i1___wmul@product
i1___wmul@product:	; 2 bytes @ 0x11
	ds	2
?i1_UART_TxString:	; 1 bytes @ 0x13
	global	i1UART_TxString@is_ACK
i1UART_TxString@is_ACK:	; 1 bytes @ 0x13
	ds	1
??i1_UART_TxString:	; 1 bytes @ 0x14
	ds	1
	global	i1UART_TxString@str
i1UART_TxString@str:	; 1 bytes @ 0x15
	ds	1
	global	i1UART_TxString@n
i1UART_TxString@n:	; 2 bytes @ 0x16
	ds	2
??_IRS:	; 1 bytes @ 0x18
	ds	4
;!
;!Data Sizes:
;!    Strings     207
;!    Constant    19
;!    Data        7
;!    BSS         139
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON           14     14      14
;!    BANK0            80     28      55
;!    BANK1            80     66      80
;!    BANK3            96     27      82
;!    BANK2            96      0      50

;!
;!Pointer List with Targets:
;!
;!    UART_TxString@str	PTR const unsigned char  size(1) Largest target is 15
;!		 -> packet(BANK3[15]), 
;!
;!    Fill@id	PTR unsigned char  size(1) Largest target is 4
;!		 -> PIC_ID(BANK0[4]), 
;!
;!    CompareStrings@str2	PTR unsigned char  size(2) Largest target is 17
;!		 -> datoTastierino(BANK3[17]), PIC_ID(BANK0[4]), 
;!
;!    CompareStrings@str1	PTR unsigned char  size(1) Largest target is 17
;!		 -> datoSeriale(BANK3[17]), id_dest(BANK3[4]), 
;!
;!    strcopy@source	PTR unsigned char  size(1) Largest target is 5
;!		 -> SplitPacket@part(BANK1[5]), 
;!
;!    strcopy@dest	PTR unsigned char  size(1) Largest target is 17
;!		 -> datoSeriale(BANK3[17]), id_dest(BANK3[4]), 
;!
;!    SplitPacket@pkt	PTR unsigned char  size(1) Largest target is 50
;!		 -> dato(BANK2[50]), 
;!
;!    strcat@source	PTR unsigned char  size(2) Largest target is 16
;!		 -> STR_16(CODE[4]), STR_12(CODE[4]), STR_8(CODE[2]), main@num_rand_s(BANK3[16]), 
;!		 -> PIC_ID(BANK0[4]), 
;!
;!    strcat@dest	PTR unsigned char  size(1) Largest target is 15
;!		 -> packet(BANK3[15]), 
;!
;!    Length@str	PTR unsigned char  size(2) Largest target is 50
;!		 -> datoSeriale(BANK3[17]), datoTastierino(BANK3[17]), id_dest(BANK3[4]), dato(BANK2[50]), 
;!		 -> packet(BANK3[15]), PIC_ID(BANK0[4]), 
;!
;!    ConcatToPacket@str	PTR unsigned char  size(2) Largest target is 16
;!		 -> STR_16(CODE[4]), STR_12(CODE[4]), STR_8(CODE[2]), main@num_rand_s(BANK3[16]), 
;!		 -> PIC_ID(BANK0[4]), 
;!
;!    ConcatToPacket@pkt	PTR unsigned char  size(1) Largest target is 15
;!		 -> packet(BANK3[15]), 
;!
;!    ConvertToString@str	PTR unsigned char  size(2) Largest target is 16
;!		 -> main@num_rand_s(BANK3[16]), PIC_ID(BANK0[4]), 
;!
;!    lcdPrint@str	PTR unsigned char  size(2) Largest target is 18
;!		 -> STR_19(CODE[17]), STR_18(CODE[16]), datoTastierino(BANK3[17]), STR_17(CODE[18]), 
;!		 -> STR_15(CODE[16]), STR_14(CODE[13]), STR_13(CODE[15]), STR_11(CODE[12]), 
;!		 -> STR_10(CODE[13]), STR_9(CODE[18]), main@num_rand_s(BANK3[16]), PIC_ID(BANK0[4]), 
;!		 -> STR_7(CODE[17]), STR_6(CODE[12]), STR_5(CODE[10]), STR_4(CODE[8]), 
;!		 -> STR_3(CODE[14]), STR_2(CODE[8]), STR_1(CODE[11]), 
;!


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _IRS in COMMON
;!
;!    i1_UART_TxString->i1___awmod
;!    i1_rand->i1___lmul
;!    i1___wmul->i1___awmod
;!
;!Critical Paths under _main in BANK0
;!
;!    None.
;!
;!Critical Paths under _IRS in BANK0
;!
;!    _IRS->i1_UART_TxString
;!    i1_UART_TxString->i1___wmul
;!    i1___wmul->i1___awmod
;!    i1___awmod->i1_rand
;!
;!Critical Paths under _main in BANK1
;!
;!    _main->_ConvertToString
;!    _read_NumPad->___wmul
;!    _CompareStrings->_Length
;!    _init_PIC->_ConvertToString
;!    _lcdPrint->_lcdSend
;!    _init_LCD->_lcdSend
;!    _UART_init->___aldiv
;!    _Fill->_Length
;!    _ConvertToString->___aldiv
;!    _pow->___wmul
;!    ___aldiv->_pow
;!    _UART_TxString->___wmul
;!    _rand->___lmul
;!    ___wmul->___awmod
;!    ___awmod->_rand
;!    _SplitPacket->_Length
;!    _SplitPacket->_strcopy
;!    _ConcatToPacket->_strcat
;!    _strcat->_Length
;!
;!Critical Paths under _IRS in BANK1
;!
;!    None.
;!
;!Critical Paths under _main in BANK3
;!
;!    _main->_init_PIC
;!    _init_PIC->_ConvertToString
;!
;!Critical Paths under _IRS in BANK3
;!
;!    None.
;!
;!Critical Paths under _main in BANK2
;!
;!    None.
;!
;!Critical Paths under _IRS in BANK2
;!
;!    None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                16    16      0   39581
;!                                             11 BANK3     16    16      0
;!                     _CompareStrings
;!                     _ConcatToPacket
;!                    _ConvertToString
;!                        _SplitPacket
;!                      _UART_TxString
;!                           _init_PIC
;!                           _lcdPrint
;!                            _lcdSend
;!                        _read_NumPad
;! ---------------------------------------------------------------------------------
;! (1) _read_NumPad                                         12    12      0    3504
;!                                             33 BANK1     12    12      0
;!                     _CompareStrings
;!                            ___awmod
;!                             ___wmul
;!                       _eeprom_write
;!                               _rand
;!                              _srand
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_write                                         3     2      1     152
;!                                              0 BANK1      3     2      1
;! ---------------------------------------------------------------------------------
;! (2) _CompareStrings                                       8     6      2     931
;!                                              7 BANK1      8     6      2
;!                             _Length
;! ---------------------------------------------------------------------------------
;! (1) _init_PIC                                             4     4      0   16080
;!                                              7 BANK3      4     4      0
;!                    _ConvertToString
;!                               _Fill
;!                          _UART_init
;!                        _eeprom_read
;!                           _init_LCD
;!                        _init_NumPad
;!                        _init_Timer0
;!                           _lcdPrint
;!                            _lcdSend
;! ---------------------------------------------------------------------------------
;! (1) _lcdPrint                                             7     5      2    4422
;!                                              4 BANK1      7     5      2
;!                            _lcdSend
;! ---------------------------------------------------------------------------------
;! (2) _init_Timer0                                          1     1      0       0
;!                                              0 BANK1      1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _init_NumPad                                          1     1      0       0
;!                                              0 BANK1      1     1      0
;! ---------------------------------------------------------------------------------
;! (2) _init_LCD                                             2     2      0    2582
;!                                              4 BANK1      2     2      0
;!                            _lcdSend
;! ---------------------------------------------------------------------------------
;! (1) _lcdSend                                              4     3      1    2582
;!                                              0 BANK1      4     3      1
;! ---------------------------------------------------------------------------------
;! (2) _eeprom_read                                          2     2      0      31
;!                                              0 BANK1      2     2      0
;! ---------------------------------------------------------------------------------
;! (2) _UART_init                                            8     4      4    1106
;!                                             57 BANK1      8     4      4
;!                            ___aldiv
;! ---------------------------------------------------------------------------------
;! (2) _Fill                                                 4     4      0     772
;!                                              7 BANK1      4     4      0
;!                             _Length
;! ---------------------------------------------------------------------------------
;! (2) _ConvertToString                                     16    10      6    4495
;!                                             57 BANK1      9     3      6
;!                                              0 BANK3      7     7      0
;!                            ___aldiv
;!                            ___almod
;!                             ___lmul
;!                                _pow
;! ---------------------------------------------------------------------------------
;! (3) _pow                                                  9     7      2    1203
;!                                             33 BANK1      9     7      2
;!                             ___wmul
;! ---------------------------------------------------------------------------------
;! (3) ___almod                                             11     3      8     613
;!                                              0 BANK1     11     3      8
;! ---------------------------------------------------------------------------------
;! (3) ___aldiv                                             15     7      8     985
;!                                             42 BANK1     15     7      8
;!                                _pow (ARG)
;! ---------------------------------------------------------------------------------
;! (1) _UART_TxString                                        5     4      1    3143
;!                                             33 BANK1      5     4      1
;!                        _UART_TxChar
;!                            ___awmod
;!                             ___wmul
;!                               _rand
;!                              _srand
;! ---------------------------------------------------------------------------------
;! (2) _srand                                                2     0      2     211
;!                                              0 BANK1      2     0      2
;! ---------------------------------------------------------------------------------
;! (2) _rand                                                 7     5      2     496
;!                                             13 BANK1      7     5      2
;!                             ___lmul
;! ---------------------------------------------------------------------------------
;! (3) ___lmul                                              13     5      8     496
;!                                              0 BANK1     13     5      8
;! ---------------------------------------------------------------------------------
;! (2) ___wmul                                               6     2      4     856
;!                                             27 BANK1      6     2      4
;!                            ___awmod (ARG)
;!                               _rand (ARG)
;! ---------------------------------------------------------------------------------
;! (2) ___awmod                                              7     3      4     793
;!                                             20 BANK1      7     3      4
;!                               _rand (ARG)
;! ---------------------------------------------------------------------------------
;! (2) _UART_TxChar                                          2     2      0      31
;!                                              0 BANK1      2     2      0
;! ---------------------------------------------------------------------------------
;! (1) _SplitPacket                                         17    17      0    1441
;!                                              7 BANK1     17    17      0
;!                             _Length
;!                            _strcopy
;! ---------------------------------------------------------------------------------
;! (2) _strcopy                                              7     6      1     506
;!                                              0 BANK1      7     6      1
;! ---------------------------------------------------------------------------------
;! (1) _ConcatToPacket                                       7     4      3    2797
;!                                             19 BANK1      7     4      3
;!                             _strcat
;! ---------------------------------------------------------------------------------
;! (2) _strcat                                              12    10      2     685
;!                                              7 BANK1     12    10      2
;!                             _Length
;! ---------------------------------------------------------------------------------
;! (3) _Length                                               7     5      2     299
;!                                              0 BANK1      7     5      2
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 3
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (5) _IRS                                                  4     4      0     844
;!                                             24 BANK0      4     4      0
;!                    i1_UART_TxString
;! ---------------------------------------------------------------------------------
;! (6) i1_UART_TxString                                      5     4      1     844
;!                                             19 BANK0      5     4      1
;!                      i1_UART_TxChar
;!                          i1___awmod
;!                           i1___wmul
;!                             i1_rand
;!                            i1_srand
;! ---------------------------------------------------------------------------------
;! (7) i1_srand                                              2     0      2      48
;!                                              0 COMMON     2     0      2
;! ---------------------------------------------------------------------------------
;! (7) i1_rand                                               7     5      2     144
;!                                              0 BANK0      7     5      2
;!                           i1___lmul
;! ---------------------------------------------------------------------------------
;! (8) i1___lmul                                            13     5      8     144
;!                                              0 COMMON    13     5      8
;! ---------------------------------------------------------------------------------
;! (7) i1___wmul                                             6     2      4     144
;!                                             13 BANK0      6     2      4
;!                          i1___awmod (ARG)
;!                             i1_rand (ARG)
;! ---------------------------------------------------------------------------------
;! (7) i1___awmod                                            7     3      4     348
;!                                             13 COMMON     1     1      0
;!                                              7 BANK0      6     2      4
;!                             i1_rand (ARG)
;! ---------------------------------------------------------------------------------
;! (7) i1_UART_TxChar                                        2     2      0      22
;!                                              0 COMMON     2     2      0
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 8
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   _CompareStrings
;!     _Length
;!   _ConcatToPacket
;!     _strcat
;!       _Length
;!   _ConvertToString
;!     ___aldiv
;!       _pow (ARG)
;!         ___wmul
;!           ___awmod (ARG)
;!             _rand (ARG)
;!               ___lmul
;!           _rand (ARG)
;!     ___almod
;!     ___lmul
;!     _pow
;!   _SplitPacket
;!     _Length
;!     _strcopy
;!   _UART_TxString
;!     _UART_TxChar
;!     ___awmod
;!     ___wmul
;!     _rand
;!     _srand
;!   _init_PIC
;!     _ConvertToString
;!     _Fill
;!       _Length
;!     _UART_init
;!       ___aldiv
;!     _eeprom_read
;!     _init_LCD
;!       _lcdSend
;!     _init_NumPad
;!     _init_Timer0
;!     _lcdPrint
;!       _lcdSend
;!     _lcdSend
;!   _lcdPrint
;!   _lcdSend
;!   _read_NumPad
;!     _CompareStrings
;!     ___awmod
;!     ___wmul
;!     _eeprom_write
;!     _rand
;!     _srand
;!
;! _IRS (ROOT)
;!   i1_UART_TxString
;!     i1_UART_TxChar
;!     i1___awmod
;!       i1_rand (ARG)
;!         i1___lmul
;!     i1___wmul
;!       i1___awmod (ARG)
;!       i1_rand (ARG)
;!     i1_rand
;!     i1_srand
;!

;! Address spaces:

;!Name               Size   Autos  Total    Cost      Usage
;!BANK3               60     1B      52       9       85.4%
;!BITBANK3            60      0       0       8        0.0%
;!SFR3                 0      0       0       4        0.0%
;!BITSFR3              0      0       0       4        0.0%
;!BANK2               60      0      32      11       52.1%
;!BITBANK2            60      0       0      10        0.0%
;!SFR2                 0      0       0       5        0.0%
;!BITSFR2              0      0       0       5        0.0%
;!BANK1               50     42      50       7      100.0%
;!BITBANK1            50      0       0       6        0.0%
;!SFR1                 0      0       0       2        0.0%
;!BITSFR1              0      0       0       2        0.0%
;!BANK0               50     1C      37       5       68.8%
;!BITBANK0            50      0       0       4        0.0%
;!SFR0                 0      0       0       1        0.0%
;!BITSFR0              0      0       0       1        0.0%
;!COMMON               E      E       E       1      100.0%
;!BITCOMMON            E      0       0       0        0.0%
;!CODE                 0      0       0       0        0.0%
;!DATA                 0      0     119      12        0.0%
;!ABS                  0      0     119       3        0.0%
;!NULL                 0      0       0       0        0.0%
;!STACK                0      0       0       2        0.0%
;!EEDATA             100      0       0       0        0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 125 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  num_rand_s     16   11[BANK3 ] unsigned char [16]
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0      16       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0      16       0
;;Total ram usage:       16 bytes
;; Hardware stack levels required when called: 8
;; This function calls:
;;		_CompareStrings
;;		_ConcatToPacket
;;		_ConvertToString
;;		_SplitPacket
;;		_UART_TxString
;;		_init_PIC
;;		_lcdPrint
;;		_lcdSend
;;		_read_NumPad
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"main.c"
	line	125
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"main.c"
	line	125
	
_main:	
;incstack = 0
	callstack 0
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	128
	
l3849:	
;main.c: 128:     init_PIC();
	fcall	_init_PIC
	line	132
	
l3851:	
;main.c: 131:     {;main.c: 132:         if(pr_start)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_pr_start)),w
	btfsc	status,2
	goto	u4071
	goto	u4070
u4071:
	goto	l3859
u4070:
	line	134
	
l3853:	
;main.c: 133:         {;main.c: 134:             lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	135
	
l3855:	
;main.c: 135:             lcdPrint("Premi '#'\0");
	movlw	(low((((STR_1)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	136
	
l3857:	
;main.c: 136:             pr_start = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_start)
	line	138
	
l3859:	
;main.c: 138:         if(pr_err_len)
	movf	((_pr_err_len)),w
	btfsc	status,2
	goto	u4081
	goto	u4080
u4081:
	goto	l3869
u4080:
	line	141
	
l3861:	
;main.c: 139:         {;main.c: 141:             lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	142
	
l3863:	
;main.c: 142:             lcdPrint("ERRORE\0");
	movlw	(low((((STR_2)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	143
	
l3865:	
;main.c: 143:             lcdSend(0xC0, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	144
;main.c: 144:             lcdPrint("ID = 3 chars\0");
	movlw	(low((((STR_3)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	145
	
l3867:	
;main.c: 145:             pr_err_len = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_err_len)
	line	147
	
l3869:	
;main.c: 147:         if(pr_err_max)
	movf	((_pr_err_max)),w
	btfsc	status,2
	goto	u4091
	goto	u4090
u4091:
	goto	l3879
u4090:
	line	150
	
l3871:	
;main.c: 148:         {;main.c: 150:             lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	151
	
l3873:	
;main.c: 151:             lcdPrint("ERRORE\0");
	movlw	(low((((STR_4)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	152
	
l3875:	
;main.c: 152:             lcdSend(0xC0, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	153
;main.c: 153:             lcdPrint("ID > 250\0");
	movlw	(low((((STR_5)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	154
	
l3877:	
;main.c: 154:             pr_err_max = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_err_max)
	line	156
	
l3879:	
;main.c: 156:         if(pr_succ)
	movf	((_pr_succ)),w
	btfsc	status,2
	goto	u4101
	goto	u4100
u4101:
	goto	l3891
u4100:
	line	159
	
l3881:	
;main.c: 157:         {;main.c: 159:             lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	160
	
l3883:	
;main.c: 160:             lcdPrint("ID Salvato\0");
	movlw	(low((((STR_6)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	162
	
l3885:	
;main.c: 162:             milliseconds = 0;
	movlw	high highword(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_milliseconds+3)
	movlw	low highword(0)
	movwf	(_milliseconds+2)
	movlw	high(0)
	movwf	(_milliseconds+1)
	movlw	low(0)
	movwf	(_milliseconds)

	line	163
	
l3887:	
;main.c: 163:             seconds = 1000;
	movlw	0
	movwf	(_seconds+3)
	movlw	0
	movwf	(_seconds+2)
	movlw	03h
	movwf	(_seconds+1)
	movlw	0E8h
	movwf	(_seconds)

	line	164
	
l3889:	
;main.c: 164:             pr_succ = 0;
	clrf	(_pr_succ)
	line	168
	
l3891:	
;main.c: 168:         read_NumPad();
	fcall	_read_NumPad
	line	171
	
l3893:	
;main.c: 171:         if(i_id != old_i_id && initialize)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_old_i_id+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_i_id+1)^080h,w
	skipz
	goto	u4115
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_old_i_id),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_i_id)^080h,w
u4115:

	skipnz
	goto	u4111
	goto	u4110
u4111:
	goto	l3903
u4110:
	
l3895:	
	movf	((_initialize)^080h),w
	btfsc	status,2
	goto	u4121
	goto	u4120
u4121:
	goto	l3903
u4120:
	line	174
	
l3897:	
;main.c: 172:         {;main.c: 174:             lcdSend(0x01, 0);
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	175
	
l3899:	
;main.c: 175:             lcdPrint("#=conf. *=canc.\0");
	movlw	(low((((STR_7)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	176
	
l3901:	
;main.c: 176:             lcdSend(0xC0, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	177
;main.c: 177:             lcdPrint(PIC_ID);
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	(0x0)
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	180
	
l3903:	
;main.c: 180:         old_i_id = i_id;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_i_id+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_old_i_id+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_i_id)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_old_i_id)
	line	184
	
l3905:	
;main.c: 184:         if(num_rand != old_num_rand)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(_old_num_rand+1)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_num_rand+1)^080h,w
	skipz
	goto	u4135
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(_old_num_rand)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(_num_rand)^080h,w
u4135:

	skipnz
	goto	u4131
	goto	u4130
u4131:
	goto	l3931
u4130:
	line	187
	
l3907:	
;main.c: 185:         {;main.c: 187:             lcdSend(0x01, 0);
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	190
	
l3909:	
;main.c: 189:             char num_rand_s[16];;main.c: 190:             ConvertToString(num_rand, num_rand_s);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_num_rand)^080h,w
	movwf	(ConvertToString@n)^080h
	movf	(_num_rand+1)^080h,w
	movwf	(ConvertToString@n+1)^080h
	movlw	0
	btfsc	(ConvertToString@n+1)^080h,7
	movlw	255
	movwf	(ConvertToString@n+2)^080h
	movwf	(ConvertToString@n+3)^080h
	movlw	(low(main@num_rand_s|((0x1)<<8))&0ffh)
	movwf	(ConvertToString@str)^080h
	movlw	(0x1)
	movwf	(ConvertToString@str+1)^080h
	fcall	_ConvertToString
	line	191
	
l3911:	
;main.c: 191:             lcdPrint(num_rand_s);
	movlw	(low(main@num_rand_s|((0x1)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	(0x1)
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	203
	
l3913:	
;main.c: 203:             packet[0] = '0';
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(_packet)^0180h
	line	204
	
l3915:	
;main.c: 204:             packet[1] = '/';
	movlw	low(02Fh)
	movwf	0+(_packet)^0180h+01h
	line	205
	
l3917:	
;main.c: 205:             packet[2] = '\0';
	clrf	0+(_packet)^0180h+02h
	line	207
	
l3919:	
;main.c: 207:             ConcatToPacket(packet, PIC_ID, '/');
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	(0x0)
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(02Fh)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	209
	
l3921:	
;main.c: 209:             packet[6] = '0';
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	0+(_packet)^0180h+06h
	line	210
	
l3923:	
;main.c: 210:             packet[7] = '/';
	movlw	low(02Fh)
	movwf	0+(_packet)^0180h+07h
	line	211
	
l3925:	
;main.c: 211:             packet[8] = '\0';
	clrf	0+(_packet)^0180h+08h
	line	213
	
l3927:	
;main.c: 213:             ConcatToPacket(packet, num_rand_s, ' ');
	movlw	(low(main@num_rand_s|((0x1)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	(0x1)
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(020h)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	215
	
l3929:	
;main.c: 215:             UART_TxString(packet, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(UART_TxString@is_ACK)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_UART_TxString
	line	218
	
l3931:	
;main.c: 218:         old_num_rand = num_rand;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_num_rand+1)^080h,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(_old_num_rand+1)^0180h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_num_rand)^080h,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(_old_num_rand)^0180h
	line	221
	
l3933:	
;main.c: 221:         if(recieved)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_recieved)),w
	btfsc	status,2
	goto	u4141
	goto	u4140
u4141:
	goto	l3985
u4140:
	line	223
	
l3935:	
;main.c: 222:         {;main.c: 223:             SplitPacket(dato);
	movlw	(low(_dato|((0x1)<<8)))&0ffh
	fcall	_SplitPacket
	line	225
	
l3937:	
;main.c: 225:             if(source == '1' && CompareStrings(id_dest, PIC_ID) && type == '0')
		movlw	49
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	((_source)^080h),w
	btfss	status,2
	goto	u4151
	goto	u4150
u4151:
	goto	l3969
u4150:
	
l3939:	
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	movwf	(CompareStrings@str2)^080h
	movlw	(0x0)
	movwf	(CompareStrings@str2+1)^080h
	movlw	(low(_id_dest|((0x1)<<8)))&0ffh
	fcall	_CompareStrings
	xorlw	0
	skipnz
	goto	u4161
	goto	u4160
u4161:
	goto	l3969
u4160:
	
l3941:	
		movlw	48
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	((_type)^080h),w
	btfss	status,2
	goto	u4171
	goto	u4170
u4171:
	goto	l3969
u4170:
	line	228
	
l3943:	
;main.c: 226:             {;main.c: 228:                 packet[0] = '0';
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(_packet)^0180h
	line	229
;main.c: 229:                 packet[1] = '/';
	movlw	low(02Fh)
	movwf	0+(_packet)^0180h+01h
	line	230
	
l3945:	
;main.c: 230:                 packet[2] = '\0';
	clrf	0+(_packet)^0180h+02h
	line	231
	
l3947:	
;main.c: 231:                 ConcatToPacket(packet, PIC_ID, '/');
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	(0x0)
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(02Fh)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	232
	
l3949:	
;main.c: 232:                 ConcatToPacket(packet, "2", ' ');
	movlw	(low((((STR_8)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	80h
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(020h)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	233
	
l3951:	
;main.c: 233:                 UART_TxString(packet, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(UART_TxString@is_ACK)^080h
	incf	(UART_TxString@is_ACK)^080h,f
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_UART_TxString
	line	235
	
l3953:	
;main.c: 235:                 compare = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_compare)^080h
	incf	(_compare)^080h,f
	line	236
	
l3955:	
;main.c: 236:                 old_num_rand = num_rand = 0;
	clrf	(_num_rand)^080h
	clrf	(_num_rand+1)^080h
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(_old_num_rand)^0180h
	clrf	(_old_num_rand+1)^0180h
	line	238
	
l3957:	
;main.c: 238:                 maxFail = 3;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_maxFail)^080h
	line	240
	
l3959:	
;main.c: 240:                 lcdSend(0x01, 0);
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	241
	
l3961:	
;main.c: 241:                 lcdPrint("Inserisci codice\0");
	movlw	(low((((STR_9)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	242
	
l3963:	
;main.c: 242:                 lcdSend(0xC0, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	243
	
l3965:	
;main.c: 243:                 lcdPrint("Tentativi: \0");
	movlw	(low((((STR_10)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	244
	
l3967:	
;main.c: 244:                 lcdSend(maxFail + '0', 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	incf	(lcdSend@tipo)^080h,f
	movf	(_maxFail)^080h,w
	addlw	030h
	fcall	_lcdSend
	line	247
	
l3969:	
;main.c: 247:             if(source == '1' && CompareStrings(id_dest, PIC_ID) && type == '2')
		movlw	49
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	((_source)^080h),w
	btfss	status,2
	goto	u4181
	goto	u4180
u4181:
	goto	l3981
u4180:
	
l3971:	
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	movwf	(CompareStrings@str2)^080h
	movlw	(0x0)
	movwf	(CompareStrings@str2+1)^080h
	movlw	(low(_id_dest|((0x1)<<8)))&0ffh
	fcall	_CompareStrings
	xorlw	0
	skipnz
	goto	u4191
	goto	u4190
u4191:
	goto	l3981
u4190:
	
l3973:	
		movlw	50
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	((_type)^080h),w
	btfss	status,2
	goto	u4201
	goto	u4200
u4201:
	goto	l3981
u4200:
	line	250
	
l3975:	
;main.c: 248:             {;main.c: 250:                 if(num_rand != 0)
	movf	((_num_rand)^080h),w
iorwf	((_num_rand+1)^080h),w
	btfsc	status,2
	goto	u4211
	goto	u4210
u4211:
	goto	l3979
u4210:
	line	251
	
l3977:	
;main.c: 251:                     seconds = 0;
	movlw	high highword(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_seconds+3)
	movlw	low highword(0)
	movwf	(_seconds+2)
	movlw	high(0)
	movwf	(_seconds+1)
	movlw	low(0)
	movwf	(_seconds)

	goto	l3981
	line	255
	
l3979:	
;main.c: 254:                 {;main.c: 255:                     milliseconds = 0;
	movlw	high highword(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_milliseconds+3)
	movlw	low highword(0)
	movwf	(_milliseconds+2)
	movlw	high(0)
	movwf	(_milliseconds+1)
	movlw	low(0)
	movwf	(_milliseconds)

	line	256
;main.c: 256:                     seconds = 1000;
	movlw	0
	movwf	(_seconds+3)
	movlw	0
	movwf	(_seconds+2)
	movlw	03h
	movwf	(_seconds+1)
	movlw	0E8h
	movwf	(_seconds)

	line	259
	
l3981:	
;main.c: 259:             recieved = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_recieved)
	line	260
	
l3983:	
;main.c: 260:             iS = 0;
	clrf	(_iS)
	line	265
	
l3985:	
;main.c: 265:         if(success)
	movf	((_success)),w
	btfsc	status,2
	goto	u4221
	goto	u4220
u4221:
	goto	l4011
u4220:
	line	268
	
l3987:	
;main.c: 266:         {;main.c: 268:             lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	269
	
l3989:	
;main.c: 269:             lcdPrint("Benvenuto!\0");
	movlw	(low((((STR_11)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	270
	
l3991:	
;main.c: 270:             iT = old_iT = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_old_iT)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_iT)^080h
	line	271
	
l3993:	
;main.c: 271:             success = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_success)
	line	273
	
l3995:	
;main.c: 273:             compare = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_compare)^080h
	line	274
	
l3997:	
;main.c: 274:             maxFail = 3;
	movlw	low(03h)
	movwf	(_maxFail)^080h
	line	276
	
l3999:	
;main.c: 276:             packet[0] = '0';
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(_packet)^0180h
	line	277
	
l4001:	
;main.c: 277:             packet[1] = '/';
	movlw	low(02Fh)
	movwf	0+(_packet)^0180h+01h
	line	278
	
l4003:	
;main.c: 278:             packet[2] = '\0';
	clrf	0+(_packet)^0180h+02h
	line	279
	
l4005:	
;main.c: 279:             ConcatToPacket(packet, PIC_ID, '/');
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	(0x0)
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(02Fh)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	280
	
l4007:	
;main.c: 280:             ConcatToPacket(packet, "1/1", ' ');
	movlw	(low((((STR_12)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	80h
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(020h)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	281
	
l4009:	
;main.c: 281:             UART_TxString(packet, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(UART_TxString@is_ACK)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_UART_TxString
	line	282
;main.c: 282:         }
	goto	l4053
	line	284
	
l4011:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_maxFail)^080h),w
	btfsc	status,2
	goto	u4231
	goto	u4230
u4231:
	goto	l4029
u4230:
	
l4013:	
	movlw	low(03h)
	subwf	(_maxFail)^080h,w
	skipnc
	goto	u4241
	goto	u4240
u4241:
	goto	l4029
u4240:
	
l4015:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	((_fail)),w
	btfsc	status,2
	goto	u4251
	goto	u4250
u4251:
	goto	l4029
u4250:
	line	287
	
l4017:	
;main.c: 285:         {;main.c: 287:             lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	288
	
l4019:	
;main.c: 288:             lcdPrint("Codice errato\0");
	movlw	(low((((STR_13)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	289
	
l4021:	
;main.c: 289:             lcdSend(0xC0, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	290
;main.c: 290:             lcdPrint("Tentativi: \0");
	movlw	(low((((STR_14)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	291
	
l4023:	
;main.c: 291:             lcdSend(maxFail + '0', 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	incf	(lcdSend@tipo)^080h,f
	movf	(_maxFail)^080h,w
	addlw	030h
	fcall	_lcdSend
	line	292
	
l4025:	
;main.c: 292:             iT = old_iT = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_old_iT)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_iT)^080h
	line	293
	
l4027:	
;main.c: 293:             fail = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_fail)
	line	294
;main.c: 294:         }
	goto	l4053
	line	296
	
l4029:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_maxFail)^080h),w
	btfss	status,2
	goto	u4261
	goto	u4260
u4261:
	goto	l4053
u4260:
	line	299
	
l4031:	
;main.c: 297:         {;main.c: 299:             lcdSend(0x01, 0);
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	300
	
l4033:	
;main.c: 300:             lcdPrint("Tent. esauriti\0");
	movlw	(low((((STR_15)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	302
	
l4035:	
;main.c: 302:             maxFail = 3;
	movlw	low(03h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_maxFail)^080h
	line	303
	
l4037:	
;main.c: 303:             iT = old_iT = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_old_iT)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_iT)^080h
	line	304
	
l4039:	
;main.c: 304:             compare = 0;
	clrf	(_compare)^080h
	line	306
	
l4041:	
;main.c: 306:             packet[0] = '0';
	movlw	low(030h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(_packet)^0180h
	line	307
	
l4043:	
;main.c: 307:             packet[1] = '/';
	movlw	low(02Fh)
	movwf	0+(_packet)^0180h+01h
	line	308
	
l4045:	
;main.c: 308:             packet[2] = '\0';
	clrf	0+(_packet)^0180h+02h
	line	309
	
l4047:	
;main.c: 309:             ConcatToPacket(packet, PIC_ID, '/');
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	(0x0)
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(02Fh)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	310
	
l4049:	
;main.c: 310:             ConcatToPacket(packet, "1/0", ' ');
	movlw	(low((((STR_16)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@str)^080h
	movlw	80h
	movwf	(ConcatToPacket@str+1)^080h
	movlw	low(020h)
	movwf	(ConcatToPacket@delim)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_ConcatToPacket
	line	311
	
l4051:	
;main.c: 311:             UART_TxString(packet, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(UART_TxString@is_ACK)^080h
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	_UART_TxString
	line	315
	
l4053:	
;main.c: 315:         if(iT != old_iT && compare)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_iT)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_old_iT),w
	skipnz
	goto	u4271
	goto	u4270
u4271:
	goto	l4063
u4270:
	
l4055:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_compare)^080h),w
	btfsc	status,2
	goto	u4281
	goto	u4280
u4281:
	goto	l4063
u4280:
	line	318
	
l4057:	
;main.c: 316:         {;main.c: 318:             lcdSend(0x01, 0);
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	319
	
l4059:	
;main.c: 319:             lcdPrint("#=conf. *=canc.\0\0"),
	movlw	(low((((STR_17)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	
l4061:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	321
;main.c: 321:             lcdPrint(datoTastierino);
	movlw	(low(_datoTastierino|((0x1)<<8))&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	(0x1)
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	324
	
l4063:	
;main.c: 324:         old_iT = iT;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_iT)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_old_iT)
	goto	l3851
	global	start
	ljmp	start
	callstack 0
	line	328
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_read_NumPad

;; *************** function _read_NumPad *****************
;; Defined at:
;;		line 625 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  id              2   43[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0      10       0       0
;;      Totals:         0       0      12       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_CompareStrings
;;		___awmod
;;		___wmul
;;		_eeprom_write
;;		_rand
;;		_srand
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	625
global __ptext1
__ptext1:	;psect for function _read_NumPad
psect	text1
	file	"main.c"
	line	625
	
_read_NumPad:	
;incstack = 0
	callstack 1
; Regs used in _read_NumPad: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	628
	
l3341:	
;main.c: 628:     TRISD |= 0x0F;
	movlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	iorwf	(136)^080h,f	;volatile
	line	629
	
l3343:	
;main.c: 629:     for(colScan = 0; colScan < 3; colScan++)
	clrf	(_colScan)^080h
	line	633
	
l3349:	
;main.c: 630:     {;main.c: 633:         PORTB |= 0x07;
	movlw	low(07h)
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(6),f	;volatile
	line	635
	
l3351:	
;main.c: 635:         PORTB &= colMask[colScan];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_colScan)^080h,w
	addlw	low((((_colMask)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(6),f	;volatile
	line	637
	
l3353:	
;main.c: 637:         for(rowScan = 0; rowScan < 4; rowScan++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_rowScan)^080h
	line	640
	
l3359:	
;main.c: 638:         {;main.c: 640:             if(!(PORTD & rowMask[rowScan]))
	movf	(_rowScan)^080h,w
	addlw	low((((_rowMask)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),w	;volatile
	btfss	status,2
	goto	u3481
	goto	u3480
u3481:
	goto	l275
u3480:
	line	643
	
l3361:	
;main.c: 641:             {;main.c: 643:                 _delay((unsigned long)((5)*(20000000/4000.0)));
	asmopt push
asmopt off
movlw	33
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_read_NumPad+0)^080h+0+1)
	movlw	117
movwf	((??_read_NumPad+0)^080h+0)
	u4297:
decfsz	((??_read_NumPad+0)^080h+0),f
	goto	u4297
	decfsz	((??_read_NumPad+0)^080h+0+1),f
	goto	u4297
	nop2
asmopt pop

	line	644
	
l3363:	
;main.c: 644:                 if(!(PORTD & rowMask[rowScan]))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rowScan)^080h,w
	addlw	low((((_rowMask)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(8),w	;volatile
	btfss	status,2
	goto	u3491
	goto	u3490
u3491:
	goto	l275
u3490:
	line	649
	
l3365:	
;main.c: 645:                 {;main.c: 649:                     keypressed = rowScan+(4*colScan);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_colScan)^080h,w
	movwf	(??_read_NumPad+0)^080h+0
	movlw	02h
u3505:
	clrc
	rlf	(??_read_NumPad+0)^080h+0,f
	addlw	-1
	skipz
	goto	u3505
	movf	(_rowScan)^080h,w
	addwf	0+(??_read_NumPad+0)^080h+0,w
	movwf	(_keypressed)^080h
	line	651
	
l3367:	
;main.c: 651:                     keyf = 1;
	clrf	(_keyf)^080h
	incf	(_keyf)^080h,f
	line	653
;main.c: 653:             }
	
l275:	
	line	654
;main.c: 654:         }
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	addwf	(_rowScan)^080h,f
	
l3369:	
	movlw	low(04h)
	subwf	(_rowScan)^080h,w
	skipc
	goto	u3511
	goto	u3510
u3511:
	goto	l3359
u3510:
	line	656
	
l3371:	
;main.c: 656:         if(keyf)
	movf	((_keyf)^080h),w
	btfsc	status,2
	goto	u3521
	goto	u3520
u3521:
	goto	l3457
u3520:
	line	658
	
l3373:	
;main.c: 657:         {;main.c: 658:             keyf = 0;
	clrf	(_keyf)^080h
	line	661
	
l3375:	
;main.c: 661:             if(keypressed == 8)
		movlw	8
	xorwf	((_keypressed)^080h),w
	btfss	status,2
	goto	u3531
	goto	u3530
u3531:
	goto	l3417
u3530:
	line	664
	
l3377:	
;main.c: 662:             {;main.c: 664:                 if(initialize && i_id == 3)
	movf	((_initialize)^080h),w
	btfsc	status,2
	goto	u3541
	goto	u3540
u3541:
	goto	l3393
u3540:
	
l3379:	
		movlw	3
	xorwf	((_i_id)^080h),w
iorwf	((_i_id+1)^080h),w
	btfss	status,2
	goto	u3551
	goto	u3550
u3551:
	goto	l3393
u3550:
	line	667
	
l3381:	
;main.c: 665:                 {;main.c: 667:                     int id = (PIC_ID[0] - '0') * 100 + (PIC_ID[1] - '0') * 10 + (PIC_ID[2] - '0');
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_PIC_ID),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_read_NumPad+0)^080h+0
	clrf	(??_read_NumPad+0)^080h+0+1
	movf	0+(??_read_NumPad+0)^080h+0,w
	movwf	(___wmul@multiplier)^080h
	movf	1+(??_read_NumPad+0)^080h+0,w
	movwf	(___wmul@multiplier+1)^080h
	movlw	064h
	movwf	(___wmul@multiplicand)^080h
	movlw	0
	movwf	((___wmul@multiplicand)^080h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+?___wmul)^080h,w
	movwf	(??_read_NumPad+2)^080h+0
	movf	(1+?___wmul)^080h,w
	movwf	((??_read_NumPad+2)^080h+0+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_PIC_ID)+01h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_read_NumPad+4)^080h+0
	clrf	(??_read_NumPad+4)^080h+0+1
	movf	0+(??_read_NumPad+4)^080h+0,w
	movwf	(___wmul@multiplier)^080h
	movf	1+(??_read_NumPad+4)^080h+0,w
	movwf	(___wmul@multiplier+1)^080h
	movlw	0Ah
	movwf	(___wmul@multiplicand)^080h
	movlw	0
	movwf	((___wmul@multiplicand)^080h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___wmul))^080h,w
	addwf	0+(??_read_NumPad+2)^080h+0,w
	movwf	(??_read_NumPad+6)^080h+0
	movf	(1+(?___wmul))^080h,w
	skipnc
	incf	(1+(?___wmul))^080h,w
	addwf	1+(??_read_NumPad+2)^080h+0,w
	movwf	1+(??_read_NumPad+6)^080h+0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_PIC_ID)+02h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	0+(??_read_NumPad+6)^080h+0,w
	movwf	(??_read_NumPad+8)^080h+0
	movlw	0
	skipnc
	movlw	1
	addwf	1+(??_read_NumPad+6)^080h+0,w
	movwf	1+(??_read_NumPad+8)^080h+0
	movf	0+(??_read_NumPad+8)^080h+0,w
	addlw	low(0EB30h)
	movwf	(read_NumPad@id)^080h
	movf	1+(??_read_NumPad+8)^080h+0,w
	skipnc
	addlw	1
	addlw	high(0EB30h)
	movwf	1+(read_NumPad@id)^080h
	line	669
	
l3383:	
;main.c: 669:                     if(id <= 250)
	movf	(read_NumPad@id+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u3565
	movlw	0FBh
	subwf	(read_NumPad@id)^080h,w
u3565:

	skipnc
	goto	u3561
	goto	u3560
u3561:
	goto	l280
u3560:
	line	672
	
l3385:	
;main.c: 670:                     {;main.c: 672:                         eeprom_write(0, id);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(read_NumPad@id)^080h,w
	movwf	(eeprom_write@value)^080h
	movlw	low(0)
	fcall	_eeprom_write
	line	673
	
l3387:	
;main.c: 673:                         pr_succ = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_succ)
	incf	(_pr_succ),f
	line	675
	
l3389:	
;main.c: 675:                         initialize = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_initialize)^080h
	line	676
;main.c: 676:                     }
	goto	l3453
	line	678
;main.c: 678:                     else
	
l280:	
	line	680
;main.c: 679:                     {;main.c: 680:                         pr_err_max = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_err_max)
	incf	(_pr_err_max),f
	line	682
	
l3391:	
;main.c: 682:                         PIC_ID[0] = '\0';
	clrf	(_PIC_ID)
	line	683
;main.c: 683:                         i_id = old_i_id = 0;
	clrf	(_old_i_id)
	clrf	(_old_i_id+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_i_id)^080h
	clrf	(_i_id+1)^080h
	goto	l3453
	line	684
;main.c: 684:                     }
	
l281:	
	line	685
;main.c: 685:                 }
	goto	l3453
	line	687
	
l3393:	
	movf	((_initialize)^080h),w
	btfsc	status,2
	goto	u3571
	goto	u3570
u3571:
	goto	l3401
u3570:
	
l3395:	
	movf	(_i_id+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u3585
	movlw	03h
	subwf	(_i_id)^080h,w
u3585:

	skipnc
	goto	u3581
	goto	u3580
u3581:
	goto	l3401
u3580:
	line	689
	
l3397:	
;main.c: 688:                 {;main.c: 689:                     pr_err_len = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_err_len)
	incf	(_pr_err_len),f
	goto	l3391
	line	695
	
l3401:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_compare)^080h),w
	btfss	status,2
	goto	u3591
	goto	u3590
u3591:
	goto	l3405
u3590:
	line	698
	
l3403:	
;main.c: 696:                 {;main.c: 698:                     srand(milliseconds);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_milliseconds+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(srand@x+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_milliseconds),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(srand@x)^080h
	fcall	_srand
	line	700
;main.c: 700:                     num_rand = ((rand()%8999)+1000);
	movlw	027h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___awmod@divisor)^080h
	movlw	023h
	movwf	((___awmod@divisor)^080h)+1
	fcall	_rand
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_rand))^080h,w
	movwf	(___awmod@dividend+1)^080h
	movf	(0+(?_rand))^080h,w
	movwf	(___awmod@dividend)^080h
	fcall	___awmod
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___awmod))^080h,w
	addlw	low(03E8h)
	movwf	(_num_rand)^080h
	movf	(1+(?___awmod))^080h,w
	skipnc
	addlw	1
	addlw	high(03E8h)
	movwf	1+(_num_rand)^080h
	line	701
;main.c: 701:                 }
	goto	l3453
	line	703
	
l3405:	
	movf	((_compare)^080h),w
	btfsc	status,2
	goto	u3601
	goto	u3600
u3601:
	goto	l3411
u3600:
	
l3407:	
	movlw	(low(_datoTastierino|((0x1)<<8))&0ffh)
	movwf	(CompareStrings@str2)^080h
	movlw	(0x1)
	movwf	(CompareStrings@str2+1)^080h
	movlw	(low(_datoSeriale|((0x1)<<8)))&0ffh
	fcall	_CompareStrings
	xorlw	0
	skipnz
	goto	u3611
	goto	u3610
u3611:
	goto	l3411
u3610:
	line	705
	
l3409:	
;main.c: 704:                 {;main.c: 705:                     success = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_success)
	incf	(_success),f
	line	706
;main.c: 706:                 }
	goto	l3453
	line	708
	
l3411:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_compare)^080h),w
	btfsc	status,2
	goto	u3621
	goto	u3620
u3621:
	goto	l281
u3620:
	line	710
	
l3413:	
;main.c: 709:                 {;main.c: 710:                     maxFail--;
	movlw	01h
	subwf	(_maxFail)^080h,f
	line	711
	
l3415:	
;main.c: 711:                     fail = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_fail)
	incf	(_fail),f
	goto	l3453
	line	715
	
l3417:	
	movf	((_keypressed)^080h),w
	btfss	status,2
	goto	u3631
	goto	u3630
u3631:
	goto	l3435
u3630:
	line	718
	
l3419:	
;main.c: 716:             {;main.c: 718:                 if(compare && iT > 0)
	movf	((_compare)^080h),w
	btfsc	status,2
	goto	u3641
	goto	u3640
u3641:
	goto	l3427
u3640:
	
l3421:	
	movf	((_iT)^080h),w
	btfsc	status,2
	goto	u3651
	goto	u3650
u3651:
	goto	l3427
u3650:
	line	721
	
l3423:	
;main.c: 719:                 {;main.c: 721:                     iT--;
	movlw	01h
	subwf	(_iT)^080h,f
	line	722
	
l3425:	
;main.c: 722:                     datoTastierino[iT] = '\0';
	movf	(_iT)^080h,w
	addlw	low(_datoTastierino|((0x1)<<8))&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	line	723
;main.c: 723:                 }
	goto	l3453
	line	725
	
l3427:	
	movf	((_initialize)^080h),w
	btfsc	status,2
	goto	u3661
	goto	u3660
u3661:
	goto	l3453
u3660:
	
l3429:	
	movf	(_i_id+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u3675
	movlw	01h
	subwf	(_i_id)^080h,w
u3675:

	skipc
	goto	u3671
	goto	u3670
u3671:
	goto	l3453
u3670:
	line	728
	
l3431:	
;main.c: 726:                 {;main.c: 728:                     i_id--;
	movlw	0FFh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_i_id)^080h,f
	skipnc
	incf	(_i_id+1)^080h,f
	movlw	0FFh
	addwf	(_i_id+1)^080h,f
	line	729
	
l3433:	
;main.c: 729:                     PIC_ID[i_id] = '\0';
	movf	(_i_id)^080h,w
	addlw	low(_PIC_ID|((0x0)<<8))&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l3453
	line	733
	
l3435:	
	movf	((_compare)^080h),w
	btfsc	status,2
	goto	u3681
	goto	u3680
u3681:
	goto	l3443
u3680:
	line	736
	
l3437:	
;main.c: 734:             {;main.c: 736:                 datoTastierino[iT++] = keys[keypressed];
	movf	(_keypressed)^080h,w
	addlw	low((((_keys)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_read_NumPad+0)^080h+0
	movf	(_iT)^080h,w
	addlw	low(_datoTastierino|((0x1)<<8))&0ffh
	movwf	fsr0
	movf	(??_read_NumPad+0)^080h+0,w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	
l3439:	
	movlw	low(01h)
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	addwf	(_iT)^080h,f
	goto	l3425
	line	740
	
l3443:	
	movf	((_initialize)^080h),w
	btfsc	status,2
	goto	u3691
	goto	u3690
u3691:
	goto	l3453
u3690:
	
l3445:	
	movf	(_i_id+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u3705
	movlw	03h
	subwf	(_i_id)^080h,w
u3705:

	skipnc
	goto	u3701
	goto	u3700
u3701:
	goto	l3453
u3700:
	line	743
	
l3447:	
;main.c: 741:             {;main.c: 743:                 PIC_ID[i_id++] = keys[keypressed];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_keypressed)^080h,w
	addlw	low((((_keys)-__stringbase)|8000h))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_read_NumPad+0)^080h+0
	movf	(_i_id)^080h,w
	addlw	low(_PIC_ID|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(??_read_NumPad+0)^080h+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3449:	
	movlw	01h
	addwf	(_i_id)^080h,f
	skipnc
	incf	(_i_id+1)^080h,f
	movlw	0
	addwf	(_i_id+1)^080h,f
	goto	l3433
	line	747
	
l3453:	
;main.c: 747:             PORTD |= 0x0F;
	movlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(8),f	;volatile
	line	750
;main.c: 750:             while(((PORTD & 0x0F) != 0x0F))
	
l3455:	
;main.c: 750:             while(((PORTD & 0x0F) != 0x0F))
	movlw	low(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(8),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_read_NumPad+0)^080h+0
		movlw	15
	xorwf	((??_read_NumPad+0)^080h+0),w
	btfss	status,2
	goto	u3711
	goto	u3710
u3711:
	goto	l3455
u3710:
	line	755
	
l3457:	
;main.c: 755:     }
	movlw	low(01h)
	movwf	(??_read_NumPad+0)^080h+0
	movf	(??_read_NumPad+0)^080h+0,w
	addwf	(_colScan)^080h,f
	
l3459:	
	movlw	low(03h)
	subwf	(_colScan)^080h,w
	skipc
	goto	u3721
	goto	u3720
u3721:
	goto	l3349
u3720:
	line	756
	
l302:	
	return
	callstack 0
GLOBAL	__end_of_read_NumPad
	__end_of_read_NumPad:
	signat	_read_NumPad,89
	global	_eeprom_write

;; *************** function _eeprom_write *****************
;; Defined at:
;;		line 6 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eewrite.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  value           1    0[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    2[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_read_NumPad
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eewrite.c"
	line	6
global __ptext2
__ptext2:	;psect for function _eeprom_write
psect	text2
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eewrite.c"
	line	6
	
_eeprom_write:	
;incstack = 0
	callstack 2
; Regs used in _eeprom_write: [wreg+status,2+status,0]
;eeprom_write@addr stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(eeprom_write@addr)^080h
	line	8
;C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eewrite.c: 6: eeprom_write(unsigned char addr, unsigned char value);C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eewrite.c: 7: {;C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eewrite.c: 8:  do{ while (EECON1bits.WR) { continue; } EEADR = (addr); EEDATA = (value); EECON1 &= 0x3F; STATUSbits.CARRY = 0; if (INTCONbits.GIE) { STATUSbits.CARRY = 1; } INTCONbits.GIE = 0; EECON1bits.WREN = 1; EECON2 = 0x55; EECON2 = 0xAA; EECON1bits.WR = 1; EECON1bits.WREN = 0; if (STATUSbits.CARRY) { INTCONbits.GIE = 1; } } while (0);
	
l440:	
	
l441:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(396)^0180h,1	;volsfr
	goto	u3331
	goto	u3330
u3331:
	goto	l441
u3330:
	
l3249:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(eeprom_write@addr)^080h,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(eeprom_write@value)^080h,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(268)^0100h	;volatile
	
l3251:	
	movlw	low(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_eeprom_write+0)^080h+0
	movf	(??_eeprom_write+0)^080h+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volsfr
	
l3253:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(3),0	;volatile
	
l3255:	
	btfss	(11),7	;volatile
	goto	u3341
	goto	u3340
u3341:
	goto	l444
u3340:
	
l3257:	
	bsf	(3),0	;volatile
	
l444:	
	bcf	(11),7	;volatile
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(396)^0180h,2	;volsfr
	
l3259:	
	movlw	low(055h)
	movwf	(397)^0180h	;volsfr
	movlw	low(0AAh)
	movwf	(397)^0180h	;volsfr
	
l3261:	
	bsf	(396)^0180h,1	;volsfr
	
l3263:	
	bcf	(396)^0180h,2	;volsfr
	
l3265:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(3),0	;volatile
	goto	u3351
	goto	u3350
u3351:
	goto	l447
u3350:
	
l3267:	
	bsf	(11),7	;volatile
	line	9
	
l447:	
	return
	callstack 0
GLOBAL	__end_of_eeprom_write
	__end_of_eeprom_write:
	signat	_eeprom_write,8313
	global	_CompareStrings

;; *************** function _CompareStrings *****************
;; Defined at:
;;		line 569 in file "main.c"
;; Parameters:    Size  Location     Type
;;  str1            1    wreg     PTR unsigned char 
;;		 -> datoSeriale(17), id_dest(4), 
;;  str2            2    7[BANK1 ] PTR unsigned char 
;;		 -> datoTastierino(17), PIC_ID(4), 
;; Auto vars:     Size  Location     Type
;;  str1            1   14[BANK1 ] PTR unsigned char 
;;		 -> datoSeriale(17), id_dest(4), 
;;  i               1   13[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_Length
;; This function is called by:
;;		_main
;;		_read_NumPad
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	569
global __ptext3
__ptext3:	;psect for function _CompareStrings
psect	text3
	file	"main.c"
	line	569
	
_CompareStrings:	
;incstack = 0
	callstack 1
; Regs used in _CompareStrings: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;CompareStrings@str1 stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(CompareStrings@str1)^080h
	line	572
	
l3123:	
;main.c: 569: char CompareStrings(char *str1, char *str2);main.c: 570: {;main.c: 572:     if(Length(str1) != Length(str2))
	movf	(CompareStrings@str1)^080h,w
	movwf	(Length@str)^080h
	movlw	(0x1)
	movwf	(Length@str+1)^080h
	fcall	_Length
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+?_Length)^080h,w
	movwf	(??_CompareStrings+0)^080h+0
	movf	(1+?_Length)^080h,w
	movwf	((??_CompareStrings+0)^080h+0+1)
		movf	(CompareStrings@str2)^080h,w
	movwf	(Length@str)^080h
movf	(CompareStrings@str2+1)^080h,w
movwf	(Length@str+1)^080h

	fcall	_Length
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_Length))^080h,w
	xorwf	1+(??_CompareStrings+0)^080h+0,w
	skipz
	goto	u3235
	movf	(0+(?_Length))^080h,w
	xorwf	0+(??_CompareStrings+0)^080h+0,w
u3235:

	skipnz
	goto	u3231
	goto	u3230
u3231:
	goto	l3131
u3230:
	line	573
	
l3125:	
;main.c: 573:         return 0;
	movlw	low(0)
	goto	l251
	line	576
	
l3131:	
;main.c: 575:     {;main.c: 576:         char i = 0;
	clrf	(CompareStrings@i)^080h
	line	579
;main.c: 579:         while(str1[i] != '\0')
	goto	l3141
	line	581
	
l3133:	
;main.c: 580:         {;main.c: 581:             if(str1[i] != str2[i])
	movf	(CompareStrings@i)^080h,w
	addwf	(CompareStrings@str2)^080h,w
	movwf	(??_CompareStrings+0)^080h+0
	movf	(CompareStrings@str2+1)^080h,w
	skipnc
	addlw	1
	movwf	1+((??_CompareStrings+0)^080h+0)
	movf	0+(??_CompareStrings+0)^080h+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_CompareStrings+0)^080h+0,0
	bcf	status,7
	movf	indf,w
	movwf	(??_CompareStrings+2)^080h+0
	movf	(CompareStrings@i)^080h,w
	addwf	(CompareStrings@str1)^080h,w
	movwf	(??_CompareStrings+3)^080h+0
	movf	0+(??_CompareStrings+3)^080h+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	xorwf	(??_CompareStrings+2)^080h+0,w
	skipnz
	goto	u3241
	goto	u3240
u3241:
	goto	l3139
u3240:
	goto	l3125
	line	584
	
l3139:	
;main.c: 584:             i++;
	movlw	low(01h)
	movwf	(??_CompareStrings+0)^080h+0
	movf	(??_CompareStrings+0)^080h+0,w
	addwf	(CompareStrings@i)^080h,f
	line	579
	
l3141:	
;main.c: 579:         while(str1[i] != '\0')
	movf	(CompareStrings@i)^080h,w
	addwf	(CompareStrings@str1)^080h,w
	movwf	(??_CompareStrings+0)^080h+0
	movf	0+(??_CompareStrings+0)^080h+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	(indf),w
	btfss	status,2
	goto	u3251
	goto	u3250
u3251:
	goto	l3133
u3250:
	line	587
	
l3143:	
;main.c: 587:         return 1;
	movlw	low(01h)
	line	589
	
l251:	
	return
	callstack 0
GLOBAL	__end_of_CompareStrings
	__end_of_CompareStrings:
	signat	_CompareStrings,8313
	global	_init_PIC

;; *************** function _init_PIC *****************
;; Defined at:
;;		line 330 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  id              2    9[BANK3 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       2       0
;;      Temps:          0       0       0       2       0
;;      Totals:         0       0       0       4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 7
;; This function calls:
;;		_ConvertToString
;;		_Fill
;;		_UART_init
;;		_eeprom_read
;;		_init_LCD
;;		_init_NumPad
;;		_init_Timer0
;;		_lcdPrint
;;		_lcdSend
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=0
	line	330
global __ptext4
__ptext4:	;psect for function _init_PIC
psect	text4
	file	"main.c"
	line	330
	
_init_PIC:	
;incstack = 0
	callstack 0
; Regs used in _init_PIC: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	333
	
l3831:	
;main.c: 333:     UART_init(115200);
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(UART_init@baudrate+3)^080h
	movlw	01h
	movwf	(UART_init@baudrate+2)^080h
	movlw	0C2h
	movwf	(UART_init@baudrate+1)^080h
	movlw	0
	movwf	(UART_init@baudrate)^080h

	fcall	_UART_init
	line	334
;main.c: 334:     init_LCD();
	fcall	_init_LCD
	line	335
;main.c: 335:     init_NumPad();
	fcall	_init_NumPad
	line	336
;main.c: 336:     init_Timer0();
	fcall	_init_Timer0
	line	338
;main.c: 338:     int id = (int)eeprom_read(0);
	movlw	low(0)
	fcall	_eeprom_read
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(??_init_PIC+0)^0180h+0
	clrf	(??_init_PIC+0)^0180h+0+1
	movf	0+(??_init_PIC+0)^0180h+0,w
	movwf	(init_PIC@id)^0180h
	movf	1+(??_init_PIC+0)^0180h+0,w
	movwf	(init_PIC@id+1)^0180h
	line	339
	
l3833:	
;main.c: 339:     if(id == 255)
		incf	((init_PIC@id)^0180h),w
iorwf	((init_PIC@id+1)^0180h),w
	btfss	status,2
	goto	u4061
	goto	u4060
u4061:
	goto	l3841
u4060:
	line	341
	
l3835:	
;main.c: 340:     {;main.c: 341:         lcdPrint("Inser. ID PIC:\0");
	movlw	(low((((STR_18)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	342
	
l3837:	
;main.c: 342:         lcdSend(0xC0, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0C0h)
	fcall	_lcdSend
	line	343
	
l3839:	
;main.c: 343:         lcdPrint("MIN=000,MAX=250\0");
	movlw	(low((((STR_19)-__stringbase)|8000h)))&0ffh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdPrint@str)^080h
	movlw	80h
	movwf	(lcdPrint@str+1)^080h
	fcall	_lcdPrint
	line	344
;main.c: 344:     }
	goto	l178
	line	347
	
l3841:	
;main.c: 346:     {;main.c: 347:         ConvertToString(id, PIC_ID);
	movf	(init_PIC@id)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConvertToString@n)^080h
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(init_PIC@id+1)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConvertToString@n+1)^080h
	movlw	0
	btfsc	(ConvertToString@n+1)^080h,7
	movlw	255
	movwf	(ConvertToString@n+2)^080h
	movwf	(ConvertToString@n+3)^080h
	movlw	(low(_PIC_ID|((0x0)<<8))&0ffh)
	movwf	(ConvertToString@str)^080h
	movlw	(0x0)
	movwf	(ConvertToString@str+1)^080h
	fcall	_ConvertToString
	line	348
	
l3843:	
;main.c: 348:         Fill(PIC_ID);
	movlw	(low(_PIC_ID|((0x0)<<8)))&0ffh
	fcall	_Fill
	line	349
	
l3845:	
;main.c: 349:         initialize = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_initialize)^080h
	line	350
	
l3847:	
;main.c: 350:         pr_start = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_start)
	incf	(_pr_start),f
	line	352
	
l178:	
	return
	callstack 0
GLOBAL	__end_of_init_PIC
	__end_of_init_PIC:
	signat	_init_PIC,89
	global	_lcdPrint

;; *************** function _lcdPrint *****************
;; Defined at:
;;		line 402 in file "main.c"
;; Parameters:    Size  Location     Type
;;  str             2    4[BANK1 ] PTR unsigned char 
;;		 -> STR_19(17), STR_18(16), datoTastierino(17), STR_17(18), 
;;		 -> STR_15(16), STR_14(13), STR_13(15), STR_11(12), 
;;		 -> STR_10(13), STR_9(18), main@num_rand_s(16), PIC_ID(4), 
;;		 -> STR_7(17), STR_6(12), STR_5(10), STR_4(8), 
;;		 -> STR_3(14), STR_2(8), STR_1(11), 
;; Auto vars:     Size  Location     Type
;;  n               2    9[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_lcdSend
;; This function is called by:
;;		_main
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text5,local,class=CODE,delta=2,merge=1,group=0
	line	402
global __ptext5
__ptext5:	;psect for function _lcdPrint
psect	text5
	file	"main.c"
	line	402
	
_lcdPrint:	
;incstack = 0
	callstack 2
; Regs used in _lcdPrint: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	404
	
l3085:	
;main.c: 402: void lcdPrint(char *str);main.c: 403: {;main.c: 404:     int n = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdPrint@n)^080h
	clrf	(lcdPrint@n+1)^080h
	line	406
;main.c: 406:     while(str[n] != '\0')
	goto	l3091
	line	409
	
l3087:	
;main.c: 407:     {;main.c: 409:         lcdSend(str[n++], 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	incf	(lcdSend@tipo)^080h,f
	movf	(lcdPrint@n)^080h,w
	addwf	(lcdPrint@str)^080h,w
	movwf	(??_lcdPrint+1)^080h+0
	movf	(lcdPrint@str+1)^080h,w
	movwf	(??_lcdPrint+0)^080h+0
	skipnc
	incf	(??_lcdPrint+0)^080h+0,f
	btfss	(lcdPrint@n)^080h,7
	goto	u3150
	decf	(??_lcdPrint+0)^080h+0,f
u3150:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_lcdPrint+0)^080h+0,w
	movwf	0+((??_lcdPrint+1)^080h+0)+1
	movf	1+(??_lcdPrint+1)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(??_lcdPrint+1)^080h+0,w
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	stringtab
	fcall	_lcdSend
	
l3089:	
	movlw	01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcdPrint@n)^080h,f
	skipnc
	incf	(lcdPrint@n+1)^080h,f
	movlw	0
	addwf	(lcdPrint@n+1)^080h,f
	line	406
	
l3091:	
;main.c: 406:     while(str[n] != '\0')
	movf	(lcdPrint@n)^080h,w
	addwf	(lcdPrint@str)^080h,w
	movwf	(??_lcdPrint+1)^080h+0
	movf	(lcdPrint@str+1)^080h,w
	movwf	(??_lcdPrint+0)^080h+0
	skipnc
	incf	(??_lcdPrint+0)^080h+0,f
	btfss	(lcdPrint@n)^080h,7
	goto	u3160
	decf	(??_lcdPrint+0)^080h+0,f
u3160:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_lcdPrint+0)^080h+0,w
	movwf	0+((??_lcdPrint+1)^080h+0)+1
	movf	1+(??_lcdPrint+1)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(??_lcdPrint+1)^080h+0,w
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	stringtab
	xorlw	0
	skipz
	goto	u3171
	goto	u3170
u3171:
	goto	l3087
u3170:
	line	411
	
l193:	
	return
	callstack 0
GLOBAL	__end_of_lcdPrint
	__end_of_lcdPrint:
	signat	_lcdPrint,4217
	global	_init_Timer0

;; *************** function _init_Timer0 *****************
;; Defined at:
;;		line 354 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text6,local,class=CODE,delta=2,merge=1,group=0
	line	354
global __ptext6
__ptext6:	;psect for function _init_Timer0
psect	text6
	file	"main.c"
	line	354
	
_init_Timer0:	
;incstack = 0
	callstack 2
; Regs used in _init_Timer0: [wreg+status,2+status,0]
	line	357
	
l3187:	
;main.c: 357:     INTCON |= 0xA0;
	movlw	low(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_init_Timer0+0)^080h+0
	movf	(??_init_Timer0+0)^080h+0,w
	iorwf	(11),f	;volatile
	line	358
	
l3189:	
;main.c: 358:     OPTION_REG = 0x06;
	movlw	low(06h)
	movwf	(129)^080h	;volatile
	line	359
	
l3191:	
;main.c: 359:     TMR0 = 131;
	movlw	low(083h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	361
	
l3193:	
;main.c: 361:     milliseconds = 0;
	movlw	high highword(0)
	movwf	(_milliseconds+3)
	movlw	low highword(0)
	movwf	(_milliseconds+2)
	movlw	high(0)
	movwf	(_milliseconds+1)
	movlw	low(0)
	movwf	(_milliseconds)

	line	362
	
l181:	
	return
	callstack 0
GLOBAL	__end_of_init_Timer0
	__end_of_init_Timer0:
	signat	_init_Timer0,89
	global	_init_NumPad

;; *************** function _init_NumPad *****************
;; Defined at:
;;		line 618 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text7,local,class=CODE,delta=2,merge=1,group=0
	line	618
global __ptext7
__ptext7:	;psect for function _init_NumPad
psect	text7
	file	"main.c"
	line	618
	
_init_NumPad:	
;incstack = 0
	callstack 2
; Regs used in _init_NumPad: [wreg+status,2+status,0]
	line	621
	
l3185:	
;main.c: 621:     TRISD |= 0x0F;
	movlw	low(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_init_NumPad+0)^080h+0
	movf	(??_init_NumPad+0)^080h+0,w
	iorwf	(136)^080h,f	;volatile
	line	622
;main.c: 622:     TRISB &= 0xF0;
	movlw	low(0F0h)
	movwf	(??_init_NumPad+0)^080h+0
	movf	(??_init_NumPad+0)^080h+0,w
	andwf	(134)^080h,f	;volatile
	line	623
	
l268:	
	return
	callstack 0
GLOBAL	__end_of_init_NumPad
	__end_of_init_NumPad:
	signat	_init_NumPad,89
	global	_init_LCD

;; *************** function _init_LCD *****************
;; Defined at:
;;		line 364 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_lcdSend
;; This function is called by:
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text8,local,class=CODE,delta=2,merge=1,group=0
	line	364
global __ptext8
__ptext8:	;psect for function _init_LCD
psect	text8
	file	"main.c"
	line	364
	
_init_LCD:	
;incstack = 0
	callstack 1
; Regs used in _init_LCD: [wreg+status,2+status,0+pclath+cstack]
	line	368
	
l3163:	
;main.c: 368:     PORTEbits.RE2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(9),2	;volatile
	line	369
;main.c: 369:     PORTEbits.RE1 = 0;
	bcf	(9),1	;volatile
	line	370
	
l3165:	
;main.c: 370:     _delay((unsigned long)((20)*(20000000/4000.0)));
	asmopt push
asmopt off
movlw	130
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_init_LCD+0)^080h+0+1)
	movlw	221
movwf	((??_init_LCD+0)^080h+0)
	u4307:
decfsz	((??_init_LCD+0)^080h+0),f
	goto	u4307
	decfsz	((??_init_LCD+0)^080h+0+1),f
	goto	u4307
asmopt pop

	line	371
	
l3167:	
;main.c: 371:     PORTEbits.RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(9),1	;volatile
	line	373
	
l3169:	
;main.c: 373:     lcdSend(0x38, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(038h)
	fcall	_lcdSend
	line	374
	
l3171:	
;main.c: 374:     _delay((unsigned long)((5)*(20000000/4000.0)));
	asmopt push
asmopt off
movlw	33
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_init_LCD+0)^080h+0+1)
	movlw	117
movwf	((??_init_LCD+0)^080h+0)
	u4317:
decfsz	((??_init_LCD+0)^080h+0),f
	goto	u4317
	decfsz	((??_init_LCD+0)^080h+0+1),f
	goto	u4317
	nop2
asmopt pop

	line	375
;main.c: 375:     lcdSend(0x38, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(038h)
	fcall	_lcdSend
	line	376
	
l3173:	
;main.c: 376:     _delay((unsigned long)((1)*(20000000/4000.0)));
	asmopt push
asmopt off
movlw	7
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_init_LCD+0)^080h+0+1)
	movlw	124
movwf	((??_init_LCD+0)^080h+0)
	u4327:
decfsz	((??_init_LCD+0)^080h+0),f
	goto	u4327
	decfsz	((??_init_LCD+0)^080h+0+1),f
	goto	u4327
	nop
asmopt pop

	line	377
	
l3175:	
;main.c: 377:     lcdSend(0x38, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(038h)
	fcall	_lcdSend
	line	378
	
l3177:	
;main.c: 378:     lcdSend(0x08, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(08h)
	fcall	_lcdSend
	line	379
	
l3179:	
;main.c: 379:     lcdSend(0x0F, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0Fh)
	fcall	_lcdSend
	line	380
	
l3181:	
;main.c: 380:     lcdSend(0x01, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(01h)
	fcall	_lcdSend
	line	382
	
l3183:	
;main.c: 382:     lcdSend(0x0C, 0);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcdSend@tipo)^080h
	movlw	low(0Ch)
	fcall	_lcdSend
	line	383
	
l184:	
	return
	callstack 0
GLOBAL	__end_of_init_LCD
	__end_of_init_LCD:
	signat	_init_LCD,89
	global	_lcdSend

;; *************** function _lcdSend *****************
;; Defined at:
;;		line 385 in file "main.c"
;; Parameters:    Size  Location     Type
;;  dato            1    wreg     unsigned char 
;;  tipo            1    0[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dato            1    3[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_init_PIC
;;		_init_LCD
;;		_lcdPrint
;; This function uses a non-reentrant model
;;
psect	text9,local,class=CODE,delta=2,merge=1,group=0
	line	385
global __ptext9
__ptext9:	;psect for function _lcdSend
psect	text9
	file	"main.c"
	line	385
	
_lcdSend:	
;incstack = 0
	callstack 3
; Regs used in _lcdSend: [wreg+status,2+status,0]
;lcdSend@dato stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcdSend@dato)^080h
	line	389
	
l2955:	
;main.c: 385: void lcdSend(char dato, char tipo);main.c: 386: {;main.c: 389:     TRISD = 0x00;
	clrf	(136)^080h	;volatile
	line	390
	
l2957:	
;main.c: 390:     TRISEbits.TRISE1 = 0;
	bcf	(137)^080h,1	;volatile
	line	391
	
l2959:	
;main.c: 391:     TRISEbits.TRISE2 = 0;
	bcf	(137)^080h,2	;volatile
	line	393
	
l2961:	
;main.c: 393:     PORTEbits.RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(9),1	;volatile
	line	394
	
l2963:	
;main.c: 394:     PORTD = dato;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcdSend@dato)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	395
	
l2965:	
;main.c: 395:     PORTEbits.RE2 = tipo;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	rrf	(lcdSend@tipo)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	skipc
	bcf	(9),2	;volatile
	skipnc
	bsf	(9),2	;volatile
	line	396
	
l2967:	
;main.c: 396:     _delay((unsigned long)((3)*(20000000/4000.0)));
	asmopt push
asmopt off
movlw	20
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_lcdSend+0)^080h+0+1)
	movlw	121
movwf	((??_lcdSend+0)^080h+0)
	u4337:
decfsz	((??_lcdSend+0)^080h+0),f
	goto	u4337
	decfsz	((??_lcdSend+0)^080h+0+1),f
	goto	u4337
asmopt pop

	line	397
	
l2969:	
;main.c: 397:     PORTEbits.RE1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(9),1	;volatile
	line	398
	
l2971:	
;main.c: 398:     _delay((unsigned long)((3)*(20000000/4000.0)));
	asmopt push
asmopt off
movlw	20
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
movwf	((??_lcdSend+0)^080h+0+1)
	movlw	121
movwf	((??_lcdSend+0)^080h+0)
	u4347:
decfsz	((??_lcdSend+0)^080h+0),f
	goto	u4347
	decfsz	((??_lcdSend+0)^080h+0+1),f
	goto	u4347
asmopt pop

	line	399
	
l2973:	
;main.c: 399:     PORTEbits.RE1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(9),1	;volatile
	line	400
	
l187:	
	return
	callstack 0
GLOBAL	__end_of_lcdSend
	__end_of_lcdSend:
	signat	_lcdSend,8313
	global	_eeprom_read

;; *************** function _eeprom_read *****************
;; Defined at:
;;		line 6 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    1[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text10,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c"
	line	6
global __ptext10
__ptext10:	;psect for function _eeprom_read
psect	text10
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c"
	line	6
	
_eeprom_read:	
;incstack = 0
	callstack 2
; Regs used in _eeprom_read: [wreg+status,2+status,0]
;eeprom_read@addr stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(eeprom_read@addr)^080h
	line	8
;C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c: 6: eeprom_read(unsigned char addr);C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c: 7: {;C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c: 8:  do
	
l421:	
	line	9
# 9 "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c"
clrwdt ;# 
psect	text10
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(396)^0180h,1	;volsfr
	goto	u3271
	goto	u3270
u3271:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	goto	l421
u3270:
	line	18
	
l3195:	
;C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\pic\__eeread.c: 18:  return ( EEADR = addr, EECON1 &= 0x3F, EECON1bits.RD = 1, EEDATA);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(eeprom_read@addr)^080h,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	movlw	low(03Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_eeprom_read+0)^080h+0
	movf	(??_eeprom_read+0)^080h+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volsfr
	bsf	(396)^0180h,0	;volsfr
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	line	19
	
l423:	
	return
	callstack 0
GLOBAL	__end_of_eeprom_read
	__end_of_eeprom_read:
	signat	_eeprom_read,4217
	global	_UART_init

;; *************** function _UART_init *****************
;; Defined at:
;;		line 758 in file "main.c"
;; Parameters:    Size  Location     Type
;;  baudrate        4   57[BANK1 ] long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___aldiv
;; This function is called by:
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text11,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	758
global __ptext11
__ptext11:	;psect for function _UART_init
psect	text11
	file	"main.c"
	line	758
	
_UART_init:	
;incstack = 0
	callstack 1
; Regs used in _UART_init: [wreg+status,2+status,0+pclath+cstack]
	line	761
	
l3147:	
;main.c: 758: void UART_init(long int baudrate);main.c: 759: {;main.c: 761:     TRISC &= ~0x40;
	movlw	low(0BFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_UART_init+0)^080h+0
	movf	(??_UART_init+0)^080h+0,w
	andwf	(135)^080h,f	;volatile
	line	762
	
l3149:	
;main.c: 762:     TRISC |= 0x80;
	bsf	(135)^080h+(7/8),(7)&7	;volatile
	line	763
;main.c: 763:     TXSTA |= 0x24;
	movlw	low(024h)
	movwf	(??_UART_init+0)^080h+0
	movf	(??_UART_init+0)^080h+0,w
	iorwf	(152)^080h,f	;volatile
	line	764
	
l3151:	
;main.c: 764:     RCSTA |= 0x80;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(24)+(7/8),(7)&7	;volatile
	line	765
	
l3153:	
;main.c: 765:     RCSTA |= 0x10;
	bsf	(24)+(4/8),(4)&7	;volatile
	line	768
	
l3155:	
;main.c: 768:     SPBRG = (char) (20000000 / (long) (64UL * baudrate)) - 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(UART_init@baudrate)^080h,w
	movwf	(??_UART_init+0)^080h+0
	movf	(UART_init@baudrate+1)^080h,w
	movwf	((??_UART_init+0)^080h+0+1)
	movf	(UART_init@baudrate+2)^080h,w
	movwf	((??_UART_init+0)^080h+0+2)
	movf	(UART_init@baudrate+3)^080h,w
	movwf	((??_UART_init+0)^080h+0+3)
	movlw	06h
u3265:
	clrc
	rlf	(??_UART_init+0)^080h+0,f
	rlf	(??_UART_init+0)^080h+1,f
	rlf	(??_UART_init+0)^080h+2,f
	rlf	(??_UART_init+0)^080h+3,f
u3260:
	addlw	-1
	skipz
	goto	u3265
	movf	3+(??_UART_init+0)^080h+0,w
	movwf	(___aldiv@divisor+3)^080h
	movf	2+(??_UART_init+0)^080h+0,w
	movwf	(___aldiv@divisor+2)^080h
	movf	1+(??_UART_init+0)^080h+0,w
	movwf	(___aldiv@divisor+1)^080h
	movf	0+(??_UART_init+0)^080h+0,w
	movwf	(___aldiv@divisor)^080h

	movlw	01h
	movwf	(___aldiv@dividend+3)^080h
	movlw	031h
	movwf	(___aldiv@dividend+2)^080h
	movlw	02Dh
	movwf	(___aldiv@dividend+1)^080h
	movlw	0
	movwf	(___aldiv@dividend)^080h

	fcall	___aldiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___aldiv))^080h,w
	addlw	0FFh
	movwf	(153)^080h	;volatile
	line	771
	
l3157:	
;main.c: 771:     INTCON |= 0x80;
	bsf	(11)+(7/8),(7)&7	;volatile
	line	773
	
l3159:	
;main.c: 773:     INTCON |= 0x40;
	bsf	(11)+(6/8),(6)&7	;volatile
	line	775
	
l3161:	
;main.c: 775:     PIE1 |= 0x20;
	bsf	(140)^080h+(5/8),(5)&7	;volatile
	line	776
	
l305:	
	return
	callstack 0
GLOBAL	__end_of_UART_init
	__end_of_UART_init:
	signat	_UART_init,4217
	global	_Fill

;; *************** function _Fill *****************
;; Defined at:
;;		line 591 in file "main.c"
;; Parameters:    Size  Location     Type
;;  id              1    wreg     PTR unsigned char 
;;		 -> PIC_ID(4), 
;; Auto vars:     Size  Location     Type
;;  id              1   10[BANK1 ] PTR unsigned char 
;;		 -> PIC_ID(4), 
;;  length          2    8[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_Length
;; This function is called by:
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text12,local,class=CODE,delta=2,merge=1,group=0
	line	591
global __ptext12
__ptext12:	;psect for function _Fill
psect	text12
	file	"main.c"
	line	591
	
_Fill:	
;incstack = 0
	callstack 1
; Regs used in _Fill: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;Fill@id stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(Fill@id)^080h
	line	593
	
l3199:	
;main.c: 591: void Fill(char* id);main.c: 592: {;main.c: 593:     int length = Length(id);
	movf	(Fill@id)^080h,w
	movwf	(Length@str)^080h
	movlw	(0x0)
	movwf	(Length@str+1)^080h
	fcall	_Length
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_Length))^080h,w
	movwf	(Fill@length+1)^080h
	movf	(0+(?_Length))^080h,w
	movwf	(Fill@length)^080h
	line	595
	
l3201:	
;main.c: 595:     if(length < 3)
	movf	(Fill@length+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(0)^80h
	subwf	btemp+1,w
	skipz
	goto	u3285
	movlw	03h
	subwf	(Fill@length)^080h,w
u3285:

	skipnc
	goto	u3281
	goto	u3280
u3281:
	goto	l265
u3280:
	goto	l3219
	line	600
	
l3205:	
;main.c: 600:                 id[3] = '\0';
	movf	(Fill@id)^080h,w
	addlw	03h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	601
;main.c: 601:                 id[2] = id[0];
	movf	(Fill@id)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_Fill+0)^080h+0
	movf	(Fill@id)^080h,w
	addlw	02h
	movwf	fsr0
	movf	(??_Fill+0)^080h+0,w
	movwf	indf
	line	602
	
l3207:	
;main.c: 602:                 id[1] = '0';
	incf	(Fill@id)^080h,w
	movwf	fsr0
	movlw	low(030h)
	movwf	indf
	line	603
	
l3209:	
;main.c: 603:                 id[0] = '0';
	movf	(Fill@id)^080h,w
	movwf	fsr0
	movlw	low(030h)
	movwf	indf
	line	604
;main.c: 604:                 break;
	goto	l265
	line	606
	
l3211:	
;main.c: 606:                 id[3] = '\0';
	movf	(Fill@id)^080h,w
	addlw	03h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	line	607
;main.c: 607:                 id[2] = id[1];
	incf	(Fill@id)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_Fill+0)^080h+0
	movf	(Fill@id)^080h,w
	addlw	02h
	movwf	fsr0
	movf	(??_Fill+0)^080h+0,w
	movwf	indf
	line	608
	
l3213:	
;main.c: 608:                 id[1] = id[0];
	movf	(Fill@id)^080h,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_Fill+0)^080h+0
	incf	(Fill@id)^080h,w
	movwf	fsr0
	movf	(??_Fill+0)^080h+0,w
	movwf	indf
	goto	l3209
	line	614
	
l3219:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf (Fill@length+1)^080h,w
	asmopt push
	asmopt off
	xorlw	0^0	; case 0
	skipnz
	goto	l4115
	goto	l265
	asmopt pop
	
l4115:	
; Switch size 1, requested type "simple"
; Number of cases is 2, Range of values is 1 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           17    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (Fill@length)^080h,w
	asmopt push
	asmopt off
	xorlw	1^0	; case 1
	skipnz
	goto	l3205
	xorlw	2^1	; case 2
	skipnz
	goto	l3211
	goto	l265
	asmopt pop

	line	616
	
l265:	
	return
	callstack 0
GLOBAL	__end_of_Fill
	__end_of_Fill:
	signat	_Fill,4217
	global	_ConvertToString

;; *************** function _ConvertToString *****************
;; Defined at:
;;		line 424 in file "main.c"
;; Parameters:    Size  Location     Type
;;  n               4   57[BANK1 ] long 
;;  str             2   61[BANK1 ] PTR unsigned char 
;;		 -> main@num_rand_s(16), PIC_ID(4), 
;; Auto vars:     Size  Location     Type
;;  temp            2    0[BANK3 ] int 
;;  i               2    4[BANK3 ] int 
;;  j               2    2[BANK3 ] int 
;;  n_cifre         1    6[BANK3 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       6       0       0
;;      Locals:         0       0       0       7       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       9       7       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		___aldiv
;;		___almod
;;		___lmul
;;		_pow
;; This function is called by:
;;		_main
;;		_init_PIC
;; This function uses a non-reentrant model
;;
psect	text13,local,class=CODE,delta=2,merge=1,group=0
	line	424
global __ptext13
__ptext13:	;psect for function _ConvertToString
psect	text13
	file	"main.c"
	line	424
	
_ConvertToString:	
;incstack = 0
	callstack 0
; Regs used in _ConvertToString: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	428
	
l3801:	
;main.c: 424: void ConvertToString(long n, char* str);main.c: 425: {;main.c: 428:     int i = 0, j = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(ConvertToString@i)^0180h
	clrf	(ConvertToString@i+1)^0180h
	clrf	(ConvertToString@j)^0180h
	clrf	(ConvertToString@j+1)^0180h
	line	429
	
l3803:	
;main.c: 429:     if(n < 0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(ConvertToString@n+3)^080h,7
	goto	u4011
	goto	u4010
u4011:
	goto	l3811
u4010:
	line	431
	
l3805:	
;main.c: 430:     {;main.c: 431:         i = 1;
	movlw	01h
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(ConvertToString@i)^0180h
	movlw	0
	movwf	((ConvertToString@i)^0180h)+1
	line	432
	
l3807:	
;main.c: 432:         str[0] = '-';
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(ConvertToString@str)^080h,w
	movwf	fsr0
	bsf	status,7
	btfss	(ConvertToString@str+1)^080h,0
	bcf	status,7
	movlw	low(02Dh)
	movwf	indf
	line	433
	
l3809:	
;main.c: 433:         n *= -1;
	movlw	0FFh
	movwf	(___lmul@multiplier+3)^080h
	movlw	0FFh
	movwf	(___lmul@multiplier+2)^080h
	movlw	0FFh
	movwf	(___lmul@multiplier+1)^080h
	movlw	0FFh
	movwf	(___lmul@multiplier)^080h

	movf	(ConvertToString@n+3)^080h,w
	movwf	(___lmul@multiplicand+3)^080h
	movf	(ConvertToString@n+2)^080h,w
	movwf	(___lmul@multiplicand+2)^080h
	movf	(ConvertToString@n+1)^080h,w
	movwf	(___lmul@multiplicand+1)^080h
	movf	(ConvertToString@n)^080h,w
	movwf	(___lmul@multiplicand)^080h

	fcall	___lmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(3+(?___lmul))^080h,w
	movwf	(ConvertToString@n+3)^080h
	movf	(2+(?___lmul))^080h,w
	movwf	(ConvertToString@n+2)^080h
	movf	(1+(?___lmul))^080h,w
	movwf	(ConvertToString@n+1)^080h
	movf	(0+(?___lmul))^080h,w
	movwf	(ConvertToString@n)^080h

	line	436
	
l3811:	
;main.c: 436:     char n_cifre = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(ConvertToString@n_cifre)^0180h
	incf	(ConvertToString@n_cifre)^0180h,f
	line	438
;main.c: 438:     while(n / pow(10, n_cifre))
	goto	l3815
	line	439
	
l3813:	
;main.c: 439:         n_cifre++;
	movlw	low(01h)
	movwf	(??_ConvertToString+0)^080h+0
	movf	(??_ConvertToString+0)^080h+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	addwf	(ConvertToString@n_cifre)^0180h,f
	line	438
	
l3815:	
;main.c: 438:     while(n / pow(10, n_cifre))
	movf	(ConvertToString@n_cifre)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(pow@exp)^080h
	movlw	low(0Ah)
	fcall	_pow
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?_pow))^080h,w
	movwf	(___aldiv@divisor)^080h
	movf	(1+(?_pow))^080h,w
	movwf	(___aldiv@divisor+1)^080h
	movlw	0
	btfsc	(___aldiv@divisor+1)^080h,7
	movlw	255
	movwf	(___aldiv@divisor+2)^080h
	movwf	(___aldiv@divisor+3)^080h
	movf	(ConvertToString@n+3)^080h,w
	movwf	(___aldiv@dividend+3)^080h
	movf	(ConvertToString@n+2)^080h,w
	movwf	(___aldiv@dividend+2)^080h
	movf	(ConvertToString@n+1)^080h,w
	movwf	(___aldiv@dividend+1)^080h
	movf	(ConvertToString@n)^080h,w
	movwf	(___aldiv@dividend)^080h

	fcall	___aldiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(3+(?___aldiv))^080h,w
	iorwf	(2+(?___aldiv))^080h,w
	iorwf	(1+(?___aldiv))^080h,w
	iorwf	(0+(?___aldiv))^080h,w
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l3813
u4020:
	goto	l3827
	line	443
	
l3817:	
;main.c: 442:     {;main.c: 443:         int temp = pow(10, (char)(n_cifre - 1 - j));
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@j)^0180h,w
	subwf	(ConvertToString@n_cifre)^0180h,w
	addlw	0FFh
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(pow@exp)^080h
	movlw	low(0Ah)
	fcall	_pow
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_pow))^080h,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(ConvertToString@temp+1)^0180h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?_pow))^080h,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(ConvertToString@temp)^0180h
	line	445
	
l3819:	
;main.c: 445:         str[i] = (char)(n/temp) + '0';
	movf	(ConvertToString@i)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(ConvertToString@str)^080h,w
	movwf	(??_ConvertToString+1)^080h+0
	movf	(ConvertToString@str+1)^080h,w
	movwf	(??_ConvertToString+0)^080h+0
	skipnc
	incf	(??_ConvertToString+0)^080h+0,f
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(ConvertToString@i)^0180h,7
	goto	u4030
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	decf	(??_ConvertToString+0)^080h+0,f
u4030:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_ConvertToString+0)^080h+0,w
	movwf	0+((??_ConvertToString+1)^080h+0)+1
	movf	0+(??_ConvertToString+1)^080h+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_ConvertToString+1)^080h+0,0
	bcf	status,7
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@temp)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___aldiv@divisor)^080h
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@temp+1)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___aldiv@divisor+1)^080h
	movlw	0
	btfsc	(___aldiv@divisor+1)^080h,7
	movlw	255
	movwf	(___aldiv@divisor+2)^080h
	movwf	(___aldiv@divisor+3)^080h
	movf	(ConvertToString@n+3)^080h,w
	movwf	(___aldiv@dividend+3)^080h
	movf	(ConvertToString@n+2)^080h,w
	movwf	(___aldiv@dividend+2)^080h
	movf	(ConvertToString@n+1)^080h,w
	movwf	(___aldiv@dividend+1)^080h
	movf	(ConvertToString@n)^080h,w
	movwf	(___aldiv@dividend)^080h

	fcall	___aldiv
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___aldiv))^080h,w
	addlw	030h
	movwf	indf
	line	447
	
l3821:	
;main.c: 447:         n = n % temp;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@temp)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___almod@divisor)^080h
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@temp+1)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___almod@divisor+1)^080h
	movlw	0
	btfsc	(___almod@divisor+1)^080h,7
	movlw	255
	movwf	(___almod@divisor+2)^080h
	movwf	(___almod@divisor+3)^080h
	movf	(ConvertToString@n+3)^080h,w
	movwf	(___almod@dividend+3)^080h
	movf	(ConvertToString@n+2)^080h,w
	movwf	(___almod@dividend+2)^080h
	movf	(ConvertToString@n+1)^080h,w
	movwf	(___almod@dividend+1)^080h
	movf	(ConvertToString@n)^080h,w
	movwf	(___almod@dividend)^080h

	fcall	___almod
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(3+(?___almod))^080h,w
	movwf	(ConvertToString@n+3)^080h
	movf	(2+(?___almod))^080h,w
	movwf	(ConvertToString@n+2)^080h
	movf	(1+(?___almod))^080h,w
	movwf	(ConvertToString@n+1)^080h
	movf	(0+(?___almod))^080h,w
	movwf	(ConvertToString@n)^080h

	line	448
	
l3823:	
;main.c: 448:         i++;
	movlw	01h
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	addwf	(ConvertToString@i)^0180h,f
	skipnc
	incf	(ConvertToString@i+1)^0180h,f
	movlw	0
	addwf	(ConvertToString@i+1)^0180h,f
	line	449
	
l3825:	
;main.c: 449:         j++;
	movlw	01h
	addwf	(ConvertToString@j)^0180h,f
	skipnc
	incf	(ConvertToString@j+1)^0180h,f
	movlw	0
	addwf	(ConvertToString@j+1)^0180h,f
	line	441
	
l3827:	
;main.c: 441:     while(j < n_cifre)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@j+1)^0180h,w
	xorlw	80h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_ConvertToString+0)^080h+0
	movlw	80h
	subwf	(??_ConvertToString+0)^080h+0,w
	skipz
	goto	u4045
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@n_cifre)^0180h,w
	subwf	(ConvertToString@j)^0180h,w
u4045:

	skipc
	goto	u4041
	goto	u4040
u4041:
	goto	l3817
u4040:
	line	452
	
l3829:	
;main.c: 452:     str[i] = '\0';
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(ConvertToString@i)^0180h,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(ConvertToString@str)^080h,w
	movwf	(??_ConvertToString+1)^080h+0
	movf	(ConvertToString@str+1)^080h,w
	movwf	(??_ConvertToString+0)^080h+0
	skipnc
	incf	(??_ConvertToString+0)^080h+0,f
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfss	(ConvertToString@i)^0180h,7
	goto	u4050
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	decf	(??_ConvertToString+0)^080h+0,f
u4050:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_ConvertToString+0)^080h+0,w
	movwf	0+((??_ConvertToString+1)^080h+0)+1
	movf	0+(??_ConvertToString+1)^080h+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_ConvertToString+1)^080h+0,0
	bcf	status,7
	clrf	indf
	line	453
	
l209:	
	return
	callstack 0
GLOBAL	__end_of_ConvertToString
	__end_of_ConvertToString:
	signat	_ConvertToString,8313
	global	_pow

;; *************** function _pow *****************
;; Defined at:
;;		line 413 in file "main.c"
;; Parameters:    Size  Location     Type
;;  b               1    wreg     unsigned char 
;;  exp             1   33[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  b               1   37[BANK1 ] unsigned char 
;;  i               2   38[BANK1 ] int 
;;  n               2   40[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  2   33[BANK1 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       5       0       0
;;      Temps:          0       0       2       0       0
;;      Totals:         0       0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___wmul
;; This function is called by:
;;		_ConvertToString
;; This function uses a non-reentrant model
;;
psect	text14,local,class=CODE,delta=2,merge=1,group=0
	line	413
global __ptext14
__ptext14:	;psect for function _pow
psect	text14
	file	"main.c"
	line	413
	
_pow:	
;incstack = 0
	callstack 0
; Regs used in _pow: [wreg+status,2+status,0+pclath+cstack]
;pow@b stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(pow@b)^080h
	line	415
	
l2975:	
;main.c: 413: int pow(char b, char exp);main.c: 414: {;main.c: 415:     int n = 1;
	movlw	01h
	movwf	(pow@n)^080h
	movlw	0
	movwf	((pow@n)^080h)+1
	line	416
	
l2977:	
;main.c: 416:     for(int i = 0; i < exp; i++)
	clrf	(pow@i)^080h
	clrf	(pow@i+1)^080h
	goto	l2983
	line	418
	
l2979:	
;main.c: 417:     {;main.c: 418:         n *= b;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(pow@b)^080h,w
	movwf	(??_pow+0)^080h+0
	clrf	(??_pow+0)^080h+0+1
	movf	0+(??_pow+0)^080h+0,w
	movwf	(___wmul@multiplier)^080h
	movf	1+(??_pow+0)^080h+0,w
	movwf	(___wmul@multiplier+1)^080h
	movf	(pow@n+1)^080h,w
	movwf	(___wmul@multiplicand+1)^080h
	movf	(pow@n)^080h,w
	movwf	(___wmul@multiplicand)^080h
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	movwf	(pow@n+1)^080h
	movf	(0+(?___wmul))^080h,w
	movwf	(pow@n)^080h
	line	419
	
l2981:	
;main.c: 419:     }
	movlw	01h
	addwf	(pow@i)^080h,f
	skipnc
	incf	(pow@i+1)^080h,f
	movlw	0
	addwf	(pow@i+1)^080h,f
	
l2983:	
	movf	(pow@i+1)^080h,w
	xorlw	80h
	movwf	(??_pow+0)^080h+0
	movlw	80h
	subwf	(??_pow+0)^080h+0,w
	skipz
	goto	u2885
	movf	(pow@exp)^080h,w
	subwf	(pow@i)^080h,w
u2885:

	skipc
	goto	u2881
	goto	u2880
u2881:
	goto	l2979
u2880:
	line	420
	
l2985:	
;main.c: 420:     return n;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(pow@n+1)^080h,w
	movwf	(?_pow+1)^080h
	movf	(pow@n)^080h,w
	movwf	(?_pow)^080h
	line	421
	
l199:	
	return
	callstack 0
GLOBAL	__end_of_pow
	__end_of_pow:
	signat	_pow,8314
	global	___almod

;; *************** function ___almod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\almod.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK1 ] long 
;;  dividend        4    4[BANK1 ] long 
;; Auto vars:     Size  Location     Type
;;  sign            1   10[BANK1 ] unsigned char 
;;  counter         1    9[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK1 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       8       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0      11       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ConvertToString
;; This function uses a non-reentrant model
;;
psect	text15,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\almod.c"
	line	5
global __ptext15
__ptext15:	;psect for function ___almod
psect	text15
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\almod.c"
	line	5
	
___almod:	
;incstack = 0
	callstack 1
; Regs used in ___almod: [wreg+status,2+status,0]
	line	12
	
l3053:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___almod@sign)^080h
	line	13
	
l3055:	
	btfss	(___almod@dividend+3)^080h,7
	goto	u3061
	goto	u3060
u3061:
	goto	l529
u3060:
	line	14
	
l3057:	
	comf	(___almod@dividend)^080h,f
	comf	(___almod@dividend+1)^080h,f
	comf	(___almod@dividend+2)^080h,f
	comf	(___almod@dividend+3)^080h,f
	incf	(___almod@dividend)^080h,f
	skipnz
	incf	(___almod@dividend+1)^080h,f
	skipnz
	incf	(___almod@dividend+2)^080h,f
	skipnz
	incf	(___almod@dividend+3)^080h,f
	line	15
	clrf	(___almod@sign)^080h
	incf	(___almod@sign)^080h,f
	line	16
	
l529:	
	line	17
	btfss	(___almod@divisor+3)^080h,7
	goto	u3071
	goto	u3070
u3071:
	goto	l3061
u3070:
	line	18
	
l3059:	
	comf	(___almod@divisor)^080h,f
	comf	(___almod@divisor+1)^080h,f
	comf	(___almod@divisor+2)^080h,f
	comf	(___almod@divisor+3)^080h,f
	incf	(___almod@divisor)^080h,f
	skipnz
	incf	(___almod@divisor+1)^080h,f
	skipnz
	incf	(___almod@divisor+2)^080h,f
	skipnz
	incf	(___almod@divisor+3)^080h,f
	line	19
	
l3061:	
	movf	(___almod@divisor+3)^080h,w
	iorwf	(___almod@divisor+2)^080h,w
	iorwf	(___almod@divisor+1)^080h,w
	iorwf	(___almod@divisor)^080h,w
	skipnz
	goto	u3081
	goto	u3080
u3081:
	goto	l3077
u3080:
	line	20
	
l3063:	
	clrf	(___almod@counter)^080h
	incf	(___almod@counter)^080h,f
	line	21
	goto	l3067
	line	22
	
l3065:	
	movlw	01h
	movwf	(??___almod+0)^080h+0
u3095:
	clrc
	rlf	(___almod@divisor)^080h,f
	rlf	(___almod@divisor+1)^080h,f
	rlf	(___almod@divisor+2)^080h,f
	rlf	(___almod@divisor+3)^080h,f
	decfsz	(??___almod+0)^080h+0
	goto	u3095
	line	23
	movlw	low(01h)
	movwf	(??___almod+0)^080h+0
	movf	(??___almod+0)^080h+0,w
	addwf	(___almod@counter)^080h,f
	line	21
	
l3067:	
	btfss	(___almod@divisor+3)^080h,(31)&7
	goto	u3101
	goto	u3100
u3101:
	goto	l3065
u3100:
	line	26
	
l3069:	
	movf	(___almod@divisor+3)^080h,w
	subwf	(___almod@dividend+3)^080h,w
	skipz
	goto	u3115
	movf	(___almod@divisor+2)^080h,w
	subwf	(___almod@dividend+2)^080h,w
	skipz
	goto	u3115
	movf	(___almod@divisor+1)^080h,w
	subwf	(___almod@dividend+1)^080h,w
	skipz
	goto	u3115
	movf	(___almod@divisor)^080h,w
	subwf	(___almod@dividend)^080h,w
u3115:
	skipc
	goto	u3111
	goto	u3110
u3111:
	goto	l3073
u3110:
	line	27
	
l3071:	
	movf	(___almod@divisor)^080h,w
	subwf	(___almod@dividend)^080h,f
	movf	(___almod@divisor+1)^080h,w
	skipc
	incfsz	(___almod@divisor+1)^080h,w
	subwf	(___almod@dividend+1)^080h,f
	movf	(___almod@divisor+2)^080h,w
	skipc
	incfsz	(___almod@divisor+2)^080h,w
	subwf	(___almod@dividend+2)^080h,f
	movf	(___almod@divisor+3)^080h,w
	skipc
	incfsz	(___almod@divisor+3)^080h,w
	subwf	(___almod@dividend+3)^080h,f
	line	28
	
l3073:	
	movlw	01h
u3125:
	clrc
	rrf	(___almod@divisor+3)^080h,f
	rrf	(___almod@divisor+2)^080h,f
	rrf	(___almod@divisor+1)^080h,f
	rrf	(___almod@divisor)^080h,f
	addlw	-1
	skipz
	goto	u3125

	line	29
	
l3075:	
	movlw	01h
	subwf	(___almod@counter)^080h,f
	btfss	status,2
	goto	u3131
	goto	u3130
u3131:
	goto	l3069
u3130:
	line	31
	
l3077:	
	movf	((___almod@sign)^080h),w
	btfsc	status,2
	goto	u3141
	goto	u3140
u3141:
	goto	l3081
u3140:
	line	32
	
l3079:	
	comf	(___almod@dividend)^080h,f
	comf	(___almod@dividend+1)^080h,f
	comf	(___almod@dividend+2)^080h,f
	comf	(___almod@dividend+3)^080h,f
	incf	(___almod@dividend)^080h,f
	skipnz
	incf	(___almod@dividend+1)^080h,f
	skipnz
	incf	(___almod@dividend+2)^080h,f
	skipnz
	incf	(___almod@dividend+3)^080h,f
	line	33
	
l3081:	
	movf	(___almod@dividend+3)^080h,w
	movwf	(?___almod+3)^080h
	movf	(___almod@dividend+2)^080h,w
	movwf	(?___almod+2)^080h
	movf	(___almod@dividend+1)^080h,w
	movwf	(?___almod+1)^080h
	movf	(___almod@dividend)^080h,w
	movwf	(?___almod)^080h

	line	34
	
l539:	
	return
	callstack 0
GLOBAL	__end_of___almod
	__end_of___almod:
	signat	___almod,8316
	global	___aldiv

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4   42[BANK1 ] long 
;;  dividend        4   46[BANK1 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   53[BANK1 ] long 
;;  sign            1   52[BANK1 ] unsigned char 
;;  counter         1   51[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   42[BANK1 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       8       0       0
;;      Locals:         0       0       6       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0      15       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ConvertToString
;;		_UART_init
;; This function uses a non-reentrant model
;;
psect	text16,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\aldiv.c"
	line	5
global __ptext16
__ptext16:	;psect for function ___aldiv
psect	text16
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\aldiv.c"
	line	5
	
___aldiv:	
;incstack = 0
	callstack 1
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	13
	
l3013:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___aldiv@sign)^080h
	line	14
	
l3015:	
	btfss	(___aldiv@divisor+3)^080h,7
	goto	u2961
	goto	u2960
u2961:
	goto	l516
u2960:
	line	15
	
l3017:	
	comf	(___aldiv@divisor)^080h,f
	comf	(___aldiv@divisor+1)^080h,f
	comf	(___aldiv@divisor+2)^080h,f
	comf	(___aldiv@divisor+3)^080h,f
	incf	(___aldiv@divisor)^080h,f
	skipnz
	incf	(___aldiv@divisor+1)^080h,f
	skipnz
	incf	(___aldiv@divisor+2)^080h,f
	skipnz
	incf	(___aldiv@divisor+3)^080h,f
	line	16
	clrf	(___aldiv@sign)^080h
	incf	(___aldiv@sign)^080h,f
	line	17
	
l516:	
	line	18
	btfss	(___aldiv@dividend+3)^080h,7
	goto	u2971
	goto	u2970
u2971:
	goto	l3023
u2970:
	line	19
	
l3019:	
	comf	(___aldiv@dividend)^080h,f
	comf	(___aldiv@dividend+1)^080h,f
	comf	(___aldiv@dividend+2)^080h,f
	comf	(___aldiv@dividend+3)^080h,f
	incf	(___aldiv@dividend)^080h,f
	skipnz
	incf	(___aldiv@dividend+1)^080h,f
	skipnz
	incf	(___aldiv@dividend+2)^080h,f
	skipnz
	incf	(___aldiv@dividend+3)^080h,f
	line	20
	
l3021:	
	movlw	low(01h)
	movwf	(??___aldiv+0)^080h+0
	movf	(??___aldiv+0)^080h+0,w
	xorwf	(___aldiv@sign)^080h,f
	line	22
	
l3023:	
	movlw	high highword(0)
	movwf	(___aldiv@quotient+3)^080h
	movlw	low highword(0)
	movwf	(___aldiv@quotient+2)^080h
	movlw	high(0)
	movwf	(___aldiv@quotient+1)^080h
	movlw	low(0)
	movwf	(___aldiv@quotient)^080h

	line	23
	
l3025:	
	movf	(___aldiv@divisor+3)^080h,w
	iorwf	(___aldiv@divisor+2)^080h,w
	iorwf	(___aldiv@divisor+1)^080h,w
	iorwf	(___aldiv@divisor)^080h,w
	skipnz
	goto	u2981
	goto	u2980
u2981:
	goto	l3045
u2980:
	line	24
	
l3027:	
	clrf	(___aldiv@counter)^080h
	incf	(___aldiv@counter)^080h,f
	line	25
	goto	l3031
	line	26
	
l3029:	
	movlw	01h
	movwf	(??___aldiv+0)^080h+0
u2995:
	clrc
	rlf	(___aldiv@divisor)^080h,f
	rlf	(___aldiv@divisor+1)^080h,f
	rlf	(___aldiv@divisor+2)^080h,f
	rlf	(___aldiv@divisor+3)^080h,f
	decfsz	(??___aldiv+0)^080h+0
	goto	u2995
	line	27
	movlw	low(01h)
	movwf	(??___aldiv+0)^080h+0
	movf	(??___aldiv+0)^080h+0,w
	addwf	(___aldiv@counter)^080h,f
	line	25
	
l3031:	
	btfss	(___aldiv@divisor+3)^080h,(31)&7
	goto	u3001
	goto	u3000
u3001:
	goto	l3029
u3000:
	line	30
	
l3033:	
	movlw	01h
	movwf	(??___aldiv+0)^080h+0
u3015:
	clrc
	rlf	(___aldiv@quotient)^080h,f
	rlf	(___aldiv@quotient+1)^080h,f
	rlf	(___aldiv@quotient+2)^080h,f
	rlf	(___aldiv@quotient+3)^080h,f
	decfsz	(??___aldiv+0)^080h+0
	goto	u3015
	line	31
	
l3035:	
	movf	(___aldiv@divisor+3)^080h,w
	subwf	(___aldiv@dividend+3)^080h,w
	skipz
	goto	u3025
	movf	(___aldiv@divisor+2)^080h,w
	subwf	(___aldiv@dividend+2)^080h,w
	skipz
	goto	u3025
	movf	(___aldiv@divisor+1)^080h,w
	subwf	(___aldiv@dividend+1)^080h,w
	skipz
	goto	u3025
	movf	(___aldiv@divisor)^080h,w
	subwf	(___aldiv@dividend)^080h,w
u3025:
	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l3041
u3020:
	line	32
	
l3037:	
	movf	(___aldiv@divisor)^080h,w
	subwf	(___aldiv@dividend)^080h,f
	movf	(___aldiv@divisor+1)^080h,w
	skipc
	incfsz	(___aldiv@divisor+1)^080h,w
	subwf	(___aldiv@dividend+1)^080h,f
	movf	(___aldiv@divisor+2)^080h,w
	skipc
	incfsz	(___aldiv@divisor+2)^080h,w
	subwf	(___aldiv@dividend+2)^080h,f
	movf	(___aldiv@divisor+3)^080h,w
	skipc
	incfsz	(___aldiv@divisor+3)^080h,w
	subwf	(___aldiv@dividend+3)^080h,f
	line	33
	
l3039:	
	bsf	(___aldiv@quotient)^080h+(0/8),(0)&7
	line	35
	
l3041:	
	movlw	01h
u3035:
	clrc
	rrf	(___aldiv@divisor+3)^080h,f
	rrf	(___aldiv@divisor+2)^080h,f
	rrf	(___aldiv@divisor+1)^080h,f
	rrf	(___aldiv@divisor)^080h,f
	addlw	-1
	skipz
	goto	u3035

	line	36
	
l3043:	
	movlw	01h
	subwf	(___aldiv@counter)^080h,f
	btfss	status,2
	goto	u3041
	goto	u3040
u3041:
	goto	l3033
u3040:
	line	38
	
l3045:	
	movf	((___aldiv@sign)^080h),w
	btfsc	status,2
	goto	u3051
	goto	u3050
u3051:
	goto	l3049
u3050:
	line	39
	
l3047:	
	comf	(___aldiv@quotient)^080h,f
	comf	(___aldiv@quotient+1)^080h,f
	comf	(___aldiv@quotient+2)^080h,f
	comf	(___aldiv@quotient+3)^080h,f
	incf	(___aldiv@quotient)^080h,f
	skipnz
	incf	(___aldiv@quotient+1)^080h,f
	skipnz
	incf	(___aldiv@quotient+2)^080h,f
	skipnz
	incf	(___aldiv@quotient+3)^080h,f
	line	40
	
l3049:	
	movf	(___aldiv@quotient+3)^080h,w
	movwf	(?___aldiv+3)^080h
	movf	(___aldiv@quotient+2)^080h,w
	movwf	(?___aldiv+2)^080h
	movf	(___aldiv@quotient+1)^080h,w
	movwf	(?___aldiv+1)^080h
	movf	(___aldiv@quotient)^080h,w
	movwf	(?___aldiv)^080h

	line	41
	
l526:	
	return
	callstack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
	signat	___aldiv,8316
	global	_UART_TxString

;; *************** function _UART_TxString *****************
;; Defined at:
;;		line 788 in file "main.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> packet(15), 
;;  is_ACK          1   33[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  str             1   37[BANK1 ] PTR const unsigned char 
;;		 -> packet(15), 
;;  n               2   35[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_UART_TxChar
;;		___awmod
;;		___wmul
;;		_rand
;;		_srand
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text17,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	788
global __ptext17
__ptext17:	;psect for function _UART_TxString
psect	text17
	file	"main.c"
	line	788
	
_UART_TxString:	
;incstack = 0
	callstack 1
; Regs used in _UART_TxString: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;UART_TxString@str stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(UART_TxString@str)^080h
	line	790
	
l3477:	
;main.c: 788: void UART_TxString(const char *str, char is_ACK);main.c: 789: {;main.c: 790:     unsigned int n = 0;
	clrf	(UART_TxString@n)^080h
	clrf	(UART_TxString@n+1)^080h
	line	792
;main.c: 792:     while(str[n] != '\0')
	goto	l3483
	line	794
	
l3479:	
;main.c: 793:     {;main.c: 794:         UART_TxChar(str[n]);
	movf	(UART_TxString@n)^080h,w
	addwf	(UART_TxString@str)^080h,w
	movwf	(??_UART_TxString+0)^080h+0
	movf	0+(??_UART_TxString+0)^080h+0,w
	movwf	fsr0
	movf	indf,w
	fcall	_UART_TxChar
	line	795
	
l3481:	
;main.c: 795:         n++;
	movlw	01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(UART_TxString@n)^080h,f
	skipnc
	incf	(UART_TxString@n+1)^080h,f
	movlw	0
	addwf	(UART_TxString@n+1)^080h,f
	line	792
	
l3483:	
;main.c: 792:     while(str[n] != '\0')
	movf	(UART_TxString@n)^080h,w
	addwf	(UART_TxString@str)^080h,w
	movwf	(??_UART_TxString+0)^080h+0
	movf	0+(??_UART_TxString+0)^080h+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	(indf),w
	btfss	status,2
	goto	u3741
	goto	u3740
u3741:
	goto	l3479
u3740:
	line	798
	
l3485:	
;main.c: 798:     if(is_ACK == 0)
	movf	((UART_TxString@is_ACK)^080h),w
	btfss	status,2
	goto	u3751
	goto	u3750
u3751:
	goto	l318
u3750:
	line	802
	
l3487:	
;main.c: 799:     {;main.c: 802:         srand(milliseconds);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_milliseconds+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(srand@x+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_milliseconds),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(srand@x)^080h
	fcall	_srand
	line	803
	
l3489:	
;main.c: 803:         milliseconds = 0;
	movlw	high highword(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_milliseconds+3)
	movlw	low highword(0)
	movwf	(_milliseconds+2)
	movlw	high(0)
	movwf	(_milliseconds+1)
	movlw	low(0)
	movwf	(_milliseconds)

	line	805
	
l3491:	
;main.c: 805:         seconds = ((rand()%10)+5) * 250;
	movlw	0Ah
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___awmod@divisor)^080h
	movlw	0
	movwf	((___awmod@divisor)^080h)+1
	fcall	_rand
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_rand))^080h,w
	movwf	(___awmod@dividend+1)^080h
	movf	(0+(?_rand))^080h,w
	movwf	(___awmod@dividend)^080h
	fcall	___awmod
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___awmod))^080h,w
	addlw	low(05h)
	movwf	(___wmul@multiplier)^080h
	movf	(1+(?___awmod))^080h,w
	skipnc
	addlw	1
	addlw	high(05h)
	movwf	1+(___wmul@multiplier)^080h
	movlw	0FAh
	movwf	(___wmul@multiplicand)^080h
	movlw	0
	movwf	((___wmul@multiplicand)^080h)+1
	fcall	___wmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___wmul))^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_seconds)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___wmul))^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_seconds+1)
	movlw	0
	btfsc	(_seconds+1),7
	movlw	255
	movwf	(_seconds+2)
	movwf	(_seconds+3)
	line	807
	
l318:	
	return
	callstack 0
GLOBAL	__end_of_UART_TxString
	__end_of_UART_TxString:
	signat	_UART_TxString,8313
	global	_srand

;; *************** function _srand *****************
;; Defined at:
;;		line 6 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_read_NumPad
;;		_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text18,local,class=CODE,delta=2,merge=1,group=2
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	6
global __ptext18
__ptext18:	;psect for function _srand
psect	text18
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	6
	
_srand:	
;incstack = 0
	callstack 2
; Regs used in _srand: [wreg]
	line	8
	
l3269:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(srand@x)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(srand@x+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((_randx))+1
	clrf	2+((_randx))
	clrf	3+((_randx))
	line	9
	
l904:	
	return
	callstack 0
GLOBAL	__end_of_srand
	__end_of_srand:
	signat	_srand,4217
	global	_rand

;; *************** function _rand *****************
;; Defined at:
;;		line 12 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   13[BANK1 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       5       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		___lmul
;; This function is called by:
;;		_read_NumPad
;;		_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text19,local,class=CODE,delta=2,merge=1,group=2
	line	12
global __ptext19
__ptext19:	;psect for function _rand
psect	text19
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	12
	
_rand:	
;incstack = 0
	callstack 1
; Regs used in _rand: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l3271:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+3),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___lmul@multiplier+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+2),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___lmul@multiplier+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___lmul@multiplier+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___lmul@multiplier)^080h

	movlw	041h
	movwf	(___lmul@multiplicand+3)^080h
	movlw	0C6h
	movwf	(___lmul@multiplicand+2)^080h
	movlw	04Eh
	movwf	(___lmul@multiplicand+1)^080h
	movlw	06Dh
	movwf	(___lmul@multiplicand)^080h

	fcall	___lmul
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(3+(?___lmul))^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx+3)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(2+(?___lmul))^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx+2)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?___lmul))^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(0+(?___lmul))^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx)

	line	15
	
l3273:	
	movlw	039h
	addwf	(_randx),f
	movlw	030h
	skipnc
movlw 49
	addwf	(_randx+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_randx+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_randx+3),f
	line	16
	
l3275:	
	movf	(_randx),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_rand+0)^080h+0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	((??_rand+0)^080h+0+1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+2),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	((??_rand+0)^080h+0+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+3),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	((??_rand+0)^080h+0+3)
	movlw	010h
	movwf	(??_rand+4)^080h+0
u3365:
	rlf	(??_rand+0)^080h+3,w
	rrf	(??_rand+0)^080h+3,f
	rrf	(??_rand+0)^080h+2,f
	rrf	(??_rand+0)^080h+1,f
	rrf	(??_rand+0)^080h+0,f
u3360:
	decfsz	(??_rand+4)^080h+0,f
	goto	u3365
	movlw	0FFh
	andwf	0+(??_rand+0)^080h+0,w
	movwf	(?_rand)^080h
	movlw	07Fh
	andwf	1+(??_rand+0)^080h+0,w
	movwf	1+(?_rand)^080h
	line	17
	
l907:	
	return
	callstack 0
GLOBAL	__end_of_rand
	__end_of_rand:
	signat	_rand,90
	global	___lmul

;; *************** function ___lmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK1 ] unsigned long 
;;  multiplicand    4    4[BANK1 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[BANK1 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK1 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       8       0       0
;;      Locals:         0       0       4       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0      13       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ConvertToString
;;		_rand
;; This function uses a non-reentrant model
;;
psect	text20,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul32.c"
	line	15
global __ptext20
__ptext20:	;psect for function ___lmul
psect	text20
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul32.c"
	line	15
	
___lmul:	
;incstack = 0
	callstack 1
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	119
	
l2999:	
	movlw	high highword(0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(___lmul@product+3)^080h
	movlw	low highword(0)
	movwf	(___lmul@product+2)^080h
	movlw	high(0)
	movwf	(___lmul@product+1)^080h
	movlw	low(0)
	movwf	(___lmul@product)^080h

	line	121
	
l3001:	
	btfss	(___lmul@multiplier)^080h,(0)&7
	goto	u2911
	goto	u2910
u2911:
	goto	l3005
u2910:
	line	122
	
l3003:	
	movf	(___lmul@multiplicand)^080h,w
	addwf	(___lmul@product)^080h,f
	movf	(___lmul@multiplicand+1)^080h,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2921
	addwf	(___lmul@product+1)^080h,f
u2921:
	movf	(___lmul@multiplicand+2)^080h,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2922
	addwf	(___lmul@product+2)^080h,f
u2922:
	movf	(___lmul@multiplicand+3)^080h,w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2923
	addwf	(___lmul@product+3)^080h,f
u2923:

	line	123
	
l3005:	
	movlw	01h
	movwf	(??___lmul+0)^080h+0
u2935:
	clrc
	rlf	(___lmul@multiplicand)^080h,f
	rlf	(___lmul@multiplicand+1)^080h,f
	rlf	(___lmul@multiplicand+2)^080h,f
	rlf	(___lmul@multiplicand+3)^080h,f
	decfsz	(??___lmul+0)^080h+0
	goto	u2935
	line	124
	
l3007:	
	movlw	01h
u2945:
	clrc
	rrf	(___lmul@multiplier+3)^080h,f
	rrf	(___lmul@multiplier+2)^080h,f
	rrf	(___lmul@multiplier+1)^080h,f
	rrf	(___lmul@multiplier)^080h,f
	addlw	-1
	skipz
	goto	u2945

	line	125
	movf	(___lmul@multiplier+3)^080h,w
	iorwf	(___lmul@multiplier+2)^080h,w
	iorwf	(___lmul@multiplier+1)^080h,w
	iorwf	(___lmul@multiplier)^080h,w
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l3001
u2950:
	line	128
	
l3009:	
	movf	(___lmul@product+3)^080h,w
	movwf	(?___lmul+3)^080h
	movf	(___lmul@product+2)^080h,w
	movwf	(?___lmul+2)^080h
	movf	(___lmul@product+1)^080h,w
	movwf	(?___lmul+1)^080h
	movf	(___lmul@product)^080h,w
	movwf	(?___lmul)^080h

	line	129
	
l465:	
	return
	callstack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
	signat	___lmul,8316
	global	___wmul

;; *************** function ___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2   27[BANK1 ] unsigned int 
;;  multiplicand    2   29[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2   31[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   27[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_pow
;;		_read_NumPad
;;		_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text21,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext21
__ptext21:	;psect for function ___wmul
psect	text21
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul16.c"
	line	15
	
___wmul:	
;incstack = 0
	callstack 2
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	43
	
l2941:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___wmul@product)^080h
	clrf	(___wmul@product+1)^080h
	line	45
	
l2943:	
	btfss	(___wmul@multiplier)^080h,(0)&7
	goto	u2841
	goto	u2840
u2841:
	goto	l451
u2840:
	line	46
	
l2945:	
	movf	(___wmul@multiplicand)^080h,w
	addwf	(___wmul@product)^080h,f
	skipnc
	incf	(___wmul@product+1)^080h,f
	movf	(___wmul@multiplicand+1)^080h,w
	addwf	(___wmul@product+1)^080h,f
	
l451:	
	line	47
	movlw	01h
	
u2855:
	clrc
	rlf	(___wmul@multiplicand)^080h,f
	rlf	(___wmul@multiplicand+1)^080h,f
	addlw	-1
	skipz
	goto	u2855
	line	48
	
l2947:	
	movlw	01h
	
u2865:
	clrc
	rrf	(___wmul@multiplier+1)^080h,f
	rrf	(___wmul@multiplier)^080h,f
	addlw	-1
	skipz
	goto	u2865
	line	49
	
l2949:	
	movf	((___wmul@multiplier)^080h),w
iorwf	((___wmul@multiplier+1)^080h),w
	btfss	status,2
	goto	u2871
	goto	u2870
u2871:
	goto	l2943
u2870:
	line	52
	
l2951:	
	movf	(___wmul@product+1)^080h,w
	movwf	(?___wmul+1)^080h
	movf	(___wmul@product)^080h,w
	movwf	(?___wmul)^080h
	line	53
	
l453:	
	return
	callstack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
	signat	___wmul,8314
	global	___awmod

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2   20[BANK1 ] int 
;;  dividend        2   22[BANK1 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   26[BANK1 ] unsigned char 
;;  counter         1   25[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   20[BANK1 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_read_NumPad
;;		_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text22,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\awmod.c"
	line	5
global __ptext22
__ptext22:	;psect for function ___awmod
psect	text22
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\awmod.c"
	line	5
	
___awmod:	
;incstack = 0
	callstack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	12
	
l3285:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(___awmod@sign)^080h
	line	13
	
l3287:	
	btfss	(___awmod@dividend+1)^080h,7
	goto	u3381
	goto	u3380
u3381:
	goto	l3293
u3380:
	line	14
	
l3289:	
	comf	(___awmod@dividend)^080h,f
	comf	(___awmod@dividend+1)^080h,f
	incf	(___awmod@dividend)^080h,f
	skipnz
	incf	(___awmod@dividend+1)^080h,f
	line	15
	
l3291:	
	clrf	(___awmod@sign)^080h
	incf	(___awmod@sign)^080h,f
	line	17
	
l3293:	
	btfss	(___awmod@divisor+1)^080h,7
	goto	u3391
	goto	u3390
u3391:
	goto	l3297
u3390:
	line	18
	
l3295:	
	comf	(___awmod@divisor)^080h,f
	comf	(___awmod@divisor+1)^080h,f
	incf	(___awmod@divisor)^080h,f
	skipnz
	incf	(___awmod@divisor+1)^080h,f
	line	19
	
l3297:	
	movf	((___awmod@divisor)^080h),w
iorwf	((___awmod@divisor+1)^080h),w
	btfsc	status,2
	goto	u3401
	goto	u3400
u3401:
	goto	l3315
u3400:
	line	20
	
l3299:	
	clrf	(___awmod@counter)^080h
	incf	(___awmod@counter)^080h,f
	line	21
	goto	l3305
	line	22
	
l3301:	
	movlw	01h
	
u3415:
	clrc
	rlf	(___awmod@divisor)^080h,f
	rlf	(___awmod@divisor+1)^080h,f
	addlw	-1
	skipz
	goto	u3415
	line	23
	
l3303:	
	movlw	low(01h)
	movwf	(??___awmod+0)^080h+0
	movf	(??___awmod+0)^080h+0,w
	addwf	(___awmod@counter)^080h,f
	line	21
	
l3305:	
	btfss	(___awmod@divisor+1)^080h,(15)&7
	goto	u3421
	goto	u3420
u3421:
	goto	l3301
u3420:
	line	26
	
l3307:	
	movf	(___awmod@divisor+1)^080h,w
	subwf	(___awmod@dividend+1)^080h,w
	skipz
	goto	u3435
	movf	(___awmod@divisor)^080h,w
	subwf	(___awmod@dividend)^080h,w
u3435:
	skipc
	goto	u3431
	goto	u3430
u3431:
	goto	l3311
u3430:
	line	27
	
l3309:	
	movf	(___awmod@divisor)^080h,w
	subwf	(___awmod@dividend)^080h,f
	movf	(___awmod@divisor+1)^080h,w
	skipc
	decf	(___awmod@dividend+1)^080h,f
	subwf	(___awmod@dividend+1)^080h,f
	line	28
	
l3311:	
	movlw	01h
	
u3445:
	clrc
	rrf	(___awmod@divisor+1)^080h,f
	rrf	(___awmod@divisor)^080h,f
	addlw	-1
	skipz
	goto	u3445
	line	29
	
l3313:	
	movlw	01h
	subwf	(___awmod@counter)^080h,f
	btfss	status,2
	goto	u3451
	goto	u3450
u3451:
	goto	l3307
u3450:
	line	31
	
l3315:	
	movf	((___awmod@sign)^080h),w
	btfsc	status,2
	goto	u3461
	goto	u3460
u3461:
	goto	l3319
u3460:
	line	32
	
l3317:	
	comf	(___awmod@dividend)^080h,f
	comf	(___awmod@dividend+1)^080h,f
	incf	(___awmod@dividend)^080h,f
	skipnz
	incf	(___awmod@dividend+1)^080h,f
	line	33
	
l3319:	
	movf	(___awmod@dividend+1)^080h,w
	movwf	(?___awmod+1)^080h
	movf	(___awmod@dividend)^080h,w
	movwf	(?___awmod)^080h
	line	34
	
l617:	
	return
	callstack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
	signat	___awmod,8314
	global	_UART_TxChar

;; *************** function _UART_TxChar *****************
;; Defined at:
;;		line 778 in file "main.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    1[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text23,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	778
global __ptext23
__ptext23:	;psect for function _UART_TxChar
psect	text23
	file	"main.c"
	line	778
	
_UART_TxChar:	
;incstack = 0
	callstack 2
; Regs used in _UART_TxChar: [wreg+status,2+status,0]
;UART_TxChar@ch stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(UART_TxChar@ch)^080h
	line	781
	
l3279:	
;main.c: 778: void UART_TxChar(char ch);main.c: 779: {;main.c: 781:     while(!(PIR1 & 0x10));
	
l308:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(12),(4)&7	;volatile
	goto	u3371
	goto	u3370
u3371:
	goto	l308
u3370:
	line	783
	
l3281:	
;main.c: 783:     PIR1 &= ~0x10;
	movlw	low(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_UART_TxChar+0)^080h+0
	movf	(??_UART_TxChar+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	andwf	(12),f	;volatile
	line	785
	
l3283:	
;main.c: 785:     TXREG = ch;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(UART_TxChar@ch)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	786
	
l311:	
	return
	callstack 0
GLOBAL	__end_of_UART_TxChar
	__end_of_UART_TxChar:
	signat	_UART_TxChar,4217
	global	_SplitPacket

;; *************** function _SplitPacket *****************
;; Defined at:
;;		line 506 in file "main.c"
;; Parameters:    Size  Location     Type
;;  pkt             1    wreg     PTR unsigned char 
;;		 -> dato(50), 
;; Auto vars:     Size  Location     Type
;;  pkt             1   21[BANK1 ] PTR unsigned char 
;;		 -> dato(50), 
;;  i               2   22[BANK1 ] int 
;;  part            5   12[BANK1 ] unsigned char [5]
;;  i_part          2   19[BANK1 ] int 
;;  section         2   17[BANK1 ] int 
;;  len             2   10[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0      14       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0      17       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_Length
;;		_strcopy
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text24,local,class=CODE,delta=2,merge=1,group=0
	line	506
global __ptext24
__ptext24:	;psect for function _SplitPacket
psect	text24
	file	"main.c"
	line	506
	
_SplitPacket:	
;incstack = 0
	callstack 2
; Regs used in _SplitPacket: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;SplitPacket@pkt stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(SplitPacket@pkt)^080h
	line	512
	
l3493:	
;main.c: 506: void SplitPacket(char* pkt);main.c: 507: {;main.c: 509:     char part[5];;main.c: 512:     int i_part = 0, section = 0, len = Length(pkt);
	clrf	(SplitPacket@i_part)^080h
	clrf	(SplitPacket@i_part+1)^080h
	clrf	(SplitPacket@section)^080h
	clrf	(SplitPacket@section+1)^080h
	
l3495:	
	movf	(SplitPacket@pkt)^080h,w
	movwf	(Length@str)^080h
	movlw	(0x1)
	movwf	(Length@str+1)^080h
	fcall	_Length
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_Length))^080h,w
	movwf	(SplitPacket@len+1)^080h
	movf	(0+(?_Length))^080h,w
	movwf	(SplitPacket@len)^080h
	line	515
	
l3497:	
;main.c: 515:     for(int i = 0; i < len + 1; i++)
	clrf	(SplitPacket@i)^080h
	clrf	(SplitPacket@i+1)^080h
	goto	l3527
	line	518
	
l3499:	
;main.c: 516:     {;main.c: 518:         if(pkt[i] != '/' && pkt[i] != '\0')
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(SplitPacket@i)^080h,w
	addwf	(SplitPacket@pkt)^080h,w
	movwf	(??_SplitPacket+0)^080h+0
	movf	0+(??_SplitPacket+0)^080h+0,w
	movwf	fsr0
		movlw	47
	bsf	status, 7	;select IRP bank2
	xorwf	(indf),w
	btfsc	status,2
	goto	u3761
	goto	u3760
u3761:
	goto	l3519
u3760:
	
l3501:	
	movf	(SplitPacket@i)^080h,w
	addwf	(SplitPacket@pkt)^080h,w
	movwf	(??_SplitPacket+0)^080h+0
	movf	0+(??_SplitPacket+0)^080h+0,w
	movwf	fsr0
	movf	(indf),w
	btfsc	status,2
	goto	u3771
	goto	u3770
u3771:
	goto	l3519
u3770:
	line	521
	
l3503:	
;main.c: 519:         {;main.c: 521:             part[i_part] = pkt[i];
	movf	(SplitPacket@i)^080h,w
	addwf	(SplitPacket@pkt)^080h,w
	movwf	(??_SplitPacket+0)^080h+0
	movf	0+(??_SplitPacket+0)^080h+0,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_SplitPacket+1)^080h+0
	movf	(SplitPacket@i_part)^080h,w
	addlw	low(SplitPacket@part|((0x0)<<8))&0ffh
	movwf	fsr0
	movf	(??_SplitPacket+1)^080h+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	522
	
l3505:	
;main.c: 522:             i_part++;
	movlw	01h
	addwf	(SplitPacket@i_part)^080h,f
	skipnc
	incf	(SplitPacket@i_part+1)^080h,f
	movlw	0
	addwf	(SplitPacket@i_part+1)^080h,f
	line	523
	
l3507:	
;main.c: 523:             part[i_part] = '\0';
	movf	(SplitPacket@i_part)^080h,w
	addlw	low(SplitPacket@part|((0x0)<<8))&0ffh
	movwf	fsr0
	clrf	indf
	line	524
;main.c: 524:         }
	goto	l3525
	line	532
	
l3509:	
;main.c: 532:                     source = part[0];
	movf	(SplitPacket@part)^080h,w
	movwf	(_source)^080h
	line	533
;main.c: 533:                     break;
	goto	l3521
	line	535
	
l3511:	
;main.c: 535:                     strcopy(id_dest, part);
	movlw	(low(SplitPacket@part|((0x0)<<8)))&0ffh
	movwf	(strcopy@source)^080h
	movlw	(low(_id_dest|((0x1)<<8)))&0ffh
	fcall	_strcopy
	line	536
;main.c: 536:                     break;
	goto	l3521
	line	538
	
l3513:	
;main.c: 538:                     type = part[0];
	movf	(SplitPacket@part)^080h,w
	movwf	(_type)^080h
	line	539
;main.c: 539:                     break;
	goto	l3521
	line	541
	
l3515:	
;main.c: 541:                     strcopy(datoSeriale, part);
	movlw	(low(SplitPacket@part|((0x0)<<8)))&0ffh
	movwf	(strcopy@source)^080h
	movlw	(low(_datoSeriale|((0x1)<<8)))&0ffh
	fcall	_strcopy
	line	542
;main.c: 542:                     break;
	goto	l3521
	line	545
	
l3519:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "simple"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	movf (SplitPacket@section+1)^080h,w
	asmopt push
	asmopt off
	xorlw	0^0	; case 0
	skipnz
	goto	l4117
	goto	l3521
	asmopt pop
	
l4117:	
; Switch size 1, requested type "simple"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
;	Chosen strategy is simple_byte

	movf (SplitPacket@section)^080h,w
	asmopt push
	asmopt off
	xorlw	0^0	; case 0
	skipnz
	goto	l3509
	xorlw	1^0	; case 1
	skipnz
	goto	l3511
	xorlw	2^1	; case 2
	skipnz
	goto	l3513
	xorlw	3^2	; case 3
	skipnz
	goto	l3515
	goto	l3521
	asmopt pop

	line	547
	
l3521:	
;main.c: 547:             section++;
	movlw	01h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(SplitPacket@section)^080h,f
	skipnc
	incf	(SplitPacket@section+1)^080h,f
	movlw	0
	addwf	(SplitPacket@section+1)^080h,f
	line	549
	
l3523:	
;main.c: 549:             i_part = 0;
	clrf	(SplitPacket@i_part)^080h
	clrf	(SplitPacket@i_part+1)^080h
	line	551
	
l3525:	
;main.c: 551:     }
	movlw	01h
	addwf	(SplitPacket@i)^080h,f
	skipnc
	incf	(SplitPacket@i+1)^080h,f
	movlw	0
	addwf	(SplitPacket@i+1)^080h,f
	
l3527:	
	movf	(SplitPacket@len)^080h,w
	addlw	low(01h)
	movwf	(??_SplitPacket+0)^080h+0
	movf	(SplitPacket@len+1)^080h,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(??_SplitPacket+0)^080h+0
	movf	(SplitPacket@i+1)^080h,w
	xorlw	80h
	movwf	(??_SplitPacket+2)^080h+0
	movf	1+(??_SplitPacket+0)^080h+0,w
	xorlw	80h
	subwf	(??_SplitPacket+2)^080h+0,w
	skipz
	goto	u3785
	movf	0+(??_SplitPacket+0)^080h+0,w
	subwf	(SplitPacket@i)^080h,w
u3785:

	skipc
	goto	u3781
	goto	u3780
u3781:
	goto	l3499
u3780:
	line	552
	
l241:	
	return
	callstack 0
GLOBAL	__end_of_SplitPacket
	__end_of_SplitPacket:
	signat	_SplitPacket,4217
	global	_strcopy

;; *************** function _strcopy *****************
;; Defined at:
;;		line 554 in file "main.c"
;; Parameters:    Size  Location     Type
;;  dest            1    wreg     PTR unsigned char 
;;		 -> datoSeriale(17), id_dest(4), 
;;  source          1    0[BANK1 ] PTR unsigned char 
;;		 -> SplitPacket@part(5), 
;; Auto vars:     Size  Location     Type
;;  dest            1    4[BANK1 ] PTR unsigned char 
;;		 -> datoSeriale(17), id_dest(4), 
;;  n               2    5[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SplitPacket
;; This function uses a non-reentrant model
;;
psect	text25,local,class=CODE,delta=2,merge=1,group=0
	line	554
global __ptext25
__ptext25:	;psect for function _strcopy
psect	text25
	file	"main.c"
	line	554
	
_strcopy:	
;incstack = 0
	callstack 2
; Regs used in _strcopy: [wreg-fsr0h+status,2+status,0]
;strcopy@dest stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(strcopy@dest)^080h
	line	556
	
l3239:	
;main.c: 554: void strcopy(char* dest, char* source);main.c: 555: {;main.c: 556:     int n = 0;
	clrf	(strcopy@n)^080h
	clrf	(strcopy@n+1)^080h
	line	559
;main.c: 559:     while(source[n] != '\0')
	goto	l3245
	line	561
	
l3241:	
;main.c: 560:     {;main.c: 561:         dest[n] = source[n];
	movf	(strcopy@n)^080h,w
	addwf	(strcopy@source)^080h,w
	movwf	(??_strcopy+0)^080h+0
	movf	0+(??_strcopy+0)^080h+0,w
	movwf	fsr0
	movf	indf,w
	movwf	(??_strcopy+1)^080h+0
	movf	(strcopy@n)^080h,w
	addwf	(strcopy@dest)^080h,w
	movwf	(??_strcopy+2)^080h+0
	movf	0+(??_strcopy+2)^080h+0,w
	movwf	fsr0
	movf	(??_strcopy+1)^080h+0,w
	bsf	status, 7	;select IRP bank2
	movwf	indf
	line	562
	
l3243:	
;main.c: 562:         n++;
	movlw	01h
	addwf	(strcopy@n)^080h,f
	skipnc
	incf	(strcopy@n+1)^080h,f
	movlw	0
	addwf	(strcopy@n+1)^080h,f
	line	559
	
l3245:	
;main.c: 559:     while(source[n] != '\0')
	movf	(strcopy@n)^080h,w
	addwf	(strcopy@source)^080h,w
	movwf	(??_strcopy+0)^080h+0
	movf	0+(??_strcopy+0)^080h+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	(indf),w
	btfss	status,2
	goto	u3321
	goto	u3320
u3321:
	goto	l3241
u3320:
	line	566
	
l3247:	
;main.c: 566:     dest[n] = '\0';
	movf	(strcopy@n)^080h,w
	addwf	(strcopy@dest)^080h,w
	movwf	(??_strcopy+0)^080h+0
	movf	0+(??_strcopy+0)^080h+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	line	567
	
l247:	
	return
	callstack 0
GLOBAL	__end_of_strcopy
	__end_of_strcopy:
	signat	_strcopy,8313
	global	_ConcatToPacket

;; *************** function _ConcatToPacket *****************
;; Defined at:
;;		line 456 in file "main.c"
;; Parameters:    Size  Location     Type
;;  pkt             1    wreg     PTR unsigned char 
;;		 -> packet(15), 
;;  str             2   19[BANK1 ] PTR unsigned char 
;;		 -> STR_16(4), STR_12(4), STR_8(2), main@num_rand_s(16), 
;;		 -> PIC_ID(4), 
;;  delim           1   21[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  pkt             1   25[BANK1 ] PTR unsigned char 
;;		 -> packet(15), 
;;  packet_lengt    2   23[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       3       0       0
;;      Locals:         0       0       3       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 6
;; This function calls:
;;		_strcat
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text26,local,class=CODE,delta=2,merge=1,group=0
	line	456
global __ptext26
__ptext26:	;psect for function _ConcatToPacket
psect	text26
	file	"main.c"
	line	456
	
_ConcatToPacket:	
;incstack = 0
	callstack 1
; Regs used in _ConcatToPacket: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;ConcatToPacket@pkt stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(ConcatToPacket@pkt)^080h
	line	459
	
l3461:	
;main.c: 456: void ConcatToPacket(char* pkt, char* str, char delim);main.c: 457: {;main.c: 459:     int packet_length = strcat(pkt, str);
		movf	(ConcatToPacket@str)^080h,w
	movwf	(strcat@source)^080h
movf	(ConcatToPacket@str+1)^080h,w
movwf	(strcat@source+1)^080h

	movf	(ConcatToPacket@pkt)^080h,w
	fcall	_strcat
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_strcat))^080h,w
	movwf	(ConcatToPacket@packet_length+1)^080h
	movf	(0+(?_strcat))^080h,w
	movwf	(ConcatToPacket@packet_length)^080h
	line	461
	
l3463:	
;main.c: 461:     if(delim != ' ')
		movlw	32
	xorwf	((ConcatToPacket@delim)^080h),w
	btfsc	status,2
	goto	u3731
	goto	u3730
u3731:
	goto	l3469
u3730:
	line	464
	
l3465:	
;main.c: 462:     {;main.c: 464:         pkt[packet_length] = delim;
	movf	(ConcatToPacket@packet_length)^080h,w
	addwf	(ConcatToPacket@pkt)^080h,w
	movwf	(??_ConcatToPacket+0)^080h+0
	movf	0+(??_ConcatToPacket+0)^080h+0,w
	movwf	fsr0
	movf	(ConcatToPacket@delim)^080h,w
	bsf	status, 7	;select IRP bank2
	movwf	indf
	line	465
	
l3467:	
;main.c: 465:         packet_length++;
	movlw	01h
	addwf	(ConcatToPacket@packet_length)^080h,f
	skipnc
	incf	(ConcatToPacket@packet_length+1)^080h,f
	movlw	0
	addwf	(ConcatToPacket@packet_length+1)^080h,f
	line	466
;main.c: 466:     }
	goto	l3475
	line	471
	
l3469:	
;main.c: 469:     {;main.c: 471:         pkt[packet_length] = '\r';
	movf	(ConcatToPacket@packet_length)^080h,w
	addwf	(ConcatToPacket@pkt)^080h,w
	movwf	(??_ConcatToPacket+0)^080h+0
	movf	0+(??_ConcatToPacket+0)^080h+0,w
	movwf	fsr0
	movlw	low(0Dh)
	bsf	status, 7	;select IRP bank2
	movwf	indf
	line	472
	
l3471:	
;main.c: 472:         packet_length++;
	movlw	01h
	addwf	(ConcatToPacket@packet_length)^080h,f
	skipnc
	incf	(ConcatToPacket@packet_length+1)^080h,f
	movlw	0
	addwf	(ConcatToPacket@packet_length+1)^080h,f
	line	473
	
l3473:	
;main.c: 473:         pkt[packet_length] = '\n';
	movf	(ConcatToPacket@packet_length)^080h,w
	addwf	(ConcatToPacket@pkt)^080h,w
	movwf	(??_ConcatToPacket+0)^080h+0
	movf	0+(??_ConcatToPacket+0)^080h+0,w
	movwf	fsr0
	movlw	low(0Ah)
	movwf	indf
	line	474
;main.c: 474:         packet_length++;
	movlw	01h
	addwf	(ConcatToPacket@packet_length)^080h,f
	skipnc
	incf	(ConcatToPacket@packet_length+1)^080h,f
	movlw	0
	addwf	(ConcatToPacket@packet_length+1)^080h,f
	line	477
	
l3475:	
;main.c: 477:     pkt[packet_length] = '\0';
	movf	(ConcatToPacket@packet_length)^080h,w
	addwf	(ConcatToPacket@pkt)^080h,w
	movwf	(??_ConcatToPacket+0)^080h+0
	movf	0+(??_ConcatToPacket+0)^080h+0,w
	movwf	fsr0
	clrf	indf
	line	478
	
l214:	
	return
	callstack 0
GLOBAL	__end_of_ConcatToPacket
	__end_of_ConcatToPacket:
	signat	_ConcatToPacket,12409
	global	_strcat

;; *************** function _strcat *****************
;; Defined at:
;;		line 489 in file "main.c"
;; Parameters:    Size  Location     Type
;;  dest            1    wreg     PTR unsigned char 
;;		 -> packet(15), 
;;  source          2    7[BANK1 ] PTR unsigned char 
;;		 -> STR_16(4), STR_12(4), STR_8(2), main@num_rand_s(16), 
;;		 -> PIC_ID(4), 
;; Auto vars:     Size  Location     Type
;;  dest            1   14[BANK1 ] PTR unsigned char 
;;		 -> packet(15), 
;;  length_dest     2   17[BANK1 ] int 
;;  n               2   15[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  2    7[BANK1 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       5       0       0
;;      Temps:          0       0       5       0       0
;;      Totals:         0       0      12       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 5
;; This function calls:
;;		_Length
;; This function is called by:
;;		_ConcatToPacket
;; This function uses a non-reentrant model
;;
psect	text27,local,class=CODE,delta=2,merge=1,group=0
	line	489
global __ptext27
__ptext27:	;psect for function _strcat
psect	text27
	file	"main.c"
	line	489
	
_strcat:	
;incstack = 0
	callstack 1
; Regs used in _strcat: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;strcat@dest stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(strcat@dest)^080h
	line	492
	
l3225:	
;main.c: 489: int strcat(char* dest, char* source);main.c: 490: {;main.c: 492:     int n = 0, length_dest = Length(dest);
	clrf	(strcat@n)^080h
	clrf	(strcat@n+1)^080h
	
l3227:	
	movf	(strcat@dest)^080h,w
	movwf	(Length@str)^080h
	movlw	(0x1)
	movwf	(Length@str+1)^080h
	fcall	_Length
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(1+(?_Length))^080h,w
	movwf	(strcat@length_dest+1)^080h
	movf	(0+(?_Length))^080h,w
	movwf	(strcat@length_dest)^080h
	line	495
;main.c: 495:     while(source[n] != '\0')
	goto	l223
	line	497
	
l3229:	
;main.c: 496:     {;main.c: 497:         dest[length_dest] = source[n];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(strcat@n)^080h,w
	addwf	(strcat@source)^080h,w
	movwf	(??_strcat+1)^080h+0
	movf	(strcat@source+1)^080h,w
	movwf	(??_strcat+0)^080h+0
	skipnc
	incf	(??_strcat+0)^080h+0,f
	btfss	(strcat@n)^080h,7
	goto	u3290
	decf	(??_strcat+0)^080h+0,f
u3290:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_strcat+0)^080h+0,w
	movwf	0+((??_strcat+1)^080h+0)+1
	movf	1+(??_strcat+1)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(??_strcat+1)^080h+0,w
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(??_strcat+3)^080h+0
	movf	(strcat@length_dest)^080h,w
	addwf	(strcat@dest)^080h,w
	movwf	(??_strcat+4)^080h+0
	movf	0+(??_strcat+4)^080h+0,w
	movwf	fsr0
	movf	(??_strcat+3)^080h+0,w
	bsf	status, 7	;select IRP bank2
	movwf	indf
	line	498
	
l3231:	
;main.c: 498:         n++;
	movlw	01h
	addwf	(strcat@n)^080h,f
	skipnc
	incf	(strcat@n+1)^080h,f
	movlw	0
	addwf	(strcat@n+1)^080h,f
	line	499
	
l3233:	
;main.c: 499:         length_dest++;
	movlw	01h
	addwf	(strcat@length_dest)^080h,f
	skipnc
	incf	(strcat@length_dest+1)^080h,f
	movlw	0
	addwf	(strcat@length_dest+1)^080h,f
	line	500
;main.c: 500:     }
	
l223:	
	line	495
;main.c: 495:     while(source[n] != '\0')
	movf	(strcat@n)^080h,w
	addwf	(strcat@source)^080h,w
	movwf	(??_strcat+1)^080h+0
	movf	(strcat@source+1)^080h,w
	movwf	(??_strcat+0)^080h+0
	skipnc
	incf	(??_strcat+0)^080h+0,f
	btfss	(strcat@n)^080h,7
	goto	u3300
	decf	(??_strcat+0)^080h+0,f
u3300:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_strcat+0)^080h+0,w
	movwf	0+((??_strcat+1)^080h+0)+1
	movf	1+(??_strcat+1)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(??_strcat+1)^080h+0,w
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	fcall	stringtab
	xorlw	0
	skipz
	goto	u3311
	goto	u3310
u3311:
	goto	l3229
u3310:
	line	503
	
l3235:	
;main.c: 503:     return length_dest;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(strcat@length_dest+1)^080h,w
	movwf	(?_strcat+1)^080h
	movf	(strcat@length_dest)^080h,w
	movwf	(?_strcat)^080h
	line	504
	
l226:	
	return
	callstack 0
GLOBAL	__end_of_strcat
	__end_of_strcat:
	signat	_strcat,8314
	global	_Length

;; *************** function _Length *****************
;; Defined at:
;;		line 480 in file "main.c"
;; Parameters:    Size  Location     Type
;;  str             2    0[BANK1 ] PTR unsigned char 
;;		 -> datoSeriale(17), datoTastierino(17), id_dest(4), dato(50), 
;;		 -> packet(15), PIC_ID(4), 
;; Auto vars:     Size  Location     Type
;;  len             2    5[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       0       3       0       0
;;      Totals:         0       0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_strcat
;;		_SplitPacket
;;		_CompareStrings
;;		_Fill
;; This function uses a non-reentrant model
;;
psect	text28,local,class=CODE,delta=2,merge=1,group=0
	line	480
global __ptext28
__ptext28:	;psect for function _Length
psect	text28
	file	"main.c"
	line	480
	
_Length:	
;incstack = 0
	callstack 1
; Regs used in _Length: [wreg-fsr0h+status,2+status,0]
	line	482
	
l2989:	
;main.c: 480: int Length(char *str);main.c: 481: {;main.c: 482:     int len = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(Length@len)^080h
	clrf	(Length@len+1)^080h
	line	484
;main.c: 484:     while(str[len] != '\0') { len++; }
	goto	l2993
	
l2991:	
	movlw	01h
	addwf	(Length@len)^080h,f
	skipnc
	incf	(Length@len+1)^080h,f
	movlw	0
	addwf	(Length@len+1)^080h,f
	
l2993:	
	movf	(Length@len)^080h,w
	addwf	(Length@str)^080h,w
	movwf	(??_Length+1)^080h+0
	movf	(Length@str+1)^080h,w
	movwf	(??_Length+0)^080h+0
	skipnc
	incf	(??_Length+0)^080h+0,f
	btfss	(Length@len)^080h,7
	goto	u2890
	decf	(??_Length+0)^080h+0,f
u2890:
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(??_Length+0)^080h+0,w
	movwf	0+((??_Length+1)^080h+0)+1
	movf	0+(??_Length+1)^080h+0,w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_Length+1)^080h+0,0
	bcf	status,7
	movf	(indf),w
	btfss	status,2
	goto	u2901
	goto	u2900
u2901:
	goto	l2991
u2900:
	line	486
	
l2995:	
;main.c: 486:     return len;
	movf	(Length@len+1)^080h,w
	movwf	(?_Length+1)^080h
	movf	(Length@len)^080h,w
	movwf	(?_Length)^080h
	line	487
	
l220:	
	return
	callstack 0
GLOBAL	__end_of_Length
	__end_of_Length:
	signat	_Length,4218
	global	_IRS

;; *************** function _IRS *****************
;; Defined at:
;;		line 809 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 3
;; This function calls:
;;		i1_UART_TxString
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text29,local,class=CODE,delta=2,merge=1,group=0
	line	809
global __ptext29
__ptext29:	;psect for function _IRS
psect	text29
	file	"main.c"
	line	809
	
_IRS:	
;incstack = 0
	callstack 0
; Regs used in _IRS: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_IRS+1)
	movf	fsr0,w
	movwf	(??_IRS+2)
	movf	pclath,w
	movwf	(??_IRS+3)
	ljmp	_IRS
psect	text29
	line	812
	
i1l2861:	
;main.c: 812:     if(RCIF)
	btfss	(101/8),(101)&7	;volatile
	goto	u279_21
	goto	u279_20
u279_21:
	goto	i1l2873
u279_20:
	line	814
	
i1l2863:	
;main.c: 813:     {;main.c: 814:         dato[iS++] = RCREG;
	movf	(_iS),w
	addlw	low(_dato|((0x1)<<8))&0ffh
	movwf	fsr0
	movf	(26),w	;volatile
	bsf	status, 7	;select IRP bank2
	movwf	indf
	
i1l2865:	
	movlw	low(01h)
	movwf	(??_IRS+0)+0
	movf	(??_IRS+0)+0,w
	addwf	(_iS),f
	line	815
	
i1l2867:	
;main.c: 815:         dato[iS] = '\0';
	movf	(_iS),w
	addlw	low(_dato|((0x1)<<8))&0ffh
	movwf	fsr0
	clrf	indf
	line	816
	
i1l2869:	
;main.c: 816:         recieved = 1;
	clrf	(_recieved)
	incf	(_recieved),f
	line	817
	
i1l2871:	
;main.c: 817:         RCIF = 0;
	bcf	(101/8),(101)&7	;volatile
	line	820
	
i1l2873:	
;main.c: 820:     if(T0IF)
	btfss	(90/8),(90)&7	;volatile
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l328
u280_20:
	line	822
	
i1l2875:	
;main.c: 821:     {;main.c: 822:         TMR0 = 131;
	movlw	low(083h)
	movwf	(1)	;volatile
	line	823
;main.c: 823:         milliseconds++;
	movlw	01h
	addwf	(_milliseconds),f
	movlw	0
	skipnc
movlw 1
	addwf	(_milliseconds+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_milliseconds+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_milliseconds+3),f
	line	824
;main.c: 824:         if(seconds != 0 && milliseconds > seconds)
	movf	(_seconds+3),w
	iorwf	(_seconds+2),w
	iorwf	(_seconds+1),w
	iorwf	(_seconds),w
	skipnz
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l2889
u281_20:
	
i1l2877:	
	movf	(_milliseconds+3),w
	subwf	(_seconds+3),w
	skipz
	goto	u282_25
	movf	(_milliseconds+2),w
	subwf	(_seconds+2),w
	skipz
	goto	u282_25
	movf	(_milliseconds+1),w
	subwf	(_seconds+1),w
	skipz
	goto	u282_25
	movf	(_milliseconds),w
	subwf	(_seconds),w
u282_25:
	skipnc
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l2889
u282_20:
	line	827
	
i1l2879:	
;main.c: 825:         {;main.c: 827:             if(seconds == 1000)
		movlw	232
	xorwf	((_seconds)),w
	movlw	3
	skipnz
	xorwf	((_seconds+1)),w
iorwf	((_seconds+2)),w
iorwf	((_seconds+3)),w
	btfss	status,2
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l2885
u283_20:
	line	829
	
i1l2881:	
;main.c: 828:             {;main.c: 829:                 pr_start = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_pr_start)
	incf	(_pr_start),f
	line	830
	
i1l2883:	
;main.c: 830:                 seconds = 0;
	movlw	high highword(0)
	movwf	(_seconds+3)
	movlw	low highword(0)
	movwf	(_seconds+2)
	movlw	high(0)
	movwf	(_seconds+1)
	movlw	low(0)
	movwf	(_seconds)

	line	831
;main.c: 831:             }
	goto	i1l2889
	line	835
	
i1l2885:	
;main.c: 834:             {;main.c: 835:                 seconds = 0;
	movlw	high highword(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_seconds+3)
	movlw	low highword(0)
	movwf	(_seconds+2)
	movlw	high(0)
	movwf	(_seconds+1)
	movlw	low(0)
	movwf	(_seconds)

	line	836
	
i1l2887:	
;main.c: 836:                 UART_TxString(packet, 0);
	clrf	(i1UART_TxString@is_ACK)
	movlw	(low(_packet|((0x1)<<8)))&0ffh
	fcall	i1_UART_TxString
	line	839
	
i1l2889:	
;main.c: 839:         T0IF = 0;
	bcf	(90/8),(90)&7	;volatile
	line	841
	
i1l328:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_IRS+3),w
	movwf	pclath
	movf	(??_IRS+2),w
	movwf	fsr0
	swapf	(??_IRS+1),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	callstack 0
GLOBAL	__end_of_IRS
	__end_of_IRS:
	signat	_IRS,89
	global	i1_UART_TxString

;; *************** function i1_UART_TxString *****************
;; Defined at:
;;		line 788 in file "main.c"
;; Parameters:    Size  Location     Type
;;  str             1    wreg     PTR const unsigned char 
;;		 -> packet(15), 
;;  is_ACK          1   19[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  str             1   21[BANK0 ] PTR const unsigned char 
;;		 -> packet(15), 
;;  n               2   22[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 2
;; This function calls:
;;		i1_UART_TxChar
;;		i1___awmod
;;		i1___wmul
;;		i1_rand
;;		i1_srand
;; This function is called by:
;;		_IRS
;; This function uses a non-reentrant model
;;
psect	text30,local,class=CODE,delta=2,merge=1,group=0
	line	788
global __ptext30
__ptext30:	;psect for function i1_UART_TxString
psect	text30
	file	"main.c"
	line	788
	
i1_UART_TxString:	
;incstack = 0
	callstack 0
; Regs used in i1_UART_TxString: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;i1UART_TxString@str stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(i1UART_TxString@str)
	line	790
	
i1l2629:	
;main.c: 788: void UART_TxString(const char *str, char is_ACK);main.c: 789: {;main.c: 790:     unsigned int n = 0;
	clrf	(i1UART_TxString@n)
	clrf	(i1UART_TxString@n+1)
	line	792
;main.c: 792:     while(str[n] != '\0')
	goto	i1l2635
	line	794
	
i1l2631:	
;main.c: 793:     {;main.c: 794:         UART_TxChar(str[n]);
	movf	(i1UART_TxString@n),w
	addwf	(i1UART_TxString@str),w
	movwf	(??i1_UART_TxString+0)+0
	movf	0+(??i1_UART_TxString+0)+0,w
	movwf	fsr0
	movf	indf,w
	fcall	i1_UART_TxChar
	line	795
	
i1l2633:	
;main.c: 795:         n++;
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(i1UART_TxString@n),f
	skipnc
	incf	(i1UART_TxString@n+1),f
	movlw	0
	addwf	(i1UART_TxString@n+1),f
	line	792
	
i1l2635:	
;main.c: 792:     while(str[n] != '\0')
	movf	(i1UART_TxString@n),w
	addwf	(i1UART_TxString@str),w
	movwf	(??i1_UART_TxString+0)+0
	movf	0+(??i1_UART_TxString+0)+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	(indf),w
	btfss	status,2
	goto	u255_21
	goto	u255_20
u255_21:
	goto	i1l2631
u255_20:
	line	798
	
i1l2637:	
;main.c: 798:     if(is_ACK == 0)
	movf	((i1UART_TxString@is_ACK)),w
	btfss	status,2
	goto	u256_21
	goto	u256_20
u256_21:
	goto	i1l318
u256_20:
	line	802
	
i1l2639:	
;main.c: 799:     {;main.c: 802:         srand(milliseconds);
	movf	(_milliseconds+1),w
	movwf	(i1srand@x+1)
	movf	(_milliseconds),w
	movwf	(i1srand@x)
	fcall	i1_srand
	line	803
	
i1l2641:	
;main.c: 803:         milliseconds = 0;
	movlw	high highword(0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_milliseconds+3)
	movlw	low highword(0)
	movwf	(_milliseconds+2)
	movlw	high(0)
	movwf	(_milliseconds+1)
	movlw	low(0)
	movwf	(_milliseconds)

	line	805
	
i1l2643:	
;main.c: 805:         seconds = ((rand()%10)+5) * 250;
	movlw	0Ah
	movwf	(i1___awmod@divisor)
	movlw	0
	movwf	((i1___awmod@divisor))+1
	fcall	i1_rand
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?i1_rand)),w
	movwf	(i1___awmod@dividend+1)
	movf	(0+(?i1_rand)),w
	movwf	(i1___awmod@dividend)
	fcall	i1___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?i1___awmod)),w
	addlw	low(05h)
	movwf	(i1___wmul@multiplier)
	movf	(1+(?i1___awmod)),w
	skipnc
	addlw	1
	addlw	high(05h)
	movwf	1+(i1___wmul@multiplier)
	movlw	0FAh
	movwf	(i1___wmul@multiplicand)
	movlw	0
	movwf	((i1___wmul@multiplicand))+1
	fcall	i1___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?i1___wmul)),w
	movwf	(_seconds)
	movf	(1+(?i1___wmul)),w
	movwf	(_seconds+1)
	movlw	0
	btfsc	(_seconds+1),7
	movlw	255
	movwf	(_seconds+2)
	movwf	(_seconds+3)
	line	807
	
i1l318:	
	return
	callstack 0
GLOBAL	__end_ofi1_UART_TxString
	__end_ofi1_UART_TxString:
	signat	i1_UART_TxString,8281
	global	i1_srand

;; *************** function i1_srand *****************
;; Defined at:
;;		line 6 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text31,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	6
global __ptext31
__ptext31:	;psect for function i1_srand
psect	text31
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	6
	
i1_srand:	
;incstack = 0
	callstack 1
; Regs used in i1_srand: [wreg]
	line	8
	
i1l2407:	
	movf	(i1srand@x),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx)
	movf	(i1srand@x+1),w
	movwf	((_randx))+1
	clrf	2+((_randx))
	clrf	3+((_randx))
	line	9
	
i1l904:	
	return
	callstack 0
GLOBAL	__end_ofi1_srand
	__end_ofi1_srand:
	signat	i1_srand,4185
	global	i1_rand

;; *************** function i1_rand *****************
;; Defined at:
;;		line 12 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; Hardware stack levels required when called: 1
;; This function calls:
;;		i1___lmul
;; This function is called by:
;;		i1_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text32,local,class=CODE,delta=2,merge=1,group=0
	line	12
global __ptext32
__ptext32:	;psect for function i1_rand
psect	text32
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\rand.c"
	line	12
	
i1_rand:	
;incstack = 0
	callstack 0
; Regs used in i1_rand: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
i1l2409:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_randx+3),w
	movwf	(i1___lmul@multiplier+3)
	movf	(_randx+2),w
	movwf	(i1___lmul@multiplier+2)
	movf	(_randx+1),w
	movwf	(i1___lmul@multiplier+1)
	movf	(_randx),w
	movwf	(i1___lmul@multiplier)

	movlw	041h
	movwf	(i1___lmul@multiplicand+3)
	movlw	0C6h
	movwf	(i1___lmul@multiplicand+2)
	movlw	04Eh
	movwf	(i1___lmul@multiplicand+1)
	movlw	06Dh
	movwf	(i1___lmul@multiplicand)

	fcall	i1___lmul
	movf	(3+(?i1___lmul)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_randx+3)
	movf	(2+(?i1___lmul)),w
	movwf	(_randx+2)
	movf	(1+(?i1___lmul)),w
	movwf	(_randx+1)
	movf	(0+(?i1___lmul)),w
	movwf	(_randx)

	line	15
	
i1l2411:	
	movlw	039h
	addwf	(_randx),f
	movlw	030h
	skipnc
movlw 49
	addwf	(_randx+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_randx+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_randx+3),f
	line	16
	
i1l2413:	
	movf	(_randx),w
	movwf	(??i1_rand+0)+0
	movf	(_randx+1),w
	movwf	((??i1_rand+0)+0+1)
	movf	(_randx+2),w
	movwf	((??i1_rand+0)+0+2)
	movf	(_randx+3),w
	movwf	((??i1_rand+0)+0+3)
	movlw	010h
	movwf	(??i1_rand+4)+0
u222_25:
	rlf	(??i1_rand+0)+3,w
	rrf	(??i1_rand+0)+3,f
	rrf	(??i1_rand+0)+2,f
	rrf	(??i1_rand+0)+1,f
	rrf	(??i1_rand+0)+0,f
u222_20:
	decfsz	(??i1_rand+4)+0,f
	goto	u222_25
	movlw	0FFh
	andwf	0+(??i1_rand+0)+0,w
	movwf	(?i1_rand)
	movlw	07Fh
	andwf	1+(??i1_rand+0)+0,w
	movwf	1+(?i1_rand)
	line	17
	
i1l907:	
	return
	callstack 0
GLOBAL	__end_ofi1_rand
	__end_ofi1_rand:
	signat	i1_rand,90
	global	i1___lmul

;; *************** function i1___lmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul32.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[COMMON] unsigned long 
;;  multiplicand    4    4[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:        13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_rand
;; This function uses a non-reentrant model
;;
psect	text33,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul32.c"
	line	15
global __ptext33
__ptext33:	;psect for function i1___lmul
psect	text33
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul32.c"
	line	15
	
i1___lmul:	
;incstack = 0
	callstack 0
; Regs used in i1___lmul: [wreg+status,2+status,0]
	line	119
	
i1l2097:	
	movlw	high highword(0)
	movwf	(i1___lmul@product+3)
	movlw	low highword(0)
	movwf	(i1___lmul@product+2)
	movlw	high(0)
	movwf	(i1___lmul@product+1)
	movlw	low(0)
	movwf	(i1___lmul@product)

	line	121
	
i1l2099:	
	btfss	(i1___lmul@multiplier),(0)&7
	goto	u173_21
	goto	u173_20
u173_21:
	goto	i1l2103
u173_20:
	line	122
	
i1l2101:	
	movf	(i1___lmul@multiplicand),w
	addwf	(i1___lmul@product),f
	movf	(i1___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u174_21
	addwf	(i1___lmul@product+1),f
u174_21:
	movf	(i1___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u174_22
	addwf	(i1___lmul@product+2),f
u174_22:
	movf	(i1___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u174_23
	addwf	(i1___lmul@product+3),f
u174_23:

	line	123
	
i1l2103:	
	movlw	01h
	movwf	(??i1___lmul+0)+0
u175_25:
	clrc
	rlf	(i1___lmul@multiplicand),f
	rlf	(i1___lmul@multiplicand+1),f
	rlf	(i1___lmul@multiplicand+2),f
	rlf	(i1___lmul@multiplicand+3),f
	decfsz	(??i1___lmul+0)+0
	goto	u175_25
	line	124
	
i1l2105:	
	movlw	01h
u176_25:
	clrc
	rrf	(i1___lmul@multiplier+3),f
	rrf	(i1___lmul@multiplier+2),f
	rrf	(i1___lmul@multiplier+1),f
	rrf	(i1___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u176_25

	line	125
	movf	(i1___lmul@multiplier+3),w
	iorwf	(i1___lmul@multiplier+2),w
	iorwf	(i1___lmul@multiplier+1),w
	iorwf	(i1___lmul@multiplier),w
	skipz
	goto	u177_21
	goto	u177_20
u177_21:
	goto	i1l2099
u177_20:
	line	128
	
i1l2107:	
	movf	(i1___lmul@product+3),w
	movwf	(?i1___lmul+3)
	movf	(i1___lmul@product+2),w
	movwf	(?i1___lmul+2)
	movf	(i1___lmul@product+1),w
	movwf	(?i1___lmul+1)
	movf	(i1___lmul@product),w
	movwf	(?i1___lmul)

	line	129
	
i1l465:	
	return
	callstack 0
GLOBAL	__end_ofi1___lmul
	__end_ofi1___lmul:
	signat	i1___lmul,8284
	global	i1___wmul

;; *************** function i1___wmul *****************
;; Defined at:
;;		line 15 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul16.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2   13[BANK0 ] unsigned int 
;;  multiplicand    2   15[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2   17[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   13[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text34,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul16.c"
	line	15
global __ptext34
__ptext34:	;psect for function i1___wmul
psect	text34
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\Umul16.c"
	line	15
	
i1___wmul:	
;incstack = 0
	callstack 1
; Regs used in i1___wmul: [wreg+status,2+status,0]
	line	43
	
i1l2355:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(i1___wmul@product)
	clrf	(i1___wmul@product+1)
	line	45
	
i1l2357:	
	btfss	(i1___wmul@multiplier),(0)&7
	goto	u209_21
	goto	u209_20
u209_21:
	goto	i1l451
u209_20:
	line	46
	
i1l2359:	
	movf	(i1___wmul@multiplicand),w
	addwf	(i1___wmul@product),f
	skipnc
	incf	(i1___wmul@product+1),f
	movf	(i1___wmul@multiplicand+1),w
	addwf	(i1___wmul@product+1),f
	
i1l451:	
	line	47
	movlw	01h
	
u210_25:
	clrc
	rlf	(i1___wmul@multiplicand),f
	rlf	(i1___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u210_25
	line	48
	
i1l2361:	
	movlw	01h
	
u211_25:
	clrc
	rrf	(i1___wmul@multiplier+1),f
	rrf	(i1___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u211_25
	line	49
	
i1l2363:	
	movf	((i1___wmul@multiplier)),w
iorwf	((i1___wmul@multiplier+1)),w
	btfss	status,2
	goto	u212_21
	goto	u212_20
u212_21:
	goto	i1l2357
u212_20:
	line	52
	
i1l2365:	
	movf	(i1___wmul@product+1),w
	movwf	(?i1___wmul+1)
	movf	(i1___wmul@product),w
	movwf	(?i1___wmul)
	line	53
	
i1l453:	
	return
	callstack 0
GLOBAL	__end_ofi1___wmul
	__end_ofi1___wmul:
	signat	i1___wmul,8282
	global	i1___awmod

;; *************** function i1___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    7[BANK0 ] int 
;;  dividend        2    9[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   12[BANK0 ] unsigned char 
;;  counter         1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       6       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text35,local,class=CODE,delta=2,merge=1,group=0
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\awmod.c"
	line	5
global __ptext35
__ptext35:	;psect for function i1___awmod
psect	text35
	file	"C:\Program Files\Microchip\xc8\v2.40\pic\sources\c90\common\awmod.c"
	line	5
	
i1___awmod:	
;incstack = 0
	callstack 1
; Regs used in i1___awmod: [wreg+status,2+status,0]
	line	12
	
i1l2369:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(i1___awmod@sign)
	line	13
	
i1l2371:	
	btfss	(i1___awmod@dividend+1),7
	goto	u213_21
	goto	u213_20
u213_21:
	goto	i1l2377
u213_20:
	line	14
	
i1l2373:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	15
	
i1l2375:	
	clrf	(i1___awmod@sign)
	incf	(i1___awmod@sign),f
	line	17
	
i1l2377:	
	btfss	(i1___awmod@divisor+1),7
	goto	u214_21
	goto	u214_20
u214_21:
	goto	i1l2381
u214_20:
	line	18
	
i1l2379:	
	comf	(i1___awmod@divisor),f
	comf	(i1___awmod@divisor+1),f
	incf	(i1___awmod@divisor),f
	skipnz
	incf	(i1___awmod@divisor+1),f
	line	19
	
i1l2381:	
	movf	((i1___awmod@divisor)),w
iorwf	((i1___awmod@divisor+1)),w
	btfsc	status,2
	goto	u215_21
	goto	u215_20
u215_21:
	goto	i1l2399
u215_20:
	line	20
	
i1l2383:	
	clrf	(i1___awmod@counter)
	incf	(i1___awmod@counter),f
	line	21
	goto	i1l2389
	line	22
	
i1l2385:	
	movlw	01h
	
u216_25:
	clrc
	rlf	(i1___awmod@divisor),f
	rlf	(i1___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u216_25
	line	23
	
i1l2387:	
	movlw	low(01h)
	movwf	(??i1___awmod+0)+0
	movf	(??i1___awmod+0)+0,w
	addwf	(i1___awmod@counter),f
	line	21
	
i1l2389:	
	btfss	(i1___awmod@divisor+1),(15)&7
	goto	u217_21
	goto	u217_20
u217_21:
	goto	i1l2385
u217_20:
	line	26
	
i1l2391:	
	movf	(i1___awmod@divisor+1),w
	subwf	(i1___awmod@dividend+1),w
	skipz
	goto	u218_25
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),w
u218_25:
	skipc
	goto	u218_21
	goto	u218_20
u218_21:
	goto	i1l2395
u218_20:
	line	27
	
i1l2393:	
	movf	(i1___awmod@divisor),w
	subwf	(i1___awmod@dividend),f
	movf	(i1___awmod@divisor+1),w
	skipc
	decf	(i1___awmod@dividend+1),f
	subwf	(i1___awmod@dividend+1),f
	line	28
	
i1l2395:	
	movlw	01h
	
u219_25:
	clrc
	rrf	(i1___awmod@divisor+1),f
	rrf	(i1___awmod@divisor),f
	addlw	-1
	skipz
	goto	u219_25
	line	29
	
i1l2397:	
	movlw	01h
	subwf	(i1___awmod@counter),f
	btfss	status,2
	goto	u220_21
	goto	u220_20
u220_21:
	goto	i1l2391
u220_20:
	line	31
	
i1l2399:	
	movf	((i1___awmod@sign)),w
	btfsc	status,2
	goto	u221_21
	goto	u221_20
u221_21:
	goto	i1l2403
u221_20:
	line	32
	
i1l2401:	
	comf	(i1___awmod@dividend),f
	comf	(i1___awmod@dividend+1),f
	incf	(i1___awmod@dividend),f
	skipnz
	incf	(i1___awmod@dividend+1),f
	line	33
	
i1l2403:	
	movf	(i1___awmod@dividend+1),w
	movwf	(?i1___awmod+1)
	movf	(i1___awmod@dividend),w
	movwf	(?i1___awmod)
	line	34
	
i1l617:	
	return
	callstack 0
GLOBAL	__end_ofi1___awmod
	__end_ofi1___awmod:
	signat	i1___awmod,8282
	global	i1_UART_TxChar

;; *************** function i1_UART_TxChar *****************
;; Defined at:
;;		line 778 in file "main.c"
;; Parameters:    Size  Location     Type
;;  ch              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ch              1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      void 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_UART_TxString
;; This function uses a non-reentrant model
;;
psect	text36,local,class=CODE,delta=2,merge=1,group=0
	file	"main.c"
	line	778
global __ptext36
__ptext36:	;psect for function i1_UART_TxChar
psect	text36
	file	"main.c"
	line	778
	
i1_UART_TxChar:	
;incstack = 0
	callstack 1
; Regs used in i1_UART_TxChar: [wreg+status,2+status,0]
;i1UART_TxChar@ch stored from wreg
	movwf	(i1UART_TxChar@ch)
	line	781
	
i1l2349:	
;main.c: 778: void UART_TxChar(char ch);main.c: 779: {;main.c: 781:     while(!(PIR1 & 0x10));
	
i1l308:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(12),(4)&7	;volatile
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l308
u208_20:
	line	783
	
i1l2351:	
;main.c: 783:     PIR1 &= ~0x10;
	movlw	low(0EFh)
	movwf	(??i1_UART_TxChar+0)+0
	movf	(??i1_UART_TxChar+0)+0,w
	andwf	(12),f	;volatile
	line	785
	
i1l2353:	
;main.c: 785:     TXREG = ch;
	movf	(i1UART_TxChar@ch),w
	movwf	(25)	;volatile
	line	786
	
i1l311:	
	return
	callstack 0
GLOBAL	__end_ofi1_UART_TxChar
	__end_ofi1_UART_TxChar:
	signat	i1_UART_TxChar,4185
global	___latbits
___latbits	equ	2
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	end
