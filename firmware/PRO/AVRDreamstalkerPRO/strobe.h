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

#ifndef _STROBE_DEFINED
#define _STROBE_DEFINED

#define NUM_STROBES	3

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	STROBE_OFF,
	STROBE_ON,
	STROBE_TOGGLE,
} strobe_transition_t;

typedef struct s_strobe_context strobe_context_t;

typedef void (*pfn_strobe_complete)(int);
typedef void (*pfn_strobe_transition)(int, strobe_transition_t);

struct s_strobe_context {
	volatile uint32_t duration_ticks;
	volatile uint16_t period_ticks;
	uint16_t period;
	uint8_t duty_cycle;
	pfn_strobe_complete complete;
	pfn_strobe_transition transition;
};

/*-----------------------------------------------------------------------*/
/* Strobe Control Functions									 			 */
/*-----------------------------------------------------------------------*/

void strobe_init (void);

strobe_context_t *strobe_get (int index);

void strobe_transition (int index, strobe_transition_t trans);
void strobe_complete (int index);

int strobe_is_active (int index);
uint32_t strobe_interval_us (void);

void strobe_setup(int i, uint16_t duration_ms, uint16_t period_ms, uint8_t duty_cycle);

/* Intended for use in RTC ISR. Do not call it directly! */
void strobe_isr (void);

void strobe_set_callbacks(int index, pfn_strobe_complete, pfn_strobe_transition);

#ifdef __cplusplus
}
#endif

#endif // _STROBE_DEFINED
