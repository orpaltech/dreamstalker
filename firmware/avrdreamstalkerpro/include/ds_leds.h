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

#ifndef _DS_LEDS_DEFINED
#define _DS_LEDS_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include "ds_sqwave.h"


namespace DS {
/*-----------------------------------------------------------------------*/

/* The values are also slots in SquareWave */
typedef enum e_led_id {
  LED1 = 0,
  LED2 = 1,
} led_id_t;

/*-----------------------------------------------------------------------*/
class Leds : public SquareWaveCB {
public:
  bool init (void);

  void on (led_id_t led,
			uint8_t brightness,		/* percent, 1-100*/
			uint16_t duration_ms	/* milliseconds*/
			);

  void off (led_id_t led);

  void pulse (led_id_t led,
				uint8_t brightness,		/* percent, 1-100*/
				uint16_t duration_ms,	/* milliseconds*/
				uint16_t period_ms,		/* milliseconds*/
				uint8_t duty_cycle		/* percent, normally 5-95 */
				);
protected:
  virtual void on_sqw_transition(unsigned slot, sqw_transition_t trans);
  virtual void on_sqw_complete(unsigned slot);
};

/*-----------------------------------------------------------------------*/
};	//DS

extern DS::Leds leds;

#endif // _DS_LEDS_DEFINED
