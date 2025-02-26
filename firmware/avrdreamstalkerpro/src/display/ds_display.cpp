/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2025	ORPAL Technologies, Inc.
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
#include <util/atomic.h>

#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "ds_config.h"
#include "ds_rtclock.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define DDR_SEG			DDRA
#define DDR_DIG			DDRC

#define PORT_SEG		PORTA
#define PORT_DIG		PORTC

#define DD_DIG1		_BV(DDC4)
#define DD_DIG2		_BV(DDC5)
#define DD_DIG3		_BV(DDC6)
#define DD_DIG4		_BV(DDC7)

#define PF_DIG1		_BV(PC4)
#define PF_DIG2		_BV(PC5)
#define PF_DIG3		_BV(PC6)
#define PF_DIG4		_BV(PC7)

#define SEGA		_BV(PA0)
#define SEGB		_BV(PA1)
#define SEGC		_BV(PA2)
#define SEGD		_BV(PA3)
#define SEGE		_BV(PA4)
#define SEGF		_BV(PA5)
#define SEGG		_BV(PA6)
#define SEGH		_BV(PA7)

#define	DD_ALL_DIG	((uint8_t)(DD_DIG1 | DD_DIG2 | DD_DIG3 | DD_DIG4))
#define	DD_ALL_SEG	0xFFU

#define	PF_ALL_DIG	((uint8_t)(PF_DIG1 | PF_DIG2 | PF_DIG3 | PF_DIG4))
#define	PF_ALL_SEG	0xFFU

/*-----------------------------------------------------------------------*/
#define NDIGITS	4

#ifdef DISP_NUM_CODE_ENABLE

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

#endif	// DISP_NUM_CODE_ENABLE

PROGMEM const uint8_t ascii_code[] = {
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,
	0,
	0,
	/* */ 0,
	0,0,0,0,0,0,0,0,0,0,
	/*+*/ 0,
	/*,*/ 0,
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
	/*:*/ 0,
	/*;*/ 0,
	0,
	/*=*/ 0,
	0,
	/*?*/ 0,
	0,
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
	0,
	0,
	0,
	0,
	/*_*/						  SEGD,
	0,
	/*a*/ 0,
	/*b*/ 				  SEGC	| SEGD	| SEGE	| SEGF	| SEGG,
	/*c*/						  SEGD	| SEGE			| SEGG,
	/*d*/		  SEGB	| SEGC	| SEGD	| SEGE			| SEGG,
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
	/*r*/ 								  SEGE			| SEGG,
	/*s*/ 0,
	/*t*/						  SEGD	| SEGE	| SEGF	| SEGG,
	/*u*/ 				  SEGC	| SEGD	| SEGE,
	/*v*/ 0,
	/*w*/ 0,
	/*x*/ 0,
	/*y*/ 		  SEGB	| SEGC	| SEGD			| SEGF	| SEGG,
	/*z*/ 0,
};

PROGMEM const uint8_t pf_digits[NDIGITS] = {
	PF_DIG1,
	PF_DIG2,
	PF_DIG3,
	PF_DIG4
};

/*-----------------------------------------------------------------------*/

static
uint8_t get_ascii_code (int index)
{
  return pgm_read_byte_far ( &(ascii_code[ index ]));
}

#ifdef DISP_NUM_CODE_ENABLE

static
uint8_t get_num_code (int index)
{
  return pgm_read_byte_far( &num_code[ index ] );
}
#endif

static
uint8_t get_pf_digit ( int index )
{
  return pgm_read_byte_far ( &pf_digits[ index ] );
}

/*-----------------------------------------------------------------------*/
static
void pins_off (void)
{
  DDR_DIG &= ~DD_ALL_DIG;		/* set digits inputs */
  DDR_SEG = 0x00;				/* set segments inputs */

  PORT_DIG |= PF_ALL_DIG;		/* high-Z */
  PORT_SEG = 0x00;			/* high-Z */
}

static
void pins_on (void)
{
  DDR_DIG |= DD_ALL_DIG;		/* set digits outputs */
  DDR_SEG = DD_ALL_SEG;			/* set segments outputs */

  PORT_DIG |= PF_ALL_DIG;		/* drive high */
  PORT_SEG |= PF_ALL_SEG;		/* drive high */
}


/*-----------------------------------------------------------------------*/
void Display::handle_isr (void)
{
	disp.irq_handler ();
}

uint32_t Display::get_cycle_us (void)
{
  return RTClock::isr_period_us ();
}

/*-----------------------------------------------------------------------*/
void LED4D7S_Display::irq_handler (void)
{
  if (! enabled)
	return;

  PORT_DIG = ( PORT_DIG | PF_ALL_DIG ) & ~get_pf_digit (dig_index);
  PORT_SEG = PF_ALL_SEG & ~pf_segments[ dig_index ];

  dig_index = ( dig_index + 1 ) % NDIGITS;	/* Increment digit counter */
}

bool LED4D7S_Display::init (void)
{
  dig_index = 0;
  enabled = false;

  for (uint8_t i = 0; i < NDIGITS; i++)
  	pf_segments[0] = 0;

  pins_off ();

  return true;
}

void LED4D7S_Display::enable_unsafe (void)
{
  if (enabled)
	return;

  pins_on ();

  enabled = true;
}

void LED4D7S_Display::enable (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
	enable_unsafe ();
  }
}

void LED4D7S_Display::disable_unsafe (void)
{
  if (! enabled)
	return;

  pins_off ();

  clear_unsafe ();

  enabled = false;
}

void LED4D7S_Display::disable (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
	disable_unsafe ();
  }
}

bool LED4D7S_Display::is_enabled (void)
{
  return enabled;
}

void LED4D7S_Display::clear_unsafe (void)
{
  for (uint8_t i = 0; i < NDIGITS; i++ )
	pf_segments[ i ] = 0;
}

void LED4D7S_Display::clear (void)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
	clear_unsafe ();
  }
}

void LED4D7S_Display::text_out_unsafe (const char *text)
{
  uint8_t len, pos;
  uint8_t i = 0;

  len = strlen (text);
  if (len == 0)
	return;

  clear_unsafe ();

  for ( pos=0; pos<len; pos++ ) {
	if ( i>0 && text[ pos ]=='.' ) {
		pf_segments[ i-1 ] |= SEGH;
	} else {
		if ( i< NDIGITS ) {
			pf_segments[ i ] = get_ascii_code ((int)text[ pos ]);
			i++;
		} else
			break;
	}
  }

  /*
   * Process global flags
   */
  if (RTC.wakeup_timer_is_set ())
	pf_segments[NDIGITS-1] |= SEGH;

}

void LED4D7S_Display::text_out (const char *text)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
	text_out_unsafe (text);
  }
}

void LED4D7S_Display::version (char ver_type, uint16_t ver, uint16_t cycles_to_wait)
{
  char msg[ 6 ];

  snprintf (msg, 6, __disp_msg_version__, 
			ver_type, VER_MAJOR (ver), VER_MINOR (ver));
  message (msg, cycles_to_wait);
}

#ifdef DISP_NUM_CODE_ENABLE

void LED4D7S_Display::disp_hex ( uint16_t num )
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
	pf_segments[ 3 ] = get_num_code ( (num >> 0) & 0xF );
	pf_segments[ 2 ] = get_num_code ( (num >> 4) & 0xF );
	pf_segments[ 1 ] = get_num_code ( (num >> 8) & 0xF );
	pf_segments[ 0 ] = get_num_code ( (num >> 12) & 0xF );
  }

  wait_one_cycle ();
}
#endif

void LED4D7S_Display::number ( uint16_t num )
{
  char msg[ 5 ];

  if ( num > 9999 )
	strcpy ( msg, __disp_msg_bad_number__ );
  else
	snprintf ( msg, 5, "%4u", num );

  message ( msg, 1 );
}

/*
 * Displays 4 symbols of the text
 */
void LED4D7S_Display::message (const char *text, uint16_t cycles_to_wait)
{
  text_out (text);

  if (cycles_to_wait == 0)
	cycles_to_wait = 1;

  wait_cycles (cycles_to_wait);
}

void LED4D7S_Display::time (uint8_t hour, unsigned minute)
{
  char msg[6];

  if (minute > 59) {
	hour = minute / 60;
	minute = minute - ( 60U * hour );
  }

  if (hour > 23)
  	hour = 23;

  snprintf ( msg, 6, "%02u.%02u", (unsigned)hour, minute );

  text_out ( msg );
}

void LED4D7S_Display::flag (bool flag_val)
{
  if (flag_val)
	message (__disp_msg_on__, 1);
  else
	message (__disp_msg_off__, 1);
}

void LED4D7S_Display::confirm (void)
{
  message (__disp_msg_confirm__, 1);
}

void LED4D7S_Display::wait_one_cycle (void)
{
  _delay_us (get_cycle_us ());
}

void LED4D7S_Display::wait_cycles (unsigned num_cycles)
{
  for (unsigned i = 0; i < num_cycles; i++)
	wait_one_cycle ();
}

/*-----------------------------------------------------------------------*/

void LED4D7S_Display::test_on (void)
{
	pins_on ();

	/* Power ON all digits & segments */
	PORT_DIG &= ~PF_ALL_DIG;	/* drive low */
	PORT_SEG = 0x00;			/* drive low */
}

void LED4D7S_Display::test_off (void)
{
	pins_off ();
}
