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

#include "core/adc_avr.h"
#include "core/uart_avr.h"
#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"

#include "ds_batmon.h"
#include "ds_deferred.h"
#include "ds_util.h"


/* Peripheral controls (Platform dependent) */


#define DDR_MGBUF	DDRG		/* MGBUF direction */
#define DD_MGBUF	_BV(DDG0)

#define PORT_MGBUF	PORTG		/* MGBUG port */
#define PF_MGBUF	_BV(PG0)

/*-----------------------------------------------------------------------*/
/* The GBUF level is declared 1.23V in the datasheet and this level 
 *	should be considered as "full" battery.
 *	Note, that GBUF level is in fact ~1.15V when the power supply 
 *	is close to 3V.
 * As the internal ref 2.56V is used for ADC, the GBUF level 1.23V
 * 	is supposed to be 0x1EC in a 10-bit sample. 
 * 	The value 0x1CC corresponds to 1.15V, which is the real measured GBUF level.
 */
#define BATTERY_FULL_ADC_LEVEL	0x01CCU

#define MEASURE_PERIOD_MINUTES	3

#define BATMON_ADC_CHAN		2
#define BATMON_ADC_SAMPLES	32


/*-----------------------------------------------------------------------*/
typedef struct s_batmon_context {
    uint16_t battery_level;
    uint8_t timer_ticks;		/* minute ticks*/
    bool active;
} batmon_context_t;

static volatile batmon_context_t bm;


/*-----------------------------------------------------------------------*/
static
void batmon_adc_cb ( uint16_t sample )
{
	if ( 0 == bm.battery_level )
		bm.battery_level = sample;
	else
		bm.battery_level = ((uint32_t) bm.battery_level + (uint32_t) sample) / 2;

	/* TODO: forward sample to UART0 during testing phase*/
	//uart0_send_buf ((uint8_t*)&sample, 2);
}

static
void run_conv ( void )
{
	/* Let ADC take a few samples */
	adc_start ( BATMON_ADC_CHAN, 
				BATMON_ADC_SAMPLES, 
				batmon_adc_cb );
}

/*-----------------------------------------------------------------------*/
void batmon_isr (void)	/* called every 1 minute */
{
	uint8_t lvl;

	if( bm.active==false )
		return;

	/* check battery level */
	bm.timer_ticks = ( bm.timer_ticks + 1 ) % MEASURE_PERIOD_MINUTES;
	if ( 0 == bm.timer_ticks ) {

		if ( bm.battery_level > 0 ) {

			lvl = batmon_battery_level ();
			if ( lvl < BATTERY_LOW )
				disp_text ( __disp_msg_battery_low__ );

			if ( lvl < BATTERY_EMPTY )
				return; /* No more measurements needed */
		}

		bm.battery_level = 0;	/* New measurement */

		run_conv();
	}
}

/*-----------------------------------------------------------------------*/
void batmon_init (void)
{
	/* NOTE: This will set GBUF line to be controlled by the codec. 
	 *	The GBUF level is expected to be ~1.23V according to datasheet.
	 */
	DDR_MGBUF &= ~DD_MGBUF;		/* set for input */
	PORT_MGBUF |= PF_MGBUF;		/* pull up */
	//PORT_MGBUF &= ~PF_MGBUF;		/* high Z */

	adc_setup_channel ( BATMON_ADC_CHAN, ADC_CF_VREF_256 );

	bm.active = false;
}

void batmon_start (void)
{
	bm.battery_level = 0;
	bm.timer_ticks = 0;
	bm.active = true;
}

void batmon_stop (void)
{
	bm.active = false;
}

bool batmon_is_running (void)
{
	return bm.active;
}

uint8_t batmon_battery_level()
{
	return ( 100UL * bm.battery_level ) / BATTERY_FULL_ADC_LEVEL;
}
