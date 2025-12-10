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
#include <string.h>
#include <util/atomic.h>

#include <Arduino.h>

#include "core/tmr_avr.h"
#include "ds_leds.h"
#include "ds_rtclock.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_LED1  PIN_PE3   /* TIMER3A */
#define PIN_LED2  PIN_PE4   /* TIMER3B */

#ifdef LEDS_PWM_DEPTH
	#undef LEDS_PWM_DEPTH
#endif
#define LEDS_PWM_DEPTH		10

#define DUTY_CYCLE_MIN		5
#define DUTY_CYCLE_MAX		95

#define LEDS_TCCR3A_FPWM	TCCR3A_FPWM_(LEDS_PWM_DEPTH)
#define LEDS_TCCR3B_FPWM	TCCR3B_FPWM_(LEDS_PWM_DEPTH)

#define LEDS_TMR3_OCR_TOP		TMR3_OCR_TOP_(LEDS_PWM_DEPTH)
#define LEDS_TMR3_OCR_HALF_TOP	(LEDS_TMR3_OCR_TOP / 2)


/*-----------------------------------------------------------------------*/

static
int led_is_busy(led_id_t led)
{
  return SquareWave::get()->is_active (led);
}

static 
uint8_t led_to_pin (/*led_id_t*/unsigned led)
{
  uint8_t pin;

  switch (led) {
    case LED1: pin = PIN_LED1; break;
	  case LED2: pin = PIN_LED2; break;
  }
  return pin;
}

static
void led_set_pwm_ocr (led_id_t led, uint16_t ocr)
{
  switch (led) {
	case LED1: 
	  OCR3A = ocr; 
    TCCR3A |= _BV(COM3A1);
	  break;

	case LED2:
	  OCR3B = ocr;
    TCCR3A |= _BV(COM3B1);
	  break;
  }
}

/*-----------------------------------------------------------------------*/
Leds leds;

/*-----------------------------------------------------------------------*/
Leds *Leds::get()
{
  return &leds;
}

/*-----------------------------------------------------------------------*/
void Leds::on (led_id_t led, uint8_t brightness, uint16_t duration_ms)
{
  pulse (led, brightness, duration_ms, 0, 0);
}

void Leds::off (led_id_t led)
{
  /* check arguments */
  if (!(led==LED1 || led==LED2))
	  return;
  if (! led_is_busy (led))	/* skip if not lit*/
	  return;

  SquareWave::get()->stop (led);

  TMR3_OFF();
}

void Leds::pulse (led_id_t led, uint8_t brightness, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
  /* check arguments */
  if (!(led==LED1 || led==LED2))
	  return;
  if (led_is_busy (led))	/* skip if already lit*/
	  return;

  float fbr = brightness / 100.f;
  if (fbr <0.1f)  fbr =0.1f;
  if (fbr >1.f)   fbr =1.f;

  if (duty_cycle <DUTY_CYCLE_MIN)	duty_cycle=DUTY_CYCLE_MIN;
  if (duty_cycle >DUTY_CYCLE_MAX)	duty_cycle=DUTY_CYCLE_MAX;

  led_set_pwm_ocr (led, LEDS_TMR3_OCR_HALF_TOP + LEDS_TMR3_OCR_HALF_TOP * (1.f - fbr*fbr));

  RTClock::get()->wait( 4 ); // found experimentally to avoid initial LED burst

  SquareWave::get()->start (led, duration_ms, period_ms, duty_cycle, this);
}

bool Leds::init (void)
{
  /* Set pins to input mode */
  pinMode ( PIN_LED1, INPUT );
  pinMode ( PIN_LED2, INPUT );

  /* Disable timer3 interrupts */
#if defined (__AVR_ATmega128__)
  ETIMSK &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(TICIE3));

#elif defined (__AVR_ATmega1281__)
  TIMSK3 &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(ICIE3));
	
#endif

  /* Clear OC3A pin on compare match, set OC3A pin high at BOTTOM (non-inverting mode) */
  /* Clear OC3B pin on compare match, set OC3B pin high at BOTTOM (non-inverting mode) */
  /* Set timer to Fast PWM */
  TCCR3A = LEDS_TCCR3A_FPWM;
  TCCR3B = LEDS_TCCR3B_FPWM;

  OCR3A = 0;
  OCR3B = 0;

  /* Select lowest possible flicker-less frequency */
  TMR3_SET_N(64);

  return true;
}

void Leds::on_sqw_transition(unsigned led, sqw_transition_t trans)
{
  uint8_t pin = led_to_pin(led);
  uint8_t mask = digitalPinToBitMask(pin);
  uint8_t port = digitalPinToPort(pin);

  volatile uint8_t *mod, *out;
  mod = portModeRegister(port);
  out = portOutputRegister(port);

  switch (trans)
  {
	case SQW_TRANS_LOW:
    *mod &= ~mask;
    *out &= ~mask;
	  break;

	case SQW_TRANS_HIGH:
    *mod |= mask;
	  break;

	case SQW_TRANS_TOGGLE:
    if ((*mod) & mask) {
      /* if pin output, set it input */
      *mod &= ~mask;
      *out &= ~mask;
    } else {
      /* if pin input, set it output*/
      *mod |= mask;
    }
	  break;
  }
}

void Leds::on_sqw_complete(unsigned led)
{
  switch (led) {
	case LED1: 
    TCCR3A &= ~_BV(COM3A1);
	  break;

	case LED2:
    TCCR3A &= ~_BV(COM3B1);
	  break;
  }
}
