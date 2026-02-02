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

#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "ds_battery.h"
#include "ds_util.h"

using namespace DS;
using namespace avr_core;


/*-----------------------------------------------------------------------*/
#ifndef BATTMON_PERIOD_MINUTES
  #define BATTMON_PERIOD_MINUTES	10
#endif
#define BATTMON_CHANNEL	2
#define BATTMON_SAMPLES	32

#ifndef BATTMON_TEST
  #define BATTMON_TEST 0
#endif

#define BATTMON_INPUT_VOLT    3.8       // Volts, maximum battery voltage after charge
#define BATTMON_RESISTOR2     33200.    // Ohms
#define BATTMON_RESISTOR1     75000.    // Ohms

/*-----------------------------------------------------------------------*/
static constexpr float max_voltage = ( BATTMON_INPUT_VOLT * BATTMON_RESISTOR2 / 
                                      ( BATTMON_RESISTOR1 + BATTMON_RESISTOR2 ));
// Internal ref 2.56V is used for ADC
static constexpr uint16_t max_adc_level = (max_voltage / 2.56) * ADC_MAX_VALUE;

/*-----------------------------------------------------------------------*/
void BatteryMonitor::handle_sysclk (void)	/* called every 1 min */
{
  get()->irq_handler();
}

/*-----------------------------------------------------------------------*/
void BatteryMonitor::adc_sample_callback(void *context, uint16_t sample)
{
  BatteryMonitor *pbm = reinterpret_cast<BatteryMonitor *>(context);

  pbm->on_adc_sample( sample );
}

/*-----------------------------------------------------------------------*/
BatteryMonitor *BatteryMonitor::get()
{
  static BatteryMonitor bm;
  return &bm;
}

/*-----------------------------------------------------------------------*/
void BatteryMonitor::irq_handler (void) /*runs once per 1min */
{
  timer_ticks = ( timer_ticks + 1 ) % BATTMON_PERIOD_MINUTES;
  if ( timer_ticks == 0 ) {

    if (! running)
	    return;

    run_monitor ();
  }
}

void BatteryMonitor::run_monitor (void)
{
  uint8_t lvl;

  /* Check battery level */
  lvl = battery_level ();
  if ( lvl ) {
    if ( lvl < BATTERY_LOW )
      Display::get()->text_out (__disp_msg_battery_low__);

    if ( lvl < BATTERY_EMPTY )
      return;   /* No more measurements needed */
  }

  batt_level = 0;	/* Start a new measurement */

  /* Let ADC take a few samples */
  A2DConvert::get()->start_unsafe ( BATTMON_CHANNEL, 
                                  BATTMON_SAMPLES, 
                                  adc_sample_callback, 
                                  this );
}

bool BatteryMonitor::init (void)
{
  ACSR |= _BV(ACD); /* Disable analog comparator */

  running = false;
  return true;
}

void BatteryMonitor::start (void)
{
  if (running)
    return;
  
  bool success = A2DConvert::get()->setup_channel (
                BATTMON_CHANNEL, ADC_CF_VREF_2_56);
  if (! success)
	  return;

  batt_level = 0;
  timer_ticks = 0;
  running = true;
}

void BatteryMonitor::stop (void)
{
  running = false;
}

uint8_t BatteryMonitor::battery_level (void)
{
  return (uint8_t) ((uint32_t ( batt_level ) * 100U) / max_adc_level);
}

void BatteryMonitor::on_adc_sample( uint16_t sample )
{
  if ( 0 == batt_level ) {

	  batt_level = sample;
  } else {

	  batt_level = (uint32_t( batt_level ) + sample) / 2;
  }

#if BATTMON_TEST
	/* 
   * Forward sample to UART0 during testing phase
   */
	Serial.write ((uint8_t*)&sample, 2);
#endif
}

