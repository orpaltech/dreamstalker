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

#ifndef _LEDS_DEFINED
#define _LEDS_DEFINED


#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
	LED1 = 0,
	LED2 = 1,
} led_id_t;

/*-----------------------------------------------------------------------*/
/* LED Control Functions									 			 */
/*-----------------------------------------------------------------------*/

void leds_init (void);

void leds_on (led_id_t led,
			uint8_t brightness,		/* percent, 1-100*/
			uint16_t duration_ms	/* milliseconds*/
			);

void leds_pulse (led_id_t led,
				uint8_t brightness,		/* percent, 1-100*/
				uint16_t duration_ms,	/* milliseconds*/
				uint16_t period_ms,	/* milliseconds*/
				uint8_t duty_cycle	/* percent, 5-95 */
				);


#ifdef __cplusplus
}
#endif

#endif // _LEDS_DEFINED
