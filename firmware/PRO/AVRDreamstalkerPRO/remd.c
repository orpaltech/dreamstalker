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
#include <util/delay.h>

#include "core/adc_avr.h"
#include "remd.h"


/* Peripheral controls (Platform dependent) */
#define DD_IRTX		_BV(DDC0)
#define DDR_IRTX	DDRC
#define PORT_IRTX	PORTC

#define	BIT_IRTX	PC0
#define BV_IRTX		_BV(BIT_IRTX)

#define IRTX_ON()	PORT_IRTX &= ~BV_IRTX		/* Enables IR transmitter */
#define IRTX_OFF()	PORT_IRTX |= BV_IRTX		/* Disables IR transmitter */


/*-----------------------------------------------------------------------*/
static
void remd_adc_isr(adc_context_t *padc, uint16_t sample)
{
	/*uint16_t val;

	val = padc->sample;

	if (val < (0x1FF))
	{
		PORTE &= ~(1<<PE3);
	}
	else
	{
		PORTE |= (1<<PE3);
	}*/
}

/*-----------------------------------------------------------------------*/

void remd_init (void)
{
	DDR_IRTX |= DD_IRTX;	// IRTX output line

	IRTX_OFF();
}

void remd_run (void)
{
	IRTX_ON();

	adc_run(0, remd_adc_isr);
}

void remd_stop (void)
{
	adc_stop();

	IRTX_OFF();
}

