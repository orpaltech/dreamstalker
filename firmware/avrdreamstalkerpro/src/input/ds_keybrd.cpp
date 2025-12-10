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

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#include <Arduino.h>

#include "input/inputevent.h"
#include "input/ds_keybrd.h"


using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_ONOFF   PIN_PD0
#define PIN_CHECK   PIN_PD1
#define PIN_SELECT  PIN_PD4
#define PIN_ENTER   PIN_PD5
#define PIN_PLUS    PIN_PD6
#define PIN_MINUS   PIN_PD7

/* INT0/INT1 will generate interrupts on falling edge */
#define INT_ONOFF   0
#define INT_CHECK   1

#define INTF_ONOFF  _BV(INTF0)
#define INTF_CHECK  _BV(INTF1)


/*-----------------------------------------------------------------------*/
static
void handle_onoff_isr (void)  /* POWER button interrupt */
{
  Keyboard::handle_key_isr ( KEY_POWER );
}

static
void handle_check_isr (void)  /* CHECK button interrupt */
{
  Keyboard::handle_key_isr ( KEY_CHECK );
}

/*-----------------------------------------------------------------------*/
static 
keybrd_event_t poll_keys ( void );

/*-----------------------------------------------------------------------*/
bool Keyboard::handle_isr ( void )
{
  return get()->irq_handler ();
}

void Keyboard::handle_key_isr ( keybrd_event_t key )
{
  get()->key_irq ( key );
}

/*-----------------------------------------------------------------------*/
Keyboard kbrd;

/*-----------------------------------------------------------------------*/
Keyboard *Keyboard::get()
{
  return &kbrd;
}

bool Keyboard::irq_handler (void)
{
  uint8_t keys;

  keys = poll_keys ();
  input_process (keys);

  return ( keys != KEY_NONE );
}

void Keyboard::key_irq ( keybrd_event_t key )
{
  irq_keys |= key;
}

bool Keyboard::init (void)
{
  /** Keyboard input lines
   ** Pull-up all associated pins 
   */
  pinMode ( PIN_ONOFF,  INPUT_PULLUP );
  pinMode ( PIN_CHECK,  INPUT_PULLUP );
  pinMode ( PIN_SELECT, INPUT_PULLUP );
  pinMode ( PIN_ENTER,  INPUT_PULLUP );
  pinMode ( PIN_PLUS,   INPUT_PULLUP );
  pinMode ( PIN_MINUS,  INPUT_PULLUP );

  /* Disable all interrupts INT0-7 */
  EIMSK = 0;

  irq_keys = 0;
  return true;
}

void Keyboard::end ( void )
{
  // TODO: implement, if needed
}

void Keyboard::hold_repeat_disable ( void )
{
  input_set_hold_repeat ( 0 );
}

void Keyboard::hold_repeat_default ( void )
{
  input_set_hold_repeat ( INPUT_HOLDREPEAT_CYCLES_DEFAULT );
}

void Keyboard::hold_repeat_fast ( void )
{
  input_set_hold_repeat ( INPUT_HOLDREPEAT_CYCLES_FAST );
}

uint8_t Keyboard::get_irq_keys ( void )
{
  return irq_keys;
}

void Keyboard::enable_key_irq ( uint8_t keys )
{
  if( keys & KEY_POWER ) {

    attachInterrupt( INT_ONOFF, handle_onoff_isr, FALLING );
  }

  if( keys & KEY_CHECK ) {

    attachInterrupt( INT_CHECK, handle_check_isr, FALLING );
  }

  /* Clear interrupt flags */
  EIFR |= ( INTF_CHECK | INTF_ONOFF );

  irq_keys = 0;
}

void Keyboard::disable_key_irq ( uint8_t keys )
{
  if( keys & KEY_POWER ) {

    detachInterrupt ( INT_ONOFF );
  }

  if( keys & KEY_CHECK ) {

    detachInterrupt ( INT_CHECK );
  }
}

keybrd_event_t Keyboard::get_event ( void )
{
  if( v_InputEventCount == 0 )
	  return KEY_NONE;

  return (keybrd_event_t) input_get_event ();
}

void Keyboard::clear_events ( void )
{
  input_clear_events ();
}

void Keyboard::wait_for_key_press ( keybrd_event_t key )
{
  keybrd_event_t key_event;

  do {
      key_event = get_event ();
      _NOP ();
  } while ( key_event != key );
}

/*-----------------------------------------------------------------------*/
keybrd_event_t poll_keys ( void )
{
  keybrd_event_t ret	= KEY_NONE;

  // check to see if the user has pressed ONOFF down
  if( digitalRead( PIN_ONOFF ) == LOW )
  {
	  ret |= KEY_POWER;
  }

  // check to see if the user has pressed CHECK down
  if( digitalRead( PIN_CHECK ) == LOW )
  {
	  ret |= KEY_CHECK;
  }

  // check to see if the user has pressed ENTER down
  if( digitalRead( PIN_ENTER ) == LOW )
  {
	  ret |= KEY_ENTER;
  }

  // check to see if the user has pressed SELECT down
  if( digitalRead( PIN_SELECT ) == LOW )
  {
	  ret |= KEY_SELECT;
  }

  // check to see if the user has pressed (+) down
  if( digitalRead( PIN_PLUS ) == LOW )
  {
	  ret |= KEY_PLUS;
  }

  // check to see if the user has pressed (-) down
  if( digitalRead( PIN_MINUS ) == LOW )
  {
	  ret |= KEY_MINUS;
  }

  return ret;
}

