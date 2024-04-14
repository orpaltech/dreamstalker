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

#ifndef _AVR_ADC_DEFINED
#define _AVR_ADC_DEFINED

#include <stdbool.h>
#include <avr/power.h>

/*-----------------------------------------------------------------------*/

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*pfn_adc_callback)(uint16_t sample);

typedef enum adc_channel_flag {
    ADC_CF_VREF_256  = 0x0001,
    ADC_CF_LEFT_ADJUST = 0x0002,
} adc_channel_flag_t;

/*-----------------------------------------------------------------------*/
/* ADC Functions									 	 		 		 */
/*-----------------------------------------------------------------------*/

bool adc_enable (void) ;
void adc_disable (void) ;

void adc_warm_up (void) ;

uint32_t adc_get_rate (void);

bool adc_setup_channel(uint8_t channel, uint16_t flags);

bool adc_start (uint8_t channel, int num_samples, pfn_adc_callback pfcb) ;
void adc_stop (uint8_t channel) ;
bool adc_is_running (uint8_t channel);


#ifdef __cplusplus
}
#endif

#endif // _AVR_ADC_DEFINED
