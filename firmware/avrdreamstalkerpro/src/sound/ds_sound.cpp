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

#include <string.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/power.h>

#include "ds_arduino.h"
#include "sound/ds_sound.h"
#include "sound/ds_tonegen.h"
#include "ds_config.h"
#include "ds_sysclock.h"
#include "ds_util.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_SILENT		PIN_PC2

#define PIN_HPTS		  PIN_PE2
#define PIN_SND_OFF		PIN_PE5
#define PIN_MIC_PWR		PIN_PE6

#define PIN_MGBUF     PIN_PG0
#define PIN_MLEFT     PIN_PG1


/*-----------------------------------------------------------------------*/
void Sound::handle_sysclk (void)	/* runs every 1 sec */
{
	get()->irq_handler ();
}

/*-----------------------------------------------------------------------*/
Sound *Sound::get()
{
  static Sound snd;
	return &snd;
}

/*-----------------------------------------------------------------------*/
Sound::Sound()
{
}

void Sound::irq_handler (void)
{
  if (Pins::is_in_low ( PIN_HPTS )) {

    // off loudspeaker
    if ( is_speaker_on () )
      speaker_off( );
  } else {

	  // on loudspeaker (if enabled by config)
	  if ( config.get_loud_speaker_enabled () && ! is_speaker_on () )
		  speaker_on( );
  }
}

void Sound::speaker_on (void)
{
  Pins::drive_low ( PIN_SND_OFF );

	SysClock::get()->wait ( 10 );
}

void Sound::speaker_off (void)
{
  Pins::drive_high ( PIN_SND_OFF );

  SysClock::get()->wait ( 10 );
}

bool Sound::is_speaker_on() const
{
	return Pins::is_out_low ( PIN_SND_OFF );
}

void Sound::set_silent (bool silent)
{
  if ( silent ) {

    Pins::set_out( PIN_SILENT );
    Pins::drive_low( PIN_SILENT );
  } else {

    Pins::set_in_highz( PIN_SILENT );
  }

  SysClock::get()->wait ( 10 );
}

void Sound::microphone_on (void)
{
  Pins::drive_high ( PIN_MIC_PWR );

  SysClock::get()->wait ( 100 );
}

void Sound::microphone_off (void)
{
  Pins::drive_low ( PIN_MIC_PWR );

  SysClock::get()->wait ( 10 );
}

bool Sound::init ( void )
{
  /* Switch speaker/microphone pins to output */
  Pins::set_out( PIN_MIC_PWR );
  Pins::set_out( PIN_SND_OFF );

  /* Switch headphone tip sensing pin to input */
  Pins::set_in_pullup( PIN_HPTS );

  /* Switch silent pin to input */
  Pins::set_in_highz( PIN_SILENT );

	/* TODO: Left channel control pin - what is it for ???? */
  Pins::set_in_highz( PIN_MLEFT);
	//DDRG &= ~DD_MLEFT;		/* set input */
	//DDRG |= DD_MLEFT;		/* set output */
	//PORTG &= ~PF_MLEFT;		/* high z / drive low */
	//PORTG |= PF_MLEFT;		/* pull up */

  /* TODO: GBUF line control pin - what is it for ???? */
  //Pins::set_in_pullup( PIN_MGBUF );  /* set for input & pullup */
  Pins::set_in_highz( PIN_MGBUF );     /* set for input & high-Z */

  speaker_off ();

  /* Power down microphone */
  microphone_off ();

  Tonegen::get()->init ();

  return true;
}

void Sound::start (void)
{
  if (config.get_loud_speaker_enabled ()) {

	  speaker_on ();
  } else {

	  speaker_off ();
  }
}

void Sound::stop (void)
{
  speaker_off();
}
