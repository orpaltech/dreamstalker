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

#ifndef _VS1053_DEFINED
#define _VS1053_DEFINED

#include "vs10xx.h"

/*
 * VS1053-specific bit fields for SCI_REG_MODE
 */
#define	 SM_CLK_RANGE	15		/* Input clock range: 0 - 12..13 MHz, 1 - 24..26 MHz */


#ifdef __cplusplus
extern "C" {
#endif


void vs1053_adpcm_rec_start (void);
void vs1053_adpcm_rec_stop (void);

#ifdef __cplusplus
}
#endif

#endif // _VS1053_DEFINED
