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
#include <avr/pgmspace.h>

#include <ctype.h>
#include <util/atomic.h>
#include <util/delay.h>

#include <Arduino.h>

#include "core/tmr_avr.h"
#include "ds_rtclock.h"
#include "ds_config.h"
#include "ds_util.h"
#include "sound/ds_tonegen.h"
#include "sound/pwm_notes.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Peripheral controls (Platform dependent) */

#define PIN_SOUND	PIN_PB5		/* PWM sound pin */

/*-----------------------------------------------------------------------*/
typedef enum e_tonegen_storage {
  TGS_RAM = 0,
  TGS_FLASH
} tonegen_storage_t;

/*-----------------------------------------------------------------------*/
PROGMEM const uint16_t notes[] = {
	PAUSE,
	C2, C2x, D2, D2x, E2, F2, F2x, G2, G2x, A2, A2x, B2,
	C3, C3x, D3, D3x, E3, F3, F3x, G3, G3x, A3, A3x, B3,
	C4, C4x, D4, D4x, E4, F4, F4x, G4, G4x, A4, A4x, B4,
	C5, C5x, D5, D5x, E5, F5, F5x, G5, G5x, A5, A5x, B5,
	C6, C6x, D6, D6x, E6, F6, F6x, G6, G6x, A6, A6x, B6,
	C7, C7x, D7, D7x, E7, F7, F7x, G7, G7x, A7, A7x, B7,
};

/*-----------------------------------------------------------------------*/
PROGMEM const char indiana_jones[] = "d=4,o=5,b=250:E,8p,8F,8G,8p,1C6,8p.,D,8p,"
									"8E,1F,p.,G,8p,8A,8B,8p,1F6,p,A,8p,8B,2C6,"
									"2D6,2E6,E,8p,8F,8G,8p,1C6,p,D6,8p,8E6,1F.6,"
									"G,8p,8G,E.6,8p,D6,8p,8G,E.6,8p,D6,8p,8G,F.6,"
									"8p,E6,8p,8D6,2C6";

PROGMEM const char mission_impossible[] = "d=16,o=6,b=90:32d,32d#,32d,32d#,32d,32d#,32d,"
										"32d#,32d,32d,32d#,32e,32f,32f#,32g,g,8p,g,8p,a#,"
										"p,c7,p,g,8p,g,8p,f,p,f#,p,g,8p,g,8p,a#,p,c7,p,g,"
										"8p,g,8p,f,p,f#,p,a#,g,2d,32p,a#,g,2c#,32p,a#,g,2c,"
										"a#5,8c,2p,32p,a#5,g5,2f#,32p,a#5,g5,2f,32p,a#5,"
										"g5,2e,d#,8d";

PROGMEM const char moonlight_sonata[] = "d=4,o=4,b=70:8g#3,8c#,8e,8g#3,8c#,8e,8g#3,8c#,8e,"
										"8g#3,8c#,8e,8a3,8c#,8e,8a3,8c#,8e,8a3,8d,8f#,8a3,"
										"8d,8f#,8g#3,8c,8f#,8g#3,8c#,8e,8g#3,8c#,8d#,8f#3,"
										"8c,8d#,c#";

PROGMEM const char fur_elise[] = "d=8,o=4,b=160:2p,e5,d#5|e5,d#5,e5,b,d5,c5|4a,p,c,e,a|"
								"4b,p,e,G#,B|4c5,p,e,e5,d#5|e5,d#5,e5,b,d5,c5|4a,p,c,e,a|"
								"4b,p,e,c5,b|2a,4p";

PROGMEM const char ode_to_joy[] = "d=4,o=4,b=130:e,e,f,g|g,f,e,d|c,c,d,e|e.,8d,2d|"
								"e,e,f,g|g,f,e,d|c,c,d,e|d.,8c,2c|"
								"d,d,e,c|d,8e,8f,e,c|d,8e,8f,e,d|c,d,g3,2e,"
								"e,f,g|g,f,e,d|c,c,d,e|d.,8c,2c|1p";

PROGMEM const char happy_birthday[] = "d=4,o=3,b=120:2p,8g,8g|a,g,c4|2b,8g,8g|a,g,d4|"
									"2c4,8g,8g|g4,e4,c4|b,a,8f4,8f4|e4,c4,d4|2c.4";

PROGMEM const char amazing_grace[] = "d=4,o=4,b=120:2p,c|2f,8a,8f|2a,g|2f,d|2c,c|2f,8a,8f|"
									"2a,g|2c.5|2p,a|2c5,8c5,8a|2f,c|2d,8f,8d|2c,c|"
									"2f,8a,8f|2a,g|2f.";

PROGMEM const char kleine_nachtmusik[] = "d=4,o=5,b=280:2c.,g4|2c.,g4|c,g4,c,e|2g,2p|"
										"2f.,d|2f.,d|f,d,b4,d|2g4,2p|2c,2c|p,e,d,c|"
										"c,b4,2b4|p,d,f,b4|d,c,2c|p,e,d,c|c,b4,2b4|"
										"p,d,f,b4|c,c,8c,8b4,8a4,8b4|c,c,8e,8d,8c,8d|"
										"e,e,8g,8f,8e,8f|2g,2p";

PROGMEM const char jingle_bells[] = "d=4,o=4,b=240:e,e,2e|e,e,2e|e,g,c,d|2e,2p|f,f,f,f|"
									"f,e,e,8e,8e|e,d,d,e|2d,2g|e,e,2e|e,e,2e|e,g,c,d|"
									"2e,2p|f,f,f,f|f,e,e,8e,8e|g,g,f,d|2c,2p";


/*-----------------------------------------------------------------------*/
#define TICK_PERIOD_MS 10	/* The interrupt period, ms */


/*-----------------------------------------------------------------------*/

#if defined (__AVR_ATmega128__)
ISR(TIMER2_COMP_vect) // interrupt
#elif defined (__AVR_ATmega1281__)
ISR(TIMER4_COMPA_vect) // interrupt
#endif
{
  tonegen.handle_isr();
}

/*-----------------------------------------------------------------------*/

char Tonegen::melody_get_char (void)
{
  if ( melody.storage_mode == TGS_FLASH )
    return pgm_read_byte_far ( melody.buffer );
  else
	return *melody.buffer;	// direct access
}

/*-----------------------------------------------------------------------*/
#if defined (__AVR_ATmega128__)
/*-----------------------------------------------------------------------*/
static
void melody_on (void)
{
  TCNT2 = 0;

  /* CTC mode, clock F_CPU/1024 = 7812.5 */
  TCCR2 = (_BV(WGM21) | T2_N_1024);

  /* Generate 10ms interrupts.
   * Max Error: (1 / 7812.5 * (OCR2+1)) − 0.01 = 0.000016 (s) 
   */
  OCR2 = 77;

  TIFR &= ~(_BV(OCF2) | _BV(TOV2)); /* Reset interrupt flags */
  TIMSK |= _BV(OCIE2);				/* Enable CTC interrupt */
}

static
void melody_off()
{
  /* Disable Timer/Counter 2 interrupts */
  TIMSK &= ~(_BV(OCIE2) | _BV(TOIE2));

  TMR2_OFF();
}

/*-----------------------------------------------------------------------*/
#elif defined (__AVR_ATmega1281__)
/*-----------------------------------------------------------------------*/
static
void melody_on (void)
{
  TCNT4 = 0;

  /* CTC mode, clock F_CPU/64 = 125000 */
  TCCR4A = _BV(WGM42);
  TCCR4B = (_BV(WGM42) | T4_N_64);

  /* Generate 10ms interrupts.
   * Max Error: (1 / 125000 * (OCR4A+1)) − 0.01 = 0 (s) 
   */
  OCR4A	= 1249;

  TIFR4	 = 0;			/* Reset interrupt flags */
  TIMSK4 = _BV(OCIE4A);	/* Enable CTC interrupt */
}

static
void melody_off()
{
  /* Disable Timer/Counter 4 interrupts */
  TIMSK4 = 0;

  TMR4_OFF();
}

/*-----------------------------------------------------------------------*/
#else
/*-----------------------------------------------------------------------*/
  #error "Unsupported MCU"

/*-----------------------------------------------------------------------*/
#endif
/*-----------------------------------------------------------------------*/

static
void tone_off (void)
{
  OCR1A = 0;
}

static
void tone_on (uint8_t note, uint8_t octave)
{
  if( PAUSE == note ) {
	/* pause, no sound */
	return;
  }

  /* generate tone */
  OCR1A = Maths::pow_u16 ( 2, config.get_volume_level () );

  /* set frequency */
  /* Fpwm = Fcpu/(2*Prescaler*TOP) */
  /* TOP = Fcpu/(2*Prescaler*Fpwm) */
  ICR1 = pgm_read_word_far ( notes + ( octave - 2 ) * 12 + note );
}

static
uint16_t whole_duration_ms (uint16_t bpm)
{
  return ((1000UL * 60 / bpm) * 4);
}

/*-----------------------------------------------------------------------*/
Tonegen tonegen;

/*-----------------------------------------------------------------------*/
void Tonegen::handle_isr()
{
	tonegen.irq_handler();
}

void Tonegen::beep (uint16_t millisec, uint8_t note, uint8_t octave)
{
  if (is_playing ())
	return;

  melody.count = -1;
  melody.ticks = (millisec) / TICK_PERIOD_MS;

  melody_on ();

  tone_on (note, octave);
}

bool Tonegen::play_melody (tonegen_piece_t piece, uint8_t repeat_count)
{
  switch (piece) {
	case TGP_MOONLIGHT_SONATA:
	  melody.buffer = moonlight_sonata;
	  break;

	case TGP_FUR_ELISE:
	  melody.buffer = fur_elise;
	  break;

	case TGP_INDIANA_JONES:
	  melody.buffer = indiana_jones;
	  break;

	case TGP_ODE_TO_JOY:
	  melody.buffer = ode_to_joy;
	  break;

	case TGP_MISSION_IMPOSSIBLE:
	  melody.buffer = mission_impossible;
	  break;

	case TGP_HAPPY_BIRTHDAY:
	  melody.buffer = happy_birthday;
	  break;

	case TGP_AMAZING_GRACE:
	  melody.buffer = amazing_grace;
	  break;

	case TGP_KLEINE_NACHTMUSIK:
	  melody.buffer = kleine_nachtmusik;
	  break;

	case TGP_JINGLE_BELLS:
	  melody.buffer = jingle_bells;
	  break;
	default:
	 return false;
  }

  melody.storage_mode = TGS_FLASH;	// melody is stored in progmem

  melody.count = repeat_count == 0 ? INT16_MAX : repeat_count;
  melody.ticks = 0;
  melody.octave_default = 0;
  melody.note_default_len = 0;
  melody.whole_duration = 0;

  /* ---------------------------------------------------------- */
  /* Read melody parameters 									*/
  /* ---------------------------------------------------------- */
  if (melody_get_char() == 'd')	{
	/* Skip "d=" */
	melody.buffer++;
	melody.buffer++;

	while (isdigit (melody_get_char ())) {
	  melody.note_default_len =
					(melody.note_default_len * 10)
	   				+ (melody_get_char () - '0');
	  melody.buffer++;
	}

    /* Skip "," */
    melody.buffer++;
  }

  if (melody.note_default_len == 0)
   	melody.note_default_len = 4;

  /* ---------------------------------------------------------- */
  if (melody_get_char() == 'o') {
	/* Skip "o=" */
	melody.buffer++;
	melody.buffer++;

	melody.octave_default = melody_get_char() - '0';
	melody.buffer++;

	/* Skip "," */
	melody.buffer++;
  }

  if (!(melody.octave_default >= 2 && melody.octave_default <=7))
	melody.octave_default = 4;

  /* ---------------------------------------------------------- */
  if (melody_get_char() == 'b') {
	/* Skip "b=" */
	melody.buffer++;
	melody.buffer++;

	/* read BPM temporarily into whole_duration variable */
	while (isdigit (melody_get_char ())){
	  melody.whole_duration =
					(melody.whole_duration * 10)
					+ (melody_get_char () - '0');
	  melody.buffer++;
	}

	/* Skip ":" */
	melody.buffer++;
  }

  if (melody.whole_duration == 0)
    melody.whole_duration = 90;
  /** get whole note duration in melody timer's ticks 
   */
  melody.whole_duration =
				whole_duration_ms(melody.whole_duration)
				/ TICK_PERIOD_MS;

  /* now melody.buffer points to the melody data */
  melody.head = melody.buffer;

  melody_on();
  return true;
}

bool Tonegen::is_playing (void)
{
  bool playing;

  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
	playing = melody.count > 0;
  }
  return playing;
}

void Tonegen::stop (void)
{
  ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
	stop_unsafe ();
  }
}

void Tonegen::init (void)
{
  pinMode ( PIN_SOUND, OUTPUT );	/* output */
  digitalWrite ( PIN_SOUND, LOW );	/* set low */

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

void Tonegen::irq_handler (void)
{
  uint8_t note, octave;

  if (melody.count < 0)	{
	/* beep mode */
	if (--melody.ticks == 0) {
	  tone_off ();
	  melody_off ();
	  melody.count=0;
	}
	return;
  }

  if (melody.count == 0)	/*idle*/
	return;

  if (melody.ticks == 0) {
	/* find note duration */
	melody.duration=0;
	while (isdigit (melody_get_char ())) {
		melody.duration =
				(melody.duration * 10)
				+ (melody_get_char() - '0');
		melody.buffer++;
	};

	if (melody.duration)
		melody.duration =
				(melody.whole_duration / melody.duration);
	else
		melody.duration =
				(melody.whole_duration / melody.note_default_len);

	switch (melody_get_char ()) {
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
	melody.buffer++;

	/* Check for '#' */
	if (melody_get_char () == '#') {
	  if (note != PAUSE)
	  	note++;
	  melody.buffer++;
	}

	/* Check for '.' */
	if (melody_get_char () == '.') {
	  melody.duration += melody.duration/2;
	  melody.buffer++;
	}

	/* Read octave */
	if (isdigit (melody_get_char ())) {
	  octave = melody_get_char () - '0';
	  melody.buffer++;
	} else {
	  octave = melody.octave_default;
	}

	/* Skip ',' or '|' */
	if (melody_get_char () == ',' || melody_get_char () == '|')
	  melody.buffer++;

	tone_on(note, octave);
  }

  if (++melody.ticks >= melody.duration) {
	melody.ticks = 0;
	tone_off ();

	if (melody_get_char () == 0) {
	  melody.buffer = melody.head;
	  if (--melody.count == 0)
		melody_off ();
	}
  }
}

void Tonegen::stop_unsafe (void)
{
  if (melody.count > 0) {
	/*
	 * Tonegen is playing melody 
	 */
	tone_off ();
	melody_off ();

	melody.count = 0;
  }
}
