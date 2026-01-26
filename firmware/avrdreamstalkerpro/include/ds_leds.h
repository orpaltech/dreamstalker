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

#ifndef _DS_LEDS_DEFINED
#define _DS_LEDS_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include "ds_sqwave.h"


namespace DS {
/*-----------------------------------------------------------------------*/

#define NUM_LEDS  2

/* The values are also slots in SquareWave */
typedef enum e_led_id {
  LED1 = 0,
  LED2 = 1,
} led_id_t;


/*-----------------------------------------------------------------------*/
class LedFader {
public:
  LedFader();

  enum State { IDLE, RAMP_UP, RAMP_DOWN, WAIT };
    
  // Updated signature to include increment and limit
  void start(uint8_t start_br, uint8_t increment_br, uint8_t limit_br, 
             uint16_t ramp_ms, uint16_t min_wait_ms, uint16_t max_wait_ms, uint8_t count);
  void stop (void);

  uint16_t update (void);

  bool is_active (void) const { return state != IDLE; }

  uint16_t get_max_ocr() const { return max_ocr; }
  uint16_t get_current_ocr() const { return current_ocr; }
  uint8_t get_pulses_left() const { return pulses_left; }

private:
  // --- State Machine Members ---
  State state;
  uint16_t timer;
  uint8_t pulses_left;

  // --- OCR / Hardware Target Members ---
  uint16_t current_ocr;       // The live PWM value being sent to the timer
  uint16_t max_ocr;           // The peak OCR for the CURRENT pulse
  uint16_t absolute_max_ocr;  // The user's menu setting (The Ceiling) converted to OCR

  // --- Timing Members ---
  uint16_t ramp_step_time;    // ms to stay on each OCR unit (changes as brightness increases)
  uint16_t ramp_ms_fixed;     // The original ramp duration requested (e.g., 500ms)
  uint16_t min_wait_time;     // Base dark period between pulses
  uint16_t max_wait_time;     // Max dark period (including jitter)
  uint16_t current_wait_time; // The randomized target for the current WAIT state

  // --- Escalation Members (Percentages) ---
  uint8_t br_current;         // The current brightness % (starts at start_br)
  uint8_t br_increment;       // The % to add after each successful pulse
};

/*-----------------------------------------------------------------------*/
class Leds {
public:
  static Leds *get();
public:
  bool init (void);

  void on (led_id_t led,
      uint8_t brightness,		/* percent, 1-100*/
      uint16_t duration_ms	/* milliseconds*/
      );

  void stop (led_id_t led);

  void pulse (led_id_t led,
      uint8_t brightness,		/* percent, 1-100*/
      uint16_t duration_ms,	/* milliseconds*/
      uint16_t period_ms,		/* milliseconds*/
      uint8_t duty_cycle		/* percent, normally 5-95 */
      );

  bool is_led_busy(led_id_t led) const;

  void set_raw_ocr(led_id_t led, uint16_t ocr);
  void set_raw_ocr_top(led_id_t led);

protected:
  void on_sqw_transition(uint8_t slot, sqw_transition_t trans);

private:
  static void sqw_transition_callback(void *context, uint8_t slot, sqw_transition_t trans);
};

/*-----------------------------------------------------------------------*/
};	//DS

#endif // _DS_LEDS_DEFINED
