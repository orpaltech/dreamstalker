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

#ifndef _DS_KEYBRD_DEFINED
#define _DS_KEYBRD_DEFINED

#include <stdbool.h>
#include <stdint.h>

/*-----------------------------------------------------------------------*/
#define KEY_NONE	0x00U
#define KEY_POWER	0x01U
#define KEY_CHECK	0x02U
#define KEY_SELECT	0x04U
#define KEY_ENTER	0x08U
#define KEY_PLUS	0x10U
#define KEY_MINUS	0x20U

#define KEYBRD_HOLD 0x80U


namespace DS {
/*-----------------------------------------------------------------------*/
typedef uint8_t keybrd_event_t;

/*-----------------------------------------------------------------------*/
class Keyboard {
public:
  bool init ( void );
  void end ( void );

  keybrd_event_t get_event ( void );
  void clear_events ( void );

  void hold_repeat_disable ( void );
  void hold_repeat_default ( void );
  void hold_repeat_fast ( void );

  void enable_key_irq ( uint8_t keys );
  void disable_key_irq ( uint8_t keys );
  uint8_t get_irq_keys ( void );

  void wait_for_key_press ( keybrd_event_t key );

  /* NOTE: only for use in RTC ISR. Do not call it directly! */
  static bool handle_isr ( void );
  static void handle_key_isr ( keybrd_event_t key );

private:
  bool irq_handler ( void );
  void key_irq ( keybrd_event_t key );

  volatile uint8_t irq_keys;
};

/*-----------------------------------------------------------------------*/
};  //DS

extern DS::Keyboard kbrd;

#endif // _DS_KEYBRD_DEFINED
