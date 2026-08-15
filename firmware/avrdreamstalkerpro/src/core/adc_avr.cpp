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

#include <util/delay.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/atomic.h>

#include "core/adc_avr.h"
#include "ds_util.h"

using namespace avr::core;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

/* ADC status flags */
#define SF_ENABLED      0x01U
#define SF_RUNNING		  0x02U
#define SF_LEFT_ADJUST	0x04U
#define SF_VREF_2_56	  0x08U
//#define SF_LOW_NOISE	0x10U

#define DDR_ADC		DDRF
#define DD_ADC0		_BV(DDF0)
#define DD_ADC2		_BV(DDF2)

/* ADC clock prescalers, F_CPU/N */
#define ADC_N_8   (_BV(ADPS1) | _BV(ADPS0))     /* 1 MHz */
#define ADC_N_16	(_BV(ADPS2))  		            /* 500 kHz */
#define ADC_N_32	(_BV(ADPS2) | _BV(ADPS0))			/* 250 kHz */
#define ADC_N_64	(_BV(ADPS2) | _BV(ADPS1))			/* 125 kHz */
#define ADC_N_128	(_BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0))	/* 62.5 kHz */
#define ADC_N(n)	ADC_N_ ## n

/* Possible ADC refs */
#define ADC_REF_AVCC	_BV(REFS0)					        /* ADC ref is AVCC */
#define ADC_REF_256		(_BV(REFS1) | _BV(REFS0))   /* ADC ref is 2.56V */

/* 5 bits in total, ADC channels 0-7 supported
 * i.e. only 3 lower bits are used to encode the channel number 
 */
#define ADC_CHAN_MASK	0x1FU

/* ADC helpers */
#define ADC_SET_DIV(n)	ADCSRA |= ADC_N(n)
#define ADC_GET_CH()	  (ADMUX & ADC_CHAN_MASK)


/* Default ADC prescaler (F_CPU divider) */
#define ADC_DIV		64                  // ADC takes 13 cycles for each conversion, ~104us
#define ADC_CLK   (F_CPU / ADC_DIV)



// code to be executed when ADC interrupts
/*-----------------------------------------------------------------------*/
ISR(ADC_vect)
{
  A2DConvert::handle_adc ();
}

/*-----------------------------------------------------------------------*/
void A2DConvert::handle_sysclk (void) //called every 1ms
{
  get()->sysclk_handler();
}

void A2DConvert::handle_adc (void)
{
  get()->adc_handler();
}

A2DConvert *A2DConvert::get()
{
  static A2DConvert a2d;
  return &a2d;
}

/*-----------------------------------------------------------------------*/
void A2DConvert::sysclk_handler (void)
{
  if (! (ADCSRA & _BV(ADEN))) // Check if ADC enabled 
    return;

  int i = get_first_running_index ();
  if ( i < 0 ) {
    // No channel to convert 
    return;
  }

  // Enable interrupt on ADC sample
  ADCSRA |= _BV(ADIE);

  // Next sample convert 
  convert_one ( i );
}

void A2DConvert::adc_handler (void)
{
  const int i = get_index( ADC_GET_CH () );
  if ( i < 0 ) return;

  volatile adc_channel_t *pch = &adc[i];

  // Read buffered ADC sample
  uint16_t sample = ADC;
  if (pch->flags & SF_LEFT_ADJUST) {
    sample >>= 6;
  }
  // ADC has 10 meaningful bits
  sample &= ADC_MAX_VALUE;

  if (pch->flags & SF_RUNNING) {

	  // Allow callback function process the sample
	  if (pch->pfcb) {
	    pch->pfcb( pch->context, sample );
    }

	  if (pch->num_samples > 0) {
	    // Check number of samples requested and stop channel, if needed 
	    //
	    if (--pch->num_samples == 0) {
		    pch->flags &= ~SF_RUNNING;
      }
	  }
  }

  const int n = get_next_running_index ( i );
  if( n < 0 ) {
    // No more channels, disable interrupts until next sysclk tick
    //
    ADCSRA &= ~_BV(ADIE);
    return;
  }

  // Found next channel
  convert_one ( n );
}

uint8_t A2DConvert::get_channel ( uint8_t i ) const
{
  const volatile adc_channel_t *pch = &adc[i];

  // The compiler will only read the first byte of .flags 
  // because the mask 0x1F makes the second byte irrelevant
  //
  return (uint8_t)(pch->channel & ADC_CHAN_MASK);
}

int8_t A2DConvert::get_index( uint8_t chan ) const
{
  for (uint8_t i = 0; i < ADC_CHANNELS; i++) {
	  if (get_channel ( i ) == chan) {
	    return i;
    }
  }
  return -1;
}

int8_t A2DConvert::get_first_running_index ( void) const
{
  return get_next_running_index( -1 );
}

int8_t A2DConvert::get_next_running_index(int8_t current_index) const
{
  // Start searching from the index immediately following the current one
  for (int8_t i = current_index + 1; i < ADC_CHANNELS; i++) {
    const volatile adc_channel_t *pch = &adc[i];

    if (pch->flags & SF_RUNNING) {
      // Found the next running channel
      //
      return i;
    }
  }

  return -1; // Reached the end, sweep is finished
}

void A2DConvert::convert_one ( int8_t i ) const
{
  uint8_t adc_ref, left_adjust = 0;
  const volatile adc_channel_t *pch = &adc[i];

  // Setup ADC multiplexer for conversion 
  if (pch->flags & SF_VREF_2_56) {
	  adc_ref = ADC_REF_256;			      // Internal 2.56V as ref
  }
  else {
	  adc_ref = ADC_REF_AVCC;           // AVCC as ref
  }

  if (pch->flags & SF_LEFT_ADJUST) {
	  left_adjust |= _BV(ADLAR);        // Left-adjusted result
  }

  // Setup multiplexer register
  ADMUX = (adc_ref | left_adjust | get_channel( i ));	

  // Do a single conversion 
  ADCSRA |= _BV(ADSC);
}

/*-----------------------------------------------------------------------*/
bool A2DConvert::enable (void)
{
  // NOTE: ADC is in single-convert mode

  // Enable ADC channel 0 
  adc[0].channel = 0;
  adc[0].flags = SF_ENABLED;

  // Enable ADC channel 2 
  adc[1].channel = 2;
  adc[1].flags = SF_ENABLED;

  // Switch ADC pins for input
  // TODO: is this really needed ???
  DDR_ADC &= ~(DD_ADC0 | DD_ADC2);

  ADCSRA = _BV(ADEN);     // Power ADC on
  ADC_SET_DIV(ADC_DIV);		// Set ADC sampling rate

  return true;
}

void A2DConvert::warm_up (void) 
{
  // Warm up the ADC analog circuitry 
  start ( 2, 3, NULL );

  _delay_ms ( 10 );
}

void A2DConvert::disable (void)
{
  for (int8_t i = 0; i < ADC_CHANNELS; i++) {
    volatile adc_channel_t *pch = &adc[i];

    stop ( pch->channel );

    // Disable the channel
    pch->flags &= ~SF_ENABLED;
  }

  // Disable interrupt, power ADC off
  ADCSRA &= ~(_BV(ADIE) | _BV(ADEN));
}

uint32_t A2DConvert::get_adc_rate (void)
{
  return ( F_CPU / ADC_DIV );	/* ADC clock rate */
}

bool A2DConvert::setup_channel (uint8_t chan, uint16_t flags)
{
  int i = get_index ( chan );
  if( i < 0 ) return false;

  volatile adc_channel_t *pch = &adc[i];

  if( flags & ADC_CF_LEFT_ADJUST ) {
	  pch->flags |= SF_LEFT_ADJUST;
  }
  else {
	  pch->flags &= ~SF_LEFT_ADJUST;
  }

  if( flags & ADC_CF_VREF_2_56 ) {
	  pch->flags |= SF_VREF_2_56;
  }
  else {
	  pch->flags &= ~SF_VREF_2_56;
  }

  return true;
}

bool A2DConvert::start (uint8_t chan, uint16_t num_samples, A2DSampleCB_t pfcb, void *context)
{
  bool res;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    res = start_unsafe ( chan, num_samples, pfcb, context );
  }
  return res;
}

bool A2DConvert::start_unsafe (uint8_t chan, uint16_t num_samples, A2DSampleCB_t pfcb, void *context)
{
  int i = get_index ( chan );
  if( i < 0 ) return false;

  volatile adc_channel_t *pch = &adc[i];

  // Check if channel is enabled
  if (!( pch->flags & SF_ENABLED )) {
	  return false;
  }

  // Check if channel is already running
  if (pch->flags & SF_RUNNING) {
    return false;
  }

  pch->num_samples = num_samples;
  pch->pfcb = pfcb;
  pch->context = context;
  pch->flags |= SF_RUNNING;

  // Start the conversion on this channel
  return true;
}

void A2DConvert::enable_channel (uint8_t chan, bool enable)
{
  int i = get_index ( chan );
  if( i < 0 ) return;

  if (enable) {
    adc[i].flags |= SF_ENABLED;
  }
  else {
    adc[i].flags &= ~SF_ENABLED;
  }
}

void A2DConvert::stop (uint8_t chan) 
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    stop_unsafe (chan);
  }
}

void A2DConvert::stop_unsafe ( uint8_t chan )
{
  int i = get_index ( chan );
  if( i < 0 ) return;

  adc[i].flags &= ~SF_RUNNING;
}
