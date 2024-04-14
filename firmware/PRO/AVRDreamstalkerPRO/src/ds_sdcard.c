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

#include <string.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#include "core/spi_avr.h"
#include "fatfs/ff.h"
#include "fatfs/diskio.h"

#include "ds_sdcard.h"
#include "ds_rtclk.h"



/* Peripheral controls (Platform dependent) */

#define DDR_SDCS	DDRB
#define PORT_SDCS	PORTB
#define DD_SDCS		_BV(DDB0)
#define BIT_SDCS	PB0

/*-----------------------------------------------------------------------*/

static FATFS fs;
static volatile uint8_t	tick_counter = 0;

/*-----------------------------------------------------------------------*/

void sd_card_isr (void)
{
	if (++tick_counter == rtc_msec_to_ticks(10)) {
		tick_counter = 0;

		disk_timerproc();
	}
}

/*-----------------------------------------------------------------------*\
 * SD-Card Functions
\*-----------------------------------------------------------------------*/

void sd_card_cs_init ( void )
{
	/* Configure CS pin */
	DDR_SDCS |= DD_SDCS;

	sd_card_cs_hi ();
}

void sd_card_cs_lo ( void )
{
	SPI_CS_LO(PORT_SDCS, BIT_SDCS);
}

void sd_card_cs_hi ( void )
{
	SPI_CS_HI(PORT_SDCS, BIT_SDCS);
}

bool sd_card_init ( void )
{
	FRESULT res;

	spi_enable();	/* Enable SPI controller in mode-0 */

	res = f_mount(&fs, "/sd/", 1);
	if (res != FR_OK)
		return false;

	return true;
}

void sd_card_umount (void)
{
	f_unmount("/sd/");
}
