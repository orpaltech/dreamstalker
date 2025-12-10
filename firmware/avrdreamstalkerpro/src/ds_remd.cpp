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

#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>
#include <util/atomic.h>

#include <Arduino.h>

#include "core/adc_avr.h"
#include "ds_remd.h"
#include "ds_util.h"

using namespace DS;
using namespace avr_core;


/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_IRTX  PIN_PC0

#define REMD_ADC_CHAN	0

/*-----------------------------------------------------------------------*/
REMDetect remd;

/*-----------------------------------------------------------------------*/
REMDetect *REMDetect::get()
{
  return &remd;
}

/*-----------------------------------------------------------------------*/
bool REMDetect::init (void)
{
  /* Enable IRTX line */
  pinMode( PIN_IRTX, OUTPUT );    /*set output mode*/

  /* Switch-off IRX transmitter*/
  digitalWrite( PIN_IRTX, HIGH ); /*drive pin high*/

  status = false;	/* not running */
  return true;
}

void REMDetect::end (void)
{
  /* Disable IRTX line */
  pinMode( PIN_IRTX, INPUT ); /*set input mode, high-Z*/
}

bool REMDetect::start (REMDetectCB *pcb)
{
  bool res;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    res = start_unsafe ( pcb );
  }
  return res;
}

bool REMDetect::start_unsafe (REMDetectCB *pcb)
{
  if (status)
	  return true;

  if (! A2DConv::get()->setup_channel ( REMD_ADC_CHAN, ADC_CF_NONE ))
	  return false;

  if (! A2DConv::get()->start_unsafe ( REMD_ADC_CHAN, 0, this ))
	  return false;

  /* Switch-on IRX transmitter*/
  digitalWrite( PIN_IRTX, LOW );  /*drive pin low*/

  premdcb = pcb;
  status = true;	/* running */
  return true;
}

void REMDetect::stop_unsafe (void)
{
  if (! status)
	  return;

  A2DConv::get()->stop_unsafe ( REMD_ADC_CHAN );

  /* Switch-off IRX transmitter*/
  digitalWrite( PIN_IRTX, HIGH ); /*drive pin high*/
  
  status = false;	/* not running*/
}

void REMDetect::stop (void) 
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    stop_unsafe ();
  }
}

bool REMDetect::is_running()
{
  return status;
}

void REMDetect::on_a2d_sample(uint16_t sample)
{
#if REMD_TEST
	/*
   * forward sample to UART0 during testing phase
   */
	Serial.write((const uint8_t*)&sample, 2);

#else

  // TODO: feed algorithm with the sample

#endif
}
