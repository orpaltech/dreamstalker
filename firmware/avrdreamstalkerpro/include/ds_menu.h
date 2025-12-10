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

#ifndef _DS_MENU_DEFINED
#define _DS_MENU_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include "input/ds_keybrd.h"

/*-----------------------------------------------------------------------*/
#define MENU_MAX_PLANES	2


namespace DS {
/*-----------------------------------------------------------------------*/

typedef enum e_menu_process_flag {
	MENU_UNHANDLED = 0x00,
	MENU_HANDLED = 0x01,
	MENU_RETURN = 0x02,
	MENU_EXIT = 0x04,
} menu_process_flag_t;

typedef struct s_menu_plane {
  uint8_t index : 5;
  uint8_t count : 5;
  uint8_t is_active : 1;
} menu_plane_t;

typedef struct s_menu_context {
  menu_plane_t plane[MENU_MAX_PLANES];
  int8_t level;
  uint8_t res : 4;
} menu_context_t, *pmenu_context_t;

/*-----------------------------------------------------------------------*/
class AppMenu {
public:
  static AppMenu *get();
public:
  bool init (void);

  void enter (void);
  bool is_active (void);

  int handle_key (uint8_t key_event);

public:
  static void wakeup_timer_setup ( pmenu_context_t ctx, keybrd_event_t key_event );

private:
  void play_tone (void);

  menu_context_t ctx;
};

/*-----------------------------------------------------------------------*/
};	//DS

#endif // _DS_MENU_DEFINED
