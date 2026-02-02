/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2026	ORPAL Technologies, Inc.
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

#ifndef _DS_BATTMON_DEFINED
#define _DS_BATTMON_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include "core/adc_avr.h"

/*-----------------------------------------------------------------------*/
#define BATTERY_FULL	100U
#define BATTERY_LOW 	85U
#define BATTERY_EMPTY   70U

/*-----------------------------------------------------------------------*/
namespace DS {

/*-----------------------------------------------------------------------*/
class BatteryMonitor {
public:
  static BatteryMonitor *get();
public:
  bool init (void);

  void start (void);
  void stop (void);
  bool is_running (void) const { return running;}

  uint8_t battery_level (void);

  /* Intended for use from system clock ISR only. Do not call it directly! */
  static void handle_sysclk (void);

protected:
  virtual void on_adc_sample(uint16_t sample);

private:
  static void adc_sample_callback(void *context, uint16_t sample);
  
  void irq_handler (void);
  void run_monitor (void);

  volatile uint16_t batt_level;
  uint8_t timer_ticks;		/* minute ticks*/
  bool running;
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif  //_DS_BATTMON_DEFINED
