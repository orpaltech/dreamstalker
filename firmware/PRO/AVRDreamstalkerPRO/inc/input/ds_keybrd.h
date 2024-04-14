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

#ifndef _DS_KEYBRD_DEFINED
#define _DS_KEYBRD_DEFINED

#include <stdbool.h>

#define KEY_NONE	0x00U
#define KEY_POWER	0x01U
#define KEY_CHECK	0x02U
#define KEY_SELECT	0x04U
#define KEY_ENTER	0x08U
#define KEY_PLUS	0x10U
#define KEY_MINUS	0x20U

#define KEYBRD_HOLD 0x80U


#ifdef __cplusplus
extern "C" {
#endif

typedef uint8_t keybrd_event_t;

/*-----------------------------------------------------------------------*/
/* Keyboard Control Functions									 		 */
/*-----------------------------------------------------------------------*/

void keybrd_init ( void );

void keybrd_hold_repeat_disable ( void );
void keybrd_hold_repeat_default ( void );
void keybrd_hold_repeat_fast ( void );

keybrd_event_t keybrd_get_event ( void );
void keybrd_clear_events ( void );

void keybrd_enable_irq ( uint8_t keys );
void keybrd_disable_irq ( uint8_t keys );
uint8_t keybrd_get_irq_keys ( void );

/* NOTE: only for use in RTC ISR. Do not call it directly! */
bool keybrd_isr ( void );


#ifdef __cplusplus
}
#endif

#endif // _DS_KEYBRD_DEFINED
