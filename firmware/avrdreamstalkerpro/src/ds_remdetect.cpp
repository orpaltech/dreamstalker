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
#include <time.h>

#include <avr/io.h>
#include <util/delay.h>
#include <util/atomic.h>

#include <Arduino.h>

#include "core/adc_avr.h"
#include "ds_remdetect.h"
#include "ds_config.h"
#include "ds_sysclock.h"
#include "ds_util.h"
#include "ds_sdfat.h"

using namespace ds::remd;
using namespace avr::core;


/*-----------------------------------------------------------------------*/
/** Defines the REM detector test mode
 */
#ifndef REMD_LOG
  #define REMD_LOG 0
#endif

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_IRTX  PIN_PC0


/*-----------------------------------------------------------------------*/
#define REMD_ADC_CHAN   0

#if CLK_PERIOD_MSEC == 1
  // ADC is taking samples every 1ms, i.e. 1KHz
  #define SAMPLE_RATE_HZ  1000UL
#endif

#define TIME_TO_SAMPLES(ms)   (SAMPLE_RATE_HZ * (ms)) / 1000

#if SAMPLE_RATE_HZ == 1000UL
  // Constants for 1kHz sampling
  #define SAMPLES_PER_EPOCH     30000U  // 30s at 1kHz
  #define MAX_SAMPLES_PER_MOVE  500U    // 500ms at 1KHz
  #define SAMPLES_PER_BUCKET    50U     // 50ms at 1kHz
#endif

// Tune RESTLESS_THRESHOLD (e.g., 30-50) based on your sensor noise.
//#define RESTLESS_THRESHOLD  40

//#define STAGE_REM   1
//#define STAGE_NREM  0

//#define MULT_1P5(val) (val + ((val) >> 1))
//#define MULT_2(val)   ((val) << 1)

/*-----------------------------------------------------------------------*/
static REMDetect only;

/*-----------------------------------------------------------------------*/
void REMDetect::a2d_sample_callback(void *context, uint16_t sample)
{
  REMDetect *premd = static_cast<REMDetect *>(context);

  premd->on_a2d_sample(sample);
}

/*-----------------------------------------------------------------------*/
REMDetect *REMDetect::get()
{
  return &only;
}

/*-----------------------------------------------------------------------*/
bool REMDetect::init (void)
{
  /* Enable IRTX line */
  Pins::set_out ( PIN_IRTX );       /*set output mode*/

  /* Switch-off IRX transmitter*/
  Pins::drive_high ( PIN_IRTX );    /*drive pin high*/

  state = REMD_STATE_OFF;	/* not running */
  check_mode = false;
  return true;
}

void REMDetect::end (void)
{
  /* Disable IRTX line */
  Pins::set_in_highz ( PIN_IRTX );  /*set input mode, high-Z*/
}

bool REMDetect::start (REMDetectCB_t pcb, void *pcontext, bool remd_check)
{
  if (get_state () != REMD_STATE_OFF)
    return false;

  pcb_func = pcb;
  pcb_context = pcontext;
  check_mode = remd_check;

  state = REMD_STATE_START;   // Request start
  return true;
}

bool REMDetect::start_internal (void)
{
  if (get_state () != REMD_STATE_START)
    return false;

  if (! A2DConvert::get()->setup_channel ( REMD_ADC_CHAN ))
	  return false;

  if (! A2DConvert::get()->start ( REMD_ADC_CHAN, 0, a2d_sample_callback, this ))
	  return false;

  /* Switch-on IRX transmitter*/
  Pins::drive_low ( PIN_IRTX );   /*drive pin low*/

  lowpass_flt.reset();

  /* Initialize algorithm-related variables */
  remd.move_count = 0;
  remd.epoch_samples = 0;
  remd.current_epoch = 0;
  remd.rem_epoch_count = 0;
  remd.last_trigger_epoch = 0;

  remd.epoch_total_delta = 0;

  remd.move_peak_delta = 0;
  remd.epoch_peak_delta = 0;

  remd.bucket_sum = 0;
  remd.bucket_count = 0;
  remd.last_avg = -1; // Special flag or "to be initialized" value
  remd.move_duration = 0;

  remd.trigger_cycle = 0;
  
  // initialize stats buffer
  stats_buff.overrun = false;
  stats_buff.read_idx = 0;
  stats_buff.write_idx = 0;

  // allocate a new file name
  Files::make_next_file_path(stats_filepath, STATS_PATH, "REMD", "DAT", 4);

#if (REMD_LOG == REMD_LOG_FILE)
  slog.buf_idx = 0;
  slog.buf_ready = false;

  // create a new file
  String filepath;
  Files::make_next_file_path(filepath, STATS_PATH, "REMDS", "BIN", 3);

  slog_fp = card0.open (filepath.c_str(), FILE_WRITE);
#endif

  /* Set running */
  state = REMD_STATE_ON;
  return true;
}

void REMDetect::stop_internal (void)
{
  if (get_state () != REMD_STATE_STOP)
    return;

  A2DConvert::get()->stop( REMD_ADC_CHAN );

  /* Switch-off IRX transmitter*/
  Pins::drive_high( PIN_IRTX );    /*drive pin high*/

  state = REMD_STATE_OFF;	/* not running*/

#if REMD_LOG == REMD_LOG_FILE
  if ( slog_fp ) {
    slog_fp.flush();
    slog_fp.close();
  }
#endif
}

void REMDetect::stop (void) 
{
  if (get_state () != REMD_STATE_ON)
    return;

  state = REMD_STATE_STOP;  // Request stop
}

remd_state_t REMDetect::get_state (void) const
{
  return state;
}

bool REMDetect::is_check_mode (void) const
{
  return check_mode;
}

void REMDetect::process_task (void)
{
  if (get_state () == REMD_STATE_STOP) {
    stop_internal ();
    return;
  }

  if (get_state () == REMD_STATE_START) {
    start_internal ();
    return;
  }

  if (get_state () != REMD_STATE_ON) {
    // Nothing to do
    return;
  }

#if REMD_LOG
  #if REMD_LOG == REMD_LOG_FILE

  if ( slog.buf_ready ) {
    if ( slog_fp ) {
      // copy buffer and release it
      memcpy ( slog_fp_buf, (const void *)slog.buf, sizeof(slog.buf) );
    }
    slog.buf_ready = false;

    if ( slog_fp ) {
      // write to SD card
      slog_fp.write ( (const uint8_t*) slog_fp_buf, sizeof(slog_fp_buf) );
    }
  }

  #endif
#else

  if ( is_check_mode () )
    return; // No epoch logging in check mode

  // Check for data in the circular buffer
  if (stats_buff.read_idx != stats_buff.write_idx) {
    remd_epoch_stats_t stats;
    bool data_ready = false;

    // CRITICAL SECTION: Copy data and release the buffer slot immediately
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
      if (stats_buff.read_idx != stats_buff.write_idx) {
        memcpy(&stats, (const void *)&stats_buff.data[stats_buff.read_idx], 
              sizeof(remd_epoch_stats_t));
        
        // Move the read pointer immediately so the ISR can reuse this slot
        stats_buff.read_idx = (stats_buff.read_idx + 1) % STATS_BUFF_LEN;
        data_ready = true;
      }
    }

    // Do the heavy lifting outside the atomic block
    if (data_ready) {
      File fp = SdFatEx::get()->sd0.open(stats_filepath, FILE_WRITE);
      if ( fp ) {
        if (fp.size() == 0) { // Only write if file is new
          remd_epoch_config_t cfg = {
            .magic = REMD_EPOCH_MAGIC,
            .start_time = time (nullptr) + UNIX_OFFSET,
            .profile = config.get_remd_profile ()
          };
          fp.write((const uint8_t*)&cfg, sizeof(remd_epoch_config_t));
        }

        // seek(size) ensures we are at the end of the file for a true append
        fp.seek(fp.size());
        fp.write((const uint8_t*)&stats, sizeof(remd_epoch_stats_t));
        fp.close();
      }
    }
  }

  // Handle overrun flag for debugging
  if (stats_buff.overrun) {
    // If this flag stays true, your SD card or Main Loop is too slow.
    // Consider increasing the buffer size in the header
    stats_buff.overrun = false;
  }
#endif
}

void REMDetect::log_epoch(uint16_t moves, uint16_t ceiling, uint16_t restlessness,
                        uint16_t peak, uint8_t rem_epochs, uint8_t trigger)
{
  volatile remd_epoch_stats_t &rpt = stats_buff.data[stats_buff.write_idx];

  // Set the sync word
  rpt.magic = REMD_EPOCH_MAGIC;
  // Storing relative seconds since start (or absolute time, or index)
  rpt.epoch_index = remd.current_epoch + 1;

  rpt.move_count = moves;
  rpt.gate_ceiling = ceiling;
  rpt.restlessness = restlessness; // To see if your body is moving
  rpt.epoch_peak_delta = peak;     // To see the "loudest" eye move
  rpt.rem_epoch_count = rem_epochs;
  rpt.trigger_status = trigger;    // The actual output

  // Buffer management...
  uint8_t next_idx = (stats_buff.write_idx + 1) % STATS_BUFF_LEN;
  if (next_idx == stats_buff.read_idx) {
    stats_buff.overrun = true;
  } else {
    stats_buff.write_idx = next_idx;
  }
}

void REMDetect::process_sample(int16_t sample)
{ 
  // 1. TIMING & EPOCH TRACKING
  remd.epoch_samples++;
  
  // 2. THE 50ms INTEGRATION BUCKET
  remd.bucket_sum += sample;
  remd.bucket_count++;

  if (remd.bucket_count < SAMPLES_PER_BUCKET)
    return; // Only process every bucket

  // --- START OF bucket ANALYSIS ---
  const int16_t current_avg = remd.bucket_sum / SAMPLES_PER_BUCKET;

  // Prevent a massive "ghost delta" on the first bucket
  if (remd.last_avg < 0) remd.last_avg = current_avg;

  const int16_t delta = abs(current_avg - remd.last_avg);
  remd.last_avg = current_avg;
  remd.bucket_sum = 0;
  remd.bucket_count = 0;

  // Track total "shakiness" for the 30-second restlessness check
  remd.epoch_total_delta += (uint32_t)delta;

  // 3. PARAMETER MAPPING
  const int16_t ceiling = (config.get_remd_sensitivity() * 5) + 20;
  const int16_t threshold = 2; 

  // 4. THE WINDOW COMPARATOR
  if (delta >= threshold) {
    remd.move_duration++; 

    // Track peak for the current individual movement
    if (delta > remd.move_peak_delta) {
      remd.move_peak_delta = delta;
    }

    // Track the absolute peak for the entire 30s epoch log
    if (delta > remd.epoch_peak_delta) {
      remd.epoch_peak_delta = delta;
    }

  } else {
    bool is_long_enough = (remd.move_duration >= config.get_remd_min_move_duration());
    bool is_not_a_blink = (remd.move_peak_delta < ceiling);

    if (is_long_enough && is_not_a_blink) {
      remd.move_count++;
      if (pcb_func)
        (*pcb_func)(pcb_context, REMD_EVENT_MOVE, remd.move_count);
    }
    remd.move_duration = 0;
    remd.move_peak_delta = 0;
  }

  // 5. THE 30-SECOND EPOCH DECISION
  if (remd.epoch_samples >= SAMPLES_PER_EPOCH) {
    
    constexpr uint16_t buckets_per_epoch = SAMPLES_PER_EPOCH / SAMPLES_PER_BUCKET;
    const uint16_t variability = (uint16_t)(remd.epoch_total_delta / buckets_per_epoch);

    // RESTLESSNESS CHECK
    if (variability > config.get_remd_restlessness_factor()) {
      remd.move_count = 0;
    }

    const bool is_rem_epoch = (remd.move_count >= config.get_remd_min_epoch_moves());
    const uint8_t required_epochs = config.get_remd_required_rem_epochs();

    // LEAKY BUCKET (Integrator)
    if (is_rem_epoch) {
      if (remd.rem_epoch_count < (required_epochs + 2))
        remd.rem_epoch_count++;
    } else {
      if (remd.rem_epoch_count > 0)
        remd.rem_epoch_count--;
      
      // Reset intensity cycle if we've been out of REM long enough for the bucket to drain
      if (remd.rem_epoch_count == 0) {
        remd.trigger_cycle = 0;
      }
    }

    // TRIGGER CHECK
    uint8_t trigger_status = 0;
    if (remd.rem_epoch_count >= required_epochs) {
      uint16_t elapsed = remd.current_epoch - remd.last_trigger_epoch;
      
      if (remd.last_trigger_epoch == 0 || elapsed >= config.get_remd_cooldown_epochs()) {

        // Dynamic Intensity Logic
        switch(remd.trigger_cycle % 3) {
          case 0:  trigger_status = 15; break; // Subtle
          case 1:  trigger_status = 20; break; // Medium
          default: trigger_status = 30; break; // Strong
        }

        if (pcb_func)
          (*pcb_func)(pcb_context, REMD_EVENT_REM, trigger_status);

        remd.last_trigger_epoch = remd.current_epoch;
        remd.trigger_cycle++; 
      }
    }

    if (! is_check_mode ()) {
      // Logging statistics (not in check mode)
      log_epoch(remd.move_count,          // Total saccades in 30s
                ceiling,                  // What was the "speed limit" for eyes?
                variability,              // How shaky was the mask?
                remd.epoch_peak_delta,    // What was the biggest eye swing?
                remd.rem_epoch_count,     // How full is the "Are we dreaming yet?" bucket?
                trigger_status            // Did we actually fire the LEDs?
              );
    }
    
    // Reset for the next epoch
    remd.current_epoch++;
    remd.move_count = 0;
    remd.epoch_samples = 0;
    remd.epoch_total_delta = 0;
    remd.epoch_peak_delta = 0;
  }
}

void REMDetect::on_a2d_sample(uint16_t sample)
{
  int16_t filtered = lowpass_flt.process(sample);

#if REMD_LOG
  #if REMD_LOG == REMD_LOG_UART

  	/* forward sample to serial port during testing phase */
  	Serial.write((const uint8_t*)&filtered, 2);

  #elif REMD_LOG == REMD_LOG_FILE

  	/* forward sample to file during testing phase */
    if (! slog.buf_ready ) {
        slog.buf [slog.buf_idx++] = filtered;
        if (slog.buf_idx >= 256) {
            slog.buf_idx = 0;
            slog.buf_ready = true; // Tell main loop to write
        }
    }
  #endif
#else

  // Feed the algorithm with the sample
  process_sample (filtered);

#endif
}
