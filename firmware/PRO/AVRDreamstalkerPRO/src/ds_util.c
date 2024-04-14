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

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>

#include <avr/io.h>
#include <avr/wdt.h>
#include <compat/ina90.h>

#include "fatfs/ff.h"
#include "ds_util.h"


/*-----------------------------------------------------------------------*/

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
#	error "Unsupported MCU"
#endif

	wdt_disable();
}

void soft_reset ( void )
{
	do {
		wdt_enable(WDTO_15MS);
		for(;;) { }
	} while(0);
}

bool hex_str ( uint32_t decimal, char *buffer, int precision )
{
    char hexadecimal[10] = {0};
    int indx = 0;
    int i, k = 0;

    while( decimal > 0 )
    {
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

uint16_t pow_u16 ( uint16_t base, uint8_t exp )
{
    if( exp == 0 )
        return 1;
 
    return base * pow_u16 ( base, exp - 1 );
}

void make_next_file_path(char *file_path, unsigned len, const char *dir_path, 
						const char *file_prefix, const char *file_ext)
{
	FRESULT res;
	DIR 	dir;		/* Pointer to the blank directory object */
	FILINFO fi;			/* Pointer to the file information structure */
	uint8_t max = 0, num;
	char prefix[7];

	/* Take only 6 (or less) characters from the prefix */
	strncpy(prefix, file_prefix, 6);
	prefix[6] = '\0';

	res = f_opendir(&dir, dir_path);
	if (res == FR_OK) {
		for (;;) {
			res = f_readdir(&dir, &fi);
			if (res != FR_OK || !fi.fname[0]) 
				break;	/* Terminate if any error or end of dir */
			char *endp;
			char *ptr = strchr(fi.fname, '.');
			ptr -= 2;
			num = strtoul(ptr, &endp, 10);
			if (num > max)
				max = num;
		}
		f_closedir(&dir);
	}

	snprintf(file_path, len, "%s/%s%02u.%s", dir_path, prefix, ++max, file_ext);
}
