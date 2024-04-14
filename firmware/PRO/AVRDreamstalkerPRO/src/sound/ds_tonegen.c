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

#include <ctype.h>
#include <util/delay.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

#include "core/tmr_avr.h"
#include "ds_rtclk.h"
#include "pwm_notes.h"
#include "ds_config.h"
#include "ds_deferred.h"
#include "ds_sound.h"
#include "ds_util.h"


/* Peripheral controls (Platform dependent) */


#define DDR_SOUND		DDRB
#define PORT_SOUND		PORTB

#define DD_SOUND		_BV(DDB5)	/* PWM sound */
#define PF_SOUND		_BV(PB5)


typedef struct s_tonegen_melody {
	const char *head;
	const char *sound;
	uint8_t access_mode;
	uint16_t ticks;
	uint16_t duration;
	uint16_t whole_duration;
	uint8_t note_default_len;
	uint8_t octave_default;
	/* use count to designate melody/beep,
	 * count = 0 - idle
	 * count < 0 - beep
	 * count > 0 - melody  */
	int8_t count;
} tonegen_melody_t;


PROGMEM const uint16_t notes[] = {
	PAUSE,
	C2, C2x, D2, D2x, E2, F2, F2x, G2, G2x, A2, A2x, B2,
	C3, C3x, D3, D3x, E3, F3, F3x, G3, G3x, A3, A3x, B3,
	C4, C4x, D4, D4x, E4, F4, F4x, G4, G4x, A4, A4x, B4,
	C5, C5x, D5, D5x, E5, F5, F5x, G5, G5x, A5, A5x, B5,
	C6, C6x, D6, D6x, E6, F6, F6x, G6, G6x, A6, A6x, B6,
	C7, C7x, D7, D7x, E7, F7, F7x, G7, G7x, A7, A7x, B7,
};


PROGMEM const char indiana_jones[] = "d=4,o=5,b=250:E,8p,8F,8G,8p,1C6,8p.,D,8p,"
		"8E,1F,p.,G,8p,8A,8B,8p,1F6,p,A,8p,8B,2C6,2D6,2E6,E,8p,8F,8G,8p,1C6,p,D6,"
		"8p,8E6,1F.6,G,8p,8G,E.6,8p,D6,8p,8G,E.6,8p,D6,8p,8G,F.6,8p,E6,8p,8D6,2C6";

PROGMEM const char mission_impossible[] = "d=16,o=6,b=90:32d,32d#,32d,32d#,32d,32d#,32d,"
		"32d#,32d,32d,32d#,32e,32f,32f#,32g,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,"
		"p,g,8p,g,8p,a#,p,c7,p,g,8p,g,8p,f,p,f#,p,a#,g,2d,32p,a#,g,2c#,32p,a#,g,2c,"
		"a#5,8c,2p,32p,a#5,g5,2f#,32p,a#5,g5,2f,32p,a#5,g5,2e,d#,8d";

PROGMEM const char moonlight_sonata[] = "d=4,o=5,b=70:8g#4,8c#,8e,8g#4,8c#,8e,8g#4,"
		"8c#,8e,8g#4,8c#,8e,8a4,8c#,8e,8a4,8c#,8e,8a4,8d,8f#,8a4,8d,8f#,8g#4,8c,"
		"8f#,8g#4,8c#,8e,8g#4,8c#,8d#,8f#4,8c,8d#,c#";

/* 3/8 */
PROGMEM const char fur_elise[] = "d=16,o=4,b=90:e5,d#5,e5,d#5,e5,b,d5,c5,8a,p,c,e,a,"
		"8b,p,e,G#,B,8c5,p,e,e,d#5,e5,d#5,e5,b,d5,c5,8a,p,c,e,a,8b,p,e,c5,b,8a,8p";

static volatile tonegen_melody_t melody;

#define TICK_PERIOD_MS 10	/* The interrupt period, ms */

#if defined (__AVR_ATmega128__)
static
void melody_on (void)
{
	TCNT2 = 0;

	/* CTC mode, clock F_CPU/1024 = 7812.5 */
	TCCR2 = (_BV(WGM21) | T2_N_1024);

	/* Generate 10ms interrupts.
	 * Max Error: (1 / 7812.5 * 78) − 0.01 = 0.000016 (s) */
	OCR2 = 78;

	TIFR &= ~(_BV(OCF2) | _BV(TOV2)); 	/* Reset interrupt flags */
	TIMSK |= _BV(OCIE2);				/* Enable CTC interrupt */
}

static
void melody_off()
{
	/* Disable Timer/Counter 2 interrupts */
	TIMSK &= ~(_BV(OCIE2) | _BV(TOIE2));

	TMR2_OFF();
}

#elif defined (__AVR_ATmega1281__)
static
void melody_on (void)
{
	TCNT4 = 0;

	/* CTC mode, clock F_CPU/64 = 125000 */
	TCCR4A	= _BV(WGM42);
	TCCR4B	= (_BV(WGM42) | T4_N_64);

	/* Generate 10ms interrupts.
	 * Max Error: (1 / 125000 * 1250) − 0.01 = 0 (s) */
	OCR4A	= 1250;

	TIFR4	= 0;			/* Reset interrupt flags */
	TIMSK4	= _BV(OCIE4A);	/* Enable CTC interrupt */
}

static
void melody_off()
{
	/* Disable Timer/Counter 4 interrupts */
	TIMSK4 = 0;

	TMR4_OFF();
}

#else
#	error "Unsupported MCU"
#endif

static
char melody_get_char (void)
{
	if (melody.access_mode == 0)
		return *melody.sound;	// direct access
	else
		return pgm_read_byte_far(melody.sound);
}

static
void tone_off (void)
{
	OCR1A = 0;
}

static
void tone_on(uint8_t note, uint8_t octave)
{
	if( PAUSE == note ) {
		/* pause, no sound */
		return;
	}

	/* generate tone */
	OCR1A = pow_u16 ( 2, get_music_volume_level () );

	/* set frequency */
	/* Fpwm = Fcpu/(2*Prescaler*TOP) */
	/* TOP = Fcpu/(2*Prescaler*Fpwm) */
	ICR1 = pgm_read_word_far ( notes + ( octave - 2 ) * 12 + note );
}

static
uint16_t whole_duration_ms(uint16_t bpm)
{
	return ((1000UL * 60 / bpm) * 4);
}

void tonegen_beep (uint16_t millisec, uint8_t note, uint8_t octave)
{
	if (melody.count)	/*melody running*/
		return;

	melody.count = -1;
	melody.ticks = (millisec) / TICK_PERIOD_MS;

	melody_on();

	tone_on(note, octave);
}

void tonegen_melody (uint8_t playback_times)
{
	melody.sound = mission_impossible;
	melody.count = playback_times;
	melody.ticks = 0;
	melody.access_mode = 1;	// progmem


	if (melody_get_char() == 'd')
	{
		/* Skip "d=" */
		melody.sound++;
		melody.sound++;

		melody.note_default_len = 0;
	    while (isdigit(melody_get_char())) {
	    	melody.note_default_len =
	    			(melody.note_default_len * 10)
	    			+ (melody_get_char() - '0');
	    	melody.sound++;
	    }

	    if (melody.note_default_len == 0)
	    	melody.note_default_len = 4;

	    /* Skip "," */
	    melody.sound++;
	}

	 if (melody_get_char() == 'o')
	 {
		 /* Skip "o=" */
		 melody.sound++;
		 melody.sound++;

		 melody.octave_default = melody_get_char() - '0';
		 melody.sound++;
		 if(!(melody.octave_default >= 2 && melody.octave_default <=7))
			 melody.octave_default = 4;

		 /* Skip "," */
		 melody.sound++;
	}

	if (melody_get_char() == 'b')
	{
		/* Skip "b=" */
		melody.sound++;
		melody.sound++;

		/* read BPM temporarily into whole_duration variable */
		melody.whole_duration = 0;
		while (isdigit(melody_get_char())){
			melody.whole_duration =
					(melody.whole_duration * 10)
					+ (melody_get_char() - '0');
			melody.sound++;
		}

		/* get whole note duration in melody timer's ticks */
		melody.whole_duration =
				whole_duration_ms(melody.whole_duration)
				/ TICK_PERIOD_MS;

		/* Skip ":" */
		melody.sound++;
	}

	/* now melody.sound points to the melody data */
	melody.head = melody.sound;

	melody_on();
}

void tonegen_init (void)
{
	DDR_SOUND |= DD_SOUND;		/* output */
	PORT_SOUND &= ~PF_SOUND;	/* set low */

#ifdef __AVR_ATmega128__
	/* Disable Timer/Counter 1 interrupts */
	TIMSK &= ~(_BV(OCIE1A) | _BV(TOIE1) | _BV(TICIE1));

#elif __AVR_ATmega1281__
	/* Disable Timer/Counter 1 interrupts */
	TIMSK1	= 0;

#endif

	TCNT1 = 0;

	/* Clear OC1A on compare match (set output to low level).*/
	/* PWM, Phase and Frequency	Correct, TOP in ICR1 */
	/* Set prescaler 1, i.e. clock F_CPU/1 */
	TCCR1A = _BV(COM1A1);
	TCCR1B = _BV(WGM13) | T1_N_1;

	melody_off();
}

#if defined (__AVR_ATmega128__)
ISR(TIMER2_COMP_vect) // interrupt
#elif defined (__AVR_ATmega1281__)
ISR(TIMER4_COMPA_vect) // interrupt
#endif
{
	uint8_t note, octave;


	if (melody.count < 0)	/* beep */
	{
		if (--melody.ticks == 0) {
			tone_off();
			melody_off();
			melody.count=0;
		}
		return;
	}

	if (melody.count == 0)	/*idle*/
		return;

	if (melody.ticks == 0) {
		/* find note duration */
		melody.duration=0;
		while (isdigit(melody_get_char())) {
			melody.duration =
					(melody.duration * 10)
					+ (melody_get_char() - '0');
			melody.sound++;
		};

		if (melody.duration)
			melody.duration =
					(melody.whole_duration / melody.duration);
		else
			melody.duration =
					(melody.whole_duration / melody.note_default_len);

		switch(melody_get_char()) {
			case 'C':
			case 'c':
				note = 1;
				break;
			case 'D':
			case 'd':
				note = 3;
				break;
			case 'E':
			case 'e':
				note = 5;
				break;
			case 'F':
			case 'f':
				note = 6;
				break;
			case 'G':
			case 'g':
				note = 8;
				break;
			case 'A':
			case 'a':
				note = 10;
				break;
			case 'B':
			case 'b':
				note = 12;
				break;
			case 'P':
			case 'p':
			default:
				note = PAUSE;
				break;
		}
		melody.sound++;

		/* Check for '#' */
		if (melody_get_char() == '#') {
			note++;
			melody.sound++;
		}

		/* Check for '.' */
		if (melody_get_char() == '.') {
			melody.duration += melody.duration/2;
			melody.sound++;
		}

		/* Read octave */
		if (isdigit(melody_get_char())) {
			octave = melody_get_char() - '0';
			melody.sound++;
		} else {
			octave = melody.octave_default;
		}

		/* Skip ',' */
		if (melody_get_char() == ',')
			melody.sound++;

		tone_on(note, octave);
	}

	if (++melody.ticks >= melody.duration) {
		melody.ticks = 0;
		tone_off();

		if (melody_get_char() == 0) {
			melody.sound = melody.head;
			if (--melody.count == 0)
				melody_off();
		}
	}
}
