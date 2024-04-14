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
#include <avr/power.h>
#include <util/delay.h>

#include "spi_avr.h"


/* Peripheral controls (Platform dependent) */


bool spi_enable (void)
{
	if (SPCR & _BV(SPE))			/* Check if already enabled */
		return true;

	/* Configure MOSI/MISO/SCLK pins */
	DDR_SPI |= (DD_SCK | DD_MOSI);	/* output pins */
	DDR_SPI &= ~DD_MISO;			/* MISO input line */

	PORT_SPI &= ~PF_MOSI;
	PORT_SPI &= ~PF_SCK;
	PORT_SPI |= PF_MISO;	/* pull-up MISO pin */

	SPCR = (_BV(SPE) | _BV(MSTR));	/* Enable SPI module in SPI mode 0 */
	_delay_ms(10);
	
	return true;
}

void spi_disable (void)
{
	SPCR = 0;

	/* turn output lines to input */
	DDR_SPI &= ~(DD_MOSI | DD_SCK);

	/* set pins hi-Z */
	PORT_SPI &= ~(PF_MOSI | PF_SCK | PF_MISO);
}


/* Setup clock for SPI bus */
clock_div_t 
spi_set_clk (clock_div_t div)
{
	/* Figure out current divider */
	uint8_t spr, x2;
	clock_div_t old;

	spr = SPCR & (_BV(SPR1) | _BV(SPR0));
	x2 = SPSR & _BV(SPI2X);

	switch (spr) {
	case 0:
		old = x2 ? clock_div_2 : clock_div_4;
		break;
	case _BV(SPR0):
		old = x2 ? clock_div_8 : clock_div_16;
		break;
	case _BV(SPR1):
		old = x2 ? clock_div_32 : clock_div_64;
		break;
	case (_BV(SPR1)|_BV(SPR0)):
		old = x2 ? clock_div_64 : clock_div_128;
		break;
	}

	switch (div) {
	case clock_div_2:
	case clock_div_4:
		SPCR &= ~(_BV(SPR1) | _BV(SPR0));
		break;
	case clock_div_8:
	case clock_div_16:
		SPCR = (SPCR & ~_BV(SPR1)) | _BV(SPR0);
		break;
	case clock_div_32:
	case clock_div_64:
		SPCR = (SPCR & ~_BV(SPR0)) | _BV(SPR1);
		break;
	case clock_div_128:
		SPCR |= (_BV(SPR1) | _BV(SPR0));
		break;
	default:
		return (clock_div_t)-1;
	}

	switch (div) {
	case clock_div_2:
	case clock_div_8:
	case clock_div_32:
		SPSR |= _BV(SPI2X);
		break;
	case clock_div_4:
	case clock_div_16:
	case clock_div_64:
	case clock_div_128:
		SPSR &= ~_BV(SPI2X);
		break;
	default:
		break;
	}

	return old;
}

/* Exchange a byte */
/* Returns received data */
uint8_t spi_xchg (
	uint8_t dat		/* Data to be sent */
)
{
	SPDR = dat;
	loop_until_bit_is_set(SPSR, SPIF);
	return SPDR;
}

/*-----------------------------------------------------------------------*\
 * Transmit/Receive data from/to MMC via SPI  (Platform dependent)
/*-----------------------------------------------------------------------*/

/* Receive a data block fast */
void spi_rcvr_multi (
	uint8_t *p,		/* Data read buffer */
	uint32_t cnt	/* Size of data block */
)
{
	do {
		SPDR = 0xFF;
		loop_until_bit_is_set(SPSR, SPIF);
		*p++ = SPDR;
		SPDR = 0xFF;
		loop_until_bit_is_set(SPSR, SPIF);
		*p++ = SPDR;
	} while (cnt -= 2);
}

/* Send a data block fast */
void spi_xmit_multi (
	const uint8_t *p,	/* Data block to be sent */
	uint32_t cnt		/* Size of data block */
)
{
	if(cnt==0) return;
	if(cnt<2) {
		spi_xchg(*p);
		return;
	}
	do {
		SPDR = *p++;
		loop_until_bit_is_set(SPSR, SPIF);
		SPDR = *p++;
		loop_until_bit_is_set(SPSR, SPIF);
	} while (cnt -= 2);
}

