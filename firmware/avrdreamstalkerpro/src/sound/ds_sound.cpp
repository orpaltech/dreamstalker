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

#include <Arduino.h>

#include "sound/ds_sound.h"
#include "sound/ds_tonegen.h"
#include "ds_config.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */


#define DD_SILENT		_BV(DDC2)		// silent
#define DD_MLEFT		_BV(DDG1)
#define DD_HPTS			_BV(DDE2)
//#define DD_SNDOFF		_BV(DDE5)		// sound off
//#define DD_MICP			_BV(DDE6)		// mic on/off

#define PF_SILENT		_BV(PC2)
#define PF_MLEFT		_BV(PG1)
#define PF_HPTS			_BV(PE2)
//#define PF_SNDOFF		_BV(PE5)
//#define PF_MICP			_BV(PE6)

#define PIN_SND_OFF		PIN_PE5
#define PIN_MIC_PWR		PIN_PE6


/*-----------------------------------------------------------------------*/
Sound SND;

/*-----------------------------------------------------------------------*/
Sound::Sound()
{
}

void Sound::speaker_on (void)
{
	digitalWrite ( PIN_SND_OFF, LOW );

	_delay_ms ( 100 );
}

void Sound::speaker_off (void)
{
	digitalWrite ( PIN_SND_OFF, HIGH );

	_delay_ms ( 10 );
}

void Sound::mic_on (void)
{
  digitalWrite ( PIN_MIC_PWR, HIGH );

  _delay_ms ( 10 );
}

void Sound::mic_off (void)
{
  digitalWrite ( PIN_MIC_PWR, LOW );

  _delay_ms ( 10 );
}

bool Sound::init ( void )
{
  //DDRE |= DD_MICP;			/* set output */
  //DDRE |= DD_SNDOFF;		/* set output */

  /* set control pins to output */
  pinMode( PIN_MIC_PWR, OUTPUT );
  pinMode( PIN_SND_OFF, OUTPUT );


	/* Left channel sensing pin */
	DDRG &= ~DD_MLEFT;		/* set input */
	//DDRG |= DD_MLEFT;		/* set output */
	PORTG &= ~PF_MLEFT;		/* high z / drive low */
	//PORTG |= PF_MLEFT;		/* pull up */

	DDRE &= ~DD_HPTS;		/* set input */
	//DDRE |= DD_HPTS;		/* set output */
	PORTE &= ~PF_HPTS;		/* high z / drive low */

	/* Silent sensing pin */
	DDRC &= ~DD_SILENT;		/* set input */
	//DDRC |= DD_SILENT;		/* set output */
	PORTC &= ~PF_SILENT;	/* high z / drive low */
	//PORTC |= PF_SILENT;		/* pull up / drive high */

  speaker_off ();

  mic_off ();		/* power down microphone */

  tonegen.init ();

  return true;
}

void Sound::start (void)
{
  if (config.get_loud_speaker ()) {
	speaker_on ();

  } else {
	speaker_off ();

  }
}

void Sound::stop (void)
{
  speaker_off();
}
