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

#ifndef _ADC_AVR_DEFINED
#define _ADC_AVR_DEFINED

#include <avr/power.h>

#ifdef __cplusplus
extern "C" {
#endif


typedef struct s_adc_context adc_context_t;

typedef void (*pfn_adc_isr)(adc_context_t *, uint16_t);

struct s_adc_context {
	uint8_t status;
	uint8_t channel;
	pfn_adc_isr pfisr;
};

/*-----------------------------------------------------------------------*/
/* ADC Functions									 	 		 		 */
/*-----------------------------------------------------------------------*/

int adc_init (void) ;

uint32_t adc_get_rate (void);

int adc_run (int channel, pfn_adc_isr pfisr) ;
void adc_stop (void) ;
int adc_is_running (void);


#ifdef __cplusplus
}
#endif

#endif // _ADC_AVR_DEFINED
