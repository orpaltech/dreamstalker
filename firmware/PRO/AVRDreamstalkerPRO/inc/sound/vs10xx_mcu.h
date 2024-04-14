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

#ifndef _VS10XX_MCU_DEFINED
#define _VS10XX_MCU_DEFINED

#include <stdbool.h>
#include <avr/io.h>

/*
 * NOTE: This header MUST be updated according to the hardware specifics
 */

#define WAV_FORMAT_IMA_ADPCM	0x11

#define ADPCM_SAMPLE_RATE	8000UL
#define ADPCM_BLOCK_ALIGN	256UL
#define ADPCM_BITS_PER_SAMPLE	4
/* Number of samples per channel per Block */
#define ADPCM_SAMPLES_PER_BLOCK (ADPCM_BLOCK_ALIGN*2-7)
#define ADPCM_USE_HP_FILTER	0


/* MCU -> Vs10xx control definitions											 */
/* NOTE: values below MUST be redefined according to your hardware configuration */

#define DD_DREQ		_BV(DDB4)			/* data request line */
#define DD_XCS		_BV(DDB6)			/* SSI select line	*/
#define DD_XDCS		_BV(DDB7)			/* SDI select line	*/
#define DD_XRST		_BV(DDE7)			/* hardware reset	*/

#define	PINS_DREQ	PINB
#define BIT_DREQ	PB4

#define PF_XCS		_BV(PB6)
#define PF_XDCS		_BV(PB7)
#define PF_XRST		_BV(PE7)

#define XRST_LO()		PORTE &= ~PF_XRST
#define XRST_HI()		PORTE |= PF_XRST

#define XDCS_LO()		PORTB &= ~PF_XDCS
#define XDCS_HI()		PORTB |= PF_XDCS

#define XCS_LO()		PORTB &= ~PF_XCS
#define XCS_HI()		PORTB |= PF_XCS

/* MCU ports data direction setup */
#define VS_DD_SETUP()	DDRE |= DD_XRST;			\
						DDRB |= (DD_XCS | DD_XDCS); \
						DDRB &= ~DD_DREQ

#ifdef __cplusplus
extern "C" {
#endif

void vs_wait_for_dreq (void);
bool vs_is_dreq (void);

#ifdef __cplusplus
}
#endif


#endif // _VS10XX_MCU_DEFINED
