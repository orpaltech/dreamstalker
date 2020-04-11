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
#include <avr/pgmspace.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>

#include "display.h"
#include "rtclock.h"
#include "shared_file.h"
#include "dreamstalker.h"


/* Min, max, default and invalid values for various configuration properties */

#define WAKEUP_TIMER_DELAY_MIN			3				/* 3min */
#define WAKEUP_TIMER_DELAY_MAX			(4 * 60)		/* 4h */
#define WAKEUP_TIMER_DELAY_DEFAULT		((3 * 60) + 30)	/* 3h 30min */
#define WAKEUP_TIMER_DELAY_INVALID		0


#define IMPLEMENT_CONFIG_PROPERTY(name, type, min_val, max_val, step, default_val)	\
															\
type get_ ## name (void)									\
{															\
	return cfg.name;										\
}															\
type min_ ## name (void)									\
{															\
	return min_val;											\
}															\
type max_ ## name (void)									\
{															\
	return max_val;											\
}															\
type step_ ## name (void)									\
{															\
	return 1;												\
}															\
void set_ ## name (type val)								\
{															\
	if (val <= max_ ## name () && val >= min_ ## name ())	\
		cfg.name = val;										\
}															\
void set_default_ ## name (void)							\
{															\
	cfg.name = default_val;									\
}


#define IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(name, type, min_val, max_val, step, default_val, invalid_val) \
IMPLEMENT_CONFIG_PROPERTY(name, type, min_val, max_val, step, default_val)	\
void set_invalid_ ## name (void)							\
{															\
	cfg.name = invalid_val;									\
}															\
int is_invalid_ ## name (void)								\
{															\
	return (cfg.name == invalid_val);						\
}

#define IMPLEMENT_CONFIG_SIMPLE_PROPERTY(name, type, var, default_val)	\
															\
static type var = default_val;								\
															\
type get_ ## name (void)									\
{															\
	return var;												\
}															\
void set_ ## name (type val)								\
{															\
	var = val;												\
}


#define IMPLEMENT_CONFIG_COUNTER_PROPERTY(name, type)	\
														\
static type v_ ## name = 0;								\
														\
type get_ ## name (void)								\
{														\
	return v_ ## name;									\
}														\
void inc_ ## name (void)								\
{														\
	v_ ## name ++;										\
}														\
void reset_ ## name (void)								\
{														\
	v_ ## name = 0;										\
}


#define IMPLEMENT_CONFIG_FLAG_PROPERTY(name, index, default_val) \
															\
uint8_t get_ ## name (void)									\
{															\
	return get_flag(index);									\
}															\
void set_ ## name (uint8_t new_val)							\
{															\
	if (new_val)											\
		set_flag(index);									\
	else													\
		clear_flag(index);									\
}															\
void toggle_ ## name (void)									\
{															\
	set_ ## name(! get_ ## name ());						\
}															\
void set_default_ ## name (void)							\
{															\
	if (default_val)										\
		set_flag(index);									\
	else													\
		clear_flag(index);									\
}


PROGMEM const uint16_t u_FirmwareVersion = MAKE_VER(1,0);

/*-----------------------------------------------------------------------*/
/* Configuration Functions									 			 */
/*-----------------------------------------------------------------------*/

static
int load_from_file (void);

static
void set_defaults (void)
{
	/*
	 * TODO: Add more lines below in case you declare more flags !!!
	 */
	set_default_before_hints_message();
	set_default_after_hints_message();
	set_default_voice_recording();
	set_default_enh_speaker();
	set_default_alarm_clock();

	/*
	 * TODO: Add more lines below in case you declare more properties !!!
	 */
	set_default_sleep_scenario_playback();
	set_default_relax_tunes_playback();
	set_default_enh_volume_level();
	set_default_remd_sensitivity();
	set_default_duplex_mode();
	set_default_wakeup_mode();
	set_default_vibration_level();
	set_default_hints_frequency();
	set_default_hints_duty_cycle();
	set_default_light_hints_brightness();
	set_default_sound_hints_volume();
	set_default_light_hints_duration();
	set_default_sound_hints_duration();
}

void config_init (void)
{
	if (load_from_file()==0)
	{
		set_defaults();
	}
}

void config_set_defaults (void)
{
	// delete config file and reboot
	f_unlink("config");

	soft_reset();
}


/*-----------------------------------------------------------------------*/
/* System Functions									 			 		 */
/*-----------------------------------------------------------------------*/

void wdt_init (void)
{
	MCUCSR = 0;

	wdt_disable();
}

void soft_reset (void)
{
	do
	{
		wdt_enable(WDTO_15MS);
		for(;;) { }
	} while(0);
}

void pwroff_cycle (void)
{
	EIMSK |= (1<<INT0);		/* enable button interrupt */

	rtc_hide();
	disp_msg(" OFF", 200);
	disp_clear();
	disp_off();

	set_sleep_mode(SLEEP_MODE_PWR_DOWN);
	sleep_mode();

	/* get here after button interrupt */
	EIMSK &= ~(1<<INT0);	/* disable button interrupt */

	disp_on();
	disp_msg("  On", 200);

	soft_reset();
}

uint16_t fw_version (void)
{
	return pgm_read_word_near((uint8_t *)&u_FirmwareVersion);
}

/*-----------------------------------------------------------------------*/
/* Configuration Layout										 	 		 */
/*-----------------------------------------------------------------------*/

typedef struct s_dreamstalker_config {

	/*
	 * TODO: increase number of bytes, if more flags are needed
	 */
	uint8_t 	flags[1];

	/*
	 * TODO: add more members if you create new properties
	 */
	uint16_t	wakeup_timer_delay;
	uint8_t 	sleep_scenario_playback;
	uint8_t 	relax_tunes_playback;
	uint8_t		enh_volume_level;
	uint8_t		remd_sensitivity;
	uint8_t		duplex_mode;
	uint8_t		wakeup_mode;
	uint8_t		vibration_level;
	uint8_t		hints_frequency;
	uint8_t		hints_duty_cycle;
	uint8_t		light_hints_brightness;
	uint8_t		sound_hints_volume;
	uint8_t		light_hints_duration;
	uint8_t		sound_hints_duration;

} dreamstalker_config_t;

static dreamstalker_config_t cfg;

/*-----------------------------------------------------------------------*/
/* Flags management									 			 		 */
/*-----------------------------------------------------------------------*/

//Set one flag based on the index
static
void set_flag(uint8_t index)
{
	cfg.flags[index/8] |= 0x1 << (index % 8);
}

//Clear one flag based on the index
static
void clear_flag(uint8_t index)
{
	cfg.flags[index/8] &= ~(0x1 << (index % 8));
}

//Check whether a flag is set
static
int get_flag(uint8_t index)
{
    return (cfg.flags[index/8] & (0x1 << (index % 0x8))) != 0;
}

/*-----------------------------------------------------------------------*/
/* Configuration Functions							 			 		 */
/*-----------------------------------------------------------------------*/

int load_from_file (void)
{
	if (f_open(&shared_fp, "config", FA_READ) != FR_OK)	/* open config file */
		return 0;

	f_read(&shared_fp, &cfg, sizeof(cfg), &brw);
	f_close(&shared_fp);
	return 1;
}

/*-----------------------------------------------------------------------*/
/* Configuration Properties									 			 */
/*-----------------------------------------------------------------------*/

IMPLEMENT_CONFIG_FLAG_PROPERTY(before_hints_message, 0, 0)
IMPLEMENT_CONFIG_FLAG_PROPERTY(after_hints_message, 1, 0)
IMPLEMENT_CONFIG_FLAG_PROPERTY(voice_recording, 2, 0)
IMPLEMENT_CONFIG_FLAG_PROPERTY(enh_speaker, 3, 1)
IMPLEMENT_CONFIG_FLAG_PROPERTY(alarm_clock, 4, 0)
IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(wakeup_timer_delay, uint16_t, WAKEUP_TIMER_DELAY_MIN, WAKEUP_TIMER_DELAY_MAX, 1, WAKEUP_TIMER_DELAY_DEFAULT, WAKEUP_TIMER_DELAY_INVALID)
IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(sleep_scenario_playback, uint8_t, 1, 9, 1, 1, 0)
IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(relax_tunes_playback, uint8_t, 1, 9, 1, 1, 0)
IMPLEMENT_CONFIG_PROPERTY(vibration_level, uint8_t, 1, 10, 1, 5)
IMPLEMENT_CONFIG_PROPERTY(enh_volume_level, uint8_t, 1, 9, 1, 3)
IMPLEMENT_CONFIG_PROPERTY(remd_sensitivity, uint8_t, 1, 20, 1, 5)
IMPLEMENT_CONFIG_PROPERTY(duplex_mode, uint8_t, 0, 3, 1, 0)
IMPLEMENT_CONFIG_PROPERTY(wakeup_mode, uint8_t, 0, 3, 1, 1)
IMPLEMENT_CONFIG_PROPERTY(hints_frequency, uint8_t, 1, 10, 1, 2)
IMPLEMENT_CONFIG_PROPERTY(hints_duty_cycle, uint8_t, 10, 90, 1, 40)
IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(light_hints_brightness, uint8_t, 1, 100, 1, 15, 0)
IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(sound_hints_volume,	uint8_t, 1, 100, 1, 20, 0)
IMPLEMENT_CONFIG_PROPERTY(light_hints_duration, uint8_t, 1, 120, 1, 10)
IMPLEMENT_CONFIG_PROPERTY(sound_hints_duration, uint8_t, 1, 120, 1, 10)

IMPLEMENT_CONFIG_COUNTER_PROPERTY(trigger_counter, uint8_t)

