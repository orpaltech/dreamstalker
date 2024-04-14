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
#include <string.h>
#include <util/atomic.h>

#include "ds_strobe.h"
#include "ds_rtclk.h"


/*-----------------------------------------------------------------------*/

typedef struct s_strobe_context {
	uint32_t duration_ticks;
	uint16_t period_ticks;
	uint16_t period;
	uint8_t duty_cycle;
	pfn_strobe_transition transition;
} strobe_context_t;

static volatile strobe_context_t strobes[MAX_STROBES];

/*-----------------------------------------------------------------------*/
static inline
strobe_context_t *strobe_get (unsigned i)
{
	if (i >= MAX_STROBES)
		return NULL;

	return &strobes[i];
}

static
void strobe_do_transition(unsigned i, strobe_transition_t trans)
{
	if (strobe_get(i)->transition)
		strobe_get(i)->transition(i, trans);
}

/*-----------------------------------------------------------------------*/

void strobe_isr (void)
{
	strobe_context_t *ps;
	uint32_t i, pulse_width;

	for (i=0; i< MAX_STROBES; i++) {
		ps = strobe_get(i);

		if (ps->duration_ticks) {
			if (--ps->duration_ticks == 0) {
				ps->duration_ticks = 0;
				ps->period_ticks = 0;
				ps->period = 0;

				strobe_do_transition(i, STROBE_LOW);
			}
		}

		if (ps->period) {
			pulse_width = ps->period;
			pulse_width = pulse_width * ps->duty_cycle / 100;

			ps->period_ticks = (ps->period_ticks + 1) % ps->period;
			if (ps->period_ticks == pulse_width || ps->period_ticks==0)
			{
				strobe_do_transition(i, STROBE_TOGGLE);
			}
		}
	}
}

/*-----------------------------------------------------------------------*/

void strobe_init(void)
{
	memset(strobes, 0, MAX_STROBES * sizeof(strobe_context_t));
}

bool strobe_is_active (unsigned i)
{
	if (i >= MAX_STROBES)
		return;

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		return strobe_get(i)->duration_ticks || strobe_get(i)->period;
	}
}

void strobe_start(unsigned i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
	strobe_context_t *ps;

	if (strobe_is_active(i))
		return;

	ps = strobe_get(i);
	if (!ps)
		return;

	if (duration_ms < RTC_INTERVAL_MSEC) duration_ms = RTC_INTERVAL_MSEC;
	if (period_ms	< RTC_INTERVAL_MSEC) period_ms	 = RTC_INTERVAL_MSEC;

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		ps->duration_ticks = rtc_msec_to_ticks(duration_ms);
		ps->period = rtc_msec_to_ticks(period_ms);
		ps->duty_cycle = duty_cycle;
		ps->period_ticks = 0;
	}
	strobe_do_transition(i, STROBE_HIGH);
}

void strobe_stop(unsigned i)
{
	strobe_context_t *ps = strobe_get(i);
	if (!ps)
		return;

	ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
		ps->duration_ticks = 0;
		ps->period = 0;
	}
	strobe_do_transition(i, STROBE_LOW);
}

void strobe_set_cb(unsigned i, pfn_strobe_transition trans_func)
{
	if (i >= MAX_STROBES)
		return;

	strobe_get(i)->transition = trans_func;
}
