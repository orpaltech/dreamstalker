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
#include <avr/pgmspace.h>

#include "ds_config.h"
#include "sound/ds_tonegen.h"
#include "ds_remhints.h"

using namespace DS;


/*-----------------------------------------------------------------------*/
PROGMEM const uint16_t u_HintsPeriods[10] = {
    0,
    5000, // 1: Slow Breath
    3500, // 2
    2500, // 3: Human Resting Heartbeat
    1800, // 4
    1200, // 5: Active
    800,  // 6
    600,  // 7: Urgent
    450,  // 8
    300   // 9: Rapid Pulse
};

/*-----------------------------------------------------------------------*/
REMHints *REMHints::get()
{
    static REMHints instance; 
    return &instance;
}

/*-----------------------------------------------------------------------*/
void REMHints::handle_rtc (void)
{
  get()->update();
}

/*-----------------------------------------------------------------------*/
uint16_t REMHints::level_to_hints_period (uint8_t lvl)
{
  return ((lvl > 0 && lvl < 10) ? pgm_read_word_far (u_HintsPeriods + lvl) : 0);
}

/*-----------------------------------------------------------------------*/

void REMHints::start(uint8_t intensity_limit)
{
  if (fader.is_active()) 
    return;

  // 1. Get Durations (0 = Disabled)
  light_count = config.is_light_hints_duration_invalid() ? 0 : config.get_light_hints_duration();
  sound_count = config.is_sound_hints_duration_invalid() ? 0 : config.get_sound_hints_duration();
  if (light_count == 0 && sound_count == 0) 
    return;

  // Map Config to physical Rhythmic parameters
  uint32_t period_ms = level_to_hints_period (config.get_hints_frequency ());
  uint8_t duty_cycle = Config::level_to_percent (config.get_hints_duty_cycle ());

  // We add +1 to sound because it starts on the 2nd pulse.
  uint8_t sound_end_pulse = (sound_count > 0) ? (sound_count + 1) : 0;

  // The fader engine must run for the LONGEST duration
  master_count = (light_count > sound_end_pulse) ? light_count : sound_end_pulse;

  // Calculate Ramp (Half of active time based on duty cycle)
  uint16_t active_ms = (uint32_t(period_ms) * duty_cycle) / 100;
  uint16_t ramp_ms = active_ms / 2;

  // Calculate 'Wait' time (The remaining part of the period)
  uint16_t min_wait_ms = period_ms - (uint16_t)active_ms;

  // Max wait adds the jitter
  uint16_t jitter_ms = 100;
  uint16_t max_wait_ms  = min_wait_ms + jitter_ms;

  // Start the Master Fader
  // Start at 5% brightness, increment by 5%, up to the intensity_level
  fader.start(5, 5, intensity_limit, ramp_ms, min_wait_ms, max_wait_ms, master_count);

  if (sound_count > 0) {
    Tonegen::get()->beep(period_ms * master_count, 5, 4, 0);
  }
}

void REMHints::update() 
{
  if (!fader.is_active()) {

    if (light_count > 0) {
      // Just send the "Dark" value (TOP).
      Leds::get()->set_raw_ocr_top(LED1);
      Leds::get()->set_raw_ocr_top(LED2);
      light_count = 0;
    }

    if (sound_count > 0) {
      Tonegen::get()->stop();
      sound_count = 0;
    }
    return;
  }

  uint8_t current_pulse = (master_count - fader.get_pulses_left()) + 1;

  uint16_t current_ocr = fader.update();

  // --- Light Scenario Logic ---
  if (light_count > 0) {
    if (current_pulse <= light_count) {
      Leds::get()->set_raw_ocr(LED1, current_ocr);
      Leds::get()->set_raw_ocr(LED2, current_ocr);
    } else {
      // Light's time has run out
      Leds::get()->set_raw_ocr_top(LED1);
      Leds::get()->set_raw_ocr_top(LED2);
      light_count = 0;
    }
  }

  // --- Sound Scenario Logic ---
  if (sound_count > 0 && current_pulse >= 2) {
    // Start on pulse 2, and continue until sound_count pulses are delivered
    // If user sets sound_count = 2, it will play on current_pulse = 2 and 3.
    uint8_t sound_end_pulse = sound_count + 1;
    if (current_pulse <= sound_end_pulse) {
      // Extract the POSITIVE intensity for the Tonegen
      // Tonegen needs to know how "bright" it is (0 to Max), not the raw OCR
      Tonegen::get()->set_intensity(fader.get_current_ocr(), fader.get_max_ocr());
    } else {
      Tonegen::get()->stop();
      sound_count = 0;
    }
  }
}
