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

#ifndef _VS1002_DEFINED
#define _VS1002_DEFINED

#include "vs10xx.h"


/*-----------------------------------------------------------------------*/

	/* SCI Registers */
#ifndef SCI_REG_MODE
#   define SCI_REG_MODE		0x00
#endif
#define  SM_OUTOFWAV	3			// Jump out of WAV decoding: 1 - yes
#define  SM_PDOWN		4			// Power down: 1 - yes
#define  SM_PLUSV		7			// MP3+V active: 1 - yes
#define  SM_ADPCM_HP	13			// ADPCM high-pass filter: 1 - active

/*-----------------------------------------------------------------------*/

/*
 * VS1002-specific default XTAL frequency and the clock doubler
 */
#define VS1002_XTAL_FREQ    24576000

/*-----------------------------------------------------------------------*/

#ifdef __cplusplus
extern "C" {
#endif

pvs_patch_rom_t vs1002_patch_rom (void);

bool vs1002_init (void);

// vs1002-specific patches
bool vs1002_process_patches (void);

void vs1002_suspend (void);
void vs1002_resume (void);

bool vs1002_playback_start (void);
void vs1002_playback_stop (void);

bool vs1002_adpcm_rec_start (uint16_t sample_rate, uint8_t gain, bool highpass_filter);
void vs1002_adpcm_rec_stop (void);

#ifdef __cplusplus
}
#endif

#endif // _VS1002_DEFINED
