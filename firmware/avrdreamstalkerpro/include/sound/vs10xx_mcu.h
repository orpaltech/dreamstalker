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

#ifndef _VS10XX_MCU_DEFINED
#define _VS10XX_MCU_DEFINED

#include <stdbool.h>
#include <avr/io.h>


/*-----------------------------------------------------------------------*/

#define SDI_BLOCK_LEN		32UL	/* amount to write to SDI device after DREQ goes high*/

/*
 * NOTE: This header MUST be updated according to the hardware specifics
 */

#define WAV_FORMAT_IMA_ADPCM	0x11

#define ADPCM_SAMPLE_RATE	8000UL
#define ADPCM_BLOCK_ALIGN	256UL
#define ADPCM_BITS_PER_SAMPLE	4
/* Number of samples per channel per Block */
#define ADPCM_SAMPLES_PER_BLOCK (ADPCM_BLOCK_ALIGN*2-7)
#define ADPCM_USE_HP_FILTER	0


/*-----------------------------------------------------------------------*/

/*
 * For each channel, a value in range of 0 .. 255 
 * may be defined to set its attenuation from the 
 * maximum volume level (in 0.5 dB steps). 
 */

#define VS_VOL_MIN	(0xFFU-1)
#define VS_VOL_MAX	0U

/* Use simplifed volume-to-register mapping */

//	Vol	|	db	 |	Reg	|	Def
// ------------------------------------
//	9 	| 	0	 |	0	|	VS_VOL_MAX
//	8	|	-2	 |	4	|
//	7	|	-5	 |	10	|
//	6	|	-10	 |	20	|
//  5	|	-18	 |	36	|
//  4	|	-30	 |	60	|
//  3	|	-45	 |	90	|
//  2	|	-65	 |	130	|
//  1	|	-90	 |	180	|
//  0	|	-127 |	254	|	VS_VOL_MIN

#define VS_VOL_8	4U
#define VS_VOL_7	10U
#define VS_VOL_6	20U
#define VS_VOL_5	36U
#define VS_VOL_4	60U
#define VS_VOL_3	90U
#define VS_VOL_2	130U
#define VS_VOL_1	180U

#define VS_VOL_DEFAULT	VS_VOL_MIN


/*-----------------------------------------------------------------------*/

#define VS_PATCH_ROM_REVISION	0x8881U

/*-----------------------------------------------------------------------*/
#define VS_HWS_UNKNOWN	0
#define VS_HWS_1002		2U
#define	VS_HWS_1003		3U
#define VS_HWS_1053		53U


#endif // _VS10XX_MCU_DEFINED
