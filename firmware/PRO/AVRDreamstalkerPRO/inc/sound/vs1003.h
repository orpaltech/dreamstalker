/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2023	ORPAL Technologies, Inc.
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

#ifndef _VS1003_DEFINED
#define _VS1003_DEFINED

#include "vs10xx.h"


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


/*-----------------------------------------------------------------------*/

#ifdef __cplusplus
extern "C" {
#endif

pvs_patch_rom_t vs1003_patch_rom (void);

bool vs1003_init (void);

// vs1003-specific patches
bool vs1003_process_patches (void);

void vs1003_suspend (void);
void vs1003_resume (void);

bool vs1003_playback_start (void);
void vs1003_playback_stop (void);

bool vs1003_adpcm_rec_start (uint16_t sample_rate, uint8_t gain, bool highpass_filter);
void vs1003_adpcm_rec_stop (void);

/* NOT: Suspend/resume operations are similar to VS1002 */

#ifdef __cplusplus
}
#endif

#endif // _VS1003_DEFINED
