/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2024	ORPAL Technologies, Inc.
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

#include <stdio.h>
#include <string.h>

#include <avr/io.h>
#include <compat/ina90.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "input/ds_keybrd.h"
#include "display/ds_display.h"
#include "sound/ds_sound.h"

#include "ds_deferred.h"
#include "ds_strobe.h"
#include "ds_batmon.h"
#include "ds_sdcard.h"
#include "ds_rtclk.h"


/*-----------------------------------------------------------------------*/
#define RTC_OFF_DELAY_SEC	30U		/* seconds, max 60 */

/*-----------------------------------------------------------------------*/
typedef struct s_rtc_context {
	uint8_t hour : 5;
	uint8_t minute : 6;
	uint8_t second : 6;
	uint16_t ticks0;
	uint8_t ticks1;
	uint16_t flags : 8;
	uint8_t oper_mode : 2;
	uint8_t setup_mode : 2;
	uint8_t off_count : 6;
} rtc_context_t;

/*-----------------------------------------------------------------------*/
static volatile rtc_context_t rtc;

/*-----------------------------------------------------------------------*/
static
void rtc_display (int hour, int minute, uint8_t flags);

/*-----------------------------------------------------------------------*/
/* Interrupt Handler 													 */
/*-----------------------------------------------------------------------*/
#if defined (__AVR_ATmega128__)
ISR(TIMER0_COMP_vect)
#elif defined (__AVR_ATmega1281__)
ISR(TIMER2_COMPA_vect)
#endif
{
	if( rtc.oper_mode == RTC_OPM_POWERSAVE )  {
		/* Power-save mode */

		/*
		 * get here every SECOND
		 */
		rtc.second = ( rtc.second + 1 ) % 60;
		if( rtc.second == 0 ) {
			/*
			 * get here every MINUTE
			 */
			rtc.minute = ( rtc.minute + 1 ) % 60;
			if( rtc.minute == 0 ) {
				/*
				 * get here every HOUR
				 */
				rtc.hour = ( rtc.hour + 1 ) % 24;
			}
		}
		rtc_flag_set ( RTC_TICK_MARK );
		return;
	}

	/* Normal mode */

	uint16_t ticks_1sec = rtc_msec_to_ticks ( 1000 );
	uint8_t ticks_200ms = rtc_msec_to_ticks ( 200 );

	/* Let keyboard first process the interrupt */
	if( keybrd_isr () ) {
		/* Reset display-off counter on a key press */
		disp_enable_unsafe ();
		rtc.off_count = 0;
	}

	/* Let other subsystems process interrupt */
	deferred_isr ();
	display_isr ();
	strobe_isr ();
	sd_card_isr ();

	rtc.ticks0 = ( rtc.ticks0 + 1 ) % ticks_1sec;
	if( rtc.ticks0 == 0 )
	{
		/*
		 * get here every SECOND
		 */
		if( rtc.off_count < RTC_OFF_DELAY_SEC ) {
			++rtc.off_count;
			if( ( rtc.off_count >= RTC_OFF_DELAY_SEC )
				&& rtc_is_visible () 
				&& !rtc_is_setup ())
				disp_disable_unsafe ();
		}

		rtc.second = ( rtc.second + 1 ) % 60;
		if( rtc.second == 0 )
		{
			/*
			 * get here every MINUTE
			 */
			rtc.minute = ( rtc.minute + 1 ) % 60;
			if( rtc.minute == 0 ) {
				/*
				 * get here every HOUR
				 */
				rtc.hour = ( rtc.hour + 1 ) % 24;
			}

			if( rtc_flag_is_set ( RTC_WAKEUP_TIMER ))
			{
				/* wakeup timer is active */
			}

			/* Call battery monitor once a minute */
			batmon_isr ();
		}

		rtc_flag_toggle ( RTC_SHOW_DOT );

		if(! rtc_is_setup ())
		{
			rtc_flag_set ( RTC_SHOW_HOUR | RTC_SHOW_MINUTE );

			if( rtc_is_visible ()) {
				rtc_display( rtc.hour, rtc.minute, rtc.flags );
			}
		}
	}

	rtc.ticks1 = ( rtc.ticks1 + 1 ) % ticks_200ms;
	if( rtc_is_setup () && rtc.ticks1 == 0 )
	{
		/*
		 * get here around 5 times/sec
		 */
		switch( rtc_get_setup ())
		{
		case RTC_SETUP_MINUTE:
			rtc_flag_set ( RTC_SHOW_HOUR );
			rtc_flag_toggle ( RTC_SHOW_MINUTE );
			break;

		case RTC_SETUP_HOUR:
			rtc_flag_set ( RTC_SHOW_MINUTE );
			rtc_flag_toggle ( RTC_SHOW_HOUR );
			break;
		}

		if( rtc_is_visible () )
		{
			/* Hide wakeup timer indicator as we are 
			 *	in the clock setup mode
			 */
			rtc_display ( rtc.hour, rtc.minute, 
						rtc.flags & ~RTC_WAKEUP_TIMER );
		}
	}
}

/*-----------------------------------------------------------------------*/
void rtc_wait_for_tick ( void )
{
	ATOMIC_BLOCK( ATOMIC_RESTORESTATE ) {
		rtc_flag_unset ( RTC_TICK_MARK );
	}
	while ( !rtc_flag_is_set( RTC_TICK_MARK ))
		_NOP() ;
}

void rtc_init ( void )
{
	rtc.flags = 0;
	rtc.hour = 12;
	rtc.minute = 0;
	rtc.second = 0;
	rtc.ticks0 = 0;
	rtc.ticks1 = 0;
	rtc.setup_mode = RTC_SETUP_NONE;
	rtc.off_count = 0;

	rtc_flag_set ( RTC_SHOW_HOUR | RTC_SHOW_MINUTE );

	_delay_ms ( 200 );	/* let 32KHz XTAL stabilize */
}

void rtc_start ( rtc_oper_mode_t mode )
{
#if defined (__AVR_ATmega128__)

	/*
	 * Timer/Counter 0 is used on atmega128 
	 */

	TIMSK &= ~(_BV(OCIE0) | _BV(TOIE0));	/* Disable interrupts */

	/* When AS0 is written to 1, Timer/Counter is clocked
	 *	from a XTAL connected to the TOSC1 pin
	 */
	ASSR = _BV(AS0);

	/* The timer input clock is TOSC=32768 Hz */

	/* Set CTC mode: TOP - OCR0, TOV0 is set on MAX */
	TCCR0 = _BV(WGM01);

	TCNT0 = 0;	/* Reset counter */

	if ( mode == RTC_OPM_POWERSAVE ) {

		/* Period 1000ms = 1sec*/

		TCCR0 |= (_BV(CS02) | _BV(CS01));	/*256x prescaler, clk=TOSC/256=128 */
		/* Generate 1s interrupts.
		 * Max Error: (1 / 128 * 128) − 1 = 0 (s)
		 */
		OCR0 = 128;

		rtc.oper_mode = RTC_OPM_POWERSAVE;

	} else { /* Normal mode*/

		/* Period: 1ms */

		TCCR0 |= _BV(CS00);					/*1x prescaler, clk=TOSC*/
		/* Generate 1ms interrupts.
	 	 * Max Error: (1 / 32768 * 33) − 0.001 = 0.0000070800781 (s) */
		OCR0 = 33;

		rtc.oper_mode = RTC_OPM_DEFAULT;
	}

	// Wait for TCN0UB, OCR0UB, and TCR0UB
	// in order to switch to asynchronous operation
	while( ASSR & (_BV(TCN0UB) | _BV(TCR0UB) | _BV(OCR0UB)) );

	TIFR	&= ~(_BV(OCF0)|_BV(TOV0));	/* Clear interrupt flags */
	TIMSK	|= _BV(OCIE0);				/* Enable interrupt */

#elif defined (__AVR_ATmega1281__)

	/* 
	 * Timer/Counter 2 is be used on atmega1281 
	 */

	TIMSK2 &= ~(_BV(OCIE2A) | _BV(OCIE2B) | _BV(TOIE2));	/* Disable interrupts */

	/* When AS2 is written to 1, Timer/Counter 2 is clocked
		from a XTAL connected to the TOSC1 pin */
	ASSR = _BV(AS2);

	TCNT2 = 0;	/* Reset counter */

	/* The timer input clock is 32768 Hz */
	/* Set CTC mode: TOP - OCRA, TOV is set on MAX */
	TCCR2A = _BV(WGM21);

	if ( mode == RTC_OPM_POWERSAVE ) {

		/* Period 1000ms = 1sec*/

		TCCR2B = (_BV(CS22) | _BV(CS21));	/*256x prescaler, clk=TOSC/256=128 */
		/* Generate 1s interrupts.
		 * Max Error: (1 / 128 * 128) − 1 = 0 (s)
		 */
		OCR2A = 128;

		rtc.oper_mode = RTC_OPM_POWERSAVE;

	} else { /* Normal mode*/

		/* Period: 1ms */

		TCCR2B = _BV(CS20);	/* 1x prescaler  */
		/* Generate 1ms interrupts.
	 	 * Max Error: (1 / 32768 * 33) − 0.001 = 0.0000070800781 (s) 
		 */
		OCR2A = 33;

		rtc.oper_mode = RTC_OPM_DEFAULT;
	}

	/* Wait for TCN2UB, OCR2AUB, and TCR2AUB in order 
	 *		to switch to asynchronous operation 
	*/
	while( ASSR & (_BV(TCN2UB) | _BV(TCR2AUB) | _BV(OCR2AUB)) );

	TIFR2	= 0;			/* Clear interrupt flags */
	TIMSK2	= _BV(OCIE2A);	/* Enable interrupt */

#endif
}

uint32_t rtc_msec_to_ticks ( uint32_t ms )
{
	return ms / RTC_INTERVAL_MSEC;
}

void rtc_show ( void )
{
	rtc_flag_set ( RTC_VISIBLE );
}

void rtc_hide ( void )
{
	rtc_flag_unset ( RTC_VISIBLE );
}

bool rtc_is_visible ( void )
{
	return rtc_flag_is_set ( RTC_VISIBLE );
}

bool rtc_is_setup ( void )
{
	return !( rtc_get_setup () == RTC_SETUP_NONE );
}

void rtc_set_setup ( rtc_setup_mode_t mode )
{
	rtc.setup_mode = mode;
}

rtc_setup_mode_t rtc_get_setup ( void )
{
	return rtc.setup_mode;
}

void rtc_flag_set ( uint16_t flag )
{
	rtc.flags |= flag;
}

void rtc_flag_unset ( uint16_t flag )
{
	rtc.flags &= ~flag;
}

void rtc_flag_toggle ( uint16_t flag )
{
	rtc.flags ^= flag;
}

bool rtc_flag_is_set ( uint16_t flag )
{
	return ( ( rtc.flags & flag ) == flag );
}

void rtc_setup_inc ( int sign )
{
	switch (rtc_get_setup ()) {
	case RTC_SETUP_MINUTE:
		ATOMIC_BLOCK( ATOMIC_RESTORESTATE ) {
			if ( sign < 0 ) {
				rtc.minute--;
			} else {
				rtc.minute++;
			}
			rtc.minute %= 60;
		}
		break;

	case RTC_SETUP_HOUR:
		ATOMIC_BLOCK( ATOMIC_RESTORESTATE ) {
			if ( sign < 0 ) {
				rtc.hour--;
			} else {
				rtc.hour++;
			}
			rtc.hour %= 24;
		}
		break;
	}
}

void rtc_display ( int hour, int minute, uint8_t flags )
{
	static char msg[7];
	char *ptr = msg;

	if (! disp_is_enabled ())
		return;

	if ( flags & RTC_SHOW_HOUR )
		snprintf( ptr, 3, "%02u", hour );
	else
		strcpy( ptr, "  " );
	ptr += 2;

	if ( flags & RTC_SHOW_DOT )
		strcat( ptr++, "." );

	if ( flags & RTC_SHOW_MINUTE )
		snprintf( ptr, 3, "%02u", minute );
	else
		strcat( ptr, "  " );
	ptr += 2;

	if ( flags & RTC_WAKEUP_TIMER )
		strcat( ptr, "." );

	disp_text_unsafe ( msg );
}
