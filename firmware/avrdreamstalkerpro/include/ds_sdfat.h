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

#ifndef _DS_SDFAT_EX_DEFINED
#define _DS_SDFAT_EX_DEFINED

#include <stdbool.h>

#if USE_SDFAT_LIB
  #include <SdFat.h>
#else
  #include <SD.h>
#endif


/*-----------------------------------------------------------------------*/
namespace DS {

/*-----------------------------------------------------------------------*/
class SdFatEx {
public:
  static SdFatEx *get();
public:
  bool  init (void);
  void  end (void) {}

public:
  bool is_card_inserted (int sd = 0);

    /* The method is only used from system clock ISR. Do not call it directly. */
  static void handle_sysclk (void);

private:
  void irq_handler (void);

  bool    is_inserted;
  uint8_t ticks_delay;
public:
#if USE_SDFAT_LIB
  SdFat             sd0;
#else
  SDLib::SDClass    sd0;
#endif
};

/*-----------------------------------------------------------------------*/
}   // DS

#endif  // _DS_SDFAT_EX_DEFINED