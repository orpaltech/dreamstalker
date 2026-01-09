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
#include "ds_remdetect.h"
#include "ds_util.h"

using namespace DS;
using namespace avr_core;


/*-----------------------------------------------------------------------*/
/** Defines the REM detector test mode
 */
#ifndef TEST_REMD
# define TEST_REMD 0
#endif

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_IRTX  PIN_PC0


/*-----------------------------------------------------------------------*/
#define REMD_ADC_CHAN 0

#define MIN_DURATION  10U           // Must be fast for at least 10ms
// Sensitivity: How many times above noise is a "movement"?
#define SENSITIVITY   6U            // 5 to 8 is usually a good starting range

// Constants for 1kHz sampling
#define SAMPLES_PER_EPOCH 30000U    // 30 seconds at 1kHz
#define MIN_REM_ACTIVITY  5U        // Min movements to call it REM

/*-----------------------------------------------------------------------*/
static REMDetect remd;

/*-----------------------------------------------------------------------*/
void REMDetect::a2d_sample_callback(void *context, uint16_t sample)
{
  REMDetect *premd = static_cast<REMDetect *>(context);

  premd->on_a2d_sample(sample);
}

/*-----------------------------------------------------------------------*/
REMDetect *REMDetect::get()
{
  return &remd;
}

/*-----------------------------------------------------------------------*/
bool REMDetect::init (void)
{
  /* Enable IRTX line */
  Pins::set_out ( PIN_IRTX );       /*set output mode*/

  /* Switch-off IRX transmitter*/
  Pins::drive_high ( PIN_IRTX );    /*drive pin high*/

  status = false;	/* not running */

#if TEST_REMD
  file_buf_ready = false;
#endif
  return true;
}

void REMDetect::end (void)
{
  /* Disable IRTX line */
  Pins::set_in_highz ( PIN_IRTX );  /*set input mode, high-Z*/
}

bool REMDetect::start (REMDetectCB_t pcb, void *pcontext)
{
  bool res;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    res = start_unsafe ( pcb, pcontext );
  }
  return res;
}

bool REMDetect::start_unsafe (REMDetectCB_t pcb, void *pcontext)
{
  if (status)
	  return true;

#if TEST_REMD
  file_buf_idx = 0;
  file_buf_ready = false;
#endif

  if (! A2DConv::get()->setup_channel ( REMD_ADC_CHAN ))
	  return false;

  if (! A2DConv::get()->start_unsafe ( REMD_ADC_CHAN, 0, 
                                  a2d_sample_callback, this ))
	  return false;

  /* Switch-on IRX transmitter*/
  Pins::drive_low ( PIN_IRTX );   /*drive pin low*/

  premdcb = pcb;
  context = pcontext;

  /* Algorithm-related variables */
  noise_level = 100; // Start with a sensible guess (scaled)
  last_sample = 0;
  lowpass_filter.reset();
  epoch_sample_count = 0;
  movements_in_epoch = 0;
  movement_duration = 0;

  /* Set running */
  status = true;
  return true;
}

void REMDetect::stop_unsafe (void)
{
  if (! status)
	  return;

  A2DConv::get()->stop_unsafe( REMD_ADC_CHAN );

  /* Switch-off IRX transmitter*/
  Pins::drive_high( PIN_IRTX );    /*drive pin high*/
  
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

bool REMDetect::detect_movement(int16_t sample)
{
  int16_t velocity = abs(sample - last_sample);
  last_sample = sample;

  // 1. Calculate dynamic threshold
  int16_t threshold = (noise_level >> 7) * SENSITIVITY;

  // 2. Check for REM
  bool is_moving = (velocity > threshold);

  // 3. Update Noise Floor (Auto-Calibration)
  // If it's NOT a movement, slowly update the background noise level
  // We use a "leaky integrator" to avoid using arrays/buffers
  if (!is_moving) {
    // noise_level = 99% old noise + 1% current velocity
    noise_level = noise_level - (noise_level >> 7) + velocity;
  }

  return is_moving;
}

void REMDetect::handle_analysis(bool move_detected)
{
    epoch_sample_count++;

    // 1. Debounce the movement (ensure we count 1 movement, not 1000 flags)
    if (move_detected) {
        movement_duration++;
    } else {
        /* If movement just stopped and it lasted at least specified duration,
         * count it as ONE event
         */
        if (movement_duration > MIN_DURATION) {
            movements_in_epoch++;
        }
        movement_duration = 0;
    }

    // 2. Check if the 30-second Epoch is complete
    if (epoch_sample_count >= SAMPLES_PER_EPOCH) {
        
        if (movements_in_epoch >= MIN_REM_ACTIVITY) {
            // THIS 30-SEC WINDOW IS REM
            if (premdcb)
              (*premdcb) (context, REMD_REM_DETECTED);
        } else {
            // THIS 30-SEC WINDOW IS NREM (Non-REM)
            //Serial.println("EPOCH_RESULT: NREM");
        }

        // Reset for next 30 seconds
        epoch_sample_count = 0;
        movements_in_epoch = 0;
    }
}

void REMDetect::on_a2d_sample(uint16_t sample)
{
  int16_t filtered_sample = lowpass_filter.process(sample);

#if TEST_REMD
  #if TEST_REMD_SERIAL
  	/* forward sample to serial port during testing phase */
  	Serial.write((const uint8_t*)&filtered_sample, 2);
  #else
  	/* forward sample to file during testing phase */
    if (! file_buf_ready) {
        file_buf[file_buf_idx++] = filtered_sample;
        if (file_buf_idx >= 256) {
            file_buf_idx = 0;
            file_buf_ready = true; // Tell main loop to write
        }
    }
  #endif
#else

  /* feed algorithm with the sample */
  bool move_detected = detect_movement(filtered_sample);
  handle_analysis(move_detected);

#endif
}
