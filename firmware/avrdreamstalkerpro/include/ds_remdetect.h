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

#ifndef _DS_REMD_DEFINED
#define _DS_REMD_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include <core/adc_avr.h>
#include "ds_lowpass.h"
#include "ds_util.h"

#define REMD_LOG_FILE   1   // log to a file
#define REMD_LOG_SERIAL 2   // log to serial port

namespace DS {
/*-----------------------------------------------------------------------*/

typedef enum e_remd_event_type {
  REMD_EVENT_MOVE = 1,
	REMD_EVENT_REM = 2,
} remd_event_type_t;

/*-----------------------------------------------------------------------*/
typedef void (*REMDetectCB_t)(void *context, remd_event_type_t event, uint16_t arg);

/*-----------------------------------------------------------------------*/
class REMDetect {
public:
  static REMDetect *get();

  bool init (void) ;
  void end (void);

  bool start (REMDetectCB_t premdcb, void *context) ;
  void stop (void) ;
  bool is_running (void) const;

  /* Use the method from ISR */
  bool start_unsafe (REMDetectCB_t premdcb, void *context) ;
  void stop_unsafe (void) ;

  /* Must be called in the main application loop */
  void process_task (void);

protected:
  void on_a2d_sample(uint16_t sample);

private:
  static void a2d_sample_callback(void *context, uint16_t sample);
  
  void process_sample(int16_t sample);
  void log_epoch(uint16_t moves, uint16_t ceiling, uint16_t restlessness,
                uint16_t peak, uint8_t bucket, uint8_t trigger);

private:
  REMDetectCB_t premdcb_func;
  void *premdcb_context;
  volatile bool status;

  LowPassFilter lowpass_flt;

typedef struct s_remd_context {
    /* --- 30-Second Epoch Decision Logic --- */
    uint16_t move_count;         // Number of validated eye rolls in the current 30s window
    uint32_t epoch_samples;      // Sample counter to track the 30s window (30,000 @ 1000Hz)
    uint16_t current_epoch;      // Master timeline index (increments every 30s)
    uint8_t  rem_epoch_count;    // Leaky Bucket integrator (increments on REM, drains on quiet)
    uint16_t last_trigger_epoch; // Timestamp of the last LED flash to manage cooldowns
    uint32_t epoch_total_delta;  // Cumulative jitter sum used to calculate 'variability'

    /* --- 50ms Integration Bucket (Filter) --- */
    int32_t  bucket_sum;         // Accumulator for the current 50 samples
    uint16_t bucket_count;       // Counter for the current 50ms bucket (0 to 49)
    int16_t  last_avg;           // The integrated average of the previous 50ms bucket
    
    /* --- Saccade (Eye Movement) Detection --- */
    uint16_t move_duration;      // Width of current movement (in 50ms bucket units)
    int16_t  move_peak_delta;    // Highest jitter seen within the CURRENT movement burst
    int16_t  epoch_peak_delta;   // Highest jitter seen across the WHOLE 30s epoch (for logs)

    /* --- Output & Triggering --- */
    uint8_t  trigger_cycle;      // Intensity step counter (0=Subtle, 1=Med, 2=Strong)
  } remd_context_t;

  typedef struct __attribute__((packed)) s_remd_epoch_stats {
    uint16_t magic;           // 0xAA55
    uint16_t epoch_index;     // Time/Index
    uint16_t move_count;      // Saccades counted
    uint16_t gate_ceiling;    // The Blink Filter height (from sensitivity)
    uint16_t restlessness;    // The variability (shakiness)
    uint16_t epoch_peak_delta;// The strongest single move seen
    uint8_t  bucket_state;    // Current level of the Leaky Bucket (Integrator)
    uint8_t  trigger_status;  // LED intensity (0, 15, 20, 30)
  } remd_epoch_stats_t;

  remd_context_t remd;

  typedef struct s_remd_stats_buffer {
#define STATS_BUFF_LEN  4
    remd_epoch_stats_t data[STATS_BUFF_LEN];
    uint8_t write_idx;  // Where the ISR puts data
    uint8_t read_idx;   // Where the Main Loop reads data
    bool overrun;
  } remd_stats_buffer_t;

  volatile remd_stats_buffer_t stats_buff;
  String stats_filepath;

#if REMD_LOG == REMD_LOG_FILE // log to file
public:
  typedef struct s_remd_sample_log {
#define LOG_BUFF_SIZE 256
    uint16_t buf[LOG_BUFF_SIZE];
    int buf_idx;
    bool buf_ready;
  } remd_sample_log_t;

  File slog_fp;
  uint16_t slog_fp_buf[LOG_BUFF_SIZE];
  volatile remd_sample_log_t slog;
#endif
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif // _DS_REMD_DEFINED
