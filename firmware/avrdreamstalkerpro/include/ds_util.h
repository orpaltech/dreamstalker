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

#ifndef _DS_UTIL_DEFINED
#define _DS_UTIL_DEFINED

#include <stdbool.h>
#include <stdint.h>

/*-----------------------------------------------------------------------*/
#define MIN(X,Y)    ((X) < (Y) ? (X) : (Y))

#if !(defined ( __AVR_ATmega128__ ) || defined ( __AVR_ATmega1281__ ))
#   error "Unsupported MCU"
#endif

/*-----------------------------------------------------------------------*/
#ifdef __cplusplus
extern "C" {
#endif

/*-----------------------------------------------------------------------*/
/* System utils
 */
void hang (void);

void wdt_init(void) \
  __attribute__((naked)) \
  __attribute__((section(".init3")));

void soft_reset (void);

#ifdef __cplusplus
}
#endif

/*-----------------------------------------------------------------------*/
namespace DS {

/*-----------------------------------------------------------------------*/
/* String utils 
*/
class Strings {
public:
  static bool hex_str ( uint32_t decimal, char *buffer, int precision );
};

/*-----------------------------------------------------------------------*/
/* Math utils 
*/
class Maths {
public:
  static uint16_t pow_u16 ( uint16_t base, uint8_t exp );
};

/*-----------------------------------------------------------------------*/
/* File utils 
*/
class Files {
public:
  static void make_next_file_path ( char *file_path, unsigned len, 
                                  const char *dir_path, const char *prefix, 
                                  const char *ext );
};

/*-----------------------------------------------------------------------*/

class Pins {
public:
  /* Switches pin to output mode */
  static void set_out ( uint8_t pin );
  /* Switches pin to input mode (High-Z)*/
  static void set_in_highz ( uint8_t pin );
  /* Switches pin to input mode (Pull-Up)*/
  static void set_in_pullup ( uint8_t pin);

  /* Drives output pin high */
  static void drive_high ( uint8_t pin );
  /* Drives output pin low */
  static void drive_low ( uint8_t pin );

  /* Checks if input pin driven high */
  static bool is_in_high ( uint8_t pin );
  /* Checks if input pin driven low */
  static bool is_in_low ( uint8_t pin );

  /* Checks if output pin driven high */
  static bool is_out_high ( uint8_t pin );
  /* Checks if output pin driven low */
  static bool is_out_low ( uint8_t pin );
};

/*-----------------------------------------------------------------------*/
};  //DS

#endif // _DS_UTIL_DEFINED
