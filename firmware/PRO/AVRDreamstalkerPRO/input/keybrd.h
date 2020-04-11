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

#ifndef _KEYBRD_DEFINED
#define _KEYBRD_DEFINED

#define KEY_NONE	0x00
#define KEY_ONOFF	0x01
#define KEY_CHECK	0x02
#define KEY_SELECT	0x04
#define KEY_ENTER	0x08
#define KEY_PLUS	0x10
#define KEY_MINUS	0x20


#ifdef __cplusplus
extern "C" {
#endif


/*-----------------------------------------------------------------------*/
/* Keyboard Control Functions									 		 */
/*-----------------------------------------------------------------------*/

void keybrd_init (void);

uint8_t keybrd_test (void);


#ifdef __cplusplus
}
#endif

#endif // _KEYBRD_DEFINED
