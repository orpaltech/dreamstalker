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

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>

#include <avr/io.h>
#include <avr/wdt.h>
#include <compat/ina90.h>

#include "ds_util.h"
#include "ds_arduino.h"
#include "shared_fp.h"


/*-----------------------------------------------------------------------*/
SDLib::SDClass &card0 = SDLib::SD;


/*-----------------------------------------------------------------------*/
/* String utils 
*/

void hang ( void )
{
  while ( true )
    _NOP( );
}

void wdt_init ( void )
{
#ifdef __AVR_ATmega128__
  MCUCSR = 0;
#elif defined (__AVR_ATmega1281__)
  MCUSR = 0;
#else
  #error "Unsupported MCU"
#endif
  wdt_disable();
}

void soft_reset ( void )
{
  do {
	  wdt_enable (WDTO_60MS);
	  for(;;) { }
  } while(0);
}

/*-----------------------------------------------------------------------*/
namespace DS {

bool Strings::hex_str ( uint32_t decimal, char *buffer, int precision )
{
  char hexadecimal[10] = {0};
  int indx = 0;
  int i, k = 0;

  while( decimal > 0 ) {
	  int remainder = decimal % 16;
	  if (remainder < 10)
	    hexadecimal[indx++] = remainder + '0';
	  else
	    hexadecimal[indx++] = remainder + 'A' - 10;
    decimal /= 16;
  }

  while( indx < precision ) {
    buffer[k++] = '0';
    --precision;
  }

  for( i = indx - 1; i >= 0; i--, k++ )
	  buffer[k] = hexadecimal[i];
  buffer[k] = 0;

  return true;
}

const static char* HEX_DIGITS = "0123456789ABCDEF";

String Strings::hex_str ( uint16_t val )
{
  String result;
  result.reserve(4); // 4 digits + implicit null terminator

  result[0] = HEX_DIGITS[(val >> 12) & 0xF]; // Get the 4th hex digit
  result[1] = HEX_DIGITS[(val >> 8) & 0xF];  // Get the 3rd hex digit
  result[2] = HEX_DIGITS[(val >> 4) & 0xF];  // Get the 2nd hex digit
  result[3] = HEX_DIGITS[val & 0xF];         // Get the 1st hex digit
  result[4] = '\0';                          // Add null terminator

  return result;
}

uint16_t Maths::pow_u16 ( uint16_t base, uint8_t exp )
{
  if( exp == 0 )
	  return 1;
 
  return base * pow_u16 ( base, exp - 1 );
}

void Files::make_next_file_path(char *file_path, unsigned len, 
                                const char *dir_path, 
                                const char *file_prefix, 
                                const char *file_ext)
{
  uint8_t max = 0, num;
  char prefix [7];
  char *endp, *ptr;
  SDFile entry;

  /* Take only 6 (or less) characters from the prefix */
  strncpy (prefix, file_prefix, 6);
  prefix [6] = '\0';

  SDFile dir = card0.open (dir_path);
  if ( dir ) {
	  for (;;) {
	    entry =  dir.openNextFile ();
	    if (! entry )
		    break;	/* Terminate if any error or end of dir */

	    ptr = strchr (entry.name(), '.');
	    if ( ptr ) {
		    ptr -= 2;
		    num = strtoul (ptr, &endp, 10);
		    if (num > max)
		      max = num;
	    }

	    entry.close ();
	  }

	  dir.close ();
  }

  snprintf(file_path, len, "%s/%s%02u.%s", dir_path, prefix, ++max, file_ext);
}

void Pins::set_out ( uint8_t pin )
{
  pinMode ( pin, OUTPUT );
}

void Pins::set_in_highz ( uint8_t pin )
{
  pinMode ( pin, INPUT );
}

void Pins::set_in_pullup ( uint8_t pin)
{
  pinMode ( pin, INPUT_PULLUP );
}

void Pins::drive_high ( uint8_t pin )
{
  digitalWrite ( pin, HIGH );
}

void Pins::drive_low ( uint8_t pin )
{
  digitalWrite ( pin, LOW );
}

bool Pins::is_in_high ( uint8_t pin )
{
  return digitalRead( pin ) == HIGH;
}

bool Pins::is_in_low ( uint8_t pin )
{
  return digitalRead( pin ) == LOW;
}

bool Pins::is_out_high ( uint8_t pin )
{
  return digitalReadOutputPin( pin ) == HIGH;
}

bool Pins::is_out_low ( uint8_t pin )
{
  return digitalReadOutputPin( pin ) == LOW;
}

};  //DS
