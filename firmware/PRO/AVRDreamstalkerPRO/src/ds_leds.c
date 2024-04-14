/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2024	ORPAL Technologies, Inc.
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

#include "core/tmr_avr.h"

#include "ds_leds.h"
#include "ds_strobe.h"


/* Peripheral controls (Platform dependent) */

#define DDR_LEDS	DDRE
#define PORT_LEDS	PORTE

#define DD_LED1		_BV(DDE3)
#define DD_LED2		_BV(DDE4)
#define PF_LED1		_BV(PE3)
#define PF_LED2		_BV(PE4)


#ifdef LEDS_PWM_DEPTH
	#undef LEDS_PWM_DEPTH
#endif
#define LEDS_PWM_DEPTH	10

#define DUTY_CYCLE_MIN	5
#define DUTY_CYCLE_MAX	95

#define LEDS_TCCR3A_FPWM	TCCR3A_FPWM_(LEDS_PWM_DEPTH)
#define LEDS_TCCR3B_FPWM	TCCR3B_FPWM_(LEDS_PWM_DEPTH)

#define LEDS_TMR3_OCR_TOP		TMR3_OCR_TOP_(LEDS_PWM_DEPTH)
#define LEDS_TMR3_OCR_HALF_TOP	(LEDS_TMR3_OCR_TOP / 2)

/*-----------------------------------------------------------------------*/
/* LED Control Functions									 			 */
/*-----------------------------------------------------------------------*/

static
int led_is_busy(led_id_t led)
{
	return strobe_is_active(led);
}

static
void led_transition (unsigned led, strobe_transition_t trans)
{
	uint8_t dd;

	switch (led) {
	case LED1: dd = DD_LED1; break;
	case LED2: dd = DD_LED2; break;
	}

	switch (trans)
	{
	case STROBE_LOW:
		DDR_LEDS &= ~dd;
		break;

	case STROBE_HIGH:
		DDR_LEDS |= dd;
		break;

	case STROBE_TOGGLE:
		DDR_LEDS ^= dd;
		break;
	}
}

static
void led_set_pwm_ocr (led_id_t led, uint16_t ocr)
{
	switch (led) {
	case LED1: OCR3A = ocr; break;
	case LED2: OCR3B = ocr; break;
	}
}

void leds_on (led_id_t led, uint8_t brightness, uint16_t duration_ms)
{
	leds_pulse(led, brightness, duration_ms, 0, 0);
}

void leds_pulse (led_id_t led, uint8_t brightness, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
	/* check arguments */
	if (!(led==LED1 || led==LED2))
		return;
	if (led_is_busy(led))	/* skip if already lit*/
		return;

	if (brightness <1)	 brightness=1;
	if (brightness >100) brightness=100;

	if (duty_cycle <DUTY_CYCLE_MIN)	duty_cycle=DUTY_CYCLE_MIN;
	if (duty_cycle >DUTY_CYCLE_MAX)	duty_cycle=DUTY_CYCLE_MAX;

	TMR3_OFF();

	led_set_pwm_ocr(led, LEDS_TMR3_OCR_HALF_TOP + LEDS_TMR3_OCR_HALF_TOP * (100.f - ((float)brightness * (float)brightness)/ 100) / 100);
	
	/* Select lowest possible flicker-less frequency */
	TMR3_SET_N(64);

	strobe_start(led, duration_ms, period_ms, duty_cycle);
}

void leds_init (void)
{
	/* Set pins to input mode */
	DDR_LEDS &= ~(DD_LED1 | DD_LED2);
	PORT_LEDS &= ~(PF_LED1 | PF_LED2);

	/* Disable timer3 interrupts */

#if defined (__AVR_ATmega128__)
	ETIMSK &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(TICIE3));

#elif defined (__AVR_ATmega1281__)
	TIMSK3 &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(ICIE3));
	
#endif

	/* Clear OC3A pin on compare match, set OC3A pin at BOTTOM (non-inverting mode) */
	/* Clear OC3B pin on compare match, set OC3B pin at BOTTOM (non-inverting mode) */
	/* Set timer to Fast PWM */
	TCCR3A = (LEDS_TCCR3A_FPWM | _BV(COM3A1) | _BV(COM3B1));
	TCCR3B = LEDS_TCCR3B_FPWM;

	OCR3A = LEDS_TMR3_OCR_TOP;
	OCR3B = LEDS_TMR3_OCR_TOP;

	strobe_set_cb(LED1, led_transition);
	strobe_set_cb(LED2, led_transition);
}
