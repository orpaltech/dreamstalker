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
#include <avr/pgmspace.h>

#include <util/delay.h>

#include "../rtclock.h"
#include "sound.h"

/* Peripheral controls (Platform dependent) */
#define DD_SOUND		_BV(DDB5)			/* output line: PWM sound */
#define DDR_SOUND		DDRB
#define PORT_SOUND		PORTB

#define BIT_SOUND		PB5
#define BV_SOUND		_BV(BIT_SOUND)


// Clock Select Bit Description (page 136)
//----------------------------------------
//	CS12	CS11	CS10	Meaning
//----------------------------------------
//	0		0		0		No clock source / timer is off
//	0		0		1		No prescaling, F_CPU/1
//	0		1		0		F_CPU/8
//	0		1		1		F_CPU/64
//	1		0		0		F_CPU/256
//	1		0		1		F_CPU/1024
//

#define	TGEN_N_1			_BV(CS10)
#define	TGEN_N_8			_BV(CS11)
#define	TGEN_N_64			(_BV(CS11) | _BV(CS10))
#define	TGEN_N_256			_BV(CS12)
#define	TGEN_N_1024			(_BV(CS12) | _BV(CS10))

#define TGEN_N(n)			TGEN_N_ ## n

#define TGEN_N_SET(N)		TCCR1B = (TCCR1B & ~(_BV(CS12) | _BV(CS11) | _BV(CS10))) | (N)

#define TCCR1A_FAST_PWM_8	_BV(WGM10)
#define TCCR1B_FAST_PWM_8	_BV(WGM12)

#define TCCR1A_FAST_PWM_10	(_BV(WGM11) | _BV(WGM10))
#define TCCR1B_FAST_PWM_10	_BV(WGM12)

#define TCCR1A_PWM_PC_8		_BV(WGM10)					// PWM Phase Correct, 8bit
#define TCCR1B_PWM_PC_8		(0)
#define TCCR1A_PWM_PC_10	(_BV(WGM11) | _BV(WGM10)) 	// PWM Phase Correct, 10bit
#define TCCR1B_PWM_PC_10	(0)
#define TCCR1A_PWM_PFC		_BV(WGM10)					// PWM Phase and Frequency Correct
#define TCCR1B_PWM_PFC		_BV(WGM13)

typedef struct s_note {
	uint8_t OCRxn; // 0..255
	uint8_t N;
} note_t;

typedef struct s_octave {
	note_t note_C;
	note_t note_CS;
	note_t note_D;
	note_t note_DS;
	note_t note_E;
	note_t note_F;
	note_t note_FS;
	note_t note_G;
	note_t note_GS;
	note_t note_A;
	note_t note_AS;
	note_t note_B;
} octave_t;

/*
 All calculations below are prepared for ATmega128 at clock frequency 8MHz
 F = F_CPU / (2 * N * (1 + OCRnx)), where:
 - F is a calculated PWM frequency
 - F_CPU is a clock source
 - the N variable represents the prescaler factor (1, 8, 64, 256, or 1024).
 */

PROGMEM const octave_t octaves[8] = {
	{
		.note_C = { 238, TGEN_N(1024) },		// 16.352 Hz
		.note_CS = { 224, TGEN_N(1024) },		// 17.324 Hz
		.note_D = { 212, TGEN_N(1024) },		// 18.354 Hz
		.note_DS = { 200, TGEN_N(1024) },		// 19.445 Hz
		.note_E = { 189, TGEN_N(1024) },		// 20.602 Hz
		.note_F = { 178, TGEN_N(1024) },		// 21.827 Hz
		.note_FS = { 168, TGEN_N(1024) },		// 23.125 Hz
		.note_G = { 158, TGEN_N(1024) },		// 24.500 Hz
		.note_GS = { 149, TGEN_N(1024) },		// 25.957 Hz
		.note_A = { 141, TGEN_N(1024) },		// 27.500 Hz
		.note_AS = { 133, TGEN_N(1024) },		// 29.135 Hz
		.note_B = { 126, TGEN_N(1024) },		// 30.868 Hz
	},

	{
		.note_C = { 118, TGEN_N(1024) },	// 32.703 Hz
		.note_CS = { 112, TGEN_N(1024) },	// 34.648 Hz
		.note_D = { 105, TGEN_N(1024) },	// 36.708 Hz
		.note_DS = { 99, TGEN_N(1024) },	// 38.891 Hz
		.note_E = { 94, TGEN_N(1024) },		// 41.203 Hz
		.note_F = { 88, TGEN_N(1024) },		// 43.654 Hz
		.note_FS = { 83, TGEN_N(1024) },	// 46.249 Hz
		.note_G = { 79, TGEN_N(1024) },		// 48.999 Hz
		.note_GS = { 74, TGEN_N(1024) },	// 51.913 Hz
		.note_A = { 70, TGEN_N(1024) },		// 55.000 Hz
		.note_AS = { 66, TGEN_N(1024) },	// 58.270 Hz
		.note_B = { 62, TGEN_N(1024) },		// 61.735 Hz
	},

	{
		.note_C = { 238, TGEN_N(256) },		// 65.406 Hz
		.note_CS = { 224, TGEN_N(256) },	// 69.296 Hz
		.note_D = { 212, TGEN_N(256) },		// 73.416 Hz
		.note_DS = { 200, TGEN_N(256) },	// 77.782 Hz
		.note_E = { 189, TGEN_N(256) },		// 82.407 Hz
		.note_F = { 178, TGEN_N(256) },		// 87.307 Hz
		.note_FS = { 168, TGEN_N(256) },	// 92.499 Hz
		.note_G = { 155, TGEN_N(256) },		// 99.999 Hz
		.note_GS = { 149, TGEN_N(256) },	// 103.83 Hz
		.note_A = { 141, TGEN_N(256) },		// 110.00 Hz
		.note_AS = { 133, TGEN_N(256) },	// 116.54 Hz
		.note_B = { 126, TGEN_N(256) },		// 123.47 Hz
	},

	{
		.note_C = { 118, TGEN_N(256) },		// 130.81 Hz
		.note_CS = { 112, TGEN_N(256) },	// 138.59 Hz
		.note_D = { 105, TGEN_N(256) },		// 146.83 Hz
		.note_DS = { 99, TGEN_N(256) },		// 155.56 Hz
		.note_E = { 94, TGEN_N(256) },		// 164.81 Hz
		.note_F = { 88, TGEN_N(256) },		// 174.61 Hz
		.note_FS = { 83, TGEN_N(256) },		// 185.00 Hz
		.note_G = { 79, TGEN_N(256) },		// 196.00 Hz
		.note_GS = { 74, TGEN_N(256) },		// 207.65 Hz
		.note_A = { 70, TGEN_N(256) },		// 220.00 Hz
		.note_AS = { 66, TGEN_N(256) },		// 233.08 Hz
		.note_B = { 62, TGEN_N(256) },		// 246.94 Hz
	},

	{
		.note_C = { 238, TGEN_N(64) },		// 261.63 Hz
		.note_CS = { 224, TGEN_N(64) },		// 277.18 Hz
		.note_D = { 212, TGEN_N(64) },		// 293.66 Hz
		.note_DS = { 200, TGEN_N(64) },		// 311.13 Hz
		.note_E = { 189, TGEN_N(64) },		// 329.63 Hz
		.note_F = { 178, TGEN_N(64) },		// 349.23 Hz
		.note_FS = { 168, TGEN_N(64) },		// 369.99 Hz
		.note_G = { 158, TGEN_N(64) },		// 392.00 Hz
		.note_GS = { 149, TGEN_N(64) },		// 415.30 Hz
		.note_A = { 141, TGEN_N(64) },		// 440.00 Hz
		.note_AS = { 133, TGEN_N(64) },		// 466.16 Hz
		.note_B = { 126, TGEN_N(64) },		// 493.88 Hz
	},

	{
		.note_C = { 118, TGEN_N(64) },		// 523.25 Hz
		.note_CS = { 112, TGEN_N(64) },		// 554.37 Hz
		.note_D = { 105, TGEN_N(64) },		// 587.33 Hz
		.note_DS = { 99, TGEN_N(64) },		// 622.25 Hz
		.note_E = { 94, TGEN_N(64) },		// 659.26 Hz
		.note_F = { 88, TGEN_N(64) },		// 698.46 Hz
		.note_FS = { 83, TGEN_N(64) },		// 739.99 Hz
		.note_G = { 79, TGEN_N(64) },		// 783.99 Hz
		.note_GS = { 74, TGEN_N(64) },		// 830.61 Hz
		.note_A = { 70, TGEN_N(64) },		// 880.00 Hz
		.note_AS = { 66, TGEN_N(64) },		// 932.33 Hz
		.note_B = { 62, TGEN_N(64) },		// 987.77 Hz
	},

	{
		.note_C = { 59, TGEN_N(64) },		// 1046.50 Hz
		.note_CS = { 55, TGEN_N(64) },		// 1108.73 Hz
		.note_D = { 52, TGEN_N(64) },		// 1174.66 Hz
		.note_DS = { 49, TGEN_N(64) },		// 1244.51 Hz
		.note_E = { 46, TGEN_N(64) },		// 1318.51 Hz
		.note_F = { 44, TGEN_N(64) },		// 1396.91 Hz
		.note_FS = { 41, TGEN_N(64) },		// 1479.98 Hz
		.note_G = { 39, TGEN_N(64) },		// 1567.98 Hz
		.note_GS = { 37, TGEN_N(64) },		// 1661.22 Hz
		.note_A = { 35, TGEN_N(64) },		// 1760.00 Hz
		.note_AS = { 33, TGEN_N(64) },		// 1864.66 Hz
		.note_B = { 31, TGEN_N(64) },		// 1975.53 Hz
	},

	{
		.note_C = { 238, TGEN_N(8) },		// 2093.00 Hz
		.note_CS = { 224, TGEN_N(8) },		// 2217.46 Hz
		.note_D = { 212, TGEN_N(8) },		// 2349.32 Hz
		.note_DS = { 200, TGEN_N(8) },		// 2489.02 Hz
		.note_E = { 189, TGEN_N(8) },		// 2637.02 Hz
		.note_F = { 178, TGEN_N(8) },		// 2793.83 Hz
		.note_FS = { 168, TGEN_N(8) },		// 2959.96 Hz
		.note_G = { 158, TGEN_N(8) },		// 3135.96 Hz
		.note_GS = { 149, TGEN_N(8) },		// 3322.44 Hz
		.note_A = { 141, TGEN_N(8) },		// 3520.00 Hz
		.note_AS = { 133, TGEN_N(8) },		// 3729.31 Hz
		.note_B = { 126, TGEN_N(8) },		// 3951.07 Hz
	},
};

static volatile uint16_t u_ToneTicks = 0;

static
void tone_off (void)
{
	TGEN_N_SET(0);
}

static
void tone_on(uint8_t octave, uint8_t note)
{
	uint16_t ret;
	note_t *nt;

	ret = pgm_read_word_near((uint8_t *)&octaves + sizeof(octave_t) * octave + sizeof(note_t) * note);
	nt = (note_t *)&ret;

  	OCR1A = (nt->OCRxn - 1);	/* set the OCRnx */
  	TGEN_N_SET(nt->N);
}

void tonegen_isr (void)
{
	if (u_ToneTicks == 0)
		return;
	else if (--u_ToneTicks == 0)
		tone_off();
}

void tonegen_init (void)
{
	DDR_SOUND	|= DD_SOUND;	/* output line: PWM sound */
	PORT_SOUND	&= ~BV_SOUND;	/* PWM output low */

	/* Disable timer1 interrupts */
	TIMSK &= ~(_BV(OCIE1A) | _BV(TOIE1) | _BV(TICIE1));

	/* Clear OC1A on compare match, set OC1A at BOTTOM (non-inverting mode) */
	TCCR1A = (_BV(COM1A1) | TCCR1A_FAST_PWM_8); /* set timer mode to Fast PWM */
	TCCR1B = TCCR1B_FAST_PWM_8;
}

void tonegen_beep (int millisec)
{
	if (u_ToneTicks)
		return;
	u_ToneTicks = (millisec) / RTC_INTERVAL_MSEC;

	tone_on(6, 7);
}

