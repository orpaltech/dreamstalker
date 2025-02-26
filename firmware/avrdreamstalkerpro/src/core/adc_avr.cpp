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

#include <util/delay.h>
#include <string.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/atomic.h>

#include "core/adc_avr.h"
#include "ds_util.h"

using namespace avr_core;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

/* ADC status flags */
#define SF_ENABLED      0x0100U
#define SF_RUNNING		  0x0200U
#define SF_LEFT_ADJUST	0x0400U
#define SF_VREF_2_56	  0x0800U
//#define SF_LOW_NOISE	0x1000

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
#define ADC_REF_AVCC	_BV(REFS0)					      /* ADC ref is AVCC */
#define ADC_REF_256		(_BV(REFS1)|_BV(REFS0))		/* ADC ref is 2.56V */

/* 5 bits in total, ADC channels 0-7 supported
 * i.e. only 3 lower bits are used to encode the channel number 
 */
#define ADC_CHAN_MASK	0x1FU

/* ADC helpers */
#define ADC_SET_DIV(n)	ADCSRA |= ADC_N(n)
#define ADC_GET_CH()	  (ADMUX & ADC_CHAN_MASK)


/* Default ADC prescaler (F_CPU divider) */
#define ADC_DIV		64
#define ADC_CLK   (F_CPU / ADC_DIV)

/* ADC convert rate, kHz */
#define ADC_CONVERT_RATE  31250U

/** NOTE: see how often we should run the handler , i.e. calc the handler 
 * period. It depends on number of channels and the RTC frequency.
 * 
 * ADC_CHANNELS     = 2
 * RTC_CLK          = 1ms
 * ADC_CONVERT_RATE 
 * 
 * Must run handler ADC_CHANNELS times faster than ADC_CONVERT_RATE, 
 * i.e. period ~= ( 1'000'000 / ( ADC_CHANNELS * ADC_CONVERT_RATE ) ), 
 * in millisec.
 */
#define ADC_HANDLER_PERIOD_TICKS  (1'000'000U / ( ADC_CHANNELS * ADC_CONVERT_RATE ))



// code to be executed when ADC interrupts
/*-----------------------------------------------------------------------*/
ISR(ADC_vect)
{
  A2DConv::handle_adc ();
}

/*-----------------------------------------------------------------------*/
void A2DConv::handle_rtc (void)
{
  A2D.rtc_handler();
}

void A2DConv::handle_adc (void)
{
  A2D.adc_handler();
}

/*-----------------------------------------------------------------------*/
A2DConv A2D;

/*-----------------------------------------------------------------------*/
void A2DConv::rtc_handler (void)
{
  int i = 0;

  /** Check if ADC enabled 
   */
  if (! (ADCSRA & _BV(ADEN)))
    return;

  tick_count = ( tick_count + 1 ) % period_ticks;
  if ( 0 == tick_count ) {

    /* Check if conversion complete */
    //if (ADCSRA & _BV(ADSC))
    //  return;

    /* Next channel for convert */
    i = get_next_running_index ();
    if( i < 0 ) {
      /* No channel to convert */
      return;
    }

    /* Enable interrupt on data ready */
    ADCSRA |= _BV(ADIE);


    /* Next sample convert */
    convert_one ( i );
  }
}

void A2DConv::adc_handler (void)
{
  uint16_t sample;
  volatile adc_channel_t *pch;
  int i;

  i = get_index ( ADC_GET_CH () );
  if ( i < 0 )
	  return;

  pch = &adc[i];

  /* Read buffered ADC sample */
  sample = ADC;

  if (pch->flags & SF_LEFT_ADJUST)
    sample >>= 6;
  /* ADC has 10 meaningful bits */
  sample &= 0x3FF;

  if (pch->flags & SF_RUNNING) {

	  /* Allow callback function process the sample */
	  if (pch->pfcb)
	    (pch->pfcb)->on_a2d_sample ( sample );

	  if (pch->num_samples > 0) {
	    /* Check number of samples requested 
	     * and stop the channel, if needed 
	     */
	    if (--pch->num_samples == 0)
		    pch->flags &= ~SF_RUNNING;
	  }
  }

  /* Disable further interrupts */
  ADCSRA &= ~_BV(ADIE);
}

uint8_t A2DConv::get_channel ( int i )
{
  return adc[i].flags & ADC_CHAN_MASK;
}

int A2DConv::get_index( uint8_t chan )
{
  uint8_t i;

  for (i = 0; i < ADC_CHANNELS; i++) {
	  if (get_channel ( i ) == chan)
	    return i;
  }
  return -1;
}

int A2DConv::get_next_running_index ( void )
{
  int index = chan_index;

  /* Advance the channel index */
  if (!( ++chan_index < ADC_CHANNELS ))
    chan_index = 0;

	if (adc[index].flags & SF_RUNNING) {
    /* 
     * Ready to capture the channel 
     */
    return index;
  }

  return -1;
}

void A2DConv::convert_one ( int i )
{
  uint8_t adc_ref, left_adjust = 0;
  /* Setup ADC multiplexer for conversion */
  if (adc[i].flags & SF_VREF_2_56)
	  adc_ref = ADC_REF_256;			      /* Internal 2.56V as ref */
  else
	  adc_ref = ADC_REF_AVCC;			      /* AVCC as ref */

  if (adc[i].flags & SF_LEFT_ADJUST)
	  left_adjust |= _BV(ADLAR);        /* Left-adjusted result */

  /* Setup multiplexer register */
  ADMUX = (adc_ref | left_adjust | get_channel( i ));	

  /** Clear irq flag, do a single conversion 
   */
  ADCSRA |= _BV(ADIF); ADCSRA |= _BV(ADSC);
}

/*-----------------------------------------------------------------------*/
bool A2DConv::enable (void)
{
  /* NOTE: ADC is in single-convert mode */

  /* Enable ADC channels */
  adc[0].flags = ( 0U | SF_ENABLED );	/* channel 0 */
  adc[1].flags = ( 2U | SF_ENABLED );	/* channel 2 */

  chan_index = 0;	
  tick_count = 0;
  period_ticks = ADC_HANDLER_PERIOD_TICKS;

  /* TODO: Switch ADC pins for input. 
   *		Is this needed ???
   */
  DDR_ADC &= ~(DD_ADC0|DD_ADC2);

  ADCSRA = _BV(ADEN);     /* Power ADC on */
  ADC_SET_DIV(ADC_DIV);		/* Set ADC sampling rate */

  return true;
}

void A2DConv::warm_up (void) 
{
  /* Warm up the ADC analog circuitry */
  start ( 2, 3, NULL );

  _delay_ms ( 10 );
}

void A2DConv::disable (void)
{
  stop ( 0 );
  stop ( 2 );

  /* Disable ADC channels */
  adc[0].flags &= ~SF_ENABLED;	/* channel 0 */
  adc[1].flags &= ~SF_ENABLED;	/* channel 2 */


  /* Disable interrupt, Power ADC off */
  ADCSRA &= ~(_BV(ADIE) | _BV(ADEN));
}

uint32_t A2DConv::get_adc_rate (void)
{
  return ( F_CPU / ADC_DIV );	/* ADC clock rate */
}

bool A2DConv::setup_channel (uint8_t chan, uint16_t flags)
{
  volatile adc_channel_t *pch;
  int i;

  i = get_index ( chan );
  if( i < 0 )
	  return false;

  pch = &adc[i];

  if( flags & ADC_CF_LEFT_ADJUST )
	  pch->flags |= SF_LEFT_ADJUST;
  else
	  pch->flags &= ~SF_LEFT_ADJUST;

  if( flags & ADC_CF_VREF_2_56 )
	  pch->flags |= SF_VREF_2_56;
  else
	  pch->flags &= ~SF_VREF_2_56;

  return true;
}

bool A2DConv::start (uint8_t chan, int num_samples, A2DSampleCB *pfcb)
{
  bool res;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    res = start_unsafe ( chan, num_samples, pfcb );
  }
  return res;
}

bool A2DConv::start_unsafe (uint8_t chan, int num_samples, A2DSampleCB *pfcb)
{
  volatile adc_channel_t *pch;
  int i;

  i = get_index ( chan );
  if( i < 0 )
	  return false;

  pch = &adc[i];

  /* Check if channel is enabled */
  if (! ( pch->flags & SF_ENABLED ))
	  return false;

  /* Check if channel is already running */
  if (pch->flags & SF_RUNNING)
    return false;

  pch->num_samples = ( num_samples > 0 ) ? num_samples : -1;
  pch->pfcb = pfcb;
  pch->flags |= SF_RUNNING;

  /* Start the conversion */
  return true;
}

void A2DConv::enable_channel (uint8_t chan, bool enable)
{
  int i;

  i = get_index ( chan );
  if( i < 0 )
	  return;

  if (enable)
    adc[i].flags |= SF_ENABLED;
  else
    adc[i].flags &= ~SF_ENABLED;
}

bool A2DConv::is_enabled ( uint8_t chan )
{
  int i;
  bool enabled;

  i = get_index ( chan );
  if( i < 0 )
	  return false;

  enabled = (adc[i].flags & SF_ENABLED ) != 0;
  return enabled;
}

bool A2DConv::is_running ( uint8_t chan )
{
  int i;
  bool running;

  i = get_index ( chan );
  if( i < 0 )
	  return false;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {

    running = (adc[i].flags & SF_RUNNING ) != 0;
  }
  return running;
}

void A2DConv::stop (uint8_t chan) 
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
    stop_unsafe (chan);
  }
}

void A2DConv::stop_unsafe ( uint8_t chan )
{
  int i;
	
  i = get_index ( chan );
  if( i < 0 )
	  return;

  adc[i].flags &= ~SF_RUNNING;
}
