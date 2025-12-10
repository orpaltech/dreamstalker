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
  return SquareWave::get()->is_active (SQW_VIBRO);
}


/*-----------------------------------------------------------------------*/
DS::VibroMotor vibro;

/*-----------------------------------------------------------------------*/
VibroMotor *VibroMotor::get()
{
  return &vibro;
}

/*-----------------------------------------------------------------------*/
bool VibroMotor::start (uint8_t level, uint16_t duration_ms)
{
  uint8_t duty_cycle;

  if (vibro_is_busy())	/* skip if busy*/
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

  SquareWave::get()->start (SQW_VIBRO, duration_ms, 10, duty_cycle, this);

  return true;
}

void VibroMotor::stop (void)
{
  if (!vibro_is_busy())	/* skip if inactive*/
	  return;

  SquareWave::get()->stop (SQW_VIBRO);
}

bool VibroMotor::is_running (void)
{
  return vibro_is_busy ();
}

bool VibroMotor::init (void)
{
  /* Set vibration control pin to output mode */
  pinMode ( PIN_VIBRO, OUTPUT );

  /* Switch off */
  digitalWrite ( PIN_VIBRO, LOW );

  return true;
}

void VibroMotor::on_sqw_transition(unsigned i, sqw_transition_t trans)
{
  if (i != SQW_VIBRO)
	  return;

  uint8_t mask = digitalPinToBitMask(PIN_VIBRO);
  uint8_t port = digitalPinToPort(PIN_VIBRO);

  volatile uint8_t *out;
  out = portOutputRegister(port);

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
