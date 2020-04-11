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

#ifndef _MENU_DEFINED
#define _MENU_DEFINED

#include "input/inputevent.h"

#define MENU_WAKEUP_TIMER_SETUP	"UtSE"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum e_menu_process_flag {
	MENU_UNHANDLED = 0x00,
	MENU_HANDLED = 0x01,
	MENU_ITEM_EXIT = 0x02,
	MENU_EXIT = 0x04,
} menu_process_flag_t;

/*-----------------------------------------------------------------------*/
/* Menu Functions									 			 */
/*-----------------------------------------------------------------------*/

void menu_init (void);

void menu_enter (void);
int menu_is_active (void);

int menu_process (INPUT_EVENT_BUFFER_TYPE key_event);

#ifdef __cplusplus
}
#endif

#endif // _MENU_DEFINED
