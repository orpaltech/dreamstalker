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
#include <string.h>
#include <util/atomic.h>

#include "strobe.h"
#include "rtclock.h"
//#include "timers.h"

/* Peripheral controls (Platform dependent) */

static strobe_context_t strobes[NUM_STROBES];


void strobe_isr (void)
{
	int i, pulse_width;

	for (i=0; i< NUM_STROBES; i++)
	{
		if (strobes[i].duration_ticks)
		{
			if (--strobes[i].duration_ticks == 0)
				strobe_complete(i);
		}

		if (strobes[i].period)
		{
			pulse_width = strobes[i].period;
			pulse_width = pulse_width * strobes[i].duty_cycle / 100;

			strobes[i].period_ticks = (strobes[i].period_ticks + 1) % strobes[i].period;
			if (strobes[i].period_ticks == pulse_width || strobes[i].period_ticks==0)
			{
				strobe_transition(i, STROBE_TOGGLE);
			}
		}
	}
}

void strobe_init(void)
{
	//timer2_on(strobe_isr, 1U);
}

uint32_t strobe_interval_us (void)	/* 1 millisecond */
{
	return 1000UL;
}

strobe_context_t *strobe_get(int i)
{
	return &strobes[i];
}

int strobe_is_active (int i)
{
	return strobe_get(i)->duration_ticks || strobe_get(i)->period;
}

void strobe_setup(int i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
	strobe_get(i)->duration_ticks = 1000UL * (duration_ms) / strobe_interval_us();
	strobe_get(i)->period = 1000UL * (period_ms) / strobe_interval_us();
	strobe_get(i)->duty_cycle = duty_cycle;
	strobe_get(i)->period_ticks = 0;
}

void strobe_set_callbacks(int i, pfn_strobe_complete complete_func, pfn_strobe_transition trans_func)
{
	strobes[i].complete = complete_func;
	strobes[i].transition = trans_func;
}

void strobe_transition(int i, strobe_transition_t trans)
{
	if (strobe_get(i)->transition)
		strobe_get(i)->transition(i, trans);
}

void strobe_complete(int i)
{
	strobe_get(i)->duration_ticks = 0;
	strobe_get(i)->period_ticks = 0;
	strobe_get(i)->period = 0;

	if (strobe_get(i)->complete)
		strobe_get(i)->complete(i);
}
