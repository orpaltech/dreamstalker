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

#ifndef _DS_UTIL_DEFINED
#define _DS_UTIL_DEFINED

#include <stdbool.h>

#define MIN(X,Y)    ((X) < (Y) ? (X) : (Y))

#if !(defined ( __AVR_ATmega128__ ) || defined ( __AVR_ATmega1281__ ))
#   error "Unsupported MCU"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * System utils
 */
void hang (void);

void wdt_init(void) \
  __attribute__((naked)) \
  __attribute__((section(".init3")));

void soft_reset (void);

/*
 * String utils
 */
bool hex_str ( uint32_t decimal, char *buffer, int precision );

/*
 * Math utils
 */
uint16_t pow_u16 ( uint16_t base, uint8_t exp );

/*
 * File utils
 */
void make_next_file_path ( char *file_path, unsigned len, 
                        const char *dir_path, const char *prefix, 
                        const char *ext );

#ifdef __cplusplus
}
#endif

#endif // _DS_UTIL_DEFINED
