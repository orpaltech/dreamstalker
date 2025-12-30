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

#include <stdio.h>
#include <string.h>

#include <avr/io.h>
#include <compat/ina90.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "core/tmr_avr.h"
#include "core/adc_avr.h"
#include "input/ds_keybrd.h"
#include "display/ds_display.h"
#include "sound/ds_sound.h"
#include "ds_config.h"
#include "ds_sqwave.h"
#include "ds_pwrman.h"
#include "ds_rtclock.h"
#include "ds_remd.h"
#include "ds_driver.h"


using namespace DS;

/*-----------------------------------------------------------------------*/
/* Flags for Real-Time clock ISR (make sure these do not overlap)
 */
#define RTC_SHOW_HOUR		0x0001U
#define RTC_SHOW_MINUTE		0x0002U
#define RTC_SHOW_DOT		0x0004U
#define RTC_WAKEUP_TIMER	0x0008U
#define RTC_ALARM_CLOCK		0x0010U
/* 0x20 is vacant */
#define RTC_PWRSAVE_TICK	0x0040U
#define RTC_VISIBLE			0x0080U

/* RTC interrupt interval, in milliseconds */
#define RTC_ISR_PERIOD_MSEC	1UL

/*-----------------------------------------------------------------------*/
#define RTC_OFF_DELAY_SEC	30U		/* seconds, max 60 */

/*-----------------------------------------------------------------------*/
/* Interrupt Handler 													 */
/*-----------------------------------------------------------------------*/
#if defined (__AVR_ATmega128__)
ISR(TIMER0_COMP_vect)
#elif defined (__AVR_ATmega1281__)
ISR(TIMER2_COMPA_vect)
#endif
{
  RTClock::handle_isr();
}

/*-----------------------------------------------------------------------*/
void RTClock::handle_isr (void)
{
  get()->irq_handler();
}

/*-----------------------------------------------------------------------*/
RTClock RTC;

/*-----------------------------------------------------------------------*/
RTClock *RTClock::get()
{
  return &RTC;
}

/*-----------------------------------------------------------------------*/
void RTClock::irq_handler (void)
{
  /* Power-save mode */

  if (rtc.op_mode == RTC_OPM_PWRSAVE) {

	/*
	 * get here every SECOND
	 */
	rtc.second = (rtc.second + 1) % 60;
	if (rtc.second == 0) {
	  /*
	   * get here every MINUTE
	   */
	  rtc.minute = (rtc.minute + 1) % 60;
	  if (rtc.minute == 0) {
		/*
		 * get here every HOUR
		 */
		rtc.hour = (rtc.hour + 1) % 24;
	  }
	}
	flag_set (RTC_PWRSAVE_TICK);
	return;
  }

  /* Normal mode */

  uint16_t ticks_1sec = msec_to_ticks (1000);
  uint8_t ticks_200ms = msec_to_ticks (200);

  /* Let keyboard first process the interrupt 
   */
  if ( Keyboard::handle_isr ()) {

	/* Reset display-off counter on a key press */
	Display::get()->enable_unsafe ();
	rtc.ticks_display = 0;
  }

  /* Let other subsystems process interrupt */
  Display::handle_isr ();
  SquareWave::handle_isr ();
  avr_core::A2DConv::handle_rtc ();

  rtc.ticks_second = (rtc.ticks_second + 1) % ticks_1sec;
  if (rtc.ticks_second == 0) {
	/*
	 * get here every SECOND
	 */
	if (rtc.ticks_display < RTC_OFF_DELAY_SEC) {
	  rtc.ticks_display++;
	  if ((rtc.ticks_display >= RTC_OFF_DELAY_SEC)
			&& is_visible () 
			&& !is_setup ()) {
		Display::get()->disable_unsafe ();
	  }
	}

	Driver::handle_isr();
	Sound::handle_isr ();

	if (flag_is_set (RTC_ALARM_CLOCK)) {
	  /* 
	   * Alarm clock is set 
	   */
	  rtc.ticks_alarm_clock = (rtc.ticks_alarm_clock + 1) % ALARM_CLOCK_DELAY;
  	  if (rtc.ticks_wakeup_timer == 0) {
		/*
		 * One-shot alarm, so cancel it
		 */
		flag_unset (RTC_ALARM_CLOCK);

		/* Notify callback object */
		if (rtc.pcb_alarm_clock)
		  rtc.pcb_alarm_clock (rtc.context_alarm_clock);
	  }
	}

	rtc.second = (rtc.second + 1) % 60;
	if (rtc.second == 0) {
	  /*
	   * get here every MINUTE
	  */
	  rtc.minute = (rtc.minute + 1) % 60;
	  if (rtc.minute == 0) {
		/*
		 * get here every HOUR
		 */
		rtc.hour = (rtc.hour + 1) % 24;
	  }

	  if (flag_is_set (RTC_WAKEUP_TIMER)) {
		/* 
		 * Wake-Up timer is set 
		 */
  		rtc.ticks_wakeup_timer = (rtc.ticks_wakeup_timer + 1) % config.get_wakeup_timer_delay ();
  		if (rtc.ticks_wakeup_timer == 0) {
		  /*
		   * One-shot timer, so cancel it
		   */
		  flag_unset (RTC_WAKEUP_TIMER);

		  /* Notify callback object */
		  if (rtc.pcb_wakeup_timer)
		  	rtc.pcb_wakeup_timer (rtc.context_wakeup_timer);
		}
	  }

	  PowerMan::handle_isr ();	/* Call battery monitor */
	}

	flag_toggle (RTC_SHOW_DOT);

	if (! is_setup ()) {
	  flag_set (RTC_SHOW_HOUR | RTC_SHOW_MINUTE);

	  if ( is_visible ()) {
		display_out (rtc.hour, rtc.minute, rtc.flags);
	  }
	}
  }

  rtc.ticks_setup = (rtc.ticks_setup + 1) % ticks_200ms;
  if( is_setup () && rtc.ticks_setup == 0) {

	/*
	 * get here around 5 times/sec
	 */
	switch( get_setup ())
	{
	  case RTC_SETUP_MINUTE:
		flag_set (RTC_SHOW_HOUR);
		flag_toggle (RTC_SHOW_MINUTE);
		break;

	  case RTC_SETUP_HOUR:
		flag_set (RTC_SHOW_MINUTE);
		flag_toggle (RTC_SHOW_HOUR);
		break;

	  default:
		break;
	}

	if ( is_visible () ) {
	  /* Hide wakeup timer indicator as we are 
	   *	in the clock setup mode
	   */
	  display_out ( rtc.hour, rtc.minute, 
				rtc.flags & ~RTC_WAKEUP_TIMER );
	}
  }
}

void RTClock::wait_for_next_tick (void)
{
  if (rtc.op_mode != RTC_OPM_PWRSAVE)
	return;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
	flag_unset (RTC_PWRSAVE_TICK);
  }
  while ( ! flag_is_set (RTC_PWRSAVE_TICK))
	_NOP() ;
}

bool RTClock::init (void)
{
	rtc.flags = 0;
	rtc.hour = 12;	/* Initial time */
	rtc.minute = 0;
	rtc.second = 0;
	rtc.ticks_second = 0;
	rtc.ticks_setup = 0;
	rtc.ticks_wakeup_timer = 0;
	rtc.setup_mode = RTC_SETUP_NONE;
	rtc.ticks_display = 0;
	rtc.op_mode = RTC_OPM_NONE;

	flag_set (RTC_SHOW_HOUR | RTC_SHOW_MINUTE);

	_delay_ms (200);	/* let 32KHz XTAL stabilize */
	return true;
}

void RTClock::end (void)
{
}

void RTClock::start (rtc_oper_mode_t mode)
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

	if (mode == RTC_OPM_PWRSAVE) {

		/* Period 1000ms = 1sec*/

		TMR0_SET_N(256);					/*256x prescaler, clk=TOSC/256=128 */
		//TCCR0 |= (_BV(CS02) | _BV(CS01));	/*256x prescaler, clk=TOSC/256=128 */

		/* Generate 1s interrupts.
		 * Max Error: (1 / 128 * (OCR0+1)) − 1 = 0 (s)
		 */
		OCR0 = 127;

		rtc.op_mode = RTC_OPM_PWRSAVE;

	} else { /* Normal mode*/

		/* Period: 1ms */

		TMR0_SET_N(1);						/*1x prescaler, clk=TOSC*/
		//TCCR0 |= _BV(CS00);				/*1x prescaler, clk=TOSC*/

		/* Generate 1ms interrupts.
	 	 * Max Error: (1 / 32768 * (OCR0+1)) − 0.001 = 0.0000070800781 (s) 
		 */
		OCR0 = 32;

		rtc.op_mode = RTC_OPM_NORMAL;
	}

	// Wait for TCN0UB, OCR0UB, and TCR0UB
	// in order to switch to asynchronous operation
	while (ASSR & (_BV(TCN0UB) | _BV(TCR0UB) | _BV(OCR0UB)));

	TIFR  &= ~(_BV(OCF0) | _BV(TOV0));	/* Clear interrupt flags */
	TIMSK |= _BV(OCIE0);				/* Enable interrupt */

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

	switch (mode) {
	case RTC_OPM_PWRSAVE:
		/* Period: 1000ms = 1sec*/

		TMR2_SET_N(256);					/*256x prescaler, clk=TOSC/256=128 */
		//TCCR2B = (_BV(CS22) | _BV(CS21));	/*256x prescaler, clk=TOSC/256=128 */

		/* Generate 1s interrupts.
		 * Max Error: (1 / 128 * (OCR2A+1)) − 1 = 0 (s)
		 */
		OCR2A = 127;

		rtc.op_mode = RTC_OPM_PWRSAVE;
		break;

	case RTC_OPM_NORMAL:
	default:
		/* Period: 1ms */

		TMR2_SET_N(1);						/* 1x prescaler  */
		//TCCR2B = _BV(CS20);				/* 1x prescaler  */

		/* Generate 1ms interrupts.
	 	 * Max Error: (1 / 32768 * (OCR2A+1)) − 0.001 = 0.0000070800781 (s) 
		 */
		OCR2A = 32;

		rtc.op_mode = RTC_OPM_NORMAL;
		break;
	}

	/* Wait for TCN2UB, OCR2AUB, and TCR2AUB in order 
	 *		to switch to asynchronous operation 
	*/
	while (ASSR & (_BV(TCN2UB) | _BV(TCR2AUB) | _BV(OCR2AUB)));

	TIFR2  = 0;				/* Clear interrupt flags */
	TIMSK2 = _BV(OCIE2A);	/* Enable interrupt */

#endif
}

void RTClock::stop (void)
{
	wakeup_timer_cancel ();

#if defined (__AVR_ATmega128__)

  /*
   * Timer/Counter 0 is used on atmega128 
   */
  TMR0_OFF();
  TIMSK &= ~(_BV(OCIE0) | _BV(TOIE0));	/* Disable interrupts */

#elif defined (__AVR_ATmega1281__)

  /* 
   * Timer/Counter 2 is be used on atmega1281 
   */
  TMR2_OFF();
  TIMSK2 &= ~(_BV(OCIE2A) | _BV(OCIE2B) | _BV(TOIE2));	/* Disable interrupts */

#endif

  // TODO: implement 

  rtc.op_mode = RTC_OPM_NONE;
}

uint32_t RTClock::isr_period_us (void)
{
  return ( isr_period_ms () * 1000 );
}

uint32_t RTClock::isr_period_ms (void)
{
  return RTC_ISR_PERIOD_MSEC;
}

uint32_t RTClock::msec_to_ticks (uint32_t ms)
{
  return ( ms / RTC_ISR_PERIOD_MSEC );
}

void RTClock::wait (uint32_t num_ticks)
{
  _delay_us (isr_period_us () * num_ticks);
}

void RTClock::show (void)
{
	flag_set ( RTC_VISIBLE );
}

void RTClock::hide (void)
{
	flag_unset ( RTC_VISIBLE );
}

bool RTClock::is_visible (void)
{
	return flag_is_set ( RTC_VISIBLE );
}

bool RTClock::is_setup (void)
{
	return ( get_setup () != RTC_SETUP_NONE );
}

void RTClock::set_setup (rtc_setup_mode_t mode)
{
	rtc.setup_mode = mode;
}

rtc_setup_mode_t RTClock::get_setup (void)
{
	return (rtc_setup_mode_t) rtc.setup_mode;
}

void RTClock::flag_set (uint16_t flag)
{
	rtc.flags |= flag;
}

void RTClock::flag_unset (uint16_t flag)
{
	rtc.flags &= ~flag;
}

void RTClock::flag_toggle (uint16_t flag)
{
	rtc.flags ^= flag;
}

bool RTClock::flag_is_set (uint16_t flag)
{
	return (( rtc.flags & flag ) == flag);
}

void RTClock::setup_inc (int sign)
{
  switch ( get_setup ()) {
	case RTC_SETUP_MINUTE:
	  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
		if (sign < 0) {
			rtc.minute--;
		} else {
			rtc.minute++;
		}
		rtc.minute %= 60;
	  }
	  break;

	case RTC_SETUP_HOUR:
	  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
		if ( sign < 0 ) {
			rtc.hour--;
		} else {
			rtc.hour++;
		}
		rtc.hour %= 24;
	  }
	  break;

	default:
	  break;
  }
}

void RTClock::wakeup_timer_set (RTClockCB_t prtcb, void *context)
{
  if (rtc.op_mode != RTC_OPM_NORMAL)
	return;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	if (flag_is_set (RTC_WAKEUP_TIMER))
		return;		/* Already set */

	rtc.ticks_wakeup_timer = 0;
	rtc.pcb_wakeup_timer = prtcb;
	rtc.context_wakeup_timer = context;

	flag_set (RTC_WAKEUP_TIMER);
  }
}

bool RTClock::wakeup_timer_cancel (void)
{
  if (rtc.op_mode != RTC_OPM_NORMAL)
	return false;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	if (! flag_is_set (RTC_WAKEUP_TIMER))
		return false;	/* Not set */

	flag_unset (RTC_WAKEUP_TIMER);

	rtc.pcb_wakeup_timer = nullptr;
  }
  return true;
}

bool RTClock::wakeup_timer_is_set_unsafe (void)
{
  return flag_is_set (RTC_WAKEUP_TIMER);
}

bool RTClock::wakeup_timer_is_set (void)
{
  bool res;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
  	res = wakeup_timer_is_set_unsafe ();
  }
  return res;
}

void RTClock::alarm_clock_set (RTClockCB_t prtcb, void *context)
{
  if (rtc.op_mode != RTC_OPM_NORMAL)
	return;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

  	if (flag_is_set (RTC_ALARM_CLOCK))
		return;		/* Already set*/

	rtc.ticks_alarm_clock = 0;
	rtc.pcb_alarm_clock = prtcb;
	rtc.context_alarm_clock = context;

	flag_set (RTC_ALARM_CLOCK);
  }
}

bool RTClock::alarm_clock_cancel (void)
{
  if (rtc.op_mode != RTC_OPM_NORMAL)
	return false;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

  	if (! flag_is_set (RTC_ALARM_CLOCK))
		return false;	/* Not set */

	flag_unset (RTC_ALARM_CLOCK);

	rtc.pcb_alarm_clock = nullptr;
  }
  return true;
}

bool RTClock::alarm_clock_is_set (void)
{
  bool res;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {
	res = flag_is_set (RTC_ALARM_CLOCK);
  }
  return res;
}

void RTClock::display_out (int hour, int minute, uint8_t flags)
{
  static char msg[7];
  char *ptr = msg;

  if (! Display::get()->is_enabled ())
	return;

  if (flags & RTC_SHOW_HOUR)
	snprintf (ptr, 3, "%02u", hour);
  else
	strcpy (ptr, "  ");
  ptr += 2;

  if (flags & RTC_SHOW_DOT)
	strcat (ptr++, ".");

  if (flags & RTC_SHOW_MINUTE)
	snprintf (ptr, 3, "%02u", minute);
  else
	strcat (ptr, "  ");
  ptr += 2;

  if (flags & RTC_WAKEUP_TIMER)
	strcat (ptr, ".");

  Display::get()->text_out_unsafe (msg);
}
