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

#include "vs10xx_mcu.h"
#include "vs1002.h"


/*-----------------------------------------------------------------------*/

/* V1002 chip modifications */
#define VS1002_C	99
#define VS1002_D	100

#if !defined( VS1002_HW_REV )
#	define VS1002_HW_REV	VS1002_D
#endif

/*-----------------------------------------------------------------------*/

#if !defined( VS_XTAL_FREQ )
#	define VS_XTAL_FREQ		VS1002_XTAL_FREQ
#endif

#if (VS_XTAL_FREQ < VS1002_XTAL_FREQ)
#	define VS_USE_CLK_DBL	1
#else
#	define VS_USE_CLK_DBL	0
#endif

#if !defined( VS1002_IMA_ADPCM_PATCH )
#	define VS1002_IMA_ADPCM_PATCH	1
#endif

/*-----------------------------------------------------------------------*/
#define SC_FREQ(xf)		(((xf)/2000) & 0x7FF)	/* xf is XTAL frequency in Hz */

/*-----------------------------------------------------------------------*/

PROGMEM const uint8_t __vs1002_patch_rom[] = {
#include "vs1002_patch.h"
};

pvs_patch_rom_t vs1002_patch_rom (void)
{
	return (pvs_patch_rom_t) __vs1002_patch_rom;
}

/*-----------------------------------------------------------------------*/

#if ( VS1002_HW_REV == VS1002_C ) && ( VS1002_IMA_ADPCM_PATCH )
/* VS1002c ADPCM patch activation sequence */
vs_sci_instr_t patch_ima_adpcm_act [ 3 ] = {
		{ SCI_REG_WRAMADDR, 0x8021 },
		{ SCI_REG_WRAM,		0x2a01 },
		{ SCI_REG_WRAM,		0x000e },
};

static
bool patch_ima_adpcm_set_act(pvs_patch_t patch, pvs_patch_state_t)
{
	/* Set activation instructions */
	patch->act.instr = patch_ima_adpcm_act;
	patch->act.num_instr = sizeof(patch_ima_adpcm_act) 
						/ sizeof(patch_ima_adpcm_act[0]);

	return true;
}
#endif

bool vs1002_init (void)
{
	return true;
}

bool vs1002_process_patches (void)
{
/*#if ( VS1002_HW_REV == VS1002_D )
	if (! vs_patch_process_rom (0, NULL, vs_patch_apply, NULL, NULL))
		return false;
#endif*/

	return true;
}

void vs1002_set_clockf (void)
{
	uint16_t val;

	/* Set freq in case if NOT the default XTAL is used */
	if (VS_XTAL_FREQ != VS1002_XTAL_FREQ)
		val = SC_FREQ(VS_XTAL_FREQ);
	else
		val = 0;

	if (VS_USE_CLK_DBL)
		val |= 0x8000;

	vs_sci_write(SCI_REG_CLOCKF, val);
}

void vs1002_suspend (void)
{
	if (vs_sci_is_set(SCI_REG_MODE, _BV(SM_PDOWN)))
		return;	/* already suspended*/

	vs_analog_power_down();

	vs_sci_set(SCI_REG_MODE, _BV(SM_PDOWN));
}

void vs1002_resume (void)
{
	if (! vs_sci_is_set(SCI_REG_MODE, _BV(SM_PDOWN)))
		return;	/* not suspended*/

	vs_sci_unset(SCI_REG_MODE, _BV(SM_PDOWN));

	vs_set_volume(VS_VOL_DEFAULT, VS_VOL_DEFAULT);
}

bool vs1002_playback_start (void)
{
	vs_sw_reset(0, 0);

	/* Set clock after software reset */
	vs1002_set_clockf();

	return true;
}

void vs1002_playback_stop (void)
{
}

#if ( VS1002_IMA_ADPCM_PATCH )	

/*
 * Capture with ADPCM patch applied 
 */

bool vs1002_adpcm_rec_start (uint16_t sample_rate, uint8_t gain, bool highpass_filter)
{
	uint16_t div;

#if ( VS1002_HW_REV == VS1002_D )
	
	vs_sw_reset(0, 0);

	vs_patch_process_rom (0, NULL, vs_patch_apply, NULL, NULL);
#endif

	/* Set clock after software reset */
	vs1002_set_clockf();
	
	/* write a clock divider value, div, can be obtained by formula below:
	 * Fs = (2 * Fc) / (256 * div), where
	 * 		2	- 	multiplier used only if clock doubler is in use;
	 *		Fc	-	Xtal frequency, i.e. 12288000 Hz;
	 *		fs	-	sampling rate, i.e. 8000 Hz;
	 * i.e. with div=12, Fs = (2 * 122880000) / (256 * 12) = 8000 Hz
	 */
	div = ((VS_USE_CLK_DBL ? 2UL : 1UL) * VS_XTAL_FREQ) / (256UL * sample_rate);

	/* Set clock divider */
	vs_sci_write(SCI_REG_AICTRL0, div);

	/* Set linear recording gain control, 1024 is equal to gain 1, 512 - gain 0.5, etc.
	 *	The maximum value 65535, i.e.0xFFFF, is equal to gain 64.
	 *	Write 0 to use automatic gain control (AGC)
	 */
	vs_sci_write(SCI_REG_AICTRL1, AICTRL1_GAIN(gain));

#if ( VS1002_HW_REV == VS1002_C )
	/* By adding SM ADPCM flag during the software reset
	 * the user will activate IMA ADPCM recording mode.
	 */
	vs_sw_reset((highpass_filter ? _BV(SM_ADPCM_HP) : 0) | _BV(SM_ADPCM), 0);

	/* Set clock after software reset */
	vs1002_set_clockf();

	/* Write sample rate */
	vs_sci_write(SCI_REG_AUDATA, sample_rate);

	_delay_us(100);

	/* Load and start ADPCM recording patch */
	if (! vs_patch_process_rom (0, NULL, vs_patch_apply, 
							patch_ima_adpcm_set_act, NULL))
		return false;

#elif ( VS1002_HW_REV == VS1002_D )

	/* Activate ADPCM recording patch */
	vs_sci_write(SCI_REG_AIADDR, 0x30);
#endif

	return true;
}

void vs1002_adpcm_rec_stop (void)
{
#if ( VS1002_HW_REV == VS1002_C )
	/* Software reset to disable ADPCM recording */
	vs_sw_reset(0, _BV(SM_ADPCM) | _BV(SM_ADPCM_HP));

#elif ( VS1002_HW_REV == VS1002_D )
	vs_sci_write(SCI_REG_AIADDR, 0);

	vs_sw_reset(0, 0);
#endif
}

#else

/* 
 * Otherwise go without ADPCM patch
 */

bool vs1002_adpcm_rec_start (uint16_t sample_rate, uint8_t gain, bool highpass_filter)
{
	uint16_t div;

	vs1002_set_clockf();

	/* write a clock divider value, div, can be obtained by formula below:
	 * Fs = (2 * Fc) / (256 * div), where
	 * 		2	- 	multiplier used only if clock doubler is in use;
	 *		Fc	-	Xtal frequency, i.e. 12288000 Hz;
	 *		fs	-	sampling rate, i.e. 8000 Hz;
	 * i.e. with div=12, Fs = (2 * 122880000) / (256 * 12) = 8000 Hz
	 */
	div = ((VS_USE_CLK_DBL ? 2UL : 1UL) * VS_XTAL_FREQ) / (256UL * sample_rate);

	/* Set clock divider */
	vs_sci_write(SCI_REG_AICTRL0, div);

	/* Set linear recording gain control, 1024 is equal to gain 1, 512 - gain 0.5, etc.
	 *	The maximum value 65535, i.e.0xFFFF, is equal to gain 64.
	 *	Write 0 to use automatic gain control (AGC)
	 */
	vs_sci_write(SCI_REG_AICTRL1, AICTRL1_GAIN(gain));
	
	/* By adding SM ADPCM flag during the software reset
	 * the user will activate IMA ADPCM recording mode.
	 */
	vs_sw_reset((highpass_filter ? _BV(SM_ADPCM_HP) : 0) | _BV(SM_ADPCM), 0);

	/* Write sample rate */
	vs_sci_write(SCI_REG_AUDATA, sample_rate);

	_delay_us(100);

	return true;
}

void vs1002_adpcm_rec_stop (void)
{
	/* Software reset to disable ADPCM recording */
	vs_sw_reset(0, _BV(SM_ADPCM) | _BV(SM_ADPCM_HP));
}

#endif	// VS1002_IMA_ADPCM_PATCH
