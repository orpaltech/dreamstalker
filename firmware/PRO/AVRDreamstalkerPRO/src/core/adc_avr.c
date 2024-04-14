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

#include <util/delay.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#include "adc_avr.h"
#include "ds_util.h"


/* Peripheral controls (Platform dependent) */

/* ADC clock prescalers, F_CPU/N */
#define ADC_N_32	(_BV(ADPS2) | _BV(ADPS0))				/* 250 kHz */
#define ADC_N_64	(_BV(ADPS2) | _BV(ADPS1))				/* 125 kHz */
#define ADC_N_128	(_BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0))	/* 62.5 kHz */
#define ADC_N(n)	ADC_N_ ## n

/* Default ADC prescaler (F_CPU divider) */
#define ADC_DIV		128

/* Possible ADC refs */
#define ADC_REF_AVCC	_BV(REFS0)					/* ADC ref is AVCC */
#define ADC_REF_256		(_BV(REFS1) | _BV(REFS0))	/* ADC ref is 2.56V */

/* ADC helpers */
#define ADC_SET_DIV(n)	ADCSRA |= ADC_N(n)
#define ADC_SET_FR()	ADCSRA |= _BV(ADFR)		/* Set free-running mode */
#define ADC_GET_CH()	(ADMUX & 0x1F)

/* ADC status flags */
#define SF_ENABLED		0x0020U
#define SF_RUNNING		0x0040U
#define SF_LEFT_ADJUST	0x0080U
#define SF_VREF_256		0x0100U
//#define SF_LOW_NOISE	0x1000

#define DDR_ADC		DDRF
#define DD_ADC0		_BV(DDF0)
#define DD_ADC2		_BV(DDF2)


/*-----------------------------------------------------------------------*/
typedef struct s_adc_channel {
	uint16_t flags;
	int num_samples;
	pfn_adc_callback pfcb;
} adc_channel_t;

#define ADC_CHANNELS	2
/*-----------------------------------------------------------------------*/
static volatile adc_channel_t	adc[ADC_CHANNELS];

/*-----------------------------------------------------------------------*/
static 
uint8_t get_channel ( int i )
{
	return adc[ i ].flags & 0x1F;
}

static 
int get_index( uint8_t chan )
{
	int i;

	for( i=0;i< ADC_CHANNELS; i++ ) {
		if( get_channel ( i ) == chan )
			return i;
	}
	return -1;
}

static 
int get_next_running_index ( int i )
{
	/* Validate input parameter */
    if( i < 0 || i >= ADC_CHANNELS )
        i = 0;

    int next = i;
    do {
        if( !( ++next < ADC_CHANNELS ))
            next = 0;

        if( adc[ next ].flags & SF_RUNNING )
            return next;
    } while ( next != i );

    return -1;
}

static 
void adc_convert ( int i )
{
	/* Setup ADC multiplexer for conversion */
	if( adc[ i ].flags & SF_VREF_256 )
		ADMUX = ADC_REF_256;		/* Internal 2.56V as ref */
	else
		ADMUX = ADC_REF_AVCC;		/* AVCC as ref */

	if( adc[ i ].flags & SF_LEFT_ADJUST )
		ADMUX |= _BV(ADLAR);		/* Left-adjusted result */

	ADMUX |= get_channel( i );		/* Enable channel */
	
	/* Start a single conversion */
	ADCSRA |= _BV(ADSC);
}

// code to be executed when ADC interrupts
/*-----------------------------------------------------------------------*/
ISR(ADC_vect)
{
	uint16_t sample;
	int i;

	i = get_index ( ADC_GET_CH () );

	/* Read buffered ADC sample */
	if( adc[ i ].flags & SF_LEFT_ADJUST )
		sample = ( ADC >> 6 );
	else
		sample = ADC;

	/* ADC only has 10 meaningful bits */
	sample &= 0x3FF;

	if( adc[ i ].flags & SF_RUNNING ) {

		/* Allow callback function process the sample */
		if( adc[ i ].pfcb )
			(*adc[ i ].pfcb) ( sample );

		if( adc[ i ].num_samples > 0 ) {
			/* Check number of samples requested 
			 * and stop the channel, if needed 
			 */
			if( --adc[ i ].num_samples == 0 )
				adc[ i ].flags &= ~SF_RUNNING;
		}
	}

	/* Switch channel for next convert */
	i = get_next_running_index ( i );
	if( i < 0 )
		return;

	/* Next sample convert */
	adc_convert ( i );
}

/*-----------------------------------------------------------------------*/
bool adc_enable ( void )
{
	ADCSRA = _BV(ADEN);		/* Power ADC on */
	ADC_SET_DIV(ADC_DIV);	/* Set ADC sampling rate */
	
	/* NOTE: ADC is in single-convert mode */

	/* Enable ADC channels */
	adc[ 0 ].flags = ( 0U | SF_ENABLED );	/* channel 0 */
	adc[ 1 ].flags = ( 2U | SF_ENABLED );	/* channel 2 */
	
	/* TODO: Switch ADC pins for input. 
	 *		Is this needed ???
	 */
	DDR_ADC &= ~(DD_ADC0|DD_ADC2);

	ADCSRA |= _BV(ADIE);	/* Enable interrupt */

	return true;
}

void adc_warm_up (void) 
{
	/* Warm up the ADC analog circuitry */
	adc_start(2, 10, NULL);
	_delay_ms(10);
}

void adc_disable ( void )
{
	adc_stop ( 0 );
	adc_stop ( 2 );

	/* Disable ADC channels */
	adc[ 0 ].flags &= ~SF_ENABLED;	/* channel 0 */
	adc[ 1 ].flags &= ~SF_ENABLED;	/* channel 2 */

	ADCSRA &= ~_BV(ADIE);	/* Disable interrupt */
	ADCSRA &= ~_BV(ADEN);	/* Power ADC off */
}

uint32_t adc_get_rate ( void )
{
	return ( F_CPU / ADC_DIV );	/* ADC clock rate */
}

bool adc_setup_channel ( uint8_t chan, uint16_t flags )
{
	int i;

	i = get_index ( chan );
	if( i < 0 )
		return false;

	if( flags & ADC_CF_LEFT_ADJUST )
		adc[ i ].flags |= SF_LEFT_ADJUST;
	else
		adc[ i ].flags &= ~SF_LEFT_ADJUST;

	if( flags & ADC_CF_VREF_256 )
		adc[ i ].flags |= SF_VREF_256;
	else
		adc[ i ].flags &= ~SF_VREF_256;

	return true;
}

bool adc_start ( uint8_t chan, int num_samples, pfn_adc_callback pfcb )
{
	int i;

	i = get_index ( chan );
	if( i < 0 )
		return false;

	/* Check if channel is enabled */
	if( 0 == ( adc[ i ].flags & SF_ENABLED ))
		return false;

	/* Check if channel is already running */
	if( adc[ i ].flags & SF_RUNNING )
		return false;

	adc[ i ].num_samples = ( num_samples > 0 ) ? num_samples : -1;
	adc[ i ].pfcb = pfcb;
	adc[ i ].flags |= SF_RUNNING;

	/* Start the conversion */
	adc_convert ( i );         
 
	return true;
}

bool adc_is_running ( uint8_t chan )
{
	int i;

	i = get_index ( chan );
	if( i < 0 )
		return false;

	return ( adc[ i ].flags & SF_RUNNING ) != 0;
}

void adc_stop ( uint8_t chan )
{
	int i;
	
	i = get_index ( chan );
	if( i < 0 )
		return;

	adc[ i ].flags &= ~SF_RUNNING;
}
