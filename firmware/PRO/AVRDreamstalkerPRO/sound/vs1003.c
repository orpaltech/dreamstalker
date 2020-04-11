/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2019	ORPAL Technologies, Inc.
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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>
#include <avr/io.h>

#include "../oddebug.h"
#include "../fatfs/ff.h"

#include "vs10xx_mcu.h"
#include "vs1003.h"


/* SCI_REG_CLOCKF - VS1003 specific bits */

/* SC_MULT - Bits 15:13 - Clock multiplier */
#define SC_MULT_1		0x0000			/* XTALI */
#define SC_MULT_1P5		0x2000			/* XTALI×1.5 */
#define SC_MULT_2		0x4000			/* XTALI×2.0 */
#define SC_MULT_2P5		0x6000			/* XTALI×2.5 */
#define SC_MULT_3		0x8000			/* XTALI×3.0 */
#define SC_MULT_3P5		0xA000			/* XTALI×3.5 */
#define SC_MULT_4		0xC000			/* XTALI×4.0 */
#define SC_MULT_4P5		0xE000			/* XTALI×4.5 */

/* SC_ADD - Bits 12:11	- tells how much the decoder firmware is allowed
 * to add to the multiplier specified by SC_MULT if more cycles are
 * temporarily needed to decode a WMA stream */
#define SC_ADD_0		0x0000			/* No modification is allowed */
#define SC_ADD_0P5		0x0800			/* 0.5× */
#define SC_ADD_1		0x1000			/* 1.0× */
#define SC_ADD_1P5		0x1800			/* 1.5× */

/* SC_FREQ - Bits 10:0	- is used to tell if the XTAL clock is running
 * at something else than 12.288 MHz */
#define SC_FREQ_12288	0x0000
#define SC_FREQ(xf)		(uint16_t)(((xf)-8000000)/4000)		/* xf is XTAL frequency in Hz */


void vs1003_set_clockf (uint32_t xtal_freq, int clock_doubler)
{
	uint16_t val;

	val = (SC_ADD_0P5 | SC_FREQ(xtal_freq));

	if (clock_doubler)
		val	|= SC_MULT_2;
	else
		val |= SC_MULT_1;

	vs_sci_write(SCI_REG_CLOCKF, val);
	_delay_ms(1);
}

void vs1003_suspend (void)
{

}

void vs1003_resume (void)
{

}

void vs1003_adpcm_rec_start (int highpass_filter)
{
	/* Write a clock divider value, div, can be obtained by formula below:
	 * fs = (2 * Fc) / (256 * div), where
	 * 		2	- 	only if clock doubler is in use, otherwise 1;
	 *		Fc	-	Xtal frequency, i.e. 12288000 Hz;
	 *		fs	-	sampling rate, i.e. 8000 Hz;
	 * with div=12, fs = (2 * 122880000) / (256 * 12) = 8000 Hz */
	vs_sci_write(SCI_REG_AICTRL0, 12);

	/* Set recording gain control, 1024 is equal to digital gain 1 (analog gain 4)
	 * write 0 to use automatic gain control (AGC) */
	vs_sci_write(SCI_REG_AICTRL1, 1024);

	/* TODO: Write the sample rate. is this needed ? */
	//vs_sci_write(SCI_REG_AUDATA, 8000);

	/* By adding SM ADPCM flag during the software reset
	 * the user will activate IMA ADPCM recording mode. */
	if (highpass_filter)
		vs_sw_reset((1<<SM_ADPCM)|(1<<SM_ADPCM_HP), 0);
	else
		vs_sw_reset((1<<SM_ADPCM), (1<<SM_ADPCM_HP));

	/* TODO: set clock after software reset. is this needed ? */
	//vs_set_clockf(VS_XTAL_FREQ, VS_USE_CLK_DOUBLER);
}

void vs1003_adpcm_rec_stop (void)
{
	/* software reset to disable ADPCM recording */
	vs_sw_reset(0, (1<<SM_ADPCM) | (1<<SM_ADPCM_HP));

	/* TODO: set clock after software reset. is this needed ? */
	//vs_set_clockf(VS_XTAL_FREQ, VS_USE_CLK_DOUBLER);
}

