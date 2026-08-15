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
#include <util/atomic.h>

#include "ds_util.h"
#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "ds_battery.h"

using namespace ds;
using namespace avr::core;


/*-----------------------------------------------------------------------*/
#ifndef BM_POLL_PERIOD_MINUTES
  #define BM_POLL_PERIOD_MINUTES	10
#endif
#define BM_ADC_CHANNEL	2
#define BM_ADC_SAMPLES	32    // Keep it as a power of 2

#ifndef BM_TEST
  #define BM_TEST 0
#endif

#define BM_INPUT_VOLT 3.8f    // Volts, Maximum battery voltage after charge
#define BM_DIV_R2  33200.f    // Ohms
#define BM_DIV_R1  75000.f    // Ohms

/*-----------------------------------------------------------------------*/
static constexpr float MAX_VOLTAGE = ( BM_INPUT_VOLT * BM_DIV_R2 / 
                                      ( BM_DIV_R1 + BM_DIV_R2 ));
// Internal ref 2.56V is used for ADC
static constexpr uint16_t MAX_ADC_LEVEL = (MAX_VOLTAGE / 2.56f) * ADC_MAX_VALUE;

/*-----------------------------------------------------------------------*/
void Battery::handle_sysclk (void)  //called once per 1min
{
  get()->sysclk_handler();
}

void Battery::adc_sample_callback(void *context, uint16_t sample)
{
  Battery *pbm = static_cast<Battery *>(context);

  pbm->on_adc_sample( sample );
}

Battery *Battery::get()
{
  static Battery bm;
  return &bm;
}

/*-----------------------------------------------------------------------*/
void Battery::sysclk_handler (void)
{
  timer_ticks = ( timer_ticks + 1 ) % BM_POLL_PERIOD_MINUTES;
  if ( 0 == timer_ticks ) {
    if (! running) return;

    trigger_monitor ();
  }
}

void Battery::trigger_monitor (void)
{
  // Check battery level
  uint8_t level = battery_level ();
  if ( level ) {
    if ( level < BATTERY_LOW ) {
      ds::Display::get()->text_out (__disp_msg_battery_low__);
    }

    if ( level < BATTERY_EMPTY ) {
      // No more measurements needed
      return;
    }
  }

  raw_batt_level = 0;   // Start a new measurement (acts as sum)
  sample_count = 0;     // Reset the counter

  // Let ADC take a few samples 
  bool success = A2DConvert::get()->start_unsafe (
    BM_ADC_CHANNEL, 
    BM_ADC_SAMPLES,
    adc_sample_callback, 
    this );
  static_cast<void>(success);
}

bool Battery::init (void)
{
  ACSR |= _BV(ACD); // Disable analog comparator

  running = false;
  return true;
}

void Battery::start (void)
{
  if (running) return;
  
  bool success = A2DConvert::get()->setup_channel (
    BM_ADC_CHANNEL,
    ADC_CF_VREF_2_56);
  if (! success) return;

  raw_batt_level = 0;
  timer_ticks = 0;
  running = true;
}

void Battery::stop (void)
{
  running = false;
}

uint8_t Battery::battery_level (void)
{
  return (uint8_t) (raw_batt_level * 100U / MAX_ADC_LEVEL);
}

void Battery::on_adc_sample( uint16_t sample )
{
  // Accumulate the raw sum
  raw_batt_level += sample;

  // Check if we have received all requested samples
  // and calculate the true arithmetic mean
  if (++sample_count >= BM_ADC_SAMPLES) {
    raw_batt_level = raw_batt_level / BM_ADC_SAMPLES; 
  }

#if BATTMON_TEST
	/* 
   * Forward sample to UART0 during testing phase
   */
	Serial.write ((uint8_t*)&sample, 2);
#endif
}

