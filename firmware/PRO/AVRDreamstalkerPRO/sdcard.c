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
#include <avr/interrupt.h>
#include <string.h>
#include <util/delay.h>

#include "oddebug.h"

#include "sdcard.h"
#include "fatfs/ff.h"
#include "fatfs/diskio.h"

//#include "timers.h"


static FATFS fs;


static
void sd_timer_on (void)
{
	//timer2_on(disk_timerproc, 10U);
}

static
void sd_timer_off (void)
{
	//timer2_off(disk_timerproc);
}

static volatile uint8_t	timer_counter = 0;

void sdcard_isr (void)
{
	if (++timer_counter == 10) {
		timer_counter = 0;

		disk_timerproc();
	}
}

/*-----------------------------------------------------------------------*/
/* SD-Card Control Functions									 		 */
/*-----------------------------------------------------------------------*/

int sdcard_init (int delay_mount)
{
	FRESULT fres;

	sd_timer_on();

	fres = f_mount(&fs, "sd:", (delay_mount==0 ? 1 : 0));
	if (fres != FR_OK) {
		sd_timer_off();

		DBG1(0x98, (unsigned char*)&fres, 2);
		return 0;
	}

	return 1;
}

void sdcard_uninit (void)
{
	f_unmount("sd:");

	sd_timer_off();
}
