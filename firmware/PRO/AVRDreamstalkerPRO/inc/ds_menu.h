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

#ifndef _DS_MENU_DEFINED
#define _DS_MENU_DEFINED

#include <stdbool.h>

/*-----------------------------------------------------------------------*\
 * Menu Labels
\*-----------------------------------------------------------------------*/

#define MENU_CLOCK_SETUP			"CLSE"
#define MENU_WAKEUP_TIMER_SETUP		"UtSE"
#define MENU_ENHANCED_SETUP			"EnSE"
#define MENU_TRIGGERING_COUNT		"trCo"
#define MENU_TRIGGERING_LOG			"trLo"
#define MENU_CHECK_WAKEUP_SIGNALS	"CHUP"	/*check installed wakeup signals*/
#define MENU_SET_DEFAULTS			"SEdt"
#define MENU_SAVE_SETTINGS			"SAUE"
#define MENU_CHECK_REM_DETECTOR		"CHdt"


#ifdef __cplusplus
extern "C" {
#endif

typedef enum e_menu_process_flag {
	MENU_UNHANDLED = 0x00,
	MENU_HANDLED = 0x01,
	MENU_RETURN = 0x02,
	MENU_EXIT = 0x04,
} menu_process_flag_t;

/*-----------------------------------------------------------------------*/
/* Menu Functions									 			 */
/*-----------------------------------------------------------------------*/

void menu_init (void);

void menu_enter (void);
bool menu_is_active (void);

int menu_handle (uint8_t key_event);

#ifdef __cplusplus
}
#endif

#endif // _DS_MENU_DEFINED
