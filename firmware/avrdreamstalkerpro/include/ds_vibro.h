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

#ifndef _DS_VIBRO_DEFINED
#define _DS_VIBRO_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include "ds_sqwave.h"

/*-----------------------------------------------------------------------*/
#define SQW_VIBRO  2


namespace ds
{
/*-----------------------------------------------------------------------*/
class VibroMotor {
public:
  static VibroMotor *get();
public:
  bool init (void);
  void end (void) {}

  bool start (uint8_t	level,	    /* 0-9 */
            uint16_t duration_ms  /* milliseconds*/
			      );
  void stop (void);
  bool is_running (void) const;

  /* Unsafe operations (must be called from ISR)*/
  bool start_unsafe (uint8_t	level,	    /* 0-9 */
                    uint16_t duration_ms  /* milliseconds*/
			              );
  void stop_unsafe (void);
  bool is_running_unsafe (void) const;

protected:
  void on_sqw_transition(uint8_t slot, sqw_transition_t trans);

private:
  static void sqw_transition_callback(void *context, uint8_t slot, sqw_transition_t trans);
};

/*-----------------------------------------------------------------------*/
} //ds

#endif // _DS_VIBRO_DEFINED
