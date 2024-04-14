/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2024	ORPAL Technologies, Inc.
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

#include "ds_strobe.h"
#include "ds_vibro.h"


/* Peripheral controls (Platform dependent) */


#define DDR_VIBRO		DDRC
#define PORT_VIBRO		PORTC

#define DD_VIBRO		_BV(DDC1)
#define PF_VIBRO		_BV(PC1)

#define PIN_VIBRO		PINC

#define DUTY_CYCLE_MIN	20U
#define DUTY_CYCLE_MAX	90U


/*-----------------------------------------------------------------------*/
/* Vibro Control Functions									 			 */
/*-----------------------------------------------------------------------*/

static
void vibro_transition(unsigned index, strobe_transition_t trans)
{
	if (index != VIBRO_STROBE)
		return;

	switch (trans)
	{
	case STROBE_LOW:
		PORT_VIBRO &= ~PF_VIBRO;
		break;
	case STROBE_HIGH:
		PORT_VIBRO |= PF_VIBRO;
		break;
	case STROBE_TOGGLE:
		PORT_VIBRO ^= PF_VIBRO;
		break;
	}
}

void vibro_on (uint16_t duration_ms, uint8_t level)
{
	uint8_t duty_cycle;

	if (strobe_is_active(VIBRO_STROBE))	/* skip if busy*/
		return;

	if (level<1)
		return;
	if (level>9) level=9;
	switch (level)
	{
	case 1:
		duty_cycle=DUTY_CYCLE_MIN;
		break;
	case 9:
		duty_cycle=DUTY_CYCLE_MAX;
		break;
	default:
		duty_cycle = DUTY_CYCLE_MIN + ((DUTY_CYCLE_MAX-DUTY_CYCLE_MIN)/8) * (level-1);
		break;
	}

	strobe_start(VIBRO_STROBE, duration_ms, 10, duty_cycle);
}

void vibro_pulse (uint16_t duration_ms)
{

}

void vibro_init (void)
{
	/* Set vibro line to output mode */
	DDR_VIBRO |= DD_VIBRO;

	/*  Switch off vibro */
	vibro_transition(VIBRO_STROBE, STROBE_LOW);

	strobe_set_cb(VIBRO_STROBE, vibro_transition);
}
