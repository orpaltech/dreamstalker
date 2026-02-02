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

#ifndef _DS_SYSCLOCK_DEFINED
#define _DS_SYSCLOCK_DEFINED

#include <stdbool.h>
#include <stdint.h>

/* System clock interval, in millisec */
#define CLK_PERIOD_MSEC   1UL

/*-----------------------------------------------------------------------*/
namespace DS {

/*-----------------------------------------------------------------------*/
class SysClock {
public:
  static SysClock *get();
public:
  bool init (void);
  void end (void) {}

  void start (void);
  void stop (void);

  void wait (uint16_t ms);

public:
  static constexpr uint32_t msec_to_ticks (uint32_t ms) { return ( ms / CLK_PERIOD_MSEC ); }
  static constexpr uint32_t ticks_to_msec (uint32_t ticks) { return ticks * CLK_PERIOD_MSEC; }

  /* RTC interrupt interval, in microseconds */
  static constexpr uint32_t clk_period_us (void) { return ( clk_period_ms () * 1000 ); }
  static constexpr uint32_t clk_period_ms (void) { return CLK_PERIOD_MSEC; }

  /* Intended for use in ISR. Do not call it directly! */
  static void handle_isr (void);

private:
  void irq_handler (void);

private:
  typedef struct s_sysclk_context {
    /* Internal tick counters */
    uint16_t ticks_second;
    uint8_t ticks_setup;
  } sysclk_context_t;

  volatile sysclk_context_t clk;
};

};  // DS

#endif  // _DS_SYSCLOCK_DEFINED