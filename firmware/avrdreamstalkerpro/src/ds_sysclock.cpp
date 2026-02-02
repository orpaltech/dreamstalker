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

#include <stdio.h>
#include <string.h>
#include <time.h>

#include <avr/io.h>
#include <compat/ina90.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "core/tmr_avr.h"
#include "core/adc_avr.h"
#include "display/ds_display.h"
#include "input/ds_keybrd.h"
#include "sound/ds_sound.h"
#include "ds_config.h"
#include "ds_driver.h"
#include "ds_battery.h"
#include "ds_remhints.h"
#include "ds_rtclock.h"
#include "ds_sysclock.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Interrupt Handler 													                           */
/*-----------------------------------------------------------------------*/
#if defined(__AVR_ATmega128__)
ISR(TIMER2_COMPA_vect)
#elif defined (__AVR_ATmega1281__)
ISR(TIMER0_COMPA_vect)
#endif
{
  // These tasks run at a perfect 1ms interval 
  // sourced from the 8MHz internal clock.

  SysClock::handle_isr();
}

/*-----------------------------------------------------------------------*/
void SysClock::handle_isr (void)
{
  get()->irq_handler();
}

/*-----------------------------------------------------------------------*/
SysClock *SysClock::get()
{
  static SysClock sys_clk;
  return &sys_clk;
}

/*-----------------------------------------------------------------------*/
static constexpr uint16_t ticks_1sec = SysClock::msec_to_ticks (1000);
static constexpr uint8_t ticks_200ms = SysClock::msec_to_ticks (200);

/*-----------------------------------------------------------------------*/
void SysClock::irq_handler (void)
{
  if (Driver::get()->get_mode() != OPM_NORMAL)
    return;

  /* Let keyboard first process the interrupt 
   */
  if ( Keyboard::handle_sysclk ()) {

	// Reset display-off counter on a key press
    RTClock::get()->awake_display ();
  }

  /* Let other subsystems process interrupt */
  Display::handle_sysclk ();
  SquareWave::handle_sysclk ();
  REMHints::handle_sysclk ();
  avr_core::A2DConvert::handle_sysclk ();


  // ... other 1ms dependencies ...

  clk.ticks_second = (clk.ticks_second + 1) % ticks_1sec;
  if (clk.ticks_second == 0) {
	  /*
	   * get here every SECOND
	   */

    Driver::handle_sysclk ();
	  Sound::handle_sysclk ();

    struct tm ltm;
    RTClock::get()->get_time(&ltm);

    if (ltm.tm_sec == 0) {
	    /*
	     * get here every MINUTE
	     */

      BatteryMonitor::handle_sysclk ();
    }

  } // End of 1 sec block

  clk.ticks_setup = (clk.ticks_setup + 1) % ticks_200ms;
  if (clk.ticks_setup == 0) {
	  /*
	   * get here around 5 times/sec
	   */

    RTClock::get()->handle_setup ();
  }
}

/* ------------------------------------------------------------------------- */
/* SysClock Initialization (1ms Heartbeat @ 8MHz)                            */
/* ------------------------------------------------------------------------- */

bool SysClock::init()
{
  return true;
}

void SysClock::start (void)
{
  // Reinitialize tick counters
  clk.ticks_second = 0;
  clk.ticks_setup = 0;

#if defined(__AVR_ATmega128__)
  /* Use Timer 2 (Timer 0 is busy with RTC) */

  // Set CTC Mode (Clear Timer on Compare Match)
  TCCR2 = _BV(WGM21);

  TMR2_SET_N(64);   // Set Prescaler to 64

  // Set Compare Value for 1ms
  // Calculation: 8,000,000 / 64 / 1000 = 125
  OCR2 = 125;

  TCNT2 = 0;  // Clear counter

  /* Clear pending interrupts and enable */
  TIFR |= _BV(OCF2);
  TIMSK |= _BV(OCIE2);

#elif defined (__AVR_ATmega1281__)
  /* Use Timer 0 (Timer 2 is busy with RTC) */

  // Set CTC Mode (Clear Timer on Compare Match)
  TCCR0A = _BV(WGM01);

  TMR0_SET_N(64);  // Set Prescaler to 64

  // Set Compare Value for 1ms
  // Calculation: 8,000,000 / 64 / 1000 = 125
  OCR0A = 125;

  TCNT0 = 0;  // Clear counter

  /* Clear pending interrupts and enable */
  TIFR0 = _BV(OCF0A);
  TIMSK0 = _BV(OCIE0A);
#endif
}

void SysClock::stop (void)
{
#if defined (__AVR_ATmega128__)
  /* Timer/Counter 2 is being used on atmega128 */
  TMR2_OFF();

  TIMSK &= ~_BV(OCIE2);

#elif defined (__AVR_ATmega1281__)

  /* Timer/Counter 0 is being used on atmega1281 */
  TMR0_OFF();

  /* Disable interrupts */
  TIMSK0 &= ~_BV(OCIE0A);
#endif
}

void SysClock::wait (uint16_t duration_ms)
{
  for (uint16_t i = 0; i < duration_ms; ++i)
  	_delay_ms (1);
}
