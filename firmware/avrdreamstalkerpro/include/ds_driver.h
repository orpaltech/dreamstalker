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
/*-----------------------------------------------------------------------*/
class Driver {
public:
  bool begin (void);
  void end (void);

  bool start (void);
  void stop (void);
  void process (void);

  void reboot_on_key (void);

  /* The method is only used from ISR. Do not call it directly. */
  static void handle_isr (void);
protected:
  void on_wakeup_timer (void);
  void on_alarm_clock (void);
  void on_remd_stable_rem (uint16_t intensity);

  friend class AppMenu;
private:
  void wakeup_timer_toggle (void);
  void wakeup_timer_quick_set (keybrd_event_t key_event);
  void start_lucid_dream (void);
  void stop_lucid_dream (void);
  void power_off (void);
  static void alarm_clock_callback (void *context);
  static void wakeup_timer_callback (void *context);
  static void remd_callback(void *context, remd_event_type_t event, uint16_t arg);
};

/*-----------------------------------------------------------------------*/
};  //DS

extern DS::Driver driver;

#endif  // _DS_DRIVER_DEFINED