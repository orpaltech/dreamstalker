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
#include <util/atomic.h>

#include <Arduino.h>

#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "ds_pwrman.h"
#include "ds_util.h"

using namespace DS;
using namespace avr_core;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_MGBUF   PIN_PG0

//#define DDR_MGBUF	DDRG		/* MGBUF direction register */
//#define DD_MGBUF	_BV(DDG0)

//#define PORT_MGBUF	PORTG		/* MGBUG out register */
//#define PINS_MGBUF	PING		/* MGBUG input register */
//#define BIT_MGBUF	PG0
//#define PF_MGBUF	_BV(BIT_MGBUF)


/*-----------------------------------------------------------------------*/
/* The GBUF level is declared 1.23V in the datasheet and this level 
 *	should be considered as "full" battery.
 *	Note, that GBUF level is in fact ~1.15V when the power supply 
 *	is close to 3V.
 * As the internal ref 2.56V is used for ADC, the GBUF level 1.23V
 * 	is supposed to be 0x1EC in a 10-bit sample. 
 * 	The value 0x1CC corresponds to 1.15V, which is the real measured GBUF level.
 */
#define BATTMON_FULL_ADC_LEVEL	0x01CCU

#ifndef BATTMON_PERIOD_MINUTES
  #define BATTMON_PERIOD_MINUTES	3
#endif
#define BATTMON_CHANNEL	2
#define BATTMON_SAMPLES	32

#ifndef BATTMON_TEST
#define BATTMON_TEST  0
#endif

/*-----------------------------------------------------------------------*/
void PowerManager::handle_isr (void)	/* called every 1 min */
{
  PM.irq_handler();
}

/*-----------------------------------------------------------------------*/
PowerManager PM;

/*-----------------------------------------------------------------------*/
void PowerManager::irq_handler (void)
{
  timer_ticks = ( timer_ticks + 1 ) % BATTMON_PERIOD_MINUTES;
  if ( 0 == timer_ticks ) {

    if (! battmon_status)
	    return;

    run_monitor ();
  }
}

void PowerManager::run_monitor (void)
{
  uint8_t lvl;

  /* check battery level */
  lvl = battery_level ();
  if ( lvl ) {
    if ( lvl < BATTERY_LOW )
      disp.text_out ( __disp_msg_battery_low__ );

    if ( lvl < BATTERY_EMPTY )
      return;   /* No more measurements needed */
  }

  batt_level = 0;	/* Start a new measurement */

  /* Let ADC take a few samples */
  A2D.start_unsafe ( BATTMON_CHANNEL, BATTMON_SAMPLES, this );
}

bool PowerManager::init (void)
{
  /* NOTE: Set GBUF line to be controlled by the codec. 
   *	The GBUF expected level is ~1.23V according to datasheet.
   */
  pinMode ( PIN_MGBUF, INPUT_PULLUP );  /* set for input & pullup */
  //pinMode ( PIN_MGBUF, INPUT );	    /* set for input & high-Z */


  /* 
   * Disable unused hardware 
   */
  ACSR |= _BV(ACD); /* Disable analog comparator */

  battmon_status = false;
  return true;
}

void PowerManager::start (void)
{
  if (battmon_status)
    return;
  
  if (! A2D.setup_channel ( BATTMON_CHANNEL, ADC_CF_VREF_2_56))
	  return;

  batt_level = 0;
  timer_ticks = 0;
  battmon_status = true;
}

void PowerManager::stop (void)
{
  battmon_status = false;
}

uint8_t PowerManager::battery_level (void)
{
  return ( 100UL * batt_level ) / BATTMON_FULL_ADC_LEVEL;
}

void PowerManager::on_a2d_sample( uint16_t sample )
{
  if ( 0 == batt_level )
	  batt_level = sample;
  else
	  batt_level = ((uint32_t) batt_level + (uint32_t) sample) / 2;

#if BATTMON_TEST
	/* 
   * Forward sample to UART0 during testing phase
   */
	Serial.write ((uint8_t*)&sample, 2);
#endif
}

