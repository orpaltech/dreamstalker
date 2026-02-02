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
#include <string.h>
#include <util/atomic.h>

#include <Arduino.h>

#include "core/tmr_avr.h"
#include "sound/ds_tonegen.h"
#include "ds_leds.h"
#include "ds_rtclock.h"
#include "ds_util.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_LED1  PIN_PE3   /* TIMER3A */
#define PIN_LED2  PIN_PE4   /* TIMER3B */

#ifndef LEDS_PWM_DEPTH
	#define LEDS_PWM_DEPTH  10
#endif

#define LEDS_TCCR3A_FPWM	TCCR3A_FPWM_(LEDS_PWM_DEPTH)
#define LEDS_TCCR3B_FPWM	TCCR3B_FPWM_(LEDS_PWM_DEPTH)

#define LEDS_TMR3_OCR_TOP		TMR3_OCR_TOP_(LEDS_PWM_DEPTH)
#define LEDS_TMR3_OCR_HALF_TOP	(LEDS_TMR3_OCR_TOP / 2)

#define DUTY_CYCLE_MIN		5
#define DUTY_CYCLE_MAX		95

/*-----------------------------------------------------------------------*/
// Gamma 2.8 correction table (101 entries for 0% to 100%)
PROGMEM const uint16_t gamma_table[] = {
#if (LEDS_PWM_DEPTH == 10)
    0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 7, 8, 8, 10, 
    11, 12, 13, 15, 16, 18, 19, 21, 23, 25, 27, 29, 32, 34, 37, 40, 
    43, 46, 49, 53, 57, 61, 65, 69, 74, 78, 83, 89, 94, 100, 106, 
    112, 118, 125, 132, 139, 146, 154, 162, 171, 179, 188, 198, 207, 
    217, 228, 238, 249, 261, 272, 284, 297, 310, 323, 337, 350, 365, 
    379, 395, 410, 426, 443, 460, 477, 495, 513, 532, 551, 571, 591, 
    611, 632, 654, 676, 698, 722, 745, 770, 794, 820, 846, 872, 900, 
    928, 956, 985, 1015, 1023

#elif (LEDS_PWM_DEPTH == 9)
    0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5, 
    5, 6, 7, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 19, 20, 22, 23, 
    25, 27, 28, 30, 32, 35, 37, 39, 42, 44, 47, 50, 53, 56, 59, 62, 
    66, 69, 73, 77, 81, 85, 90, 94, 99, 104, 109, 114, 119, 125, 130, 
    136, 142, 148, 155, 161, 168, 175, 182, 190, 197, 205, 213, 221, 
    230, 238, 247, 256, 266, 275, 285, 295, 306, 316, 327, 338, 349, 
    361, 373, 385, 397, 410, 423, 436, 450, 464, 478, 492, 507, 511

#elif (LEDS_PWM_DEPTH == 8)
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 
    3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 10, 11, 11, 12, 13, 
    14, 15, 16, 17, 18, 20, 21, 22, 24, 25, 27, 28, 30, 31, 33, 35, 
    36, 38, 40, 43, 45, 47, 49, 52, 54, 57, 59, 62, 65, 68, 71, 74, 
    77, 81, 84, 87, 91, 95, 98, 102, 106, 110, 115, 119, 124, 128, 
    133, 138, 143, 148, 153, 158, 163, 169, 175, 180, 186, 192, 198, 
    205, 211, 218, 225, 232, 239, 246, 253, 255
#endif
};

/*-----------------------------------------------------------------------*/

static 
uint8_t led_to_pin (led_id_t led)
{
  uint8_t pin;

  switch (led) {
    case LED1: pin = PIN_LED1; break;
	  case LED2: pin = PIN_LED2; break;
  }
  return pin;
}

static
void led_pwm_off (led_id_t led)
{
  // Safely disconnect the specific LED from the Timer Compare unit
  switch (led) {
    case LED1:
      TCCR3A &= ~_BV(COM3A1);
      break;

    case LED2:
      TCCR3A &= ~_BV(COM3B1);
      break;
  }
}

static
bool led_pwm_is_on (led_id_t led)
{
  switch (led) {
  case LED1: 
    return (TCCR3A & _BV(COM3A1)) != 0;

  case LED2:
    return (TCCR3A & _BV(COM3B1)) != 0;
  }
  return false;
}

static
void led_pwm_on (led_id_t led)
{
  uint8_t pin = led_to_pin(led);
  uint8_t mask = digitalPinToBitMask(pin);
  volatile uint8_t *out = portOutputRegister(digitalPinToPort(pin));

  // 1. Force the PORT bit HIGH (OFF for sink)
  *out |= mask;

  // Force the timer to the "Dark" position
  // This ensures that when the COM3nx bits connect, the timer is 
  // already past the "Turn On" point.
  TCNT3 = LEDS_TMR3_OCR_TOP;

  switch (led) {
    case LED1: 
      TCCR3A |= _BV(COM3A1); // Connect PWM
      break;

    case LED2: 
      TCCR3A |= _BV(COM3B1); // Connect PWM
      break;
  }
}

static
void led_pwm_set_ocr (led_id_t led, uint16_t ocr)
{
  switch (led) {
	case LED1: 
	  OCR3A = ocr; 
	  break;

	case LED2:
	  OCR3B = ocr;
	  break;
  }
}

/*-----------------------------------------------------------------------*/
void Leds::sqw_transition_callback(void *context, uint8_t slot, sqw_transition_t trans)
{
  Leds *pls = static_cast<Leds *>(context);

  pls->on_sqw_transition (slot, trans);
}

/*-----------------------------------------------------------------------*/
Leds *Leds::get()
{
  static Leds leds;
  return &leds;
}

/*-----------------------------------------------------------------------*/
void Leds::on (led_id_t led, uint8_t brightness, uint16_t duration_ms)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    on_unsafe (led, brightness, duration_ms);
  }
}

void Leds::stop (led_id_t led)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    stop_unsafe (led);
  }
}

void Leds::pulse (led_id_t led, uint8_t brightness, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    pulse_unsafe (led, brightness, duration_ms, period_ms, duty_cycle);
  }
}

bool Leds::is_led_busy (led_id_t led) const
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    return is_led_busy_unsafe (led);
  }
}

void Leds::on_unsafe (led_id_t led, uint8_t brightness, uint16_t duration_ms)
{
  pulse_unsafe (led, brightness, duration_ms, 0, 0);
}

void Leds::stop_unsafe (led_id_t led)
{
  if (!(led == LED1 || led == LED2))
    return;
  if (! is_led_busy_unsafe (led))	// skip if not lit
	  return;
  
  // Stop the engines
  SquareWave::get()->stop_unsafe (led);

  uint8_t pin = led_to_pin(led);

  // Switch to Pull-up before disabling the timer. 
  // This keeps the PORT register at 1 (Safety High).
  Pins::set_in_pullup(pin);

  // Now safely detach the PWM hardware
  led_pwm_off(led);

  // Set the OCR to 'Dark' so it's ready for the next start
  led_pwm_set_ocr(led, LEDS_TMR3_OCR_TOP);

  // Optional: Final state to High-Z for zero power leakage
  // Only do this if you know the next pulse() will call set_in_pullup again
  Pins::set_in_highz(pin);
}

bool Leds::is_led_busy_unsafe(led_id_t led) const
{
  // Check if SquareWave is using this slot
  bool sqw_busy = SquareWave::get()->is_active_unsafe (led);
  
  return sqw_busy;
}

void Leds::pulse_unsafe (led_id_t led, uint8_t brightness, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
  if (!(led==LED1 || led==LED2)) 
    return;
  if (is_led_busy_unsafe (led))  // skip if already lit
    return;

  if (duty_cycle < DUTY_CYCLE_MIN) duty_cycle = DUTY_CYCLE_MIN;
  if (duty_cycle > DUTY_CYCLE_MAX) duty_cycle = DUTY_CYCLE_MAX;

  if (brightness > 100) brightness = 100;

  uint16_t corrected_br = pgm_read_word (&gamma_table [brightness]);

  // Calculate and set OCR while hardware is still disconnected
  uint16_t ocr_val = LEDS_TMR3_OCR_TOP - corrected_br;
  led_pwm_set_ocr (led, ocr_val);

  //led_pwm_on(led);

  // Set to Pull-up so the PORT register is 1 (HIGH/OFF)
  Pins::set_in_pullup (led_to_pin (led));

  // Start the SquareWave engine
  SquareWave::get()->start_unsafe (led, duration_ms, period_ms, duty_cycle,
                                sqw_transition_callback, this);
}

/*void Leds::fade(led_id_t led, uint8_t brightness_max, uint16_t ramp_ms, uint16_t min_wait, uint16_t max_wait, uint8_t count)
{
  if (!(led == LED1 || led == LED2))
    return;
  if (is_led_busy(led))
    return;

  // For a standard fade, we treat max_brightness as both the START and the LIMIT.
  // We set increment to 0 so every pulse is identical.
  uint8_t start_br = brightness_max;
  uint8_t limit_br = brightness_max;
  uint8_t increment_br = 0;

  // 1. Initialize the fader logic
  faders[led].start(start_br, increment_br, limit_br, ramp_ms, min_wait, max_wait, count);

  // 2. Hardware Pre-sync: Set to Pull-up (PORT=1) to prevent the "zero-pulse" flash
  Pins::set_in_pullup(led_to_pin(led));

  // 3. Ensure hardware starts disconnected and at the dark value
  led_pwm_off(led);
  led_pwm_set_ocr(led, LEDS_TMR3_OCR_TOP);
}*/

/*void Leds::fade_rhythmic(led_id_t led, uint8_t limit_br, uint8_t start_br, 
                        uint8_t increment_br, uint16_t period_ms, uint8_t duty_cycle, 
                        uint16_t jitter_ms, uint8_t count)
{
    if (!(led == LED1 || led == LED2))
      return;
    if (is_led_busy(led))
      return;

    // Translate Period/Duty into internal Ramp/Wait values
    //
    // 1. Calculate the 'Active' time (Ramp Up + Ramp Down)
    // Example: Period 2000ms, Duty 60% = 1200ms active
    uint32_t active_ms = ((uint32_t)period_ms * duty_cycle) / 100;

    // 2. Calculate Ramp (Half of active time)
    // Example: 1200ms / 2 = 600ms to reach peak, 600ms to return to 0
    uint16_t ramp_ms = (uint16_t)(active_ms / 2);

    // 3. Calculate 'Wait' time (The remaining part of the period)
    // Example: 2000ms - 1200ms = 800ms dark
    uint16_t min_wait_ms = period_ms - (uint16_t)active_ms;

    // 4. Max wait adds the jitter
    uint16_t max_wait_ms  = min_wait_ms + jitter_ms;

    // 5. Initialize the fader logic
    faders[led].start(start_br, increment_br, limit_br, ramp_ms, min_wait_ms, max_wait_ms, count);

    // 6. Hardware Pre-sync: Set to Pull-up (PORT=1) to prevent the "zero-pulse" flash
    Pins::set_in_pullup(led_to_pin(led));

    // 7. Ensure hardware starts disconnected and at the dark value
    led_pwm_off(led);
    led_pwm_set_ocr(led, LEDS_TMR3_OCR_TOP); 
}*/

bool Leds::init (void)
{
  // Set pins to input mode 
  Pins::set_in_pullup( PIN_LED1 );
  Pins::set_in_pullup( PIN_LED2 );

  // Disable timer3 interrupts
#if defined (__AVR_ATmega128__)
  ETIMSK &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(TICIE3));

#elif defined (__AVR_ATmega1281__)
  TIMSK3 &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(ICIE3));
	
#endif

  // Ensure initial PWM state is "Off" 
  OCR3A = LEDS_TMR3_OCR_TOP;
  OCR3B = LEDS_TMR3_OCR_TOP;

  // Clear OC3A pin on compare match, set OC3A pin high at BOTTOM (non-inverting mode)
  // Clear OC3B pin on compare match, set OC3B pin high at BOTTOM (non-inverting mode)
  // Set timer to Fast PWM 
  TCCR3A = LEDS_TCCR3A_FPWM;
  TCCR3B = LEDS_TCCR3B_FPWM;

  // Select lowest possible flicker-less frequency
  TMR3_SET_N(64);

  return true;
}

void Leds::on_sqw_transition (uint8_t index, sqw_transition_t trans)
{
  led_id_t led = (led_id_t)index;
  uint8_t pin = led_to_pin (led);
  
  switch (trans)
  {
    case SQW_TRANS_LOW:
      led_pwm_off (led);        // Disconnect Timer
      Pins::set_in_pullup(pin); // Switch to Pull-up
      break;

    case SQW_TRANS_HIGH:
      // Connect Timer (Timer takes over and applies the OCR brightness)
      led_pwm_on (led);
      Pins::set_out(pin); // Ensure pin is Output
      break;

    case SQW_TRANS_TOGGLE:
      // Manual check of bit to toggle
      if (led_pwm_is_on (led)) 
        on_sqw_transition(index, SQW_TRANS_LOW);
      else 
        on_sqw_transition(index, SQW_TRANS_HIGH);
      break;
  }
}

void Leds::set_raw_ocr(led_id_t led, uint16_t ocr)
{
  uint8_t pin = led_to_pin(led);

  // Only engage hardware if there is brightness to show (ocr < TOP)
  if (ocr < LEDS_TMR3_OCR_TOP) {
    
    // Connection Logic
    // If the hardware isn't connected yet, this is the first "glowing" frame
    if (!led_pwm_is_on (led)) {
      
      // Apply the brightness
      led_pwm_set_ocr (led, ocr);

      // Clear the Timer Interrupt Flag and wait for an overflow
      // This ensures the hardware copies the 'ocr' into the 'active' register.
#if defined (__AVR_ATmega128__)
      // ATmega128 uses ETIFR for Timer 3
      ETIFR |= _BV(TOV3);          // Clear the overflow flag
      while (!(ETIFR & _BV(TOV3))); // Wait for transition
#elif defined (__AVR_ATmega1281__)
      // ATmega1281 uses TIFR3
      TIFR3 |= _BV(TOV3);          
      while (!(TIFR3 & _BV(TOV3))); 
#endif

      // Connect the Timer unit to the pin
      led_pwm_on (led);
      
      // Switch from Input (Pull-up) to Output
      // PORT is already 1 (from previous state), so no flash!
      Pins::set_out (pin);
    } else {

      // Apply the brightness
      led_pwm_set_ocr (led, ocr);
    }

  } else {
    // Disconnection Logic (The "Dark" Frame)
    // OCR is at TOP (Dark): Keep pin in Pull-up to hide PWM "1-tick" glitch
    if (led_pwm_is_on (led)) {

      led_pwm_off (led);

      Pins::set_in_pullup (pin);
    }
  }
}

void Leds::set_raw_ocr_top(led_id_t led)
{
  set_raw_ocr (led, LEDS_TMR3_OCR_TOP);
}

LedFader::LedFader()
  : state {IDLE}
  , timer{0}
  , pulses_left{0}
  , current_ocr{0} 
  , max_ocr{0}
  , absolute_max_ocr{0}
  , ramp_step_time{0}
  , ramp_ms_fixed{0}
  , br_current{0}
  , br_increment{0}
{
}

// Configures a pulse sequence
void LedFader::start(uint8_t start_br, uint8_t increment_br, uint8_t limit_br, 
                     uint16_t ramp_ms, uint16_t min_wait, uint16_t max_wait, uint8_t count)
{
  if (limit_br == 0 || count == 0)
    return;
  if (is_active())
    return;

  // 1. Set the Hard Ceiling (User Menu Setting)
  absolute_max_ocr = pgm_read_word (&gamma_table[limit_br]);
  
  // 2. Set the starting brightness (ensure it doesn't exceed the limit)
  br_current = (start_br > limit_br) ? limit_br : start_br;
  br_increment = increment_br;
  
  // 3. Configure timing and escalation memory
  ramp_ms_fixed = ramp_ms;
  max_ocr = pgm_read_word (&gamma_table[br_current]);
  if (max_ocr == 0) max_ocr = 1; // Prevent division by zero

  // 4. Calculate step speed: Higher brightness = faster stepping to keep ramp time constant
  ramp_step_time = ramp_ms_fixed / max_ocr;
  if (ramp_step_time == 0)
    ramp_step_time = 1;

  // 5. State initialization
  min_wait_time = min_wait;
  max_wait_time = max_wait;
  pulses_left = count;
  state = RAMP_UP;
  current_ocr = 0;
  timer = 0;

  // Initial jitter calculation
  uint16_t entropy = TCNT3;
  if (max_wait_time > min_wait_time) {
    current_wait_time = min_wait_time + (entropy % (max_wait_time - min_wait_time + 1));
  } else {
    current_wait_time = min_wait_time;
  }
}

void LedFader::stop (void)
{
  state = IDLE;
  current_ocr = 0;
  max_ocr = 0;
  absolute_max_ocr = 0;
  br_current = 0;
}

uint16_t LedFader::update()
{
  if (state == IDLE)
    return LEDS_TMR3_OCR_TOP;

  timer++;
  
  if (state == RAMP_UP) {
    if (timer >= ramp_step_time) {
      current_ocr++;
      timer = 0;
      if (current_ocr >= max_ocr)
        state = RAMP_DOWN;
    }
  }
  else if (state == RAMP_DOWN) {
    if (timer >= ramp_step_time) {
      if (current_ocr > 0)
        current_ocr--;
      timer = 0;
      if (current_ocr == 0) {
        pulses_left--;
        state = (pulses_left > 0) ? WAIT : IDLE;
      }
    }
  }
  else if (state == WAIT) {
    if (timer >= current_wait_time) {
      state = RAMP_UP;
      timer = 0;

      // --- Escalation Logic (Happens between pulses) ---
      if (br_increment > 0 && max_ocr < absolute_max_ocr) {
        uint16_t next_br = (uint16_t)br_current + br_increment;
        if (next_br > 100) next_br = 100;
        br_current = (uint8_t)next_br;

        uint16_t next_ocr = pgm_read_word(&gamma_table[br_current]);

        // STRICT CLAMP: Never exceed the absolute_max_ocr (User Limit)
        if (next_ocr >= absolute_max_ocr) {
            max_ocr = absolute_max_ocr;
        } else {
            max_ocr = next_ocr;
        }

        // Recalculate timing to maintain the requested ramp_ms
        ramp_step_time = ramp_ms_fixed / max_ocr;
        if (ramp_step_time == 0)
          ramp_step_time = 1;
      }

      // --- Jitter Logic for the next pulse ---
      uint16_t entropy = TCNT3;
      if (max_wait_time > min_wait_time) {
        current_wait_time = min_wait_time + (entropy % (max_wait_time - min_wait_time + 1));
      } else {
        current_wait_time = min_wait_time;
      }
    }
  }

  // Handle software inversion for sink PWM
  return (LEDS_TMR3_OCR_TOP - current_ocr);
}

