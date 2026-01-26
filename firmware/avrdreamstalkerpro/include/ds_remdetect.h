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

namespace DS {
/*-----------------------------------------------------------------------*/

typedef enum e_remd_event_type {
	REMD_STABLE_REM = 1,
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
  void log_epoch(uint16_t move_count, uint16_t baseline_noise, uint16_t restlessness,
                uint16_t max_peak, uint8_t trigger);

private:
  REMDetectCB_t premdcb_func;
  void *premdcb_context;
  volatile bool status;
  uint16_t min_samples_per_move;
  uint8_t sens_multiplier;
  uint8_t trigger_cycle;

  LowPassFilter lowpass_flt;

  typedef struct s_remd_context {
    int16_t last_sample;
    int32_t noise_level;
    uint32_t total_activity;    // To calculate avg_noise more accurately
    uint16_t move_count;
    uint16_t move_samples;
    int16_t move_peak_velocity;
    int16_t epoch_peak_velocity;
    uint32_t epoch_samples;
    uint16_t current_epoch;
    uint8_t rem_epoch_count;
    uint16_t last_trigger_epoch;
  } remd_context_t;

  typedef struct __attribute__((packed)) s_remd_epoch_stats {
    uint16_t magic;           // Fixed value: 0xAA55
    uint16_t epoch_index;     // 0, 1, 2...
    uint16_t move_count;      // Total saccades in 30s
    uint16_t avg_noise;       // Noise floor (for quality check)
    uint16_t restlessness;    // The brute force average
    uint16_t peak_velocity;   // Highest velocity seen in epoch
    uint8_t  trigger_status;  // 1 if LEDs fired, 0 otherwise
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

#if TEST_REMD
public:
  volatile uint16_t test_buf[256]; // Holds 256 samples (512 bytes)
  volatile int test_buf_idx;
  volatile bool test_buf_ready;

  SDFile test_fp;
  uint16_t test_fp_buf[256];
#endif
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif // _DS_REMD_DEFINED
