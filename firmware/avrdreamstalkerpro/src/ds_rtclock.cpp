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
#include "display/ds_display.h"
#include "ds_config.h"
#include "ds_driver.h"
#include "ds_rtclock.h"
#include "ds_util.h"


using namespace DS;

/*-----------------------------------------------------------------------*/
/* Flags for Real-time clock ISR (make sure these do NOT overlap)
 */
#define RTCF_SHOW_HOUR		0x0001U
#define RTCF_SHOW_MINUTE	0x0002U
#define RTCF_SHOW_DOT		  0x0004U
#define RTCF_WAKEUP_TIMER 0x0008U
#define RTCF_ALARM_CLOCK	0x0010U
/* 0x20 is vacant */
/* 0x40 is vacant */
#define RTCF_VISIBLE		  0x0080U

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
  struct tm ltm;
  get()->get_time(&ltm);

  *date_val = FAT_DATE(ltm.tm_year + 1900, ltm.tm_mon + 1, ltm.tm_mday);
  *time_val = FAT_TIME(ltm.tm_hour, ltm.tm_min, ltm.tm_sec);
}

/*-----------------------------------------------------------------------*/
static uint32_t EEMEM eeprom_timestamp; // Allocate 4 bytes in EEPROM


/*-----------------------------------------------------------------------*/
RTClock *RTClock::get()
{
  static RTClock rtck;
  return &rtck;
}

/*-----------------------------------------------------------------------*/
void RTClock::irq_handler (void)
{
  /*
   * get here every SECOND
   */

  system_tick(); // Updates the internal timestamp

  if (Driver::get()->get_mode() != OPM_NORMAL)
    return;

  // The rest is executed only in normal power mode

  struct tm last_time;
  RTClock::get()->get_time(&last_time);

  if (rtc.ticks_display < DISP_OFF_DELAY_SEC) {
	  rtc.ticks_display++;
	  if ((rtc.ticks_display >= DISP_OFF_DELAY_SEC)
			&& is_visible () 
			&& !is_setup ()) {
		  Display::get()->disable_unsafe ();
	  }
	}

  if (flag_is_set (RTCF_ALARM_CLOCK)) {

	  /* Alarm clock is set */
	  rtc.ticks_alarm_clock = (rtc.ticks_alarm_clock + 1) % ALARM_CLOCK_DELAY_SEC;
  	if (rtc.ticks_alarm_clock == 0) {

		  /* The alarm is one-shot, so cancel it */
		  flag_unset (RTCF_ALARM_CLOCK);

		  // Notify callback object
		  if (rtc.pcb_alarm_clock) {
		    (*rtc.pcb_alarm_clock) (rtc.context_alarm_clock);
		  }
	  }
	}

  flag_toggle (RTCF_SHOW_DOT);

  if (! is_setup ()) {
	  flag_set (RTCF_SHOW_HOUR | RTCF_SHOW_MINUTE);

	  if ( is_visible ()) {

		  display (last_time.tm_hour, last_time.tm_min, rtc.flags);
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

        /* One-shot timer, so cancel it */
		    flag_unset (RTCF_WAKEUP_TIMER);

		    /* Notify callback object */
		    if (rtc.pcb_wakeup_timer) {
		  	  (*rtc.pcb_wakeup_timer) (rtc.context_wakeup_timer);
		    }
		  }
	  }
  }

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
  delay (200);	/* let XTAL stabilize */

  rtc.flags = RTCF_SHOW_HOUR | RTCF_SHOW_MINUTE;
  rtc.setup_mode = RTC_SETUP_NONE;

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
  set_system_time (unix_time);// - UNIX_OFFSET);  

  return true;
}

void RTClock::end (void)
{
}

void RTClock::start (void)
{
  // Reinitialize all tick counters
  rtc.ticks_setup = 0;
  rtc.ticks_display = 0;
  rtc.ticks_wakeup_timer = 0;
  rtc.ticks_alarm_clock = 0;

#if defined (__AVR_ATmega128__)

  /* Timer/Counter 0 is used on atmega128 */
  TIMSK &= ~(_BV(OCIE0) | _BV(TOIE0));	/* Disable interrupts */

  /* When AS0 is written to 1, Timer/Counter is clocked
   *	from a XTAL connected to the TOSC1 pin
   */
  ASSR = _BV(AS0);

  /* The timer input clock is TOSC=32768 Hz */
  /* Set CTC mode: TOP - OCR0, TOV0 is set on MAX */
  TCCR0 = _BV(WGM01);

  /*
   * Period 1000ms = 1sec
   */
  TMR0_SET_N(256);	/*256x prescaler, clk=TOSC/256=128 */

  /* Generate 1s interrupts.
   * Max Error: (1 / 128 * (OCR0+1)) − 1 = 0 (s)
   */
  OCR0 = 128;

  TCNT0 = 0;		/* Reset counter */

  // Wait for TCN0UB, OCR0UB, and TCR0UB
  // in order to switch to asynchronous operation
  while (ASSR & (_BV(TCN0UB) | _BV(TCR0UB) | _BV(OCR0UB)));

  /* Clear interrupt flags */
  TIFR = _BV(OCF0) | _BV(TOV0);
  TIMSK |= _BV(OCIE0);					/* Enable interrupt */

#elif defined (__AVR_ATmega1281__)

  /* Timer/Counter 2 is be used on atmega1281 */
  TIMSK2 &= ~(_BV(OCIE2A) | _BV(OCIE2B) | _BV(TOIE2));	/* Disable interrupts */

  /* When AS2 is written to 1, Timer/Counter 2 is clocked
	from a XTAL connected to the TOSC1 pin */
  ASSR = _BV(AS2);

  /* The timer input clock is 32768 Hz */
  /* Set CTC mode: TOP - OCRA, TOV is set on MAX */
  TCCR2A = _BV(WGM21);

  /*
   * Period: 1000ms = 1sec
   */
  TMR2_SET_N(256);	/*256x prescaler, clk=TOSC/256=128 */

  /* Generate 1s interrupts.
   * Max Error: (1 / 128 * (OCR2A+1)) − 1 = 0 (s)
   */
  OCR2A = 128;

  TCNT2 = 0;		/* Reset counter */

  /* Wait for TCN2UB, OCR2AUB, and TCR2AUB in order 
   *		to switch to asynchronous operation 
   */
  while (ASSR & (_BV(TCN2UB) | _BV(TCR2AUB) | _BV(OCR2AUB)));

  /* Clear interrupt flags */
  TIFR2 = _BV(OCF2A) | _BV(OCF2B) | _BV(TOV2);
  TIMSK2 = _BV(OCIE2A);		/* Enable interrupt */

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
}

void RTClock::get_time(struct tm *ptm) const
{
  const time_t now = time (nullptr);
  localtime_r(&now, ptm);
}

void RTClock::show_unsafe (void)
{
  flag_set ( RTCF_VISIBLE );
}

void RTClock::show (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

    show_unsafe ();
  }
}

void RTClock::hide_unsafe (void)
{
  flag_unset ( RTCF_VISIBLE );
}

void RTClock::hide (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	  hide_unsafe ();
  }
}

bool RTClock::is_visible (void) const
{
  return flag_is_set ( RTCF_VISIBLE );
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

void RTClock::handle_setup (void)
{
  if (! is_setup ()) return;

  struct tm ltm;
  get_time(&ltm);

  switch( get_setup ())
  {
	  case RTC_SETUP_MINUTE:
		  flag_set    (RTCF_SHOW_HOUR);
		  flag_toggle (RTCF_SHOW_MINUTE);

		  /* Hide wakeup timer indicator as we are 
	 	   *	in the clock setup mode.
	 	   */
		  display (ltm.tm_hour, ltm.tm_min, 
              rtc.flags & ~RTCF_WAKEUP_TIMER);
		  break;

	  case RTC_SETUP_HOUR:
		  flag_set    (RTCF_SHOW_MINUTE);
		  flag_toggle (RTCF_SHOW_HOUR);

		  /* Hide wakeup timer indicator as we are 
	     *	in the clock setup mode.
	     */
		  display (ltm.tm_hour, ltm.tm_min, 
              rtc.flags & ~RTCF_WAKEUP_TIMER);
		  break;

	  case RTC_SETUP_YEAR:
		  display_year (&ltm);
	    break;

	  case RTC_SETUP_MONTH:
	  	display_month (&ltm);
	    break;

	  case RTC_SETUP_MDAY:
	    display_mday (&ltm);
	    break;

	  default:
		  break;
	}
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

#define SETUP_FIRST	RTC_SETUP_HOUR
#define SETUP_LAST  RTC_SETUP_MDAY

rtc_setup_mode_t RTClock::next_setup (void)
{ 
  uint8_t next_mode = rtc.setup_mode + 1;
  if (next_mode > SETUP_LAST)
	  rtc.setup_mode = SETUP_FIRST;
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
  return static_cast<rtc_setup_mode_t> (rtc.setup_mode);
}

void RTClock::setup_inc (int sign)
{
  struct tm ltm;
  get_time (&ltm);

  switch ( get_setup ()) {
	  case RTC_SETUP_MINUTE:
      inc_minute (&ltm, sign);
	    break;

	  case RTC_SETUP_HOUR:
      inc_hour (&ltm, sign);
	    break;

	  case RTC_SETUP_MDAY:
      inc_mday (&ltm, sign);
	    break;

	  case RTC_SETUP_MONTH:
      inc_month (&ltm, sign);
	    break;

	  case RTC_SETUP_YEAR:
      inc_year (&ltm, sign);
	    break;

	  default:
	    return;
  }

  ltm.tm_isdst = 0; // not use DST
  ltm.tm_wday = 0;
  ltm.tm_yday = 0;

  // Manually update the internal AVR time counter
  const time_t new_time = mktime (&ltm);
  set_system_time (new_time);
}

void RTClock::inc_year (struct tm *ptm, int8_t sign)
{
  int16_t year	= ptm->tm_year + 1900;
#define YEAR_MIN	2026

  if ( sign < 0 ) {

  	if (--year < YEAR_MIN)  year = YEAR_MIN;
  } else {

  	++year;
  }

  ptm->tm_year = year - 1900;
}

void RTClock::inc_month (struct tm *ptm, int8_t sign)
{  
  if ( sign < 0 ) {

  	if (--ptm->tm_mon < 0)  ptm->tm_mon = 11;
  } else {

  	if (++ptm->tm_mon > 11) ptm->tm_mon = 0;
  }
}

void RTClock::inc_mday (struct tm *ptm, int8_t sign)
{
  if ( sign < 0 ) {

  	if (--ptm->tm_mday < 1)   ptm->tm_mday = 31;
  } else {

  	if (++ptm->tm_mday > 31)  ptm->tm_mday = 1;
  }
}

void RTClock::inc_hour (struct tm *ptm, int8_t sign)
{
  if ( sign < 0 ) {

  	if (--ptm->tm_hour < 0)   ptm->tm_hour = 23;
  } else {

  	if (++ptm->tm_hour > 23)  ptm->tm_hour = 0;
  }
}

void RTClock::inc_minute (struct tm *ptm, int8_t sign)
{
  if ( sign < 0 ) {

  	if (--ptm->tm_min < 0)  ptm->tm_min = 59;
  } else {

  	if (++ptm->tm_min > 59) ptm->tm_min = 0;
  }

  ptm->tm_sec = 0;  // reset seconds
}

void RTClock::display (unsigned hour, unsigned minute, uint8_t flags)
{
  static char msg[7];
  char *ptr = msg;

  if (! Display::get()->is_enabled ())
	return;

  if (flags & RTCF_SHOW_HOUR)
	  snprintf (ptr, 3, "%02u", hour);
  else
	  strcpy (ptr, "  ");
  ptr += 2;

  if (flags & RTCF_SHOW_DOT)
	  strcat (ptr++, ".");

  if (flags & RTCF_SHOW_MINUTE)
	  snprintf (ptr, 3, "%02u", minute);
  else
	  strcat (ptr, "  ");
  ptr += 2;

  if (flags & RTCF_WAKEUP_TIMER)
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
  eeprom_update_dword(&eeprom_timestamp, (uint32_t)now);
}

void RTClock::awake_display (void)
{
  Display::get()->enable_unsafe ();
  rtc.ticks_display = 0;
}

void RTClock::wakeup_timer_set (RTClockCB_t prtcb, void *context)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	  if (wakeup_timer_is_set_unsafe ())
		  return;		/* Already set */

	  rtc.ticks_wakeup_timer = 0;
	  rtc.pcb_wakeup_timer = prtcb;
	  rtc.context_wakeup_timer = context;

	  flag_set (RTCF_WAKEUP_TIMER);
  }
}

bool RTClock::wakeup_timer_cancel (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	  if (! wakeup_timer_is_set_unsafe ())
		  return false;	/* Not set */

	  flag_unset (RTCF_WAKEUP_TIMER);

	  rtc.pcb_wakeup_timer = nullptr;
  }
  return true;
}

bool RTClock::wakeup_timer_is_set_unsafe (void)
{
  return flag_is_set (RTCF_WAKEUP_TIMER);
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
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

  	if (flag_is_set (RTCF_ALARM_CLOCK))
	    return;		/* Already set*/

	  rtc.ticks_alarm_clock = 0;
	  rtc.pcb_alarm_clock = prtcb;
	  rtc.context_alarm_clock = pcontext;

	  flag_set (RTCF_ALARM_CLOCK);
  }
}

bool RTClock::alarm_clock_cancel (void)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

  	if (! flag_is_set (RTCF_ALARM_CLOCK))
		  return false;	/* Not set */

	  flag_unset (RTCF_ALARM_CLOCK);

	  rtc.pcb_alarm_clock = nullptr;
  }
  return true;
}

bool RTClock::alarm_clock_is_set (void)
{
  bool res;

  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	  res = flag_is_set (RTCF_ALARM_CLOCK);
  }
  return res;
}
