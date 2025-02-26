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

#include "ds_sqwave.h"
#include "ds_rtclock.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
void SquareWave::handle_isr (void)
{
	SQW.irq_handler ();
}

/*-----------------------------------------------------------------------*/
SquareWave SQW;

/*-----------------------------------------------------------------------*/
void SquareWave::irq_handler (void)
{
  volatile sqw_context_t *ps;
  unsigned i, pulse_width;

  for (i=0; i< SQW_SLOTS; i++) {
	ps = &sqw[ i ];

	if (! ps->active)
	  continue;

	if ( ps->duration_ticks ) {
	  if (--ps->duration_ticks == 0) {
		ps->active = false;

		do_transition ( i, SQW_TRANS_LOW );
		continue;
	  }
	}

	if ( ps->period ) {
	  pulse_width = ps->period;
	  pulse_width = ( pulse_width * ps->duty_cycle ) / 100;

	  ps->period_ticks = (ps->period_ticks + 1) % ps->period;

	  if (ps->period_ticks == pulse_width || ps->period_ticks==0) {
		do_transition ( i, SQW_TRANS_TOGGLE );
	  }
	}
  }
}

void SquareWave::do_transition (unsigned i, sqw_transition_t trans)
{
  if (sqw[i].ptcb)
	sqw[i].ptcb->on_sqw_transition ( i, trans );
}

bool SquareWave::init(void)
{
  memset ((void *)sqw, 0, SQW_SLOTS * sizeof(sqw_context_t));

  return true;
}

bool SquareWave::is_active (unsigned i)
{
  bool active;

  if (i >= SQW_SLOTS)
	return false;
	
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

	active = ( sqw[ i ].active != 0 );
  }
  return active;
}

void SquareWave::start(unsigned i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle, SquareWaveCB *ptcb)
{
  sqw_context_t volatile *ps;

  if (i >= SQW_SLOTS)
	return;
  if (is_active (i))
	return;

  ps = &sqw[ i ];

  if (period_ms > 0) {
	/* The period must be at least  2x RTC_INTERVAL_MSEC
	 */
	if (period_ms < (RTClock::isr_period_ms () * 2))
	  period_ms = (RTClock::isr_period_ms () * 2);
  }

  if (duration_ms > 0) {
	/* The duration must be at least one period
	 */
	if (duration_ms < period_ms)
	  duration_ms = period_ms;
  }

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

	ps->duration_ticks = RTClock::msec_to_ticks (duration_ms);
	ps->period = RTClock::msec_to_ticks (period_ms);
	ps->duty_cycle = duty_cycle;
	ps->period_ticks = 0;
	ps->active = true;
	ps->ptcb = ptcb;

	do_transition ( i, SQW_TRANS_HIGH );
  }
}

void SquareWave::stop (unsigned i)
{
  if (i >= SQW_SLOTS)
	return;
  if (! is_active (i))
	return;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

	sqw[ i ].active = false;

	do_transition ( i, SQW_TRANS_LOW );
  }
}
