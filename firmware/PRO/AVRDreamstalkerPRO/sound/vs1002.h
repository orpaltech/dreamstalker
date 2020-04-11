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

#ifndef _VS1002_DEFINED
#define _VS1002_DEFINED

#include "vs10xx.h"

#ifdef __cplusplus
extern "C" {
#endif

// vs1002-specific patches
int vs1002_patch_ima_adpcm_apply (const char *file_name);


void vs1002_set_clockf (uint32_t xtal_freq, int clock_doubler);
void vs1002_suspend (void);
void vs1002_resume (void);

void vs1002_adpcm_rec_start (int highpass_filter);
void vs1002_adpcm_rec_stop (void);

#ifdef __cplusplus
}
#endif

#endif // _VS1002_DEFINED
