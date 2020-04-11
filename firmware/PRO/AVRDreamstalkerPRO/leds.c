/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2020	ORPAL Technologies, Inc.
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

#include "leds.h"
//#include "timers.h"
#include "strobe.h"

/* Peripheral controls (Platform dependent) */
#define DDR_LEDS	DDRE

#define DD_LED1		_BV(DDE3)
#define DD_LED2		_BV(DDE4)


// Clock Select Bit Description (page 136)
//----------------------------------------
//	CS32	CS31	CS30	Meaning
//----------------------------------------
//	0		0		0		No clock source / timer is off
//	0		0		1		No prescaling, F_CPU
//	0		1		0		F_CPU/8
//	0		1		1		F_CPU/64
//	1		0		0		F_CPU/256
//	1		0		1		F_CPU/1024
//

#define	TMR3_N_0		0
#define	TMR3_N_1		_BV(CS30)
#define	TMR3_N_8		_BV(CS31)
#define	TMR3_N_64		(_BV(CS31) | _BV(CS30))
#define	TMR3_N_256		_BV(CS32)
#define	TMR3_N_1024		(_BV(CS32) | _BV(CS30))

#define TMR3_N(n)		TMR3_N_ ## n
#define TMR3_N_SET(n)	TCCR3B = (TCCR3B & ~(_BV(CS32) | _BV(CS31) | _BV(CS30))) | TMR3_N(n)


#define TCCR3A_FAST_PWM_8		_BV(WGM30)
#define TCCR3A_FAST_PWM_9		_BV(WGM31)
#define TCCR3A_FAST_PWM_10		(_BV(WGM31) | _BV(WGM30))

#define TCCR3A_FAST_PWM_N(n)	TCCR3A_FAST_PWM_ ## n
#define TCCR3A_FAST_PWM_(n)		TCCR3A_FAST_PWM_N(n)

#define TCCR3B_FAST_PWM_8		_BV(WGM32)
#define TCCR3B_FAST_PWM_9		_BV(WGM32)
#define TCCR3B_FAST_PWM_10		_BV(WGM32)

#define TCCR3B_FAST_PWM_N(n)	TCCR3B_FAST_PWM_ ## n
#define TCCR3B_FAST_PWM_(n)		TCCR3B_FAST_PWM_N(n)


#define TMR3_OCR_MAX_8		(0xFFU)
#define TMR3_OCR_MAX_9		(0x1FFU)
#define TMR3_OCR_MAX_10		(0x3FFU)

#define	TMR3_OCR_MAX_N(n)	TMR3_OCR_MAX_ ## n
#define	TMR3_OCR_MAX_(n)	TMR3_OCR_MAX_N(n)


#ifndef LEDS_PWM_DEPTH
#define LEDS_PWM_DEPTH	10
#endif


#define DUTY_CYCLE_MIN	3
#define DUTY_CYCLE_MAX	97

/*-----------------------------------------------------------------------*/
/* LED Control Functions									 			 */
/*-----------------------------------------------------------------------*/

static
int led_is_busy(int led)
{
	return strobe_is_active(led);
}

static
void led_transition (int led, strobe_transition_t trans)
{
	uint8_t dd;

	switch (led) {
	case 0: dd = DD_LED1; break;
	case 1: dd = DD_LED2; break;
	}

	switch (trans)
	{
	case STROBE_OFF:
		DDR_LEDS &= ~dd;
		break;
	case STROBE_ON:
		DDR_LEDS |= dd;
		break;
	case STROBE_TOGGLE:
		DDR_LEDS ^= dd;
		break;
	}
}

static
void led_set_pwm_ocr (int led, uint16_t ocr)
{
	/* check arguments */
	if (!(led==0 || led==1))
		return;

	switch (led) {
	case 0: OCR3A = ocr; break;
	case 1: OCR3B = ocr; break;
	}
}

void leds_on (led_id_t led, uint8_t brightness, uint16_t duration_ms)
{
	leds_pulse(led, brightness, duration_ms, 0, 0);
}

void leds_pulse (led_id_t led, uint8_t brightness, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle)
{
	/* check arguments */
	if (!(led==0 || led==1))
		return;
	if (led_is_busy(led))	/* skip if already lit*/
		return;

	if (brightness <1)	 brightness=1;
	if (brightness >100) brightness=100;

	if (duty_cycle <DUTY_CYCLE_MIN)	duty_cycle=DUTY_CYCLE_MIN;
	if (duty_cycle >DUTY_CYCLE_MAX)	duty_cycle=DUTY_CYCLE_MAX;

	strobe_setup(led, duration_ms, period_ms, duty_cycle);

	TMR3_N_SET(0);

	led_set_pwm_ocr(led, (TMR3_OCR_MAX_(LEDS_PWM_DEPTH) / 2) +
			(TMR3_OCR_MAX_(LEDS_PWM_DEPTH) / 2) * (100.f - (((float)brightness)*brightness)/100) / 100);
	led_transition(led, STROBE_ON);

	/* Select lowest possible flicker-less frequency */
	TMR3_N_SET(64);
}

static
void leds_complete (int led)
{
	/* check arguments */
	if (!(led==0 || led==1))
		return;

	led_transition(led, STROBE_OFF);
/*
	for (i=0; i< NUM_LEDS; i++)	{
		if (strobes[i].duration_ticks || strobes[i].period)
			return;
	}

	TMR3_N_SET(0);*/
}

void leds_init (void)
{
	DDR_LEDS &= ~(DD_LED1 | DD_LED2);

	/* Disable timer3 interrupts */
	ETIMSK &= ~(_BV(OCIE3A) | _BV(OCIE3B) | _BV(TOIE3) | _BV(TICIE3));

	/* Clear OC3A on compare match, set OC3A at BOTTOM (non-inverting mode);
	   Clear OC3B on compare match, set OC3B at BOTTOM (non-inverting mode) */
	/* Set timer to Fast PWM */
	TCCR3A = (_BV(COM3A1) | _BV(COM3B1) | TCCR3A_FAST_PWM_(LEDS_PWM_DEPTH));
	TCCR3B = TCCR3B_FAST_PWM_(LEDS_PWM_DEPTH);

	OCR3A = TMR3_OCR_MAX_(LEDS_PWM_DEPTH);
	OCR3B = TMR3_OCR_MAX_(LEDS_PWM_DEPTH);

	strobe_set_callbacks(0, leds_complete, led_transition);
	strobe_set_callbacks(1, leds_complete, led_transition);
}

