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
#include <util/delay.h>

#include "batmon.h"
#include "core/adc_avr.h"
#include "display.h"
//#include "timers.h"
#include "deferred.h"



/* Peripheral controls (Platform dependent) */

#define BATTERY_FULL_ADC_LEVEL		0x180

#define MEASURE_PERIOD_MS			(1000UL * 60)	/* milliseconds*/

static volatile uint16_t battery_level	= 0;

static volatile uint16_t timer_ticks = 0;

static uint8_t batmon_status = 0;

/*-----------------------------------------------------------------------*/
static
void batmon_adc_isr(adc_context_t *padc, uint16_t sample)
{
	if (battery_level)
		battery_level = ((uint32_t) battery_level + sample) / 2;
	else
		battery_level = sample;
}

static
void run_conv (void)
{
	adc_run(2, batmon_adc_isr);
}

static
void stop_conv (void)
{
	adc_stop();
}

static
int is_conv (void)
{
	return adc_is_running();
}

static
uint16_t get_battery_level()
{
	return 100U * battery_level / BATTERY_FULL_ADC_LEVEL;
}

static
uint32_t conv_duration_ms()
{
	/* A normal conversion takes 13 ADC clock cycles.
	 * Let ADC take 32 samples.
	 */
	return (1000UL * 13 * 32) / adc_get_rate();
}

void batmon_isr (void)	/* called every 1 millisec */
{
	timer_ticks = (timer_ticks + 1) % MEASURE_PERIOD_MS;
	if (timer_ticks == 0) {
		/* check battery level once a minute */

		battery_level = 0;	/* start check */

		run_conv();
	}
	else if (batmon_status && is_conv()
			&& timer_ticks > conv_duration_ms()) {
		stop_conv();

		if (get_battery_level() < BATTERY_75_FULL)
			disp_text("btLo");
	}
}


/*-----------------------------------------------------------------------*/
void batmon_start (void)
{
	/* check every minute */
	//timer2_on(batmon_isr, 1000UL * 60);
	batmon_status = 1;
}

void batmon_stop (void)
{
	//timer2_off(batmon_isr);
	batmon_status = 0;
}

int batmon_get_battery_level (void)
{
	battery_level = 0;	/* start check */

	run_conv();
	_delay_ms(conv_duration_ms());
	stop_conv();

	return get_battery_level();
}
