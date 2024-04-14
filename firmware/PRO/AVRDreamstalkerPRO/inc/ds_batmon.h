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

#ifndef _DS_BATMON_DEFINED
#define _DS_BATMON_DEFINED

#include <stdbool.h>

#define BATTERY_FULL	100U
#define BATTERY_LOW 	85U
#define BATTERY_EMPTY   70U

#ifdef __cplusplus
extern "C" {
#endif

/*-----------------------------------------------------------------------*/
/* Battery Monitor Functions									 	 	 */
/*-----------------------------------------------------------------------*/

void batmon_init (void);
void batmon_start (void);
void batmon_stop (void);
bool batmon_is_running (void);

uint8_t batmon_battery_level (void);

/* Intended for use in RTC ISR. Do not call it directly! */
void batmon_isr(void);

#ifdef __cplusplus
}
#endif

#endif // _DS_BATMON_DEFINED
