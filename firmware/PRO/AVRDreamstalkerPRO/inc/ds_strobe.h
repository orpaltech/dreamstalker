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

#ifndef _DS_STROBE_DEFINED
#define _DS_STROBE_DEFINED

#include <stdbool.h>

#define MAX_STROBES	3

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	STROBE_HIGH,
	STROBE_LOW,
	STROBE_TOGGLE,
} strobe_transition_t;

typedef void (*pfn_strobe_transition)(unsigned, strobe_transition_t);

/*-----------------------------------------------------------------------*/
/* Strobe Control Functions									 			 */
/*-----------------------------------------------------------------------*/

void strobe_init (void);

void strobe_start(unsigned index, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle);
void strobe_stop(unsigned index);

bool strobe_is_active (unsigned index);

void strobe_set_cb(unsigned index, pfn_strobe_transition);

/* Only for use in RTC ISR. Do not call it directly! */
void strobe_isr (void);


#ifdef __cplusplus
}
#endif

#endif // _DS_STROBE_DEFINED
