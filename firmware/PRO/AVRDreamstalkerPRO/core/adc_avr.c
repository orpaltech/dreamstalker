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

#include <util/delay.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#include "adc_avr.h"


/* Peripheral controls (Platform dependent) */
#define ADC_DIV			128							/* Default clock prescaler */

/* ADC clock prescalers, F_CPU/N */
#define ADC_N_32		(_BV(ADPS2) | _BV(ADPS0))				/* 250 kHz */
#define ADC_N_64		(_BV(ADPS2) | _BV(ADPS1))				/* 125 kHz */
#define ADC_N_128		(_BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0))	/* 62.5 kHz */

#define ADC_N(n)		ADC_N_ ## n

/* Sets ADC clock rate prescaler */
#define ADC_N_SET(n)	ADCSRA = (ADCSRA & ~(_BV(ADPS2)|_BV(ADPS1)|_BV(ADPS0))) | ADC_N(n)

/* Sets the channel number 0-7 for single-ended ADC */
#define ADC_MUX(ch)		ADMUX = (ADMUX & ~0x1F) | (ch)

/* Starts ADC conversion on the specified channel */
#define ADC_START(ch)	ADC_MUX(ch); ADCSRA |= _BV(ADSC)

#define ADC_REF_AVCC	_BV(REFS0)					/* ADC voltage ref is AVCC */
#define ADC_REF_256		(_BV(REFS1) | _BV(REFS0))	/* ADC voltage ref is 2.56V */

/*-----------------------------------------------------------------------*/
static adc_context_t	adc;

/*-----------------------------------------------------------------------*/
ISR(ADC_vect)
{
	uint16_t val;

	if (0==adc.status)
		return;

	val = ADC;

	// code to be executed when ADC interrupts
	if (adc.pfisr)
		adc.pfisr(&adc, val);

	ADC_START(adc.channel);	/* Next ADC conversion */
}

/*-----------------------------------------------------------------------*/
int adc_init (void)
{
	/* Initialize memory */
	adc.status = 0;

	ADMUX = ADC_REF_AVCC;	/* Set ADC ref voltage to AVCC */

	ADC_N_SET(ADC_DIV);		/* Set ADC sample rate */

	ADCSRA |= _BV(ADEN);	/* Enable ADC for use */

	return 1;
}

uint32_t adc_get_rate (void)
{
	return (F_CPU / ADC_DIV);	/* ADC clock rate */
}

int adc_run (int channel, pfn_adc_isr pfisr)
{
	if (adc.status)
		return 0;

	adc.channel = channel;	/* Store current ADC channel */
	adc.pfisr = pfisr;
	adc.status = 1;

	ADCSRA |= _BV(ADIE);	/* Enable ADC interrupt */

	ADC_START(channel);		/* Start ADC conversion */
	return 1;
}

int adc_is_running (void)
{
	return adc.status != 0;
}

void adc_stop (void)
{
	adc.status = 0;

	ADCSRA &= ~_BV(ADIE);	/* Disable ADC interrupt */
}

