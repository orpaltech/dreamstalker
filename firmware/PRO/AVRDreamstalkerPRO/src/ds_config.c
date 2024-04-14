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

#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>
#include <util/delay.h>

#include "core/adc_avr.h"
#include "display/ds_display.h"
#include "sound/ds_sound.h"
#include "ds_config.h"
#include "ds_batmon.h"
#include "ds_keybrd.h"
#include "ds_rtclk.h"
#include "ds_sdcard.h"
#include "ds_util.h"
#include "shared_file.h"


/* Min, max, default and invalid values for various configuration properties */

#define WAKEUP_TIMER_DELAY_MIN			3				/* 3min */
#define WAKEUP_TIMER_DELAY_MAX			(4 * 60)		/* 4h */
#define WAKEUP_TIMER_DELAY_DEFAULT		((3 * 60) + 30)	/* 3h 30min */
#define WAKEUP_TIMER_DELAY_INVALID		0


#define IMPLEMENT_CONFIG_PROPERTY_GET(name, min_val, max_val, step, default_val)	\
											\
name ## _t get_ ## name (void)				\
{											\
	return cfg.props.name;					\
}											\
name ## _t min_ ## name (void)				\
{											\
	return min_val;							\
}											\
name ## _t max_ ## name (void)				\
{											\
	return max_val;							\
}											\
name ## _t step_ ## name (void)				\
{											\
	return 1;								\
}											\
name ## _t get_default_ ## name (void)		\
{											\
	return default_val;						\
}											\
bool is_readonly_ ## name (void)			\
{											\
	return cfg.states.name ## __RO != 0;	\
}											\
void set_readonly_ ## name (bool val)		\
{											\
	cfg.states.name ## __RO = val;			\
}


#define IMPLEMENT_CONFIG_PROPERTY(name, min_val, max_val, step, default_val)	\
IMPLEMENT_CONFIG_PROPERTY_GET(name, min_val, max_val, step, default_val)	\
															\
void set_ ## name (name ## _t val)							\
{															\
	if (val <= max_ ## name () && val >= min_ ## name ())	\
		cfg.props.name = val;								\
}															\
void set_default_ ## name (void)							\
{															\
	set_ ## name (get_default_ ## name ());					\
}


#define IMPLEMENT_CONFIG_PROPERTY_GET_WITH_INVALID(name, min_val, max_val, step, default_val, invalid_val)	\
IMPLEMENT_CONFIG_PROPERTY_GET(name, min_val, max_val, step, default_val)	\
											\
name ## _t get_invalid_ ## name (void)		\
{											\
	return invalid_val;						\
}											\
bool is_invalid_ ## name (void)				\
{											\
	return (cfg.props.name == invalid_val);	\
}


#define IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(name, min_val, max_val, step, default_val, invalid_val)	\
IMPLEMENT_CONFIG_PROPERTY(name, min_val, max_val, step, default_val)	\
											\
void set_invalid_ ## name (void)			\
{											\
	cfg.props.name = invalid_val;			\
}											\
name ## _t get_invalid_ ## name (void)		\
{											\
	return invalid_val;						\
}											\
bool is_invalid_ ## name (void)				\
{											\
	return (cfg.props.name == invalid_val);	\
}


#define IMPLEMENT_CONFIG_SIMPLE_PROPERTY(name, var, default_val)	\
										\
static name ## _t var = default_val;	\
										\
name ## _t get_ ## name (void)			\
{										\
	return var;							\
}										\
void set_ ## name (name ## _t val)		\
{										\
	var = val;							\
}


#define IMPLEMENT_CONFIG_COUNTER_PROPERTY(name)	\
									\
static name ## _t v_ ## name = 0;	\
									\
name ## _t	get_ ## name (void)		\
{									\
	return v_ ## name;				\
}									\
void inc_ ## name (void)			\
{									\
	v_ ## name ++;					\
}									\
void reset_ ## name (void)			\
{									\
	v_ ## name = 0;					\
}


#define IMPLEMENT_CONFIG_BOOL_PROPERTY(name, default_val) 	\
										\
bool get_ ## name (void)				\
{										\
	return cfg.props.name != 0;			\
}										\
void set_ ## name (bool new_val)		\
{										\
	if (new_val)						\
		cfg.props.name = 1;				\
	else								\
		cfg.props.name = 0;				\
}										\
void toggle_ ## name (void)				\
{										\
	set_ ## name(! get_ ## name ());	\
}										\
void set_default_ ## name (void)		\
{										\
	if (default_val)					\
		cfg.props.name = 1;				\
	else								\
		cfg.props.name = 0;				\
}


/*-----------------------------------------------------------------------*/
PROGMEM const uint16_t u_FirmwareVersion = MAKE_VER ( 1,2 );


/*-----------------------------------------------------------------------*\
 * Configuration Types
\*-----------------------------------------------------------------------*/

typedef struct s_ds_config_props {

	uint8_t before_hints_message : 1;
	uint8_t	after_hints_message : 1;
	uint8_t	voice_recording : 1;
	uint8_t	loud_speaker : 1;
	uint8_t	alarm_clock : 1;


	/*
	 * TODO: add more members if you create new properties
	 */
	wakeup_timer_delay_t		wakeup_timer_delay;
	sleep_scenario_playback_t 	sleep_scenario_playback;
	relax_tunes_playback_t 		relax_tunes_playback;
	music_volume_level_t		music_volume_level;
	recording_gain_level_t		recording_gain_level;
	remd_sensitivity_t			remd_sensitivity;
	duplex_mode_t				duplex_mode;
	wakeup_mode_t				wakeup_mode;
	vibration_level_t			vibration_level;
	hints_frequency_t			hints_frequency;
	hints_duty_cycle_t			hints_duty_cycle;
	light_hints_brightness_t	light_hints_brightness;
	sound_hints_volume_t		sound_hints_volume;
	light_hints_duration_t		light_hints_duration;
	sound_hints_duration_t		sound_hints_duration;

} ds_config_props_t;

typedef struct s_ds_config_states {

	uint8_t	wakeup_timer_delay__RO : 1;
	uint8_t sleep_scenario_playback__RO : 1;
	uint8_t relax_tunes_playback__RO : 1;
	uint8_t	music_volume_level__RO : 1;
	uint8_t	recording_gain_level__RO : 1;
	uint8_t	remd_sensitivity__RO : 1;
	uint8_t	duplex_mode__RO : 1;
	uint8_t	wakeup_mode__RO : 1;
	uint8_t	vibration_level__RO : 1;
	uint8_t	hints_frequency__RO : 1;
	uint8_t	hints_duty_cycle__RO : 1;
	uint8_t	light_hints_brightness__RO : 1;
	uint8_t	sound_hints_volume__RO : 1;
	uint8_t	light_hints_duration__RO : 1;
	uint8_t	sound_hints_duration__RO : 1;

} ds_config_states_t;

typedef struct s_ds_config {
	uint16_t signature;
	ds_config_props_t props;
	ds_config_states_t states;
} ds_config_t;


/*-----------------------------------------------------------------------*\
 * Storage Functions
\*-----------------------------------------------------------------------*/

#define CONFIG_FILE		1
#define CONFIG_EEPROM	2

#ifndef DS_CONFIG_STORAGE
#define DS_CONFIG_STORAGE	CONFIG_FILE
#endif

/* IMPORTANT: signature must be updated after every change 
 *			made to the configuration layout !!!
 */
#define CONFIG_SIGNATURE	0x8002

static 
bool load_from_storage (void);
static 
void save_to_storage (void);
static
void erase_storage ();

#if ( DS_CONFIG_STORAGE == CONFIG_EEPROM )
EEMEM static ds_config_t eeprom_cfg;
#endif

/*-----------------------------------------------------------------------*/
static ds_config_t cfg;

/*-----------------------------------------------------------------------*\
 * Configuration Functions
\*-----------------------------------------------------------------------*/

static
void set_defaults (void)
{
	/*
	 * TODO: Add more lines below if you need more flags !!!
	 */
	set_default_before_hints_message();
	set_default_after_hints_message();
	set_default_voice_recording();
	set_default_loud_speaker();
	set_default_alarm_clock();

	/*
	 * TODO: Add more lines below if you need more properties !!!
	 */
	set_default_sleep_scenario_playback();
	set_default_relax_tunes_playback();
	set_default_music_volume_level();
	set_default_recording_gain_level();
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

	/*
	 * TODO: Add more lines below to control read-only status !!!
	 */
	set_readonly_music_volume_level(false);
	set_readonly_vibration_level(false);
	set_readonly_recording_gain_level(false);
}

void config_init (void)
{
	if (load_from_storage() == false)
	{
		set_defaults();

		save_to_storage ();
	}
}

void config_set_defaults (void)
{
	erase_storage();

	// and reboot
	soft_reset();
}

void config_save_to_storage (void)
{
	save_to_storage ();
}


/*-----------------------------------------------------------------------*\
 * System Functions
\*-----------------------------------------------------------------------*/

void power_off ( void )
{
	rtc_hide ();
	disp_msg ( " OFF", 500 );

	codec_stop ();

	disp_disable ();

	batmon_stop ();
	adc_disable ();	/* disable ADC to save power */

	/* Restart RTC in power-save mode to keep time for the user */
	rtc_start ( RTC_OPM_POWERSAVE );

	/*
	 * Go to sleep...
	 */
	set_sleep_mode ( SLEEP_MODE_PWR_SAVE );

	do {
		keybrd_enable_irq ( KEY_POWER );

		/* 
		 * ...Zzz...  
		 */
		sleep_mode ();

		keybrd_disable_irq ( KEY_POWER );

	} while( keybrd_get_irq_keys () != KEY_POWER );

	/* Wait for next tick and restart RTC in normal mode */
	rtc_wait_for_tick ();
	rtc_start ( RTC_OPM_DEFAULT );

	disp_enable ();

	adc_enable ();
	batmon_start ();

	rtc_show ();

	/* Ignore keyboard events that might happen*/
	keybrd_clear_events ();
}

uint16_t fw_version ( void )
{
	return pgm_read_word_far ( &u_FirmwareVersion );
}

/*-----------------------------------------------------------------------*\
 * Load/Save Functions
\*-----------------------------------------------------------------------*/

bool load_from_storage ( void )
{
#if ( DS_CONFIG_STORAGE == CONFIG_EEPROM )
	eeprom_read_block ( (void *)&cfg, 
						(const void *)&eeprom_cfg, 
						sizeof ( cfg ));

	return ( cfg.signature == CONFIG_SIGNATURE );

#elif ( DS_CONFIG_STORAGE == CONFIG_FILE )
	UINT brw;

	/* open config file */
	if (f_open(&shared_fp, "config", FA_READ) != FR_OK)
		return false;

	f_read(&shared_fp, &cfg, sizeof(cfg), &brw);
	f_close(&shared_fp);

	return true;

#else
#	error "Unknown storage type"
#endif
}

void save_to_storage ( void )
{
#if ( DS_CONFIG_STORAGE == CONFIG_EEPROM )
	cfg.signature = CONFIG_SIGNATURE;
	eeprom_update_block ( &cfg, 
						&eeprom_cfg, 
						sizeof( cfg ));

#elif ( DS_CONFIG_STORAGE == CONFIG_FILE )
	// TODO: implement

#else
#	error "Unknown storage type"
#endif
}

void erase_storage ( void )
{
#if ( DS_CONFIG_STORAGE == CONFIG_EEPROM )
	eeprom_update_word ( &eeprom_cfg.signature, 0 );

#elif ( DS_CONFIG_STORAGE == CONFIG_FILE )
	// delete config file...
	f_unlink("config");

#else
#	error "Unknown storage type"
#endif
}

/*-----------------------------------------------------------------------*\
 * Custom set-functions
\*-----------------------------------------------------------------------*/

void set_duplex_mode ( duplex_mode_t val )
{
	if( val <= max_duplex_mode () && val >= min_duplex_mode())
		cfg.props.duplex_mode = val;
}

void set_default_duplex_mode ( void )
{
	if( get_default_duplex_mode () == get_invalid_duplex_mode ())
	{
		set_invalid_duplex_mode ();
	}
	else
	{
		set_duplex_mode ( get_default_duplex_mode ());
	}
}

void set_invalid_duplex_mode (void)
{
	cfg.props.duplex_mode = get_invalid_duplex_mode ();
}

void set_wakeup_mode ( wakeup_mode_t val )
{
	if( val <= max_wakeup_mode () && val >= min_wakeup_mode ())
	{
		cfg.props.wakeup_mode = val;

		/* update settings */
		switch ( get_wakeup_mode ())
		{
		case 1:
			set_light_hints_brightness(3);
			set_light_hints_duration(2);
			set_default_sound_hints_volume();
			set_sound_hints_duration(0);
			set_hints_duty_cycle(4);
			break;

		case 2:
			set_light_hints_brightness(6);
			set_light_hints_duration(6);
			set_default_sound_hints_volume();
			set_sound_hints_duration(0);
			set_hints_duty_cycle(4);
			break;
			
		case 3:
			set_light_hints_brightness(9);
			set_light_hints_duration(10);
			set_sound_hints_volume(2);
			set_sound_hints_duration(10);
			set_hints_duty_cycle(4);
			break;
		}

		set_default_hints_frequency();

		/* make the properties read-only */
		set_readonly_light_hints_brightness(true);
		set_readonly_light_hints_duration(true);
		set_readonly_sound_hints_volume(true);
		set_readonly_sound_hints_duration(true);
		set_readonly_hints_frequency(true);
		set_readonly_hints_duty_cycle(true);
	}
}

void set_default_wakeup_mode ( void )
{
	if (get_default_wakeup_mode() == get_invalid_wakeup_mode())
	{
		set_invalid_wakeup_mode();
	}
	else
	{
		set_wakeup_mode(get_default_wakeup_mode());
	}
}

void set_invalid_wakeup_mode ( void )
{
	cfg.props.wakeup_mode = get_invalid_wakeup_mode ();

	/* adjustable mode, let user change properties */
	set_readonly_light_hints_brightness(false);
	set_readonly_light_hints_duration(false);
	set_readonly_sound_hints_volume(false);
	set_readonly_sound_hints_duration(false);
	set_readonly_hints_frequency(false);
	set_readonly_hints_duty_cycle(false);
}

/*-----------------------------------------------------------------------*\
 * Configuration Properties
\*-----------------------------------------------------------------------*/

IMPLEMENT_CONFIG_BOOL_PROPERTY(before_hints_message, false)
IMPLEMENT_CONFIG_BOOL_PROPERTY(after_hints_message, false)
IMPLEMENT_CONFIG_BOOL_PROPERTY(voice_recording, false)
IMPLEMENT_CONFIG_BOOL_PROPERTY(loud_speaker, true)
IMPLEMENT_CONFIG_BOOL_PROPERTY(alarm_clock, false)
IMPLEMENT_CONFIG_PROPERTY_WITH_INVALID(wakeup_timer_delay, WAKEUP_TIMER_DELAY_MIN, WAKEUP_TIMER_DELAY_MAX, 1, WAKEUP_TIMER_DELAY_DEFAULT, WAKEUP_TIMER_DELAY_INVALID)
IMPLEMENT_CONFIG_PROPERTY(sleep_scenario_playback, 0, 9, 1, 0)
IMPLEMENT_CONFIG_PROPERTY(relax_tunes_playback, 0, 9, 1, 0)
IMPLEMENT_CONFIG_PROPERTY(vibration_level, 0, 9, 1, 5)
IMPLEMENT_CONFIG_PROPERTY(music_volume_level, 1, 9, 1, 5)
IMPLEMENT_CONFIG_PROPERTY(recording_gain_level, 0, 64, 1, 0)
IMPLEMENT_CONFIG_PROPERTY(remd_sensitivity, 2, 7, 1, 4)
IMPLEMENT_CONFIG_PROPERTY_GET_WITH_INVALID(duplex_mode, 1, 3, 1, 0, 0)
IMPLEMENT_CONFIG_PROPERTY_GET_WITH_INVALID(wakeup_mode, 1, 3, 1, 2, 0)
IMPLEMENT_CONFIG_PROPERTY(hints_frequency, 1, 9, 1, 2)
IMPLEMENT_CONFIG_PROPERTY(hints_duty_cycle, 1, 9, 1, 4)
IMPLEMENT_CONFIG_PROPERTY(light_hints_brightness,	1, 9, 1, 3)
IMPLEMENT_CONFIG_PROPERTY(sound_hints_volume,	1, 9, 1, 3)
IMPLEMENT_CONFIG_PROPERTY(light_hints_duration,	0, 99, 1, 7)
IMPLEMENT_CONFIG_PROPERTY(sound_hints_duration,	0, 99, 1, 7)
IMPLEMENT_CONFIG_COUNTER_PROPERTY(remd_trigger_counter)
