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

#ifndef _DS_CLOCK_DEFINED
#define _DS_CLOCK_DEFINED

#include <stdbool.h>
#include <stdint.h>


/*-----------------------------------------------------------------------*/
namespace DS {

typedef enum e_rtc_oper_mode {
  RTC_OPM_NONE = 0,
	RTC_OPM_NORMAL,
	RTC_OPM_PWRSAVE
} rtc_oper_mode_t; 

typedef enum e_rtc_setup_mode {
	RTC_SETUP_NONE	= 0,
	RTC_SETUP_HOUR,
	RTC_SETUP_MINUTE
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

  void start (rtc_oper_mode_t mode);
  void stop (void);

  /* Show/hide clock on display */
  void show (void);
  void hide (void);
  bool is_visible (void);

  void set_setup (rtc_setup_mode_t mode);
  bool is_setup (void);
  rtc_setup_mode_t get_setup (void);
  /* decrement if sign < 0, otherwise increment */
  void setup_inc (int sign);

  /* Wake-Up timer operations */
  void wakeup_timer_set (RTClockCB_t prtcb, void *context);
  bool wakeup_timer_cancel (void);
  bool wakeup_timer_is_set_unsafe (void);
  bool wakeup_timer_is_set (void);
  uint16_t wakeup_timer_get_remainder (void);

  /* Alarm clock operations */
  void alarm_clock_set (RTClockCB_t prtcb, void *context);
  bool alarm_clock_cancel (void);
  bool alarm_clock_is_set (void);

  /* Only use in power-save mode */
  void wait_for_next_tick (void);

  void wait (uint32_t num_ticks);

public:
  static uint32_t msec_to_ticks (uint32_t ms);

  /* RTC interrupt interval, in microseconds */
  static uint32_t isr_period_us (void);
  static uint32_t isr_period_ms (void);

  /* Intended for use in ISR. Do not call it directly! */
  static void handle_isr (void);

private:
  void irq_handler (void);

  void flag_set (uint16_t flag);
  void flag_unset (uint16_t flag); 
  void flag_toggle (uint16_t flag);
  bool flag_is_set (uint16_t flag);

  void display (int hour, int minute, uint8_t flags);

private:
  typedef struct s_rtc_context {
    uint8_t hour : 5;
    uint8_t minute : 6;
    uint8_t second : 6;
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
    /* Internal control flags */
    uint16_t flags : 8;
    /* Global operation mode */
    uint8_t op_mode : 2;
    /* Clock setup mode */
    uint8_t setup_mode : 2;
    uint8_t ticks_display : 6;
  } rtc_context_t;

  volatile rtc_context_t rtc;
};

/*-----------------------------------------------------------------------*/
};	//DS

#endif // _DS_CLOCK_DEFINED
