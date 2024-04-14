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

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#include "inputevent.h"
#include "core/adc_avr.h"
#include "ds_batmon.h"
#include "display/ds_display.h"
#include "ds_keybrd.h"
#include "ds_rtclk.h"


/* Peripheral controls (Platform dependent) */

#define DDR_KEYS	DDRD
#define PORT_KEYS	PORTD
#define PINS_KEYS	PIND

#define DD_ONOFF	_BV(DDD0)
#define DD_CHECK	_BV(DDD1)
#define DD_SELECT	_BV(DDD4)
#define DD_ENTER	_BV(DDD5)
#define DD_PLUS		_BV(DDD6)
#define DD_MINUS	_BV(DDD7)

#define BIT_POWER	PD0
#define BIT_CHECK	PD1
#define BIT_SELECT	PD4
#define BIT_ENTER	PD5
#define BIT_PLUS	PD6
#define BIT_MINUS	PD7

#define IF_POWER	_BV(INT0)
#define IF_CHECK	_BV(INT1)


/*-----------------------------------------------------------------------*/
static volatile uint8_t irq_keys = 0;

/*-----------------------------------------------------------------------*/
ISR(INT0_vect)	/* POWER button interrupt */
{
	/* NOTE: missing IRQ handler will cause MCU reboot */

	irq_keys |= KEY_POWER;
}

ISR(INT1_vect)	/* CHECK button interrupt */
{
	/* NOTE: missing IRQ handler will cause MCU reboot */

	irq_keys |= KEY_CHECK;
}

/*-----------------------------------------------------------------------*/
void keybrd_init (void)
{
	/* Keyboard input lines */
	DDR_KEYS &= ~(DD_SELECT
				| DD_ENTER
				| DD_PLUS
				| DD_MINUS
				| DD_ONOFF
				| DD_CHECK);

	/* Pull-up all associated pins */
	PORT_KEYS |= (_BV(BIT_SELECT)
				| _BV(BIT_ENTER)
				| _BV(BIT_PLUS)
				| _BV(BIT_MINUS)
				| _BV(BIT_POWER)
				| _BV(BIT_CHECK));

	/* Disable pin interrupts INT0-7 by default*/
	EIMSK = 0;

	/* INT0/INT1 will generate interrupts on falling edge */
	EICRA = ((EICRA & ~(_BV(ISC10) | _BV(ISC00))) | _BV(ISC11) | _BV(ISC01));
}

void keybrd_hold_repeat_disable ( void )
{
	input_set_hold_repeat( 0 );
}

void keybrd_hold_repeat_default ( void )
{
	input_set_hold_repeat( INPUT_HOLDREPEAT_CYCLES_DEFAULT );
}

void keybrd_hold_repeat_fast ( void )
{
	input_set_hold_repeat( INPUT_HOLDREPEAT_CYCLES_FAST );
}

uint8_t keybrd_get_irq_keys ( void )
{
	return irq_keys;
}

void keybrd_enable_irq ( uint8_t keys )
{
	if( keys & KEY_POWER ) {
		EIMSK |= IF_POWER;	
	}

	if( keys & KEY_CHECK ) {
		EIMSK |= IF_CHECK;	
	}

	irq_keys = 0;
}

void keybrd_disable_irq ( uint8_t keys )
{
	if( keys & KEY_POWER ) {
		EIMSK &= ~IF_POWER;	
	}

	if( keys & KEY_CHECK ) {
		EIMSK &= ~IF_CHECK;	
	}
}

keybrd_event_t keybrd_get_event ( void )
{
	if ( v_InputEventCount == 0 )
		return KEY_NONE;

	return (keybrd_event_t) input_get_event ();
}

void keybrd_clear_events ( void )
{
	input_clear_events ();
}

/*-----------------------------------------------------------------------*/
static 
keybrd_event_t poll_keys ( void );

/*-----------------------------------------------------------------------*/
bool keybrd_isr ( void )
{
	uint8_t keys;

	keys = poll_keys ();
	input_process (keys);

	return ( keys != KEY_NONE );
}

/*-----------------------------------------------------------------------*/
keybrd_event_t poll_keys ( void )
{
	keybrd_event_t ret	= KEY_NONE;

	// check to see if the user has pressed ONOFF down
	if( bit_is_clear ( PINS_KEYS, BIT_POWER ))
	{
		ret|= KEY_POWER;
	}

	// check to see if the user has pressed CHECK down
	if( bit_is_clear ( PINS_KEYS, BIT_CHECK ))
	{
		ret|= KEY_CHECK;
	}

	// check to see if the user has pressed ENTER down
	if( bit_is_clear ( PINS_KEYS, BIT_ENTER ))
	{
		ret|= KEY_ENTER;
	}

	// check to see if the user has pressed SELECT down
	if( bit_is_clear ( PINS_KEYS, BIT_SELECT ))
	{
		ret|= KEY_SELECT;
	}

	// check to see if the user has pressed (+) down
	if( bit_is_clear ( PINS_KEYS, BIT_PLUS ))
	{
		ret|= KEY_PLUS;
	}

	// check to see if the user has pressed (-) down
	if( bit_is_clear ( PINS_KEYS, BIT_MINUS ))
	{
		ret|= KEY_MINUS;
	}

	return ret;
}

