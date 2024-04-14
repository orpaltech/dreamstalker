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
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/power.h>

#include "ds_sound.h"
#include "ds_config.h"


/* Peripheral controls (Platform dependent) */


#define DD_SILENT		_BV(DDC2)		// silent
#define DD_MLEFT		_BV(DDG1)
#define DD_HPTS			_BV(DDE2)
#define DD_SNDOFF		_BV(DDE5)		// sound off
#define DD_MICP			_BV(DDE6)		// mic on/off

#define PF_SILENT		_BV(PC2)
#define PF_MLEFT		_BV(PG1)
#define PF_HPTS			_BV(PE2)
#define PF_SNDOFF		_BV(PE5)
#define PF_MICP			_BV(PE6)

/*-----------------------------------------------------------------------*\
 * Amplifier Control
\*-----------------------------------------------------------------------*/

void speaker_on (void)
{
	PORTE &= ~PF_SNDOFF;

	_delay_ms(10);
}

void speaker_off (void)
{
	PORTE |= PF_SNDOFF;

	_delay_ms(10);
}

/*-----------------------------------------------------------------------*\
 * Microphone Control
\*-----------------------------------------------------------------------*/

void mic_power_on (void)
{
	PORTE |= PF_MICP;

	_delay_ms(10);
}

void mic_power_off (void)
{
	PORTE &= ~PF_MICP;

	_delay_ms(10);
}

/*-----------------------------------------------------------------------*\
 * Sound Control
\*-----------------------------------------------------------------------*/

void sound_init (void)
{
	DDRE |= DD_MICP;		/* output */
	DDRE |= DD_SNDOFF;		/* output */

	/* Left channel sensing pin */
	DDRG &= ~DD_MLEFT;		/* input */
	//DDRG |= DD_MLEFT;		/* output */
	//PORTG &= ~PF_MLEFT;		/* high z / drive low */
	PORTG |= PF_MLEFT;		/* pull up */

	//DDRE &= ~DD_HPTS;		/* input */
	DDRE |= DD_HPTS;		/* output */
	PORTE &= ~PF_HPTS;		/* high z / drive low */

	/* Silence sensing pin */
	DDRC &= ~DD_SILENT;		/* input */
	//DDRC |= DD_SILENT;		/* output */
	//PORTC &= ~PF_SILENT;	/* high z / drive low */
	PORTC |= PF_SILENT;		/* pull up / drive high */

	speaker_off();

	mic_power_off ();		/* Power down microphone */

	tonegen_init();
}

void sound_start (void)
{
	if (get_loud_speaker()) {
		speaker_on();
	} else {
		speaker_off();
	}
}

void sound_stop (void)
{
	// Nothing 
}
