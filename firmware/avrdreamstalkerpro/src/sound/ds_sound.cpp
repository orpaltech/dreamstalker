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
#include "ds_util.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */


//#define DD_SILENT		_BV(DDC2)		// silent
#define DD_MLEFT		_BV(DDG1)
//#define DD_HPTS			_BV(DDE2)
//#define DD_SNDOFF		_BV(DDE5)		// sound off
//#define DD_MICP			_BV(DDE6)		// mic on/off

//#define PF_SILENT		_BV(PC2)
#define PF_MLEFT		_BV(PG1)
//#define PF_HPTS			_BV(PE2)
//#define PF_SNDOFF		_BV(PE5)
//#define PF_MICP			_BV(PE6)

#define PIN_SILENT		PIN_PC2

#define PIN_HPTS		PIN_PE2
#define PIN_SND_OFF		PIN_PE5
#define PIN_MIC_PWR		PIN_PE6


/*-----------------------------------------------------------------------*/
void Sound::handle_isr (void)	// runs every 1 sec
{
	get()->irq_handler ();
}

/*-----------------------------------------------------------------------*/
static Sound snd;

/*-----------------------------------------------------------------------*/
Sound *Sound::get()
{
	return &snd;
}

/*-----------------------------------------------------------------------*/
Sound::Sound()
{
}

void Sound::irq_handler (void)
{
  if (Pins::is_in_low (PIN_HPTS)) {

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
  Pins::out_low (PIN_SND_OFF);

	_delay_ms ( 100 );
}

void Sound::speaker_off (void)
{
  Pins::out_high (PIN_SND_OFF);

	_delay_ms ( 10 );
}

bool Sound::is_speaker_on() const
{
	return Pins::is_out_low (PIN_SND_OFF);
}

void Sound::mic_on (void)
{
  Pins::out_high (PIN_MIC_PWR);

  _delay_ms ( 10 );
}

void Sound::mic_off (void)
{
  Pins::out_low (PIN_MIC_PWR);

  _delay_ms ( 10 );
}

bool Sound::init ( void )
{
  /* set control pins to output */
  Pins::set_out ( PIN_MIC_PWR );
  Pins::set_out ( PIN_SND_OFF );

  /* set headphones tip sensing pin to input */
  Pins::set_in_pullup ( PIN_HPTS );

  /* set silent pin to input */
  Pins::set_in_highz ( PIN_SILENT );

	/* Left channel sensing pin */
	DDRG &= ~DD_MLEFT;		/* set input */
	//DDRG |= DD_MLEFT;		/* set output */
	PORTG &= ~PF_MLEFT;		/* high z / drive low */
	//PORTG |= PF_MLEFT;		/* pull up */

  speaker_off ();

  mic_off ();		/* power down microphone */

  tonegen.init ();

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
