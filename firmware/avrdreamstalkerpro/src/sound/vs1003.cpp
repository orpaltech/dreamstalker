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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/pgmspace.h>

#include "sound/vs10xx_mcu.h"
#include "sound/vs1003.h"


using namespace VLSI;

/*-----------------------------------------------------------------------*/
	/* SCI Registers */
#ifndef SCI_REG_MODE
#   define SCI_REG_MODE		0x00
#endif
#define  SM_OUTOFWAV	3			// Jump out of WAV decoding: 1 - yes
#define  SM_PDOWN		4			// Power down: 1 - yes
#define  SM_SETTOZERO2  7           // Set to zero: 0 - right, 1 - wrong
#define  SM_ADPCM_HP	13			// ADPCM high-pass filter: 1 - active
#define  SM_LINE_IN     14          // ADPCM source selector: 0 - mic, 1 - line

/*-----------------------------------------------------------------------*/

/*
 * VS1003-specific default XTAL frequency and the clock doubler
 */
#define VS1003_XTAL_FREQ    12288000


#if ( VS_HW_SPEC == VS_HWS_1003 )

/*-----------------------------------------------------------------------*/

#if !defined( VS_XTAL_FREQ )
#	define VS_XTAL_FREQ		VS1003_XTAL_FREQ
#endif

/*-----------------------------------------------------------------------*/

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
 * at something else than 12.288 MHz. 
 */
#define SC_FREQ(xf)		((((xf)-8000000)/4000) & 0x7FF)		/* xf is XTAL frequency in Hz */


/*-----------------------------------------------------------------------*/

PROGMEM const uint8_t __vs1003_patch_rom[] = {
#include "sound/vs1003_patch.h"
};

/*-----------------------------------------------------------------------*/
Vs1003::Vs1003()
{
}

vs_patch_rom_t *Vs1003::vs_patch_rom (void)
{
	return (pvs_patch_rom_t) __vs1003_patch_rom;
}

void Vs1003::vs_suspend (void)
{
	if (sci_is_set ( SCI_REG_MODE, _BV(SM_PDOWN)))
		return;	/* already suspended*/

	analog_pwr_down ();

	sci_add ( SCI_REG_MODE, _BV(SM_PDOWN));
}

void Vs1003::vs_resume (void)
{
	if (! sci_is_set ( SCI_REG_MODE, _BV(SM_PDOWN)))
		return;	/* not suspended*/

	sci_remove ( SCI_REG_MODE, _BV(SM_PDOWN));

	set_volume ( VS_VOL_DEFAULT, VS_VOL_DEFAULT );
}

void Vs1003::set_clockf ( uint16_t mult, uint16_t add )
{
	uint16_t val;

	/* Set freq in case if NOT the default XTAL is used */
	if (VS_XTAL_FREQ != VS1003_XTAL_FREQ)
	 	val |= SC_FREQ(VS_XTAL_FREQ);
	else
		val = 0;

	val |= mult;
	val |= add;

	sci_write ( SCI_REG_CLOCKF, val );
}

bool Vs1003::vs_playback_start (void)
{
	soft_reset ( 0, 0 );

	/* Set clock after software reset
	 */
	set_clockf ( SC_MULT_2, SC_ADD_1 );

	return true;
}

void Vs1003::vs_playback_stop (void)
{
}

bool Vs1003::vs_adpcm_rec_start ( uint16_t sample_rate, uint8_t gain, bool highpass_filter )
{
	uint16_t div;

	set_clockf ( SC_MULT_4, SC_ADD_0 );

	/* write a clock divider value, div, can be obtained by formula below:
	 * Fs = (Mu * Fc) / (256 * div), where
	 * 		Mu	- 	multiplier used only if clock doubler is in use;
	 *		Fc	-	Xtal frequency, i.e. 12288000 Hz;
	 *		Fs	-	sampling rate, i.e. 8000 Hz;
	 * i.e. with div=12, Mu=2, 
	 * 		Fs = (2 * 122880000) / (256 * 12) = 8000 Hz
	 */
	div = (4UL * VS_XTAL_FREQ) / (256UL * sample_rate);

	/* Set clock divider
	 */
	sci_write ( SCI_REG_AICTRL0, div );

	/* Set linear recording gain control, 1024 is equal to gain 1, 512 - gain 0.5, etc.
	 *	The maximum value 65535, i.e.0xFFFF, is equal to gain 64.
	 *	Write 0 to use automatic gain control (AGC)
	 */
	sci_write ( SCI_REG_AICTRL1, AICTRL1_GAIN(gain));

	/* By adding SM ADPCM flag during the software reset
	 * the user will activate IMA ADPCM recording mode.
	 */
	soft_reset ( _BV(SM_ADPCM) | (highpass_filter ? _BV(SM_ADPCM_HP) : 0), 0);

	return true;
}

void Vs1003::vs_adpcm_rec_stop ( void )
{
	/* Software reset to disable ADPCM recording 
	 */
	soft_reset ( 0, _BV(SM_ADPCM) | _BV(SM_ADPCM_HP));
}

#endif	// VS_HW_SPEC == VS_HWS_1003
