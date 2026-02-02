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

#ifndef _DS_RTCLOCK_DEFINED
#define _DS_RTCLOCK_DEFINED

#include <stdbool.h>
#include <stdint.h>
#include <time.h>


/*-----------------------------------------------------------------------*/
namespace DS {

typedef enum e_rtc_setup_mode {
  RTC_SETUP_NONE	= 0,
  RTC_SETUP_HOUR,
  RTC_SETUP_MINUTE,
  RTC_SETUP_YEAR,
  RTC_SETUP_MONTH,
  RTC_SETUP_MDAY
} rtc_setup_mode_t;


/*-----------------------------------------------------------------------*/
typedef void (*RTClockCB_t)(void *context);


/*-----------------------------------------------------------------------*/
class RTClock {
public:
  static RTClock *get();
public:
  bool init (void);
  void end (void);

  void start (void);
  void stop (void);

  void get_time(struct tm *ptm) const;

  /* Clock setup */
  void set_setup (rtc_setup_mode_t mode);
  rtc_setup_mode_t get_setup (void) const;
  rtc_setup_mode_t next_setup (void);
  bool is_setup (void) const;
  /* decrement if sign < 0, otherwise increment */
  void setup_inc (int sign);

  /* Show/hide clock on display */
  void show (void);
  void hide (void);
  void show_unsafe (void);
  void hide_unsafe (void);
  bool is_visible (void) const;

  /* Wake-Up timer operations */
  void wakeup_timer_set (RTClockCB_t pcb, void *context);
  bool wakeup_timer_cancel (void);
  bool wakeup_timer_is_set_unsafe (void);
  bool wakeup_timer_is_set (void);
  uint16_t wakeup_timer_get_remainder (void);

  /* Alarm clock operations */
  void alarm_clock_set (RTClockCB_t pcb, void *context);
  bool alarm_clock_cancel (void);
  bool alarm_clock_is_set (void);

  /* Date/time component increment */
  void inc_year (struct tm *ptm, int8_t sign);
  void inc_month (struct tm *ptm, int8_t sign);
  void inc_mday (struct tm *ptm, int8_t sign);
  void inc_hour (struct tm *ptm, int8_t sign);
  void inc_minute (struct tm *ptm, int8_t sign);

  void backup_current_time (void);

  void awake_display (void);

public:
  /* Must be called in the main application loop */
  void process_task (void);

public:
  static void fat_datetime(uint16_t *date, uint16_t *time);

  /* Intended for use in ISR. Do not call it directly! */
  static void handle_isr (void);

private:
  friend class SysClock;

  void irq_handler (void);
  void handle_setup (void);

  void flag_set (uint16_t flag);
  void flag_unset (uint16_t flag); 
  void flag_toggle (uint16_t flag);
  bool flag_is_set (uint16_t flag) const;

  void display (unsigned hour, unsigned minute, uint8_t flags);
  void display_year (struct tm *ptm);
  void display_month (struct tm *ptm);
  void display_mday (struct tm *ptm);

private:
  typedef struct s_rtclk_context {
    /* Internal tick counters */
    uint16_t ticks_second;
    uint8_t ticks_setup;
    /* Wake-Up timer management */
    uint16_t ticks_wakeup_timer;
    RTClockCB_t pcb_wakeup_timer;
    void *context_wakeup_timer;
    /* Alarm clock management */
    RTClockCB_t pcb_alarm_clock;
    void *context_alarm_clock;
    uint8_t ticks_alarm_clock;
    uint16_t flags : 8;         /* Internal control flags */
    uint8_t setup_mode : 3;     /* Clock setup mode */
    uint8_t ticks_display : 6;
  } rtclk_context_t;

  volatile rtclk_context_t rtc;

  unsigned long backup_stamp;
};

/*-----------------------------------------------------------------------*/
};	//DS

#endif // _DS_RTCLOCK_DEFINED
