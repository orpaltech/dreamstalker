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

#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "ds_rtclock.h"
#include "ds_sdfat.h"
#include "ds_util.h"

using namespace ds;

/*-----------------------------------------------------------------------*/
#define SD_PIN_CS   PIN_SPI_SS
#define SD_PIN_CD   PIN_PC3

/*-----------------------------------------------------------------------*/

SdFatEx *SdFatEx::get()
{
  static SdFatEx sdex;
  return &sdex;
}

/*-----------------------------------------------------------------------*/
void SdFatEx::handle_sysclk (void)  // Get here every 1 sec
{
  SdFatEx::get()->irq_handler();
}

/*-----------------------------------------------------------------------*/

bool SdFatEx::init (void)
{
  // Disable SD at very beginning
  Pins::set_out(SD_PIN_CS);
  Pins::drive_high(SD_PIN_CS);

  Pins::set_in_pullup (SD_PIN_CD);

  is_inserted = true; 
  ticks_delay = 10; // Start monitoring after 10 sec
  return true;
}

bool SdFatEx::is_card_inserted (int sd)
{
  if (sd != 0)  return false;
  
  return Pins::is_in_low (SD_PIN_CD);
}

void SdFatEx::irq_handler (void)
{
  if (ticks_delay == 0) {
    ticks_delay = 10; // Check again after 10 sec

    auto disp = Display::get();

    if (! is_card_inserted ()) {

      RTClock::get()->hide_unsafe();

      /* handle error */
      disp->text_out_unsafe (__disp_msg_no_sd__);

      is_inserted = false;

    } else {
      if (! is_inserted) {
        /* SD-card found */
        RTClock::get()->show_unsafe();

        is_inserted = true;
      }
    }
  } else
    --ticks_delay;
}
