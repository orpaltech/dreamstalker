/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2019	ORPAL Technologies, Inc.
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

#ifndef _VS10XX_MCU_DEFINED
#define _VS10XX_MCU_DEFINED

#include <avr/io.h>

/*
 * NOTE: This header MUST be updated according to the hardware installed
 */

#define VS_XTAL_FREQ		12288000		/* XTAL frequency fixed in the board */
#define VS_USE_CLK_DOUBLER	1				/* 1 - XTAL frequency will be multiplied by 2 */

/* MCU -> Vs1002D control definitions											 */
/* NOTE: values below MUST be redefined according to your hardware configuration */

#define DD_DREQ			_BV(DDB4)			/* data request line */
#define DD_XCS			_BV(DDB6)			/* SSI select line	*/
#define DD_XDCS			_BV(DDB7)			/* SDI select line	*/
#define DD_XRST			_BV(DDE7)			/* hardware reset	*/

#define	PINS_DREQ		PINB

#define BIT_DREQ		PB4
#define BIT_XCS			PB6
#define BIT_XDCS		PB7
#define BIT_XRST		PE7

#define XRST_LOW()		PORTE &= ~(1<<BIT_XRST)
#define XRST_HIGH()		PORTE |= (1<<BIT_XRST)

#define XDCS_LOW()		PORTB &= ~(1<<BIT_XDCS)
#define XDCS_HIGH()		PORTB |= (1<<BIT_XDCS)

#define XCS_LOW()		PORTB &= ~(1<<BIT_XCS)
#define XCS_HIGH()		PORTB |= (1<<BIT_XCS)

/* MCU ports data direction setup */
#define VS_DD_SETUP()	DDRE |= DD_XRST;			\
						DDRB |= (DD_XCS | DD_XDCS); \
						DDRB &= ~DD_DREQ


#endif // _VS10XX_MCU_DEFINED
