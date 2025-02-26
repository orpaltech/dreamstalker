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


namespace DS {
/*-----------------------------------------------------------------------*/
class VibrationMotor : public SquareWaveCB {
public:
  bool init (void);

  bool start (uint8_t	level,	    /* 0-9 */
            uint16_t duration_ms  /* milliseconds*/
			      );

  void stop (void);

  bool is_running (void);

protected:
    virtual void on_sqw_transition(unsigned slot, sqw_transition_t trans);
};

/*-----------------------------------------------------------------------*/
};	// DS

extern DS::VibrationMotor vibro;

#endif // _DS_VIBRO_DEFINED
