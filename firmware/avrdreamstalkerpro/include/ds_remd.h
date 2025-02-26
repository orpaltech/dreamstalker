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

#ifndef _DS_REMD_DEFINED
#define _DS_REMD_DEFINED

#include <stdbool.h>
#include <stdint.h>

#include <core/adc_avr.h>

/*-----------------------------------------------------------------------*/
/** Defines the REM detector test mode
 */
#ifndef REMD_TEST
# define REMD_TEST 0
#endif


namespace DS {
/*-----------------------------------------------------------------------*/

typedef enum e_remd_event_type {
	REMD_REM_DETECTED	= 1,
} remd_event_type_t;

/*-----------------------------------------------------------------------*/
class REMDetectCB{
public:
  virtual void on_remd_event (remd_event_type_t event) = 0;
};

/*-----------------------------------------------------------------------*/
class REMDetect : public avr_core::A2DSampleCB {
public:
  bool init (void) ;
  void end (void);

  bool start (REMDetectCB *premdcb) ;
  void stop (void) ;
  bool is_running (void);

  /* Use the method from ISR */
  bool start_unsafe (REMDetectCB *premdcb) ;
  void stop_unsafe (void) ;
protected:
  virtual void on_a2d_sample(uint16_t sample);
  
private:
  REMDetectCB *premdcb;
  bool status;
};

/*-----------------------------------------------------------------------*/
};  //DS

extern DS::REMDetect remd;

#endif // _DS_REMD_DEFINED
