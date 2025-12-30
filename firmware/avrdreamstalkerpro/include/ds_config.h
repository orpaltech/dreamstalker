/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2025	ORPAL Technologies, Inc.
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


/*-----------------------------------------------------------------------*/
/* Version management */
#define MAKE_VER(major, minor)	((((uint16_t)(major))<<8) | (minor))
#define VER_MAJOR(ver)			(((ver)>>8) & 0xFF)
#define VER_MINOR(ver)			((ver) & 0xFF)


/*-----------------------------------------------------------------------*/
#define STG_FILE		1
#define STG_EEPROM		2

#ifndef CONF_STG
	#define CONF_STG	STG_FILE
#endif

/*-----------------------------------------------------------------------*/
#define WAKEUP_MODE_CUSTOM	0
#define WAKEUP_MODE_LIGHT	1
#define WAKEUP_MODE_MEDIUM	2
#define WAKEUP_MODE_INTENSE	3

#define WAKEUP_TIMER_DELAY_DEFAULT	((3 * 60) + 30) /* 3h 30min */

#define ALARM_CLOCK_DELAY	60

/*-----------------------------------------------------------------------*/

#define DSCONF_DECLARE_PROPERTY(name, type)	\
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

#define DSCONF_DECLARE_PROPERTY_WITH_INVALID(name, type)	\
	DSCONF_DECLARE_PROPERTY(name, type)		\
	type	get_invalid_ ## name (void);	\
	void	set_invalid_ ## name (void);	\
	bool	is_invalid_ ## name (void);

#define DSCONF_DECLARE_STATIC_COUNTER_PROPERTY(name, type)	\
	typedef type name ## _t;			\
	static name ## _t v_ ## name;		\
	type	get_ ## name (void);		\
	void	inc_ ## name (void);		\
	void	reset_ ## name (void);

#define DSCONF_DECLARE_BOOL_PROPERTY(name)	\
	bool	get_ ## name (void);		\
	void	set_ ## name (bool);		\
	void	toggle_ ## name (void);		\
	void	set_default_ ## name (void);

#define DSCONF_DECREMENT_PROPERTY(cfg, name)	\
	if (! cfg.is_readonly_ ## name ())			\
	{											\
		DS::Config::name ## _t val = cfg.get_ ## name ();	\
		/* disable values below zero !!*/		\
		if(val < cfg.step_ ## name ())			\
			val = cfg.max_ ## name ();			\
		else {									\
			val -= cfg.step_ ## name ();		\
			if(val < cfg.min_ ## name ())		\
				val = cfg.max_ ## name ();		\
		}										\
		cfg.set_ ## name (val);					\
	}

#define DSCONF_INCREMENT_PROPERTY(cfg, name)	\
	if (! cfg.is_readonly_ ## name ())			\
	{											\
		DS::Config::name ## _t val = cfg.get_ ## name ();	\
												\
		val += cfg.step_ ## name ();			\
		if(val > cfg.max_ ## name ())			\
			val = cfg.min_ ## name ();			\
		cfg.set_ ## name (val);					\
	}

#define DSCONF_DECREMENT_PROPERTY_WITH_INVALID(cfg, name)	\
	if (! cfg.is_invalid_ ## name ())						\
		DSCONF_DECREMENT_PROPERTY(cfg, name)

#define DSCONF_INCREMENT_PROPERTY_WITH_INVALID(cfg, name)	\
	if (! cfg.is_invalid_ ## name ())						\
		DSCONF_INCREMENT_PROPERTY(cfg, name)

#define DSCONF_TOGGLE_PROPERTY_WITH_INVALID(cfg, name)	\
	if (! cfg.is_readonly_ ## name ())		\
	{										\
		if (cfg.is_invalid_ ## name ())		\
			cfg.set_default_ ## name ();	\
		else								\
			cfg.set_invalid_ ## name ();	\
	}


/*-----------------------------------------------------------------------*/
#define DSCONF_DEFINE_FLAG(name)		uint8_t name : 1
#define DSCONF_DEFINE_FLAG_RO(name)		DSCONF_DEFINE_FLAG(name ## __RO)
#define DSCONF_DEFINE_FIELD(name)		name ## _t	name


/*-----------------------------------------------------------------------*/
/* System Functions										 			 	 */
/*-----------------------------------------------------------------------*/

uint16_t fw_version (void);

namespace DS {
/*-----------------------------------------------------------------------*/
class Config {
public:
  bool begin (void);
  void set_defaults (void);	/* reset to firmware defaults */
  void save_to_storage (void);

  //
  // Declare configuration Properties
  //

  DSCONF_DECLARE_PROPERTY(wakeup_timer_delay, uint16_t)

  /*
   * All voice messages stored in BEFORE folder will be played back
   * BEFORE the device give you sound and light cues.
   */
  DSCONF_DECLARE_BOOL_PROPERTY(before_hints)

  /*
   * All voice messages stored in AFTER folder will be played back
   * AFTER the device give you sound and light cues.
   */
  DSCONF_DECLARE_BOOL_PROPERTY(after_hints)

  /*
   * All voice messages (pre-recorded dream scenarios) stored
   * in one of SLEEP01 - SLEEP09 folders will be played back
   * after the device give you light and sound cues.
   */
  DSCONF_DECLARE_PROPERTY(sleep_scenario, uint8_t)

  /*
   * Automatic recording mode of dream content.
   */
  DSCONF_DECLARE_BOOL_PROPERTY(voice_recording)

  /*
   * Lets you adjust the volume of music and voice message playback.
   */
  DSCONF_DECLARE_PROPERTY(volume_level, uint8_t)

  /*
   * Lets you adjust the voice recording gain.
   */
  DSCONF_DECLARE_PROPERTY(record_gain_level, uint8_t)

  /*
   * Playback of special music or sounds enhancing relaxation
   * and falling asleep.
   * It starts automatically from one of TUNES01 – TUNES09 folders
   * since 1 minute from turning on and setting up the timer UtSE.
   */
  DSCONF_DECLARE_PROPERTY(relax_tunes, uint8_t)

  /*
   * Turns on vibration hints in addition to light or sound hints.
   * Vibration does not function in duplex mode.
   */
  DSCONF_DECLARE_PROPERTY(vibration_level, uint8_t)

  /*
   * This mode controls built-in loudspeaker of the device.
   */
  DSCONF_DECLARE_BOOL_PROPERTY(loud_speaker_enabled)

  /*
   * The alarm clock plays melody since 1 minute from giving you 
   * a series of cues (regardless of mode you set)
   */
  DSCONF_DECLARE_BOOL_PROPERTY(alarm_clock_enabled)

  /*
   * Three modes of wakeup signals are available.
   * Mode 1 is light, Mode 2 is medium and Mode 3 is the most intensive.
   * Number 0 corresponds to adjustable mode.
   */
  DSCONF_DECLARE_PROPERTY_WITH_INVALID(wakeup_mode, uint8_t)

  /*
   * Duplex mode in DreamStalker has three degrees, from 1 to 3.
   * The numbers correspond to light, medium and persistent wakeup modes.
   * Number 0 corresponds to the duplex mode turned off.
   */
  DSCONF_DECLARE_PROPERTY_WITH_INVALID(duplex_mode, uint8_t)


  DSCONF_DECLARE_PROPERTY(hints_frequency, uint8_t)

  DSCONF_DECLARE_PROPERTY(hints_duty_cycle, uint8_t)

  DSCONF_DECLARE_PROPERTY(light_hints_brightness, uint8_t)

  DSCONF_DECLARE_PROPERTY(sound_hints_volume, uint8_t)

  /*Duration of a Series of Flashes*/
  DSCONF_DECLARE_PROPERTY(light_hints_duration, uint8_t)

  /*Duration of a Series of Sound Signals*/
  DSCONF_DECLARE_PROPERTY(sound_hints_duration, uint8_t)

  DSCONF_DECLARE_PROPERTY(remd_sensitivity, uint8_t)
  /*
   * Shows how many times the DreamStalker detected REM
   * (rapid eye movement) phase and gave corresponding light and
   * sound cues during your sleep.
   */
  DSCONF_DECLARE_STATIC_COUNTER_PROPERTY(remd_trigger_count, uint8_t)

protected:
  void set_default_values (void);
  bool load_from_storage (void);
  void erase_storage (void);

public:
  typedef struct s_ds_config_props {

	DSCONF_DEFINE_FLAG(before_hints);
	DSCONF_DEFINE_FLAG(after_hints);
	DSCONF_DEFINE_FLAG(voice_recording);
	DSCONF_DEFINE_FLAG(loud_speaker_enabled);
	DSCONF_DEFINE_FLAG(alarm_clock_enabled);

	DSCONF_DEFINE_FIELD(wakeup_timer_delay);
	DSCONF_DEFINE_FIELD(sleep_scenario);
	DSCONF_DEFINE_FIELD(relax_tunes);
	DSCONF_DEFINE_FIELD(volume_level);
	DSCONF_DEFINE_FIELD(record_gain_level);
	DSCONF_DEFINE_FIELD(remd_sensitivity);
	DSCONF_DEFINE_FIELD(duplex_mode);
	DSCONF_DEFINE_FIELD(wakeup_mode);
	DSCONF_DEFINE_FIELD(vibration_level);
	DSCONF_DEFINE_FIELD(hints_frequency);
	DSCONF_DEFINE_FIELD(hints_duty_cycle);
	DSCONF_DEFINE_FIELD(light_hints_brightness);
	DSCONF_DEFINE_FIELD(sound_hints_volume);
	DSCONF_DEFINE_FIELD(light_hints_duration);
	DSCONF_DEFINE_FIELD(sound_hints_duration);

	/*
	 * TODO: add more members if you create new properties
	 */

  } ds_config_props_t;

  typedef struct s_ds_config_states {

	DSCONF_DEFINE_FLAG_RO(wakeup_timer_delay);
	DSCONF_DEFINE_FLAG_RO(sleep_scenario);
	DSCONF_DEFINE_FLAG_RO(relax_tunes);
	DSCONF_DEFINE_FLAG_RO(volume_level);
	DSCONF_DEFINE_FLAG_RO(record_gain_level);
	DSCONF_DEFINE_FLAG_RO(remd_sensitivity);
	DSCONF_DEFINE_FLAG_RO(duplex_mode);
	DSCONF_DEFINE_FLAG_RO(wakeup_mode);
	DSCONF_DEFINE_FLAG_RO(vibration_level);
	DSCONF_DEFINE_FLAG_RO(hints_frequency);
	DSCONF_DEFINE_FLAG_RO(hints_duty_cycle);
	DSCONF_DEFINE_FLAG_RO(light_hints_brightness);
	DSCONF_DEFINE_FLAG_RO(sound_hints_volume);
	DSCONF_DEFINE_FLAG_RO(light_hints_duration);
	DSCONF_DEFINE_FLAG_RO(sound_hints_duration);

	/*
	 * TODO: add more members if you create new properties
	 */
	
  } ds_config_states_t;

  typedef struct s_ds_config {
	uint16_t signature;
	ds_config_props_t props;
	ds_config_states_t states;
  } ds_config_t;

private:
  ds_config_t cfg;

};

/*-----------------------------------------------------------------------*/
};	//DS

extern DS::Config config;

#endif // _DS_CONFIG_DEFINED
