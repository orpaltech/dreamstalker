/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2026	ORPAL Technologies, Inc.
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

#ifndef _DS_REM_HINTS_DEFINED
#define _DS_REM_HINTS_DEFINED

#include "ds_leds.h"

namespace DS {

/*-----------------------------------------------------------------------*/
class REMHints {
public:
  static REMHints *get();

public:
  void start(uint8_t intensity_limit);
  void update();

  /* Only for use in system clock ISR. Do not call it directly! */
  static void handle_sysclk (void);

private:
  static uint16_t level_to_hints_period (uint8_t lvl);

private:
  LedFader fader;
  uint8_t light_count, sound_count, master_count; // Pulse counts
};

} // namespace DS

#endif  // _DS_REM_HINTS_DEFINED