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

#include <string.h>
#include <avr/io.h>

#include "uart_avr.h"
#include "dbg_avr.h"

#if DEBUG_LEVEL > 0

#warning "Never compile production devices with debugging enabled"

static 
uint8_t hex_ascii(uint8_t h)
{
    h &= 0xf;
    if(h >= 10)
        h += 'a' - (uint8_t)10 - '0';
    h += '0';
    return h;
}

static 
void print_hex(uint8_t c)
{
    uart0_send(hex_ascii(c >> 4));
    uart0_send(hex_ascii(c));
}

void avr_dbg(uint8_t prefix, const uint8_t *data, uint8_t len)
{
    print_hex(prefix);
    uart0_send(':');
    while(len--){
        uart0_send(' ');
        print_hex(*data++);
    }
    uart0_send('\r');
    uart0_send('\n');
}

void avr_dbg_init (void)
{
    uart0_open( UART_BR_9600, UART_MODE_TX );
}

#endif
