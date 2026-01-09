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
	REMD_REM_DETECTED	= 1,
} remd_event_type_t;

/*-----------------------------------------------------------------------*/
typedef void (*REMDetectCB_t)(void *context, remd_event_type_t event);

/*-----------------------------------------------------------------------*/
class REMDetect {
public:
  static REMDetect *get();

  bool init (void) ;
  void end (void);

  bool start (REMDetectCB_t premdcb, void *context) ;
  void stop (void) ;
  bool is_running (void);

  /* Use the method from ISR */
  bool start_unsafe (REMDetectCB_t premdcb, void *context) ;
  void stop_unsafe (void) ;
protected:
  void on_a2d_sample(uint16_t sample);

private:
  static void a2d_sample_callback(void *context, uint16_t sample);
  
  bool detect_movement(int16_t sample);
  void handle_analysis(bool move_detected);

private:
  REMDetectCB_t premdcb;
  void *context;
  bool status;
  int32_t noise_level;
  int16_t last_sample;
  LowPassFilter lowpass_filter;
  uint32_t epoch_sample_count;
  uint16_t movements_in_epoch;
  uint16_t movement_duration;
#if TEST_REMD
public:
  volatile uint16_t file_buf[256]; // Holds 256 samples (512 bytes)
  volatile int file_buf_idx;
  volatile bool file_buf_ready;
#endif
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif // _DS_REMD_DEFINED
