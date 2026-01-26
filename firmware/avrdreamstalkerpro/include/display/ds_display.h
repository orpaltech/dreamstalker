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

#ifndef _DS_DISPLAY_DEFINED
#define _DS_DISPLAY_DEFINED

#include <stdbool.h>
#include <stdint.h>


namespace DS {
/*-----------------------------------------------------------------------*/
class Display {
public:
  static Display *get();
  static uint32_t get_cycle_us(void);	/* length of cycle in microseconds */

  /* Intended for use in RTC ISR. Do not call it directly! */
  static void handle_rtc (void);

  bool init (void);

  // Display control methods
  void enable (void);
  void disable (void);
  bool is_enabled (void) const;

  void clear (void);

  /* Display utilities */ 
  void number (uint16_t num);
  void message (const char *text, uint16_t wait_cycles);
  void time (uint8_t hour, unsigned minute);
  void version (char type, uint16_t ver, uint16_t wait_cycles);	/* display version */
  void flag (bool flag_val);
  void confirm (void);
  void text_out (const char *text); /* show text with no delay */

  /* Test methods */
  void test_on (void);
  void test_off (void);

  /* Intended for use in ISR */
  void clear_unsafe (void);
  void enable_unsafe (void);
  void disable_unsafe (void);
  void text_out_unsafe (const char *text);

  void wait_one_cycle (void);
  void wait_cycles (unsigned num_cycles);

protected:
  void irq_handler (void);

#define NDIGITS 4
private:
  volatile uint8_t dig_index;
  volatile uint8_t pf_segments[NDIGITS];
  volatile bool enabled;
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif // _DS_DISPLAY_DEFINED
