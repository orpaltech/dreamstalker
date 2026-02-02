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

#ifndef _DS_DRIVER_DEFINED
#define _DS_DRIVER_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include "ds_rtclock.h"
#include "ds_remdetect.h"
#include "input/ds_keybrd.h"
#include "ds_util.h"

//#define RUN_TEST_MODE 1

namespace DS {

typedef enum e_operation_mode {
  OPM_NONE = 0,
	OPM_NORMAL,
	OPM_PWRSAVE
} operation_mode_t; 

/*-----------------------------------------------------------------------*/
class Driver {
public:
  static Driver *get();
public:
  bool begin (void);
  void end (void);

  bool start (void);
  void stop (void);
  void process (void);

  void reboot_on_key (void);

  operation_mode_t get_mode () const { return static_cast<operation_mode_t>(opmode); }

  void remd_start_check (void);
  void remd_stop_check (void);
  bool is_remd_check (void) const { return remd_check;}

  /* The method is only used from system clock ISR. Do not call it directly. */
  static void handle_sysclk (void);
protected:
  void on_wakeup_timer (void);
  void on_alarm_clock (void);
  void on_remd_stable_rem (uint16_t intensity);

  friend class AppMenu;
private:
  void set_mode (operation_mode_t mode) { opmode = mode; }
  void wakeup_timer_toggle (void);
  void wakeup_timer_quick_set (keybrd_event_t key_event);
  void start_lucid_dream (void);
  void stop_lucid_dream (void);
  bool is_lucid_dreaming (void) const;
  void power_off (void);
  static void alarm_clock_callback (void *context);
  static void wakeup_timer_callback (void *context);
  static void remd_callback(void *context, remd_event_type_t event, uint16_t arg);

private:
  uint8_t opmode;
  bool  remd_check;
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif  // _DS_DRIVER_DEFINED