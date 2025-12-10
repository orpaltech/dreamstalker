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

#ifndef _DS_SQUARE_WAVE_DEFINED
#define _DS_SQUARE_WAVE_DEFINED

#include <stdbool.h>
#include <stdint.h>

/*-----------------------------------------------------------------------*/
#define SQW_SLOTS	3   /* Available slots: 0,1,2 */


namespace DS {

/*-----------------------------------------------------------------------*/
typedef enum e_sqw_transition {
  SQW_TRANS_LOW,
	SQW_TRANS_HIGH,
	SQW_TRANS_TOGGLE,
} sqw_transition_t;

/*-----------------------------------------------------------------------*/
class SquareWaveCB {
public:
  virtual void on_sqw_transition(unsigned slot, sqw_transition_t trans) = 0;
  virtual void on_sqw_complete(unsigned slot) {}
};

/*-----------------------------------------------------------------------*/
class SquareWave {
public:
  static SquareWave *get();
public:
  bool	init (void);

  void	start (unsigned slot,
              uint16_t duration_ms, 
              uint16_t period_ms, 
              uint8_t duty_cycle, /* in percent */
              SquareWaveCB *ptcb);
  void	stop(unsigned slot);

  bool	is_active (unsigned slot);

  /* Only for use in RTC ISR. Do not call it directly! */
  static void handle_isr (void);

private:
  typedef struct s_sqw_context {
    uint32_t duration_ticks;
    uint16_t period_ticks;
    uint16_t period;
    uint8_t duty_cycle : 7;
    uint8_t active : 1;
    SquareWaveCB *ptcb;
  } sqw_context_t;

  void do_transition (unsigned slot, sqw_transition_t trans);
  void irq_handler (void);

  volatile sqw_context_t sqw[SQW_SLOTS];
};

/*-----------------------------------------------------------------------*/
};	//DS

#endif // _DS_SQUARE_WAVE_DEFINED
