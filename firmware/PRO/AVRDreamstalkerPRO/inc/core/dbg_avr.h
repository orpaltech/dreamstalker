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

#ifndef _AVR_DEBUG_DEFINED
#define _AVR_DEBUG_DEFINED

/*
General Description:
This module implements a function for debug logs on the serial line of the
AVR microcontroller. Debugging can be configured with the define
'DEBUG_LEVEL'. If this macro is not defined or defined to 0, all debugging
calls are no-ops. If it is 1, DBG1 logs will appear, but not DBG2. If it is
2, DBG1 and DBG2 logs will be printed.

A debug log consists of a label ('prefix') to indicate which debug log created
the output and a memory block to dump in hex ('data' and 'len').
*/


#ifndef F_CPU
#   error "F_CPU is not defined!"
#endif

#if DEBUG_LEVEL > 0 && !(defined TXEN || defined TXEN0) /* no UART in device */
#   warning "Debugging disabled because device has no UART"
#   undef   DEBUG_LEVEL
#endif

#ifndef DEBUG_LEVEL
#   define  DEBUG_LEVEL 0
#endif

/*-------------------------------------------------------------------------*/

#if DEBUG_LEVEL > 0
#   define  DBG1(prefix, data, len) avr_dbg(prefix, data, len)
#else
#   define  DBG1(prefix, data, len)
#endif

#if DEBUG_LEVEL > 1
#   define  DBG2(prefix, data, len) avr_dbg(prefix, data, len)
#else
#   define  DBG2(prefix, data, len)
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*-------------------------------------------------------------------------*/

#if DEBUG_LEVEL > 0
extern void avr_dbg (uint8_t prefix, const uint8_t *data, uint8_t len);

void avr_dbg_init (void);

#else
#   define avr_dbg_init()
#endif

/*-------------------------------------------------------------------------*/

#ifdef __cplusplus
}
#endif

#endif /* _AVR_DEBUG_DEFINED */
