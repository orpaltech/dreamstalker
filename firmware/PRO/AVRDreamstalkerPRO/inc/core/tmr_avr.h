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

#ifndef _TIMERS_AVR_DEFINED
#define _TIMERS_AVR_DEFINED



/* ------------------------------------------------------------------------- */
/* TIMER 1																	 */
/* ------------------------------------------------------------------------- */

// Clock Select Bit Description (page 136/157)
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

#define	T1_N_1			_BV(CS10)
#define	T1_N_8			_BV(CS11)
#define	T1_N_64			(_BV(CS11) | _BV(CS10))
#define	T1_N_256		_BV(CS12)
#define	T1_N_1024		(_BV(CS12) | _BV(CS10))

#define TMR1_SET_N(N)	TCCR1B = ((TCCR1B & ~(_BV(CS12)|_BV(CS11)|_BV(CS10))) | (0x07 & (N)))


#if defined (__AVR_ATmega128__)

/* ------------------------------------------------------------------------- */
/* TIMER/COUNTER 2															 */
/* ------------------------------------------------------------------------- */

// Clock Select Bit Description (page 157)
//----------------------------------------
//	CS22	CS21	CS20	Meaning
//----------------------------------------
//	0		0		0		No clock source / timer is off
//	0		0		1		No prescaling, F_CPU
//	0		1		0		F_CPU/8			    1 MHz
//	0		1		1		F_CPU/64		    125 KHz
//	1		0		0		F_CPU/256		    31250 Hz
//	1		0		1		F_CPU/1024		    7812.5 Hz

#define	T2_N_1			_BV(CS20)
#define	T2_N_8			_BV(CS21)
#define	T2_N_64			(_BV(CS21) | _BV(CS20))
#define	T2_N_256		_BV(CS22)
#define	T2_N_1024		(_BV(CS22) | _BV(CS20))

#define TMR2_SET_N(N)	TCCR2 = ((TCCR2 & ~(_BV(CS22) | _BV(CS21) | _BV(CS20))) | (0x07 & (N)))
#define TMR2_OFF()		TMR2_SET_N(0)

#elif defined (__AVR_ATmega1281__)

/* ------------------------------------------------------------------------- */
/* TIMER/COUNTER 4													         */
/* ------------------------------------------------------------------------- */

// Clock Select Bit Description (page 136/157)
//----------------------------------------
//	CS42	CS41	CS40	Meaning
//----------------------------------------
//	0		0		0		No clock source / timer is off
//	0		0		1		F_CPU, No prescaling
//	0		1		0		F_CPU/8
//	0		1		1		F_CPU/64
//	1		0		0		F_CPU/256
//	1		0		1		F_CPU/1024
//

#define	T4_N_1          _BV(CS40)                   // No prescaler
#define	T4_N_8          _BV(CS41)                   // F_CPU/8
#define	T4_N_64         (_BV(CS41) | _BV(CS40))     // F_CPU/64
#define	T4_N_256        _BV(CS42)                   // F_CPU/256
#define	T4_N_1024       (_BV(CS42) | _BV(CS40))     // F_CPU/1024

#define TMR4_SET_N(N)	TCCR4B = ((TCCR4B & ~(_BV(CS42)|_BV(CS41) |_BV(CS40))) | (0x07 & (N)))
#define TMR4_OFF()		TMR4_SET_N(0)

#endif

/* ------------------------------------------------------------------------- */
/* TIMER/COUNTER 3															 */
/* ------------------------------------------------------------------------- */

// Clock Select Bit Description (page 136/157)
//----------------------------------------
//	CS32	CS31	CS30	Meaning
//----------------------------------------
//	0		0		0		No clock source / timer is off
//	0		0		1		F_CPU, No prescaling
//	0		1		0		F_CPU/8
//	0		1		1		F_CPU/64
//	1		0		0		F_CPU/256
//	1		0		1		F_CPU/1024
//

#define	T3_N_1			_BV(CS30)
#define	T3_N_8			_BV(CS31)
#define	T3_N_64			(_BV(CS31) | _BV(CS30))
#define	T3_N_256		_BV(CS32)
#define	T3_N_1024		(_BV(CS32) | _BV(CS30))

#define TMR3_SET_N(N)	TCCR3B = ((TCCR3B & ~(_BV(CS32)|_BV(CS31) |_BV(CS30))) | (0x07 & (N)))
#define TMR3_OFF()		TMR3_SET_N(0)

/* Fast PWM resolution modes: 8,9 or 10 bits */
#define TCCR3A_FPWM_8		_BV(WGM30)
#define TCCR3B_FPWM_8		_BV(WGM32)

#define TCCR3A_FPWM_9		_BV(WGM31)
#define TCCR3B_FPWM_9		_BV(WGM32)

#define TCCR3A_FPWM_10		(_BV(WGM31) | _BV(WGM30))
#define TCCR3B_FPWM_10		_BV(WGM32)

/* Selecting Fast PWM resolution with parameter */
#define TCCR3A_FPWM_N(n)	TCCR3A_FPWM_ ## n
#define TCCR3A_FPWM_(n)		TCCR3A_FPWM_N(n)

#define TCCR3B_FPWM_N(n)	TCCR3B_FPWM_ ## n
#define TCCR3B_FPWM_(n)		TCCR3B_FPWM_N(n)

/* Timer/Counter 3 TOP values for all Fast PWM resolutions */
#define TMR3_OCR_TOP_8		(0xFFU)
#define TMR3_OCR_TOP_9		(0x1FFU)
#define TMR3_OCR_TOP_10		(0x3FFU)

#define	TMR3_OCR_TOP_N(n)	TMR3_OCR_TOP_ ## n
#define	TMR3_OCR_TOP_(n)	TMR3_OCR_TOP_N(n)



#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

#endif // _TIMERS_AVR_DEFINED
