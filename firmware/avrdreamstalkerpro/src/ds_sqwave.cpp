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

#include <avr/io.h>
#include <string.h>
#include <util/atomic.h>

#include "ds_sqwave.h"
#include "ds_sysclock.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
void SquareWave::handle_sysclk (void)
{
  get()->irq_handler ();
}

/*-----------------------------------------------------------------------*/
SquareWave *SquareWave::get()
{
  static SquareWave sqwave;
  return &sqwave;
}

/*-----------------------------------------------------------------------*/
void SquareWave::irq_handler (void)
{
  volatile sqw_context_t *psqw;
  uint16_t pulse_width;

  for (uint8_t i=0; i< SQW_SLOTS; i++) {
	psqw = &sqw[ i ];

	if (! psqw->active)
	  continue;

	if ( psqw->duration_ticks ) {
	  if (--psqw->duration_ticks == 0) {

		psqw->active = false;

		do_transition ( i, SQW_TRANS_LOW );
		continue;
	  }
	}

	if ( psqw->period ) {
	  pulse_width = psqw->period;
	  pulse_width = ( pulse_width * psqw->duty_cycle ) / 100;

	  psqw->period_ticks = (psqw->period_ticks + 1) % psqw->period;

	  if (psqw->period_ticks == pulse_width || psqw->period_ticks==0) {

		do_transition ( i, SQW_TRANS_TOGGLE );
	  }
	}
  }
}

void SquareWave::do_transition (uint8_t i, sqw_transition_t trans)
{
  volatile sqw_context_t *psqw = &sqw[i];

  if ( psqw->ptcb )
	(*psqw->ptcb) (psqw->context, i, trans);
}

bool SquareWave::init(void)
{
  memset ((void *)sqw, 0, SQW_SLOTS * sizeof(sqw_context_t));

  return true;
}

bool SquareWave::is_active (uint8_t slot) const
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

	return is_active_unsafe (slot);
  }
}

bool SquareWave::is_active_unsafe (uint8_t slot) const
{
  if (slot >= SQW_SLOTS)
	return false;

  return ( sqw[ slot ].active != 0 );
}

void SquareWave::start (uint8_t i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle, 
						SquareWaveCB_t ptcb, void *context)
{
  ATOMIC_BLOCK (ATOMIC_RESTORESTATE) {

	start_unsafe (i, duration_ms, period_ms, duty_cycle, ptcb, context);
  }
}

void SquareWave::start_unsafe (uint8_t i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle, 
							SquareWaveCB_t ptcb, void *context)
{
  if (i >= SQW_SLOTS)
	return;
  if (is_active_unsafe (i))
	return;

  if (period_ms > 0) {
	const uint16_t min_period = (SysClock::clk_period_ms () * 2);
	/* 
	 * The period must be at least 2 * RTC ISR period
	 */
	if (period_ms < min_period)
	  period_ms = min_period;
  }

  if (duration_ms > 0) {
	/* 
	 * The duration must be at least one period
	 */
	if (duration_ms < period_ms)
	  duration_ms = period_ms;
  }

  volatile sqw_context_t *psqw = &sqw[ i ];

  psqw->duration_ticks = SysClock::msec_to_ticks (duration_ms);
  psqw->period = SysClock::msec_to_ticks (period_ms);
  psqw->duty_cycle = duty_cycle;
  psqw->period_ticks = 0;
  psqw->active = true;
  psqw->ptcb = ptcb;
  psqw->context = context;

  do_transition ( i, SQW_TRANS_HIGH );
}

void SquareWave::stop (uint8_t slot)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

	stop_unsafe (slot);
  }
}

  void SquareWave::stop_unsafe (uint8_t slot)
  {
  	if (slot >= SQW_SLOTS)
		return;
  	if (! is_active_unsafe (slot))
		return;

	sqw[ slot ].active = false;

	do_transition (slot, SQW_TRANS_LOW );
  }
