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

#ifndef _AVR_SPI_DEFINED
#define _AVR_SPI_DEFINED

#include <stdbool.h>
#include <avr/io.h>
#include <avr/power.h>


/* Peripheral controls (Platform dependent) */

#define DDR_SPI	    DDRB
#define PORT_SPI	PORTB

#define DD_SCK		_BV(DDB1)
#define DD_MOSI		_BV(DDB2)
#define DD_MISO		_BV(DDB3)

#define PF_SCK		_BV(PB1)
#define PF_MOSI		_BV(PB2)
#define PF_MISO		_BV(PB3)


/* Set CS = low */
#define SPI_CS_LO(port, bit)    (port &= ~_BV(bit))
/* Set CS = high */
#define	SPI_CS_HI(port, bit)    (port |= _BV(bit))


#ifdef __cplusplus
extern "C" {
#endif

bool spi_enable (void);
void spi_disable (void);


/* Setup clock for SPI bus */
clock_div_t spi_set_clk (clock_div_t div);

/* Exchange a byte */
uint8_t spi_xchg (uint8_t dat);

/* Receive a data block fast */
void spi_rcvr_multi (uint8_t *p, uint32_t cnt);

/* Send a data block fast */
void spi_xmit_multi (const uint8_t *p, uint32_t cnt);


#ifdef __cplusplus
}
#endif

#endif // _AVR_SPI_DEFINED
