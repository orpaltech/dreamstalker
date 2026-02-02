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

#include <avr/io.h>
#include <util/atomic.h>

#include <Arduino.h>

#include "ds_vibro.h"
#include "ds_util.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_VIBRO		PIN_PC1

#define DUTY_CYCLE_MIN	20UL
#define DUTY_CYCLE_MAX	90UL

/*-----------------------------------------------------------------------*/

static
bool vibro_is_busy (void)
{
  return SquareWave::get()->is_active_unsafe (SQW_VIBRO);
}

/*-----------------------------------------------------------------------*/
void VibroMotor::sqw_transition_callback(void *context, uint8_t slot,
                                      sqw_transition_t trans)
{
  VibroMotor *pvm = reinterpret_cast<VibroMotor *>(context);

  pvm->on_sqw_transition (slot, trans);
}

/*-----------------------------------------------------------------------*/
VibroMotor *VibroMotor::get()
{
  static VibroMotor vm;
  return &vm;
}

/*-----------------------------------------------------------------------*/
bool VibroMotor::start (uint8_t	level, uint16_t duration_ms)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    return start_unsafe (level, duration_ms);
  }
}

bool VibroMotor::start_unsafe (uint8_t level, uint16_t duration_ms)
{
  uint8_t duty_cycle;

  if (is_running_unsafe ())	/* skip if busy*/
	  return false;

  if (level<1)
		return false;
  if (level>9) level=9;

  switch (level) {
	case 1:
	  duty_cycle = DUTY_CYCLE_MIN;
	  break;

	case 9:
	  duty_cycle = DUTY_CYCLE_MAX;
	  break;

	default:
	  duty_cycle = DUTY_CYCLE_MIN + ((DUTY_CYCLE_MAX - DUTY_CYCLE_MIN)/8) * (level - 1);
	  break;
  }

  SquareWave::get()->start_unsafe (SQW_VIBRO, duration_ms, 10, duty_cycle, 
                                sqw_transition_callback, this);

  return true;
}

void VibroMotor::stop_unsafe (void)
{
  if (! is_running_unsafe())	/* skip if inactive*/
	  return;

  SquareWave::get()->stop_unsafe (SQW_VIBRO);
}

void VibroMotor::stop (void)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    stop_unsafe ();
  }
}

bool VibroMotor::is_running (void) const
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    return is_running_unsafe ();
  }
}

bool VibroMotor::is_running_unsafe (void) const
{
  return vibro_is_busy ();
}

bool VibroMotor::init (void)
{
  /* Set vibration control pin to output mode */
  Pins::set_out (PIN_VIBRO);

  /* Switch off */
  Pins::drive_low (PIN_VIBRO);

  return true;
}

void VibroMotor::on_sqw_transition(uint8_t i, sqw_transition_t trans)
{
  if (i != SQW_VIBRO)
	  return;

  uint8_t mask = digitalPinToBitMask (PIN_VIBRO);
  uint8_t port = digitalPinToPort (PIN_VIBRO);

  volatile uint8_t *out;
  out = portOutputRegister (port);

  switch (trans)
  {
	case SQW_TRANS_LOW:
    *out &= ~mask;
	  break;

	case SQW_TRANS_HIGH:
    *out |= mask;
	  break;

	case SQW_TRANS_TOGGLE:
    *out ^= mask;
	  break;
  }
}
