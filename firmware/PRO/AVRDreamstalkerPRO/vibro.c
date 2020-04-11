/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2020	ORPAL Technologies, Inc.
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

#include "vibro.h"
#include "strobe.h"
//#include "timers.h"

/* Peripheral controls (Platform dependent) */
#define DDR_VIBRO	DDRC
#define PORT_VIBRO	PORTC
#define PIN_VIBRO	PINC

#define DD_VIBRO	_BV(DDC1)

#define BIT_VIBRO	PC1


#define DUTY_CYCLE_MIN	20U
#define DUTY_CYCLE_MAX	90U


/*-----------------------------------------------------------------------*/
/* Vibro Control Functions									 			 */
/*-----------------------------------------------------------------------*/

static
void vibro_transition(int i, strobe_transition_t trans)
{
	switch (trans)
	{
	case STROBE_OFF:
		PORT_VIBRO &= ~_BV(BIT_VIBRO);
		break;
	case STROBE_ON:
		PORT_VIBRO |= _BV(BIT_VIBRO);
		break;
	case STROBE_TOGGLE:
		PORT_VIBRO ^= _BV(BIT_VIBRO);
		break;
	}
}

static
void vibro_complete (int i)
{
	vibro_transition(i, STROBE_OFF);
}

void vibro_on (uint16_t duration_ms, uint8_t level)
{
	uint8_t duty_cycle;

	if (strobe_is_active(2))	/* skip if busy*/
		return;

	if (level<1)
		return;
	if (level>10) level=10;
	switch (level)
	{
	case 1:
		duty_cycle=DUTY_CYCLE_MIN;
		break;
	case 10:
		duty_cycle=DUTY_CYCLE_MAX;
		break;
	default:
		duty_cycle = DUTY_CYCLE_MIN + ((DUTY_CYCLE_MAX-DUTY_CYCLE_MIN)/8) * (level-1);
		break;
	}

	strobe_setup(2, duration_ms, 10, duty_cycle);

	vibro_transition(2, STROBE_ON);
}

void vibro_init (void)
{
	DDR_VIBRO |= DD_VIBRO;	/* vibro output line */

	strobe_set_callbacks(2, vibro_complete, vibro_transition);
}
