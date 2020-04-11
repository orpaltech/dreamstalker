/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2019	ORPAL Technologies, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include <util/delay.h>
#include <stdio.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

#include "display.h"
#include "rtclock.h"
//#include "timers.h"
#include "dreamstalker.h"

/* Peripheral controls (Platform dependent) */
#define DD_DIG1		_BV(DDC4)
#define DD_DIG2		_BV(DDC5)
#define DD_DIG3		_BV(DDC6)
#define DD_DIG4		_BV(DDC7)

#define BIT_DIG1		PC4
#define BIT_DIG2		PC5
#define BIT_DIG3		PC6
#define BIT_DIG4		PC7

#define DIG1		_BV(BIT_DIG1)
#define DIG2		_BV(BIT_DIG2)
#define DIG3		_BV(BIT_DIG3)
#define DIG4		_BV(BIT_DIG4)

#define SEGA		_BV(PA0)
#define SEGB		_BV(PA1)
#define SEGC		_BV(PA2)
#define SEGD		_BV(PA3)
#define SEGE		_BV(PA4)
#define SEGF		_BV(PA5)
#define SEGG		_BV(PA6)
#define SEGH		_BV(PA7)

#define DDR_SEG			DDRA
#define DDR_DIG			DDRC
#define PORT_SEG		PORTA
#define PORT_DIG		PORTC


/*-----------------------------------------------------------------------*/
PROGMEM const uint8_t num_code[] = {
	/*0*/ SEGA	| SEGB	| SEGC	| SEGD	| SEGE	| SEGF,
	/*1*/		  SEGB	| SEGC,
	/*2*/ SEGA	| SEGB			| SEGD	| SEGE			| SEGG,
	/*3*/ SEGA	| SEGB	| SEGC	| SEGD					| SEGG,
	/*4*/ 		  SEGB	| SEGC					| SEGF	| SEGG,
	/*5*/ SEGA			| SEGC	| SEGD			| SEGF	| SEGG,
	/*6*/ SEGA			| SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*7*/ SEGA	| SEGB	| SEGC,
	/*8*/ SEGA	| SEGB	| SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*9*/ SEGA	| SEGB	| SEGC	| SEGD			| SEGF	| SEGG,
	/*A*/ SEGA	| SEGB	| SEGC			| SEGE	| SEGF	| SEGG,
	/*b*/				  SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*C*/ SEGA					| SEGD	| SEGE	| SEGF,
	/*d*/		  SEGB	| SEGC	| SEGD	| SEGE			| SEGG,
	/*E*/ SEGA					| SEGD	| SEGE	| SEGF	| SEGG,
	/*F*/ SEGA							| SEGE	| SEGF	| SEGG,
};

PROGMEM const uint8_t ascii_code[] = {
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,
	/* */ 0,
	0,0,0,0,0,0,0,
	0,0,0,0,0,
	/*-*/ 												  SEGG,
	/*.*/														  SEGH,
	0,
	/*0*/ SEGA	| SEGB	| SEGC	| SEGD	| SEGE	| SEGF,
	/*1*/		  SEGB	| SEGC,
	/*2*/ SEGA	| SEGB			| SEGD	| SEGE			| SEGG,
	/*3*/ SEGA	| SEGB	| SEGC	| SEGD					| SEGG,
	/*4*/ 		  SEGB	| SEGC					| SEGF	| SEGG,
	/*5*/ SEGA			| SEGC	| SEGD			| SEGF	| SEGG,
	/*6*/ SEGA			| SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*7*/ SEGA	| SEGB	| SEGC,
	/*8*/ SEGA	| SEGB	| SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*9*/ SEGA	| SEGB	| SEGC	| SEGD			| SEGF	| SEGG,
	0,0,0,0,0,0,0,
	/*A*/ SEGA	| SEGB	| SEGC			| SEGE	| SEGF	| SEGG,
	/*B*/ 0,
	/*C*/ SEGA					| SEGD	| SEGE	| SEGF,
	/*D*/ 0,
	/*E*/ SEGA					| SEGD	| SEGE	| SEGF	| SEGG,
	/*F*/ SEGA							| SEGE	| SEGF	| SEGG,
	/*G*/ SEGA			| SEGC	| SEGD	| SEGE	| SEGF,
	/*H*/ 		  SEGB	| SEGC			| SEGE	| SEGF	| SEGG,
	/*I*/		  SEGB	| SEGC,
	/*J*/ 		  SEGB	| SEGC	| SEGD,
	/*K*/ 0,
	/*L*/ 						  SEGD	| SEGE	| SEGF,
	/*M*/ 0,
	/*N*/ 0,
	/*O*/ SEGA	| SEGB	| SEGC	| SEGD	| SEGE	| SEGF,
	/*P*/ SEGA	| SEGB					| SEGE	| SEGF	| SEGG,
	/*Q*/ 0,
	/*R*/ 0,
	/*S*/ SEGA			| SEGC	| SEGD			| SEGF	| SEGG,
	/*T*/ 0,
	/*U*/ 		  SEGB	| SEGC	| SEGD	| SEGE	| SEGF,
	/*V*/ 0,
	/*W*/ 0,
	/*X*/ 0,
	/*Y*/ 0,
	/*Z*/ 0,
	0,0,0,0,
	/*_*/						  SEGD,
	0,
	/*a*/ 0,
	/*b*/ 				  SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*c*/						  SEGD	| SEGE			| SEGG,
	/*d*/ 		SEGB	| SEGC	| SEGD	| SEGE			| SEGG,
	/*e*/ 0,
	/*f*/ 0,
	/*g*/ SEGA	| SEGB	| SEGC	| SEGD			| SEGF	| SEGG,
	/*h*/ 				  SEGC			| SEGE	| SEGF	| SEGG,
	/*i*/ 0,
	/*j*/ 0,
	/*k*/ 0,
	/*l*/ 0,
	/*m*/ 0,
	/*n*/ 				  SEGC			| SEGE			| SEGG,
	/*o*/				  SEGC	| SEGD	| SEGE			| SEGG,
	/*p*/ SEGA	| SEGB					| SEGE	| SEGF	| SEGG,
	/*q*/ SEGA	| SEGB	| SEGC					| SEGF	| SEGG,
	/*r*/ 									SEGE		| SEGG,
	/*s*/ 0,
	/*t*/						  SEGD	| SEGE	| SEGF	| SEGG,
	/*u*/ 				  SEGC	| SEGD	| SEGE,
	/*v*/ 0,
	/*w*/ 0,
	/*x*/ 0,
	/*y*/ 		  SEGB	| SEGC	| SEGD			| SEGF	| SEGG,
	/*z*/ 0,
};

/*-----------------------------------------------------------------------*/
static volatile uint8_t counter = 0;
static volatile uint8_t seg_data[4] = {0x00,0x00,0x00,0x00};
static uint8_t digits[4] = {DIG1,DIG2,DIG3,DIG4};

/*-----------------------------------------------------------------------*/
static
void disp_pins_off()
{
	PORT_DIG |= (DIG1 | DIG2 | DIG3 | DIG4);	// switch-off digits
	PORT_SEG |= 0xFF;							// switch-off segments
}

void disp_isr (void)
{
	disp_pins_off();

	PORT_DIG &= ~digits[counter];
	PORT_SEG &= ~seg_data[counter];	/* Write code */
	counter = (counter + 1) % 4;	/* Increment digit counter */
}

static
void disp_timer_on()
{
	//timer2_on(disp_isr, 1);
}

static
void disp_timer_off()
{
	//timer2_off(disp_isr);
}

static
uint8_t get_num_code(int index)
{
	return pgm_read_byte(&(num_code[index]));
}

static
uint8_t get_ascii_code(int index)
{
	return pgm_read_byte(&(ascii_code[index]));
}

static
void wait_cycle (void)
{
	_delay_ms(disp_get_cycle_ms());
}


/*-----------------------------------------------------------------------*/

void disp_init (void)
{
	DDR_SEG |= 0xFF;									// segment outputs
	DDR_DIG |= (DD_DIG1 | DD_DIG2 | DD_DIG3 | DD_DIG4);	// digit outputs

	disp_on();
}

void disp_on (void)
{
	disp_pins_off();

	wait_cycle();

	disp_timer_on();
}

void disp_off (void)
{
	disp_timer_off();

	wait_cycle();

	disp_pins_off();
}

int disp_get_cycle_ms(void)
{
	return RTC_INTERVAL_MSEC;
}

void disp_clear (void)
{
	seg_data[0] = 0;
	seg_data[1] = 0;
	seg_data[2] = 0;
	seg_data[3] = 0;
}

void disp_text(const char *text)
{
	int len, pos, i;

	len = strlen(text);
	if (len==0)
		return;

	for (i=0; i<4; i++)
		seg_data[i] = 0;

	for (i=0,pos=0; pos<len; pos++) {
		if(i>0 && text[pos]=='.') {
			seg_data[i-1] |= SEGH;
		} else {
			if(i<4) {
				seg_data[i] = get_ascii_code((int)text[pos]);
				i++;
			} else
				break;
		}
	}
}

void disp_version (char type, uint16_t ver, int cycles)
{
	char msg[6];

	snprintf(msg, 6, "%c%01u.%02u", type, VER_MAJOR(ver), VER_MINOR(ver));
	disp_msg(msg, cycles);
}

void disp_hex(uint16_t num)
{
	seg_data[3] = get_num_code((num >> 0) & 0xF);
	seg_data[2] = get_num_code((num >> 4) & 0xF);
	seg_data[1] = get_num_code((num >> 8) & 0xF);
	seg_data[0] = get_num_code((num >> 12) & 0xF);

	wait_cycle();
}

void disp_dec (uint16_t num)
{
	char msg[5];

	if (num>9999)
		strcpy(msg, "EEEE");
	else
		snprintf(msg, 5, "%4u", num);
	disp_msg(msg, 1);
}

/*
 * Displays first 4 symbols of the text
 */
void disp_msg(const char *text, int cycles)
{
	disp_text(text);

	if (cycles < 1)
		cycles = 1;
	while (--cycles>=0)
		wait_cycle();
}

void disp_flag (int flag_val)
{
	if (flag_val)
		disp_msg("  On", 1);
	else
		disp_msg(" OFF", 1);
}

void disp_wakeup_timer_delay (void)
{
	uint8_t hour, minute;
	uint16_t delay;
	char msg[6];

	if (is_invalid_wakeup_timer_delay())
		strcpy(msg, " OFF");
	else {
		delay = get_wakeup_timer_delay();
		hour = delay / 60;
		minute = delay - (hour * 60);
		snprintf(msg, 6, "%02u.%02u", hour, minute);
	}

	disp_text(msg);
}

