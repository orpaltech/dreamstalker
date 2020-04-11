/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2020	ORPAL Technologies, Inc.
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

#ifndef _VIBRO_DEFINED
#define _VIBRO_DEFINED


#ifdef __cplusplus
extern "C" {
#endif


/*-----------------------------------------------------------------------*/
/* Vibro Control Functions									 			 */
/*-----------------------------------------------------------------------*/

void vibro_init (void);

void vibro_on (uint16_t duration_ms,	/* milliseconds*/
			uint8_t	level			/* 1-10 */
			);

/* Intended for use in RTC ISR. Do not call it directly! */
//void vibro_isr (void);

#ifdef __cplusplus
}
#endif

#endif // _VIBRO_DEFINED
