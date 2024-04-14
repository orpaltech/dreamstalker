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

#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>

#include "core/uart_avr.h"
#include "core/adc_avr.h"
#include "ds_remd.h"
#include "ds_util.h"


/* Peripheral controls (Platform dependent) */


#define DDR_IRTX	DDRC		/* IRTX data direction register */
#define DDF_IRTX	_BV(DDC0)	/* IRTX data direction flag */

#define PORT_IRTX	PORTC		/* IRTX port register */
#define PF_IRTX		_BV(PC0)	/* IRTX port flag */

#define REMD_ADC_CHAN	0

static bool remd_status = false;

/*-----------------------------------------------------------------------*/
static 
void remd_adc_cb(uint16_t sample)
{
	/* TODO: forward sample to UART0 during testing phase*/
	/*char pkt_buf[10];
	pkt_buf[0]='R';
	dec_to_hex(sample, &pkt_buf[1], 4);
	pkt_buf[5]='\n';
	pkt_buf[6]=0;*/
	//uart0_puts(pkt_buf);
	//uart0_write (pkt_buf, 4, true);
	uart0_send_buf ((uint8_t*)&sample, 2);

}

/*-----------------------------------------------------------------------*/

bool remd_init (void)
{
	/* Enable IRTX line */
	DDR_IRTX |= DDF_IRTX;	/*set output mode*/
	/* Switch-off IRX transmitter*/
	PORT_IRTX |= PF_IRTX;	/*drive pin high*/

	return true;
}

void remd_uninit (void)
{
	/* Disable IRTX line */
	DDR_IRTX &= ~DDF_IRTX;	/*set input mode*/
	PORT_IRTX &= PF_IRTX;	/*high-Z*/
}

bool remd_start (void)
{
	if (remd_status)
		return true;

	if (!adc_start(REMD_ADC_CHAN, 0, remd_adc_cb))
		return false;

	/* Switch-on IRX transmitter*/
	PORT_IRTX &= ~PF_IRTX;	/*drive pin low*/

	remd_status = true;
	return true;
}

void remd_stop (void)
{
	if (!remd_status)
		return;

	/* Switch-off IRX transmitter*/
	PORT_IRTX |= PF_IRTX;	/*drive pin high*/

	adc_stop(REMD_ADC_CHAN);

	remd_status = false;
}

inline bool remd_is_running()
{
	return remd_status;
}
