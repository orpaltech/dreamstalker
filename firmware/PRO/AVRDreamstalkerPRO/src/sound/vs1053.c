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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/pgmspace.h>

#include "core/dbg_avr.h"
#include "fatfs/ff.h"

#include "vs1053.h"
#include "vs10xx_mcu.h"


/*-----------------------------------------------------------------------*/

#if !defined( VS_XTAL_FREQ )
#	define VS_XTAL_FREQ		VS1053_XTAL_FREQ
#endif

/*-----------------------------------------------------------------------*/

/*
 * AICTRL3 control flags
 */
#define AICTRL3_IMA_ADPCM	0x0000		/* Use IAM ADPCM format for recording */
#define AICTRL3_DUAL_CH		0x0001
#define AICTRL3_LEFT_CH		0x0002		/* Use left channel for recording */
#define AICTRL3_RIGHT_CH	0x0003		/* Use right channel for recording */
#define AICTRL3_LINEAR_PCM	0x0004		/* Use Linear PCM format for recording */

/* SCI_REG_CLOCKF - VS1053 specific bits */

/* SC_MULT - Bits 15:13 - Clock multiplier */
#define SC_MULT_1		0x0000U			/* XTALI */
#define SC_MULT_2		0x2000U			/* XTALI×2.0 */
#define SC_MULT_2P5		0x4000U			/* XTALI×2.5 */
#define SC_MULT_3		0x6000U			/* XTALI×3.0 */
#define SC_MULT_3P5		0x8000U			/* XTALI×3.5 */
#define SC_MULT_4		0xA000U			/* XTALI×4.0 */
#define SC_MULT_4P5		0xC000U			/* XTALI×4.5 */
#define SC_MULT_5		0xE000U			/* XTALI×5 */

/* SC_ADD - Bits 12:11	- tells how much the decoder firmware is allowed
 * to add to the multiplier specified by SC_MULT if more cycles are
 * temporarily needed to decode a WMA stream */
#define SC_ADD_0		0x0000U			/* No modification is allowed */
#define SC_ADD_1		0x0800U			/* 1.0×XTALI */
#define SC_ADD_1P5		0x1000U			/* 1.5×XTALI */
#define SC_ADD_2		0x1800U			/* 2.0×XTALI */

/* SC_FREQ - Bits 10:0	- is used to tell if the XTAL clock is running
 * at something else than 12.288 MHz
 */
#define SC_FREQ(xf)		((((xf)-8000000)/4000) & 0x7FF)		/* xf is XTAL frequency in Hz */


/*-----------------------------------------------------------------------*/

PROGMEM const uint8_t __vs1053_patch_rom[] = {
#include "vs1053_patch.h"
};

pvs_patch_rom_t vs1053_patch_rom (void)
{
	return (pvs_patch_rom_t) __vs1053_patch_rom;
}

/*-----------------------------------------------------------------------*/

bool vs1053_init (void)
{
	return true;
}

bool vs1053_process_patches (void)
{
	return true;
}

void vs1053_set_clockf (uint16_t mult, uint16_t add)
{
	uint16_t val;

	if (VS_XTAL_FREQ >= 24000000) {
		vs_sci_set(SCI_REG_MODE, _BV(SM_CLK_RANGE));
	}

	/* Set freq in case if NOT the default XTAL is used */
	if (VS_XTAL_FREQ != VS1053_XTAL_FREQ)
	 	val |= SC_FREQ(VS_XTAL_FREQ);
	else 
		val = 0;

	val |= mult;
	val |= add;

	vs_sci_write(SCI_REG_CLOCKF, val);
}

bool vs1053_playback_start (void)
{
	vs_sw_reset(0, 0);

	/* Set clock after software reset */
	vs1053_set_clockf(SC_MULT_2, SC_ADD_1);

	return true;
}

void vs1053_playback_stop (void)
{
}

bool vs1053_adpcm_rec_start (uint16_t sample_rate, uint8_t gain)
{
	vs1053_set_clockf(SC_MULT_4P5, SC_ADD_0);

	vs_sci_write(SCI_REG_AICTRL0, sample_rate);

	/* Set linear recording gain control, 1024 is equal to gain 1, 512 - gain 0.5, etc.
	 *	The maximum value 65535, i.e.0xFFFF, is equal to gain 64.
	 *	Write 0 to use automatic gain control (AGC)
	 */
	vs_sci_write(SCI_REG_AICTRL1, AICTRL1_GAIN(gain));

	/* SCI_AICTRL2 controls the maximum AGC gain. This can be used to limit the amplification of
	 *	noise when there is no signal. 
	 *	If SCI_AICTRL2 is 0, the maximum gain is initialized to 65535 (64), i.e. whole range is used.
	 */
	if (gain == 0)
		vs_sci_write(SCI_REG_AICTRL2, AICTRL1_GAIN(4));	/* if GAIN = 0, define max auto gain */
	else
		vs_sci_write(SCI_REG_AICTRL2, 0);

	/* SCI_AICTRL3 flags */
	vs_sci_write(SCI_REG_AICTRL3, AICTRL3_IMA_ADPCM | AICTRL3_LEFT_CH);

	/* NOTE: DO NOT set the software reset bit. The patch below will do it. */
	//vs_sci_set(SCI_REG_MODE, _BV(SM_ADPCM));
	vs_sw_reset(_BV(SM_ADPCM), 0);

	/* This patch rewrites the SRC interrupt vector and restarts the firmware, so the patch 
	 *	must be loaded after the encoding parameters have been set in AICTRL0.. AICTRL3, 
	 *	and the ADPCM bit has been set in SCI_MODE (without setting the software reset bit).
	 */
	vs_patch_process_rom (0, NULL, vs_patch_apply, NULL, NULL);

	return true;
}

void vs1053_adpcm_rec_stop (void)
{
	/* Software reset to disable ADPCM recording */
	vs_sw_reset(0, _BV(SM_ADPCM));
}

void vs1053_suspend (void)
{
	/* 1 - write 0x0000 to SCI_CLOCKF. This disables PLL and saves power*/
	vs_sci_write(SCI_REG_CLOCKF, 0x0000);

	/* 2 - write a low non-zero value, such as 0x0010 to SCI_AUDATA*/
	vs_sci_write(SCI_REG_AUDATA, 0x0010);

	/* 3 - power down analog drivers */
	vs_analog_power_down ();
}

void vs1053_resume (void)
{
	/* same as in vs1053_suspend() but in reverse order */

	/* 3 - set vol thus enabling analog drivers */
	vs_set_volume(VS_VOL_DEFAULT, VS_VOL_DEFAULT);

	/* 2 */
	// TODO: implement

	/* 1 - enable clock */
	vs1053_set_clockf(SC_MULT_2, SC_ADD_1);
}