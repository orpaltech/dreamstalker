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

#include <string.h>
#include <compat/ina90.h>
#include <util/atomic.h>
#include <util/crc16.h>

#include "input/inputevent.h"

// volatile variables begin with a v_ as a reminder

// Read this to determine the current debounce state of all inputs
volatile INPUT_EVENT_BUFFER_TYPE v_InputState=0;

// Read this to determine if an input event is available
// Never change it
volatile INPUT_EVENT_BUFFER_INDEX_TYPE v_InputEventCount=0;

// These are set to the defaults specified in your inputevent_settings.h.
// You can change these, but do it in an atomic block because they are 2 bytes
#if (INPUT_ENABLE_HOLD_FEATURES)
volatile unsigned short v_InputHoldCycles=INPUT_HOLD_CYCLES_DEFAULT,
						v_InputHoldRepeatCycles=INPUT_HOLDREPEAT_CYCLES_DEFAULT;
#endif

//These variables are not accessed outside the library 
volatile INPUT_EVENT_BUFFER_TYPE v_InputBuffer[INPUT_EVENT_BUFFER_SIZE];
volatile INPUT_EVENT_BUFFER_INDEX_TYPE v_InputBufferIn=0, v_InputBufferOut=0;


void input_set_hold(uint16_t hold_cycles)
{
  ATOMIC_BLOCK(ATOMIC_FORCEON) {
	v_InputHoldCycles = hold_cycles;
  }
}

void input_set_hold_repeat(uint16_t repeat_cycles)
{
  ATOMIC_BLOCK(ATOMIC_FORCEON) {
	v_InputHoldRepeatCycles = repeat_cycles;
  }
}

// Returns an event from the event buffer.
// If there are no events available, it will wait for one.
// To avoid waiting, never call this function without checking v_InputEventCount to see if an event
// is available
INPUT_EVENT_BUFFER_TYPE input_get_event (void)
{
  INPUT_EVENT_BUFFER_TYPE c1;

  while (!v_InputEventCount)
    _NOP( );

  c1=v_InputBuffer[v_InputBufferOut];

  v_InputBufferOut++;
  if (v_InputBufferOut==INPUT_EVENT_BUFFER_SIZE)
    v_InputBufferOut=0;

  ATOMIC_BLOCK(ATOMIC_FORCEON) {
    v_InputEventCount--;
  }

  return c1;
}

// Function will wait until no buttons are pressed (v_InputState==0)
void input_wait_for_idle (void)
{
  while(v_InputState)
   	_NOP( );
}

// Clear the event buffer
void input_clear_events (void)
{
  ATOMIC_BLOCK(ATOMIC_FORCEON) {
    v_InputEventCount=0;
    v_InputBufferOut=v_InputBufferIn;
  }
}

static
void input_put_event(INPUT_EVENT_BUFFER_TYPE EItem)
{
  if (v_InputEventCount<INPUT_EVENT_BUFFER_SIZE) {
    v_InputBuffer[v_InputBufferIn]=EItem;
    v_InputBufferIn++;
    if (v_InputBufferIn==INPUT_EVENT_BUFFER_SIZE)
      v_InputBufferIn=0;
    v_InputEventCount++;
  }
}


void input_process(INPUT_EVENT_BUFFER_TYPE EInput)
{
  static unsigned char InputDebounceCount;
  static INPUT_EVENT_BUFFER_TYPE InputLast,InputPressed;
#if (INPUT_ENABLE_HOLD_FEATURES)
  static unsigned char InputSkipRelease;
  static unsigned int v_InputStateAge;
#endif

  // Debounce all button inputs
  if (InputLast==EInput) {
   	InputDebounceCount++;
  } else {
    InputLast=EInput;
    InputDebounceCount=1;
  }

  // Button state has changed
  if (v_InputState!=InputLast && InputDebounceCount>=INPUT_DEBOUNCE_CYCLES) {
    v_InputState=InputLast;

    if (v_InputState) {
#if (INPUT_ENABLE_HOLD_FEATURES)
      if (!InputPressed || !InputSkipRelease) {
#endif
        InputPressed|=v_InputState;
#if (INPUT_ENABLE_HOLD_FEATURES)
        v_InputStateAge=0;
      }
#endif
    } else {
      if (InputPressed) {
#if (INPUT_ENABLE_HOLD_FEATURES)
        if (!InputSkipRelease)
#endif
        input_put_event(InputPressed);
#if (INPUT_ENABLE_HOLD_FEATURES)
        InputSkipRelease=0;
#endif
        InputPressed=0;
      }
    }
  }

#if (INPUT_ENABLE_HOLD_FEATURES)
  // Repeat
  if (InputPressed &&
   	(
      (!InputSkipRelease && v_InputHoldCycles && v_InputStateAge>=v_InputHoldCycles) ||
	  (InputSkipRelease && v_InputHoldRepeatCycles && v_InputStateAge>=v_InputHoldRepeatCycles)
	)) {
      InputSkipRelease=1;
      v_InputStateAge=0;
      input_put_event(INPUT_HOLD | InputPressed);
  }

  // Increment counter
  v_InputStateAge++;
#endif
}
