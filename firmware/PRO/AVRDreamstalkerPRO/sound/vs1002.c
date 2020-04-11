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
#include "vs1002.h"


/* VS1002 ADPCM patch activation sequence */
/*VS_SCI_INSTR vs1002c_ima_adpcm_patch_activation[ 3 ] = {
		{ SCI_REG_WRAMADDR, 0x8021 },
		{ SCI_REG_WRAM,		0x2a01 },
		{ SCI_REG_WRAM,		0x000e },
};*/

static
int vs1002_patch_ima_adpcm_init(vs_patch_t *patch)
{
	vs_patch_file_t *pfd = patch->user_data;

	/* activation instructions */
	/*pfd->act.instr = vs1002d_ima_adpcm_patch_activation;
	pfd->act.num_instr = sizeof(vs1002d_ima_adpcm_patch_activation)
						/sizeof(vs1002d_ima_adpcm_patch_activation[0]);*/
	pfd->act.instr = (vs_sci_instr_t *)0;
	pfd->act.index = 0;
	pfd->act.num_instr = 0;

	return 1;
}

int vs1002_patch_ima_adpcm_apply (const char *file_name)
{
	return vs_patch_apply_from_file(file_name, vs1002_patch_ima_adpcm_init);
}

static
void patch_ima_adpcm_activate (void)
{
	vs_sci_write(SCI_REG_AIADDR, 0x30);
	_delay_us(500);
}

static
void patch_ima_adpcm_deactivate (void)
{
	vs_sci_write(SCI_REG_AIADDR, 0);
	_delay_us(500);
}

void vs1002_set_clockf (uint32_t xtal_freq, int clock_doubler)
{
	uint16_t val;

	val = ( xtal_freq / 2000 );
	if(clock_doubler)
		val |= 0x8000;

	vs_sci_write(SCI_REG_CLOCKF, val);
	_delay_ms(1);
}

void vs1002_suspend (void)
{
	uint16_t val;

	val = vs_sci_read(SCI_REG_MODE);
	if (val | _BV(SM_PDOWN))
		return;			/* already suspended*/

	// Set SCI_REG_VOL to 0xFFFF before activating software power down.
	vs_sci_write(SCI_REG_VOL, 0xFFFF);

	vs_sci_write(SCI_REG_MODE, (val | _BV(SM_PDOWN)));
	_delay_us(10);
}

void vs1002_resume (void)
{
	uint16_t val;

	val = vs_sci_read(SCI_REG_MODE);
	if ((val|_BV(SM_PDOWN))==0)
		return;			/* not suspended*/

	vs_sci_write(SCI_REG_MODE, (val & ~_BV(SM_PDOWN)));
	_delay_us(10);
}

void vs1002_adpcm_rec_start (int highpass_filter)
{
	/* write a clock divider value, div, can be obtained by formula below:
	 * fs = (2 * Fc) / (256 * div), where
	 * 		2	- 	multiplier used only if clock doubler is in use;
	 *		Fc	-	Xtal frequency, i.e. 12288000 Hz;
	 *		fs	-	sampling rate, i.e. 8000 Hz;
	 * with div=12, fs = (2 * 122880000) / (256 * 12) = 8000 Hz */
	vs_sci_write(SCI_REG_AICTRL0, 12);

	/* set recording gain control, 1024 is equal to digital gain 1 (analog gain 4)
	 * write 0 to use automatic gain control (AGC) */
	vs_sci_write(SCI_REG_AICTRL1, 1024);

	/* write the sample rate */
	vs_sci_write(SCI_REG_AUDATA, 8000);

	patch_ima_adpcm_activate();

	/* By adding SM ADPCM flag during the software reset
	 * the user will activate IMA ADPCM recording mode. */
	if (highpass_filter)
		vs_sw_reset(_BV(SM_ADPCM)|_BV(SM_ADPCM_HP), 0);
	else
		vs_sw_reset(_BV(SM_ADPCM), _BV(SM_ADPCM_HP));

	/* set clock after software reset */
	vs_set_clockf(VS_XTAL_FREQ, VS_USE_CLK_DOUBLER);
}

void vs1002_adpcm_rec_stop (void)
{
	patch_ima_adpcm_deactivate();

	/* software reset to disable ADPCM recording */
	vs_sw_reset(0, _BV(SM_ADPCM) | _BV(SM_ADPCM_HP));

	/* set clock again after software reset */
	vs_set_clockf(VS_XTAL_FREQ, VS_USE_CLK_DOUBLER);
}
