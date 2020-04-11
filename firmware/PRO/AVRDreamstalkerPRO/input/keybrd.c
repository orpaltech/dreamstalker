/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2020	ORPAL Technologies, Inc.
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

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#include "keybrd.h"


/* Peripheral controls (Platform dependent) */
#define KEYS_DDR	DDRD
#define KEYS_PORT	PORTD
#define KEYS_PINS	PIND

#define DD_ONOFF	_BV(DDD0)
#define DD_CHECK	_BV(DDD1)
#define DD_SELECT	_BV(DDD4)
#define DD_ENTER	_BV(DDD5)
#define DD_PLUS		_BV(DDD6)
#define DD_MINUS	_BV(DDD7)

#define BIT_ONOFF	PD0
#define BIT_CHECK	PD1
#define BIT_SELECT	PD4
#define BIT_ENTER	PD5
#define BIT_PLUS	PD6
#define BIT_MINUS	PD7


/*-----------------------------------------------------------------------*/
ISR(INT0_vect)
{

}

ISR(INT1_vect)
{

}

/*-----------------------------------------------------------------------*/
void keybrd_init (void)
{
	// Keyboard input lines
	KEYS_DDR &= ~(DD_SELECT
				| DD_ENTER
				| DD_PLUS
				| DD_MINUS
				| DD_ONOFF
				| DD_CHECK);

	// Pull-up all associated pins
	KEYS_PORT |= (_BV(BIT_SELECT)
				| _BV(BIT_ENTER)
				| _BV(BIT_PLUS)
				| _BV(BIT_MINUS)
				| _BV(BIT_ONOFF)
				| _BV(BIT_CHECK));

	EICRA = (_BV(ISC01) | _BV(ISC11));	// INT0 / INT1 falling edge will generate interrupts
	EIMSK = 0;	// Disable by default INT0-7
}

/*-----------------------------------------------------------------------*/
uint8_t keybrd_test (void)
{
	uint8_t ret	= KEY_NONE;

	// check to see if the user has pressed ONOFF down
	if (bit_is_clear(KEYS_PINS, BIT_ONOFF))
	{
		ret|= KEY_ONOFF;
	}

	// check to see if the user has pressed CHECK down
	if (bit_is_clear(KEYS_PINS, BIT_CHECK))
	{
		ret|= KEY_CHECK;
	}

	// check to see if the user has pressed ENTER down
	if (bit_is_clear(KEYS_PINS, BIT_ENTER))
	{
		ret|= KEY_ENTER;
	}

	// check to see if the user has pressed SELECT down
	if (bit_is_clear(KEYS_PINS, BIT_SELECT))
	{
		ret|= KEY_SELECT;
	}

	// check to see if the user has pressed (+) down
	if (bit_is_clear(KEYS_PINS, BIT_PLUS))
	{
		ret|= KEY_PLUS;
	}

	// check to see if the user has pressed (-) down
	if (bit_is_clear(KEYS_PINS, BIT_MINUS))
	{
		ret|= KEY_MINUS;
	}

	return ret;
}

