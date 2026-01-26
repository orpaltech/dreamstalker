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

#include "ds_arduino.h"
#include "ds_util.h"


/*-----------------------------------------------------------------------*/
//SDLib::SDClass &card0 = SDLib::SD;
static SdFat sd_internal;
SdFat &card0 = sd_internal;


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

/*-----------------------------------------------------------------------*/
uint16_t Maths::pow_u16 ( uint16_t base, uint8_t exp )
{
  if( exp == 0 )
	  return 1;

  return base * pow_u16 ( base, exp - 1 );
}

/*-----------------------------------------------------------------------*/
bool Files::make_next_file_path(String &file_path, 
                                const char *dir_path,
                                const char *file_prefix, 
                                const char *file_ext,
                                uint8_t num_digits, 
                                bool remove_existing )
{
  uint32_t max_val = 0, num;
  bool overrun = false;
  char prefix[9]; // Max 8 chars + null

  if (num_digits < 2) num_digits = 2;
  else if (num_digits > 4) num_digits = 4;

  // 1. Calculate numerical limit (e.g., 4 digits -> 9999)
  uint32_t limit = 1;
  for(int i = 0; i < num_digits; i++) limit *= 10;
  limit -= 1;

  // 2. Open Directory
  File dir = card0.open(dir_path);
  if (dir) {
    File entry;
    while (entry = dir.openNextFile()) {
      //const char *name = entry.name();
      char name[13]; 
      entry.getName(name, sizeof(name)); // The compiler will be happy now
      char *dot = strchr(name, '.');
      
      // Look back from dot to extract number
      if (dot && (dot - name) >= num_digits) {
        char *endp;
        num = strtoul(dot - num_digits, &endp, 10);
        if (num > max_val) max_val = num;
      }
      entry.close();
    }
    dir.close();

    if (max_val >= limit) {
      overrun = true;
      max_val = 0;
    }
  }

  // 3. Construct the filename safely on the Stack
  // 8.3 filenames mean: 8 (name) + 1 (.) + 3 (ext) + 1 (\0) = 13 bytes.
  // Add dir_path length. Let's assume a safe stack buffer of 64.
  char local_buffer[64];
  
  int max_prefix_len = 8 - num_digits;
  strncpy(prefix, file_prefix, max_prefix_len);
  prefix[max_prefix_len] = '\0';

  // Explicitly building the format: e.g., "%s/%s%04u.%s"
  char num_fmt[10]; 
  snprintf(num_fmt, sizeof(num_fmt), "%%0%du", num_digits); // i.e. creates "%04u"

  // 4. Now combine everything into the final path
  int written = snprintf(local_buffer, sizeof(local_buffer), "%s/%s", dir_path, prefix);
  written += snprintf(local_buffer + written, sizeof(local_buffer) - written, num_fmt, ++max_val);
  snprintf(local_buffer + written, sizeof(local_buffer) - written, ".%s", file_ext);

  // 5. Single assignment (Safe heap management)
  file_path = local_buffer; 

  if (remove_existing && card0.exists(file_path)) {
    card0.remove(file_path);
  }

  return !overrun;
}

/*-----------------------------------------------------------------------*/
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
