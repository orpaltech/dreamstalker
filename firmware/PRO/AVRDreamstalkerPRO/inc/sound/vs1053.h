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

#ifndef _VS1053_DEFINED
#define _VS1053_DEFINED

#include "vs10xx.h"


/*-----------------------------------------------------------------------*/

	/* SCI Registers */
#ifndef SCI_REG_MODE
#   define SCI_REG_MODE		0x00
#endif
#define  SM_CANCEL      3           // Cancel decoding current file: 1 - cancel
#define  SM_EARSPK_LO   4           // EarSpeaker low setting: 1 - active
#define  SM_EARSPK_HI   7           // EarSpeaker high setting: 1 - active
#define  SM_LINE1       14          // MIC / LINE1 selector: 1 - LINE1
#define  SM_CLK_RANGE   15          // Input clock range: 0 - 12..13 MHz, 1 - 24..26 MHz

/*-----------------------------------------------------------------------*/

/*
 * VS1053-specific default XTAL frequency and the clock doubler
 */
#define VS1053_XTAL_FREQ    12288000

/*-----------------------------------------------------------------------*/

#ifdef __cplusplus
extern "C" {
#endif

pvs_patch_rom_t vs1053_patch_rom (void);

bool vs1053_init (void);

// vs1053-specific patches
bool vs1053_process_patches (void);

void vs1053_suspend (void);
void vs1053_resume (void);

bool vs1053_playback_start (void);
void vs1053_playback_stop (void);

bool vs1053_adpcm_rec_start (uint16_t sample_rate, uint8_t gain);
void vs1053_adpcm_rec_stop (void);

#ifdef __cplusplus
}
#endif

#endif // _VS1053_DEFINED
