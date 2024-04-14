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

#ifndef _DS_CONFIG_DEFINED
#define _DS_CONFIG_DEFINED

#include <stdint.h>
#include <stdbool.h>


/* Version management */
#define MAKE_VER(major, minor)	((((uint16_t)(major))<<8) | (minor))
#define VER_MAJOR(ver)			(((ver)>>8) & 0xFF)
#define VER_MINOR(ver)			((ver) & 0xFF)


#define DECLARE_CONFIG_PROPERTY(name, type)	\
	typedef type name ## _t;				\
	type	min_ ## name (void);			\
	type	max_ ## name (void);			\
	type	step_ ## name (void);			\
	type	get_ ## name (void);			\
	type	get_default_ ## name (void);	\
	void	set_ ## name (type);			\
	void	set_default_ ## name (void);	\
	bool	is_readonly_ ## name (void);	\
	void	set_readonly_ ## name (bool);

#define DECLARE_CONFIG_PROPERTY_WITH_INVALID(name, type)	\
	DECLARE_CONFIG_PROPERTY(name, type)						\
	type	get_invalid_ ## name (void);					\
	void	set_invalid_ ## name (void);					\
	bool	is_invalid_ ## name (void);

#define DECLARE_CONFIG_COUNTER_PROPERTY(name, type)	\
	typedef type name ## _t;						\
	type	get_ ## name (void);					\
	void	inc_ ## name (void);					\
	void	reset_ ## name (void);

#define DECLARE_CONFIG_SIMPLE_PROPERTY(name, type)	\
	type	get_ ## name (void);					\
	void	set_ ## name (type);

#define DECLARE_CONFIG_BOOL_PROPERTY(name)	\
	bool	get_ ## name (void);			\
	void	set_ ## name (bool);			\
	void	toggle_ ## name (void);			\
	void	set_default_ ## name (void);

#define DECREMENT_CONFIG_PROPERTY(name)		\
	if (! is_readonly_ ## name ())			\
	{										\
		name ## _t val = get_ ## name ();	\
											\
		if(val==0)							\
			val = max_ ## name ();			\
		else {								\
			val -= step_ ## name ();		\
			if(val < min_ ## name ())		\
				val = max_ ## name ();		\
		}									\
		set_ ## name (val);					\
	}

#define INCREMENT_CONFIG_PROPERTY(name)		\
	if (! is_readonly_ ## name ())			\
	{										\
		name ## _t val = get_ ## name ();	\
											\
		val += step_ ## name ();			\
		if(val > max_ ## name ())			\
			val = min_ ## name ();			\
		set_ ## name (val);					\
	}

#define DECREMENT_CONFIG_WITH_INVALID_PROPERTY(name)	\
	if (! is_invalid_ ## name ())						\
		DECREMENT_CONFIG_PROPERTY(name)

#define INCREMENT_CONFIG_WITH_INVALID_PROPERTY(name)	\
	if (! is_invalid_ ## name ())						\
		INCREMENT_CONFIG_PROPERTY(name)

#define TOGGLE_CONFIG_WITH_INVALID_PROPERTY(name)	\
	if (! is_readonly_ ## name ())					\
	{												\
		if (is_invalid_ ## name ())					\
			set_default_ ## name ();				\
		else										\
			set_invalid_ ## name ();				\
	}


#ifdef __cplusplus
extern "C" {
#endif


/*-----------------------------------------------------------------------*/
/* Configuration Functions								 			 	 */
/*-----------------------------------------------------------------------*/

void config_init(void);

void config_set_defaults (void);	/* reset to firmware defaults */

void config_save_to_storage (void);

/*-----------------------------------------------------------------------*/
/* System Functions										 			 	 */
/*-----------------------------------------------------------------------*/

void power_off (void);

uint16_t fw_version (void);


/*-----------------------------------------------------------------------*/
/* Configuration Properties								 			 	 */
/*-----------------------------------------------------------------------*/

DECLARE_CONFIG_PROPERTY_WITH_INVALID(wakeup_timer_delay, uint16_t)

/*
 * All voice messages stored in BEFORE folder will be played back
 * BEFORE the device give you sound and light cues.
 */
DECLARE_CONFIG_BOOL_PROPERTY(before_hints_message)

/*
 * All voice messages stored in AFTER folder will be played back
 * AFTER the device give you sound and light cues.
 */
DECLARE_CONFIG_BOOL_PROPERTY(after_hints_message)

/*
 * All voice messages (pre-recorded dream scenarios) stored
 * in one of SLEEP01 - SLEEP09 folders will be played back
 * after the device give you light and sound cues.
 */
DECLARE_CONFIG_PROPERTY(sleep_scenario_playback, uint8_t)

/*
 * Automatic recording mode of dream content.
 */
DECLARE_CONFIG_BOOL_PROPERTY(voice_recording)

/*
 * Lets you adjust the volume of music and voice message playback.
 */
DECLARE_CONFIG_PROPERTY(music_volume_level, uint8_t)

/*
 * Lets you adjust the voice recording gain.
 */
DECLARE_CONFIG_PROPERTY(recording_gain_level, uint8_t)

/*
 * Playback of special music or sounds enhancing relaxation
 * and falling asleep.
 * It starts automatically from one of TUNES01 – TUNES09 folders
 * since 1 minute from turning on and setting up the timer UtSE.
 */
DECLARE_CONFIG_PROPERTY(relax_tunes_playback, uint8_t)

/*
 * Turns on vibration hints in addition to light or sound hints.
 * Vibration does not function in duplex mode.
 */
DECLARE_CONFIG_PROPERTY(vibration_level, uint8_t)

/*
 * This mode controls built-in loudspeaker of the device.
 */
DECLARE_CONFIG_BOOL_PROPERTY(loud_speaker)

/*
 * The alarm clock plays melody since 1 minute from giving you 
 * a series of cues (regardless of mode you set)
 */
DECLARE_CONFIG_BOOL_PROPERTY(alarm_clock)

/*
 * Shows how many times the DreamStalker detected REM
 * (rapid eye movement) phase and gave corresponding light and
 * sound cues during your sleep.
 */
DECLARE_CONFIG_COUNTER_PROPERTY(remd_trigger_counter, uint8_t)

DECLARE_CONFIG_PROPERTY(remd_sensitivity, uint8_t)

/*
 * Three modes of wakeup signals are available.
 * Mode 1 is light, Mode 2 is medium and Mode 3 is persistent
 * and the most intensive.
 * Number 0 corresponds to adjustable mode.
 */
DECLARE_CONFIG_PROPERTY_WITH_INVALID(wakeup_mode, uint8_t)

/*
 * Duplex mode in DreamStalker has three degrees, from 1 to 3.
 * The numbers correspond to light, medium and persistent wakeup modes.
 * Number 0 corresponds to the duplex mode turned off.
 */
DECLARE_CONFIG_PROPERTY_WITH_INVALID(duplex_mode, uint8_t)


DECLARE_CONFIG_PROPERTY(hints_frequency, uint8_t)

DECLARE_CONFIG_PROPERTY(hints_duty_cycle, uint8_t)

DECLARE_CONFIG_PROPERTY(light_hints_brightness, uint8_t)

DECLARE_CONFIG_PROPERTY(sound_hints_volume, uint8_t)

/*Duration of a Series of Flashes*/
DECLARE_CONFIG_PROPERTY(light_hints_duration, uint8_t)

/*Duration of a Series of Sound Signals*/
DECLARE_CONFIG_PROPERTY(sound_hints_duration, uint8_t)

#ifdef __cplusplus
}
#endif

#endif // _DS_CONFIG_DEFINED
