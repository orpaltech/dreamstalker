/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2024	ORPAL Technologies, Inc.
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

#ifndef INPUTEVENT_H
#define INPUTEVENT_H

#include "inputevent_settings.h"

//The following code validates settings in inputevent_settings.h and selects the appropriate data types
#if (INPUT_EVENT_BUFFER_SIZE<=255)
  #define INPUT_EVENT_BUFFER_INDEX_TYPE unsigned char
#elif (INPUT_EVENT_BUFFER_SIZE<=65535)
  #define INPUT_EVENT_BUFFER_INDEX_TYPE unsigned short
#else
  #error INPUT_EVENT_BUFFER_SIZE is too large
#endif

#if (INPUT_ENABLE_HOLD_FEATURES)
  #if (INPUT_NO_OF_INPUTS<=7)
    #define INPUT_EVENT_BUFFER_TYPE  unsigned char
    #define INPUT_HOLD					(1 << 7)
  #elif (INPUT_NO_OF_INPUTS<=15)
    #define INPUT_EVENT_BUFFER_TYPE  unsigned int
    #define INPUT_HOLD					(1 << 15)
  #elif (INPUT_NO_OF_INPUTS<=31)
    #define INPUT_EVENT_BUFFER_TYPE  unsigned long
    #define INPUT_HOLD					(1 << 31)
  #else
    #error INPUT_NO_OF_INPUTS is too large
  #endif
#else
  #if (INPUT_NO_OF_INPUTS<=8)
    #define INPUT_EVENT_BUFFER_TYPE  unsigned char
  #elif (INPUT_NO_OF_INPUTS<=16)
    #define INPUT_EVENT_BUFFER_TYPE  unsigned int
  #elif (INPUT_NO_OF_INPUTS<=32)
    #define INPUT_EVENT_BUFFER_TYPE  unsigned long
  #else
    #error INPUT_NO_OF_INPUTS is too large
  #endif
#endif

#if (INPUT_DEBOUNCE_CYCLES<1 || INPUT_DEBOUNCE_CYCLES>255)
  #error INPUT_DEBOUNCE_CYCLES should be 1-255
#endif

#if (INPUT_HOLD_CYCLES_DEFAULT>65535)
  #error INPUT_HOLD_CYCLES_DEFAULT should be 0-65535
#endif

#if (INPUT_HOLDREPEAT_CYCLES_DEFAULT>65535)
  #error INPUT_HOLDREPEAT_CYCLES_DEFAULT should be 0-65535
#endif

extern volatile INPUT_EVENT_BUFFER_INDEX_TYPE v_InputEventCount;
extern volatile INPUT_EVENT_BUFFER_TYPE v_InputState;

#if (INPUT_ENABLE_HOLD_FEATURES)
void input_set_hold(uint16_t);
void input_set_hold_repeat(uint16_t);
#endif

void input_wait_for_idle (void);
void input_clear_events (void);
INPUT_EVENT_BUFFER_TYPE input_get_event (void);
void input_process (INPUT_EVENT_BUFFER_TYPE EInput);

#endif

