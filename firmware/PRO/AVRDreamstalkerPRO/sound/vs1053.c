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

#include "vs1053.h"

/*
 * AICTRL3 control flags
 */
#define AICTRL3_LEFT_CH	0x0002		/* Use left channel for recording */


void vs1053_adpcm_rec_start (void)
{
	uint16_t val;

	vs_sci_write(SCI_REG_AICTRL0, 8000U);

	/* set recording gain control, 1024 is equal to digital gain 1 (analog gain 4)
	 * write 0 to use automatic gain control (AGC) */
	vs_sci_write(SCI_REG_AICTRL1, 0);

	/* SCI_AICTRL2 controls the maximum AGC gain */
	vs_sci_write(SCI_REG_AICTRL2, 4096U);

	/* SCI_AICTRL3 flags */
	vs_sci_write(SCI_REG_AICTRL3, AICTRL3_LEFT_CH);

	val = vs_sci_read(SCI_REG_MODE);
	/* Do not set the software reset bit. The patch below  will do it. */
	vs_sci_write(SCI_REG_MODE, val | _BV(SM_ADPCM));

	/* This patch rewrites the SRC interrupt vector and restarts the firmware,
	 * so the patch should be loaded after the encoding parameters have been set
	 * in AICTRL0 through AICTRL3, and the IMA ADPCM bit has been set in SCI_MODE
	 * (without setting the software reset bit).
	 */
	vs_patch_apply_from_file("imafix.cmd", (pfnvs_patch_init)0);

	//vs_sw_reset(_BV(SM_ADPCM), 0);
}

void vs1053_adpcm_rec_stop (void)
{
	/* software reset to disable ADPCM recording */
	vs_sw_reset(0, _BV(SM_ADPCM));
}
