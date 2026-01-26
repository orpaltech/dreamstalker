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
#include "ds_remhints.h"
#include "ds_pwrman.h"
#include "ds_rtclock.h"
#include "ds_driver.h"


using namespace DS;

/*-----------------------------------------------------------------------*/
/* Flags for Real-Time clock ISR (make sure these do NOT overlap)
 */
#define RTC_SHOW_HOUR		0x0001U
#define RTC_SHOW_MINUTE		0x0002U
#define RTC_SHOW_DOT		0x0004U
#define RTC_WAKEUP_TIMER	0x0008U
#define RTC_ALARM_CLOCK		0x0010U
/* 0x20 is vacant */
#define RTC_PWRSAVE_TICK	0x0040U
#define RTC_VISIBLE			0x0080U

/* RTC interrupt interval, in millisec */
#define RTC_PERIOD_MSEC		1UL

/*-----------------------------------------------------------------------*/
#define DISP_OFF_DELAY_SEC	30U		/* seconds, max 60 */


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
void RTClock::fat_datetime(uint16_t *date_val, uint16_t *time_val)
{
  struct tm ltmp;
  const time_t now = time (nullptr);
  localtime_r(&now, &ltmp);

  *date_val = FAT_DATE(ltmp.tm_year + 1900, ltmp.tm_mon + 1, ltmp.tm_mday);
  *time_val = FAT_TIME(ltmp.tm_hour, ltmp.tm_min, ltmp.tm_sec);
}

/*-----------------------------------------------------------------------*/
static RTClock rtck;

static uint32_t EEMEM eeprom_timestamp; // Allocate 4 bytes in EEPROM

/*-----------------------------------------------------------------------*/
RTClock *RTClock::get()
{
  return &rtck;
}

/*-----------------------------------------------------------------------*/
void RTClock::irq_handler (void)
{
  /* -------------------------------------------------
   * Power-save mode
   */

  if (rtc.op_mode == RTC_OPM_PWRSAVE) {
	/*
	 * get here every SECOND
	 */
	system_tick(); // Updates the internal timestamp

	flag_set (RTC_PWRSAVE_TICK);
	return;
  }

  /* -------------------------------------------------
   * Normal mode
   */

  const uint16_t ticks_1sec = msec_to_ticks (1000);
  const uint8_t ticks_200ms = msec_to_ticks (200);

  /* Let keyboard first process the interrupt 
   */
  if ( Keyboard::handle_isr ()) {

	/* Reset display-off counter on a key press */
	Display::get()->enable_unsafe ();
	rtc.ticks_display = 0;
  }

  /* Let other subsystems process interrupt */
  Display::handle_rtc ();
  SQWave::handle_rtc ();
  REMHints::handle_rtc ();
  avr_core::A2DConv::handle_rtc ();

  struct tm last_time;

  rtc.ticks_second = (rtc.ticks_second + 1) % ticks_1sec;
  if (rtc.ticks_second == 0) {
	/*
	 * get here every SECOND
	 */
	system_tick(); // Updates the internal timestamp

	const time_t now = time (nullptr);
	localtime_r(&now, &last_time);

	if (rtc.ticks_display < DISP_OFF_DELAY_SEC) {
	  rtc.ticks_display++;
	  if ((rtc.ticks_display >= DISP_OFF_DELAY_SEC)
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
  	  if (rtc.ticks_alarm_clock == 0) {
		/*
		 * One-shot alarm, so cancel it
		 */
		flag_unset (RTC_ALARM_CLOCK);

		/* Notify callback object */
		if (rtc.pcb_alarm_clock) {
		  (*rtc.pcb_alarm_clock) (rtc.context_alarm_clock);
		}
	  }
	}

	if (last_time.tm_sec == 0) {
	  /*
	   * get here every MINUTE
	  */

	  if (wakeup_timer_is_set_unsafe ()) {
		/* 
		 * Wake-Up timer is set 
		 */
  		rtc.ticks_wakeup_timer = (rtc.ticks_wakeup_timer + 1) % config.get_wakeup_timer_delay ();
  		if (rtc.ticks_wakeup_timer == 0) {
		  /*
		   * One-shot timer, so cancel it now
		   */
		  flag_unset (RTC_WAKEUP_TIMER);

		  /* Notify callback object */
		  if (rtc.pcb_wakeup_timer) {
		  	(*rtc.pcb_wakeup_timer) (rtc.context_wakeup_timer);
		  }
		}
	  }

	  PowerMan::handle_isr ();	/* Call battery monitor */
	}

	flag_toggle (RTC_SHOW_DOT);

	if (! is_setup ()) {
	  flag_set (RTC_SHOW_HOUR | RTC_SHOW_MINUTE);

	  if ( is_visible ()) {

		display (last_time.tm_hour, last_time.tm_min, rtc.flags);
	  }
	}
  }

  rtc.ticks_setup = (rtc.ticks_setup + 1) % ticks_200ms;
  if (is_setup () && rtc.ticks_setup == 0) {
	/*
	 * get here around 5 times/sec
	 */
	const time_t now = time (nullptr);
	localtime_r(&now, &last_time);

	switch( get_setup ())
	{
	  case RTC_SETUP_MINUTE:
		flag_set (RTC_SHOW_HOUR);
		flag_toggle (RTC_SHOW_MINUTE);

		/* Hide wakeup timer indicator as we are 
	 	 *	in the clock setup mode.
	 	 */
		display (last_time.tm_hour, last_time.tm_min, 
				rtc.flags & ~RTC_WAKEUP_TIMER);
		break;

	  case RTC_SETUP_HOUR:
		flag_set (RTC_SHOW_MINUTE);
		flag_toggle (RTC_SHOW_HOUR);

		/* Hide wakeup timer indicator as we are 
	     *	in the clock setup mode.
	     */
		display (last_time.tm_hour, last_time.tm_min, 
				rtc.flags & ~RTC_WAKEUP_TIMER);
		break;

	  case RTC_SETUP_YEAR:
		display_year (&last_time);
	    break;

	  case RTC_SETUP_MONTH:
	  	display_month (&last_time);
	    break;

	  case RTC_SETUP_MDAY:
	    display_mday (&last_time);
	    break;

	  default:
		break;
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

void RTClock::process_task (void)
{
  // Backup time to EEPROM every hour (3,600,000 milliseconds)
  // Only write if the time has actually changed significantly to save EEPROM life
  //
  unsigned long current_stamp = millis();
  if (current_stamp - backup_stamp > 3600000) {
	backup_current_time ();
    backup_stamp = current_stamp;
  }
}

bool RTClock::init (void)
{
	_delay_ms (200);	/* let XTAL stabilize */

	rtc.flags = 0;
	rtc.ticks_second = 0;
	rtc.ticks_setup = 0;
	rtc.ticks_wakeup_timer = 0;
	rtc.ticks_alarm_clock = 0;
	rtc.setup_mode = RTC_SETUP_NONE;
	rtc.ticks_display = 0;
	rtc.op_mode = RTC_OPM_NONE;

	flag_set (RTC_SHOW_HOUR | RTC_SHOW_MINUTE);

	backup_stamp = 0;	/* Reset last backup timestamp */

	struct tm ltm;
	ltm.tm_year = 2026 - 1900;
	ltm.tm_mon  = 0;   // January
	ltm.tm_mday = 1;
	ltm.tm_hour = 12;
	ltm.tm_min  = 0;
	ltm.tm_sec  = 0;
	ltm.tm_isdst = 0;  // We are telling it this is Standard Time

	// mktime converts to UTC-based time_t
    time_t start_time = mktime(&ltm);
    uint32_t stored_time = eeprom_read_dword(&eeprom_timestamp);
	uint32_t unix_time;

    // If EEPROM is empty (0xFFFFFFFF) or older than our build date
    if (stored_time == 0xFFFFFFFF || stored_time < start_time) {
		unix_time = start_time;
    } else {
		unix_time = stored_time;
	}
    set_system_time (unix_time - UNIX_OFFSET);  

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
  return RTC_PERIOD_MSEC;
}

uint32_t RTClock::msec_to_ticks (uint32_t ms)
{
  return ( ms / RTC_PERIOD_MSEC );
}

void RTClock::wait (uint32_t num_ticks)
{
  _delay_us (isr_period_us () * num_ticks);
}

void RTClock::show_unsafe (void)
{
  flag_set ( RTC_VISIBLE );
}

void RTClock::show (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

    show_unsafe ();
  }
}

void RTClock::hide_unsafe (void)
{
  flag_unset ( RTC_VISIBLE );
}

void RTClock::hide (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	hide_unsafe ();
  }
}

bool RTClock::is_visible (void) const
{
  return flag_is_set ( RTC_VISIBLE );
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

bool RTClock::flag_is_set (uint16_t flag) const
{
  return (( rtc.flags & flag ) == flag);
}

bool RTClock::is_setup (void) const
{
  return ( get_setup () != RTC_SETUP_NONE );
}

void RTClock::set_setup (rtc_setup_mode_t mode)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

    rtc.setup_mode = mode;
  }
}

#define RTC_SETUP_FIRST	RTC_SETUP_HOUR
#define RTC_SETUP_LAST  RTC_SETUP_MDAY

rtc_setup_mode_t RTClock::next_setup (void)
{ 
  uint8_t next_mode = rtc.setup_mode + 1;
  if (next_mode > RTC_SETUP_LAST)
	rtc.setup_mode = RTC_SETUP_FIRST;
  else
	rtc.setup_mode = next_mode;
  rtc_setup_mode_t mode = get_setup ();

  if ( mode == RTC_SETUP_HOUR || mode == RTC_SETUP_MINUTE ) {

	show ();
  } else {

	hide ();
  }

  return mode;
}

rtc_setup_mode_t RTClock::get_setup (void) const
{
  return (rtc_setup_mode_t) rtc.setup_mode;
}

void RTClock::setup_inc (int sign)
{
  struct tm ltm;
  const time_t now = time(nullptr);
  localtime_r(&now, &ltm);

  int16_t year	= ltm.tm_year + 1900;
#define YEAR_MIN	2026

  switch ( get_setup ()) {
	case RTC_SETUP_MINUTE:
	  if ( sign < 0 )
	  	--ltm.tm_min;
	  else
	  	++ltm.tm_min;

	  ltm.tm_min %= 60;
	  break;

	case RTC_SETUP_HOUR:
	  if ( sign < 0 )
	  	--ltm.tm_hour;
	  else
	  	++ltm.tm_hour;

	  ltm.tm_hour %= 24;
	  break;

	case RTC_SETUP_MDAY:
	  if ( sign < 0 )
	  	--ltm.tm_mday;
	  else
	  	++ltm.tm_mday;

	  if (ltm.tm_mday < 1)		 ltm.tm_mday = 31;
	  else if (ltm.tm_mday > 31) ltm.tm_mday = 1;
	  break;

	case RTC_SETUP_MONTH:
	  if ( sign < 0 )
	  	--ltm.tm_mon;
	  else
	  	++ltm.tm_mon;

	  if (ltm.tm_mon < 0)		ltm.tm_mon = 11;
	  else if (ltm.tm_mon > 11)	ltm.tm_mon = 0;
	  break;

	case RTC_SETUP_YEAR:
	  if ( sign < 0 )
	  	--year;
	  else
	  	++year;

	  if ( year < YEAR_MIN )
	  	year = YEAR_MIN;

	  ltm.tm_year = year - 1900;
	  break;

	default:
	  return;
  }

  ltm.tm_sec = 0;
  ltm.tm_isdst = 0; // not use DST
  ltm.tm_wday = 0;
  ltm.tm_yday = 0;

  // Manually update the internal AVR time counter
  const time_t new_time = mktime (&ltm);
  set_system_time (new_time);

}

void RTClock::wakeup_timer_set (RTClockCB_t prtcb, void *context)
{
  if (rtc.op_mode != RTC_OPM_NORMAL)
	return;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	if (wakeup_timer_is_set_unsafe ())
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

	if (! wakeup_timer_is_set_unsafe ())
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

uint16_t RTClock::wakeup_timer_get_remainder (void)
{
  uint16_t res = 0;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	if (wakeup_timer_is_set_unsafe ()) {
	  res = config.get_wakeup_timer_delay () - rtc.ticks_wakeup_timer;
	}
  }

  return res;
}

void RTClock::alarm_clock_set (RTClockCB_t prtcb, void *pcontext)
{
  if (rtc.op_mode != RTC_OPM_NORMAL)
	return;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

  	if (flag_is_set (RTC_ALARM_CLOCK))
	  return;		/* Already set*/

	rtc.ticks_alarm_clock = 0;
	rtc.pcb_alarm_clock = prtcb;
	rtc.context_alarm_clock = pcontext;

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

void RTClock::display (unsigned hour, unsigned minute, uint8_t flags)
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

void RTClock::display_year(struct tm *ptm)
{
  Display::get()->number (ptm->tm_year + 1900);
}

void RTClock::display_month(struct tm *ptm)
{
  Display::get()->number (ptm->tm_mon + 1);	// 1-12
}

void RTClock::display_mday(struct tm *ptm)
{
  Display::get()->number (ptm->tm_mday);	// 1-31
}

void RTClock::backup_current_time (void)
{
  const time_t now = time(nullptr);
  // Convert back to Unix 1970 format
  eeprom_update_dword(&eeprom_timestamp, (uint32_t)now + UNIX_OFFSET);
}
