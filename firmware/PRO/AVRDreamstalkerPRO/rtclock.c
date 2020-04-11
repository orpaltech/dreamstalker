/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2020	ORPAL Technologies, Inc.
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
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "display.h"
#include "sound/sound.h"
#include "deferred.h"

#include "input/inputevent.h"
#include "input/keybrd.h"
#include "rtclock.h"
#include "strobe.h"
#include "sdcard.h"
#include "batmon.h"


/* Peripheral controls (Platform dependent) */

#define RTC_DISPLAY_OFF_DELAY	30	/* seconds */

typedef struct s_rtc_context {
	int8_t hour;
	int8_t minute;
	uint8_t second;
	uint16_t ticks0;
	uint8_t ticks1;
	uint8_t flags;
	uint8_t setup_mode;
	uint8_t off_counter;
} rtc_context_t;

/*-----------------------------------------------------------------------*/
static volatile rtc_context_t rtc;

/*-----------------------------------------------------------------------*/
static
void rtc_display (int hour, int minute, uint8_t flags);

static
int rtc_is_disp_off (void);

/*-----------------------------------------------------------------------*/
/* Interrupt Handler 													 */
/*-----------------------------------------------------------------------*/
ISR(TIMER0_COMP_vect)
{
	uint8_t keys;

	keys = keybrd_test();
	input_process(keys);

	/* reset display-off counter if any key pressed */
	if (keys != KEY_NONE)
		rtc.off_counter = 0;

	deferred_isr();
	tonegen_isr();
	disp_isr();
	strobe_isr();
	sdcard_isr();
	batmon_isr();

	rtc.ticks0 = (rtc.ticks0 + 1) % 1000;	/* 1000 ticks = 1 sec */
	if (rtc.ticks0 == 0)
	{
		/*
		 * get here every SECOND
		 */
		if (rtc.off_counter < RTC_DISPLAY_OFF_DELAY) {
			++rtc.off_counter;
			if (rtc_is_disp_off()
				&& rtc_is_visible() && !rtc_is_setup())
				disp_clear();
		}

		rtc.second = (rtc.second + 1) % 60;
		if (rtc.second == 0)
		{
			/*
			 * get here every MINUTE
			 */
			ATOMIC_BLOCK(ATOMIC_FORCEON)
			{
				rtc.minute = (rtc.minute + 1) % 60;
				if (rtc.minute == 0)
				{
					/*
					 * get here every HOUR
					 */
					rtc.hour = (rtc.hour + 1) % 24;
				}
			}

			if (rtc.flags & RTC_WAKEUP_TIMER_IND)
			{
				// wakeup timer is active
			}
		}

		rtc.flags ^= RTC_SHOW_DOT;

		if (! rtc_is_setup())
		{
			rtc.flags |= RTC_SHOW_HOUR;
			rtc.flags |= RTC_SHOW_MINUTE;

			if (rtc_is_visible() && !rtc_is_disp_off())
			{
				rtc_display(rtc.hour, rtc.minute, rtc.flags);
			}
		}
	}

	rtc.ticks1 = (rtc.ticks1 + 1) % 200;	/* 200 ticks = 200 msec */
	if (rtc_is_setup() && rtc.ticks1 == 0)
	{
		// get here around 5 times/sec
		switch (rtc.setup_mode)
		{
		case RTC_SETUP_MINUTE:
			rtc.flags |= RTC_SHOW_HOUR;
			rtc.flags ^= RTC_SHOW_MINUTE;
			break;

		case RTC_SETUP_HOUR:
			rtc.flags |= RTC_SHOW_MINUTE;
			rtc.flags ^= RTC_SHOW_HOUR;
			break;
		}

		if (rtc_is_visible())
		{
			/* do not show wakeup timer indicator */
			rtc_display(rtc.hour, rtc.minute, (rtc.flags & ~RTC_WAKEUP_TIMER_IND));
		}
	}
}

/*-----------------------------------------------------------------------*/
static
void rtc_timer_on (void)
{
	TIMSK &= ~(_BV(OCIE0) | _BV(TOIE0));	/* Disable interrupts */

	// When AS0 is written to 1, Timer/Counter is clocked
	// from a Xtal connected to the TOSC1 pin
	ASSR = _BV(AS0);

	/* The timer input clock is 32768 Hz */
	TCCR0 = (_BV(WGM01) | _BV(CS00));	/* CTC mode, 1x prescaler */

	TCNT0 = 0;
#if RTC_INTERVAL_MSEC == 5
	/* Generate 5ms interrupts.
	 * Max Error: (1 / 32768 * 164) − 0.005 = 0.0000048828125 (s) */
	OCR0 = 164;
#elif RTC_INTERVAL_MSEC == 1
	/* Generate 1ms interrupts.
	 * Max Error: (1 / 32768 * 33) − 0.001 = 0.0000070800781 (s) */
	OCR0 = 33;
#endif
	// Wait for TCN0UB, OCR0UB, and TCR0UB
	// in order to switch to asynchronous operation
	while( ASSR & (_BV(TCN0UB) | _BV(TCR0UB) | _BV(OCR0UB)) );

	TIFR &= ~(_BV(OCF0) | _BV(TOV0));	/* Reset interrupt flags */
	TIMSK |= _BV(OCIE0);				/* Enable interrupt */
}

/*-----------------------------------------------------------------------*/
void rtc_init (void)
{
	rtc.hour = 12;
	rtc.minute = 0;
	rtc.second = 0;
	rtc.ticks0 = 0;
	rtc.ticks1 = 0;
	rtc.flags = RTC_SHOW_HOUR | RTC_SHOW_MINUTE;
	rtc.setup_mode = RTC_SETUP_NONE;
	rtc.off_counter = 0;

	_delay_ms(300);	/* let the 32KHz crystal stabilize */

	rtc_timer_on();
}

void rtc_show (void)
{
	rtc.flags |= RTC_FLAG_VISIBLE;
}

void rtc_hide (void)
{
	rtc.flags &= ~RTC_FLAG_VISIBLE;

	disp_clear();
}

int rtc_is_visible (void)
{
	return ((rtc.flags & RTC_FLAG_VISIBLE) != 0);
}

int rtc_is_disp_off (void)
{
	return (rtc.off_counter >= RTC_DISPLAY_OFF_DELAY);
}

int rtc_is_setup (void)
{
	return (rtc.setup_mode != RTC_SETUP_NONE);
}

void rtc_setup (rtc_setup_mode_t mode)
{
	rtc.setup_mode = mode;
}

rtc_setup_mode_t rtc_get_setup (void)
{
	return rtc.setup_mode;
}

void rtc_flag_set(uint8_t flag)
{
	rtc.flags |= flag;
}

void rtc_flag_clear(uint8_t flag)
{
	rtc.flags &= ~(flag);
}

void rtc_inc (int sign)
{
	switch (rtc.setup_mode) {
	case RTC_SETUP_MINUTE:
		ATOMIC_BLOCK(ATOMIC_FORCEON)
		{
			if (sign < 0) {
				if (--rtc.minute < 0)
					rtc.minute = 59;
			} else {
				if (++rtc.minute > 59)
					rtc.minute = 0;
			}
		}
		break;

	case RTC_SETUP_HOUR:
		ATOMIC_BLOCK(ATOMIC_FORCEON)
		{
			if (sign < 0) {
				if (--rtc.hour < 0)
					rtc.hour = 23;
			} else {
				if (++rtc.hour > 23)
					rtc.hour = 0;
			}
		}
		break;
	}
}

void rtc_display (int hour, int minute, uint8_t flags)
{
	char msg[7];
	char *ptr = msg;

	if (flags & RTC_SHOW_HOUR)
		snprintf(ptr, 3, "%02u", hour);
	else
		strcpy(ptr, "  ");
	ptr+=2;

	if (flags & RTC_SHOW_DOT)
		strcat(ptr++, ".");

	if (flags & RTC_SHOW_MINUTE)
		snprintf(ptr, 3, "%02u", minute);
	else
		strcat(ptr, "  ");
	ptr+=2;

	if (flags & RTC_WAKEUP_TIMER_IND)
		strcat(ptr, ".");

	disp_text(msg);
}

