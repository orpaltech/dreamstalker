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
#include <string.h>
#include <util/atomic.h>

#include "ds_sqwave.h"
#include "ds_rtclock.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
void SQWave::handle_isr (void)
{
	get()->irq_handler ();
}

/*-----------------------------------------------------------------------*/
static SQWave sqwav;

/*-----------------------------------------------------------------------*/
SQWave *SQWave::get()
{
  return &sqwav;
}

/*-----------------------------------------------------------------------*/
void SQWave::irq_handler (void)
{
  volatile sqw_context_t *ps;
  uint16_t pulse_width;

  for (uint8_t i=0; i< SQW_SLOTS; i++) {
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

void SQWave::do_transition (uint8_t i, sqw_transition_t trans)
{
  volatile sqw_context_t *ps = &sqw[i];

  if (ps->pcb_transition)
	(*ps->pcb_transition) (ps->context, i, trans);
}

bool SQWave::init(void)
{
  memset ((void *)sqw, 0, SQW_SLOTS * sizeof(sqw_context_t));

  return true;
}

bool SQWave::is_active (uint8_t i)
{
  bool active;

  if (i >= SQW_SLOTS)
	return false;
	
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

	active = ( sqw[ i ].active != 0 );
  }
  return active;
}

void SQWave::start(uint8_t i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle, 
					SQWaveCB_Transition_t ptcb, void *context)
{
  sqw_context_t volatile *ps;

  if (i >= SQW_SLOTS)
	return;
  if (is_active (i))
	return;

  ps = &sqw[ i ];

  if (period_ms > 0) {
	/* 
	 * The period must be at least 2 * RTC ISR period
	 */
	if (period_ms < (RTClock::isr_period_ms () * 2))
	  period_ms = (RTClock::isr_period_ms () * 2);
  }

  if (duration_ms > 0) {
	/* 
	 * The duration must be at least one period
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
	ps->pcb_transition = ptcb;
	ps->context = context;
	ps->pcb_complete = nullptr;

	do_transition ( i, SQW_TRANS_HIGH );
  }
}

void SQWave::stop (uint8_t i)
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
