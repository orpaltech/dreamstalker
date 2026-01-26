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

#include <avr/eeprom.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>
#include <util/delay.h>

#include "ds_config.h"
#include "ds_util.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* IMPORTANT: signature must be updated on every change 
 *			made to the configuration layout !!!
 */
#define DSCONF_SIGNATURE	0x8006


/*-----------------------------------------------------------------------*/
/* Min, max, default and invalid values for various configuration properties */

#define WAKEUP_TIMER_DELAY_MIN			    3 				      /* 3min */
#define WAKEUP_TIMER_DELAY_MAX			    (6 * 60)        /* 6h */

#define REMD_SENSITIVITY_MIN            1
#define REMD_SENSITIVITY_MAX            9
#define REMD_SENSITIVITY_DEFAULT        5

#define REMD_REQUIRED_EPOCHS_MIN        1
#define REMD_REQUIRED_EPOCHS_MAX        6
#define REMD_REQUIRED_EPOCHS_DEFAULT    3

#define REMD_COOLDOWN_EPOCHS_MIN        10
#define REMD_COOLDOWN_EPOCHS_MAX        120
#define REMD_COOLDOWN_EPOCHS_DEFAULT    30

#define REMD_MIN_MOVE_DURATION_MIN      5
#define REMD_MIN_MOVE_DURATION_MAX      80
#define REMD_MIN_MOVE_DURATION_DEFAULT  10

#define REMD_MIN_EPOCH_MOVES_MIN        3
#define REMD_MIN_EPOCH_MOVES_MAX        25
#define REMD_MIN_EPOCH_MOVES_DEFAULT    10


/*-----------------------------------------------------------------------*/

#define DSCONF_IMPLEMENT_PROPERTY_GET(name, min_val, max_val, step, default_val)	\
Config::name ## _t Config::get_ ## name (void)          \
{														                            \
  return cfg.props.name;								                \
}														                            \
Config::name ## _t Config::min_ ## name (void)			    \
{														                            \
  return min_val;										                    \
}														                            \
Config::name ## _t Config::max_ ## name (void)			    \
{														                            \
  return max_val;										                    \
}														                            \
Config::name ## _t Config::step_ ## name (void)			    \
{														                            \
  return step;												                  \
}														                            \
Config::name ## _t Config::get_default_ ## name (void)  \
{														                            \
  return default_val;									                  \
}														                            \
bool Config::is_readonly_ ## name (void)				        \
{														                            \
  return cfg.states.name ## __RO != 0;					        \
}														                            \
void Config::set_readonly_ ## name (bool val)			      \
{														                            \
  cfg.states.name ## __RO = val;						            \
}


#define DSCONF_IMPLEMENT_PROPERTY(name, min_val, max_val, step, default_val)	\
DSCONF_IMPLEMENT_PROPERTY_GET(name, min_val, max_val, step, default_val)	\
														                            \
void Config::set_ ## name (name ## _t val)				      \
{														                            \
  if (val <= max_ ## name () && val >= min_ ## name ()) \
	  cfg.props.name = val;								                \
}														                            \
void Config::set_default_ ## name (void)				        \
{														                            \
  set_ ## name (get_default_ ## name ());				        \
}


#define DSCONF_IMPLEMENT_PROPERTY_GET_WITH_INVALID(name, min_val, max_val, step, default_val, invalid_val)	\
DSCONF_IMPLEMENT_PROPERTY_GET(name, min_val, max_val, step, default_val)	\
														                            \
Config::name ## _t Config::get_invalid_ ## name (void)  \
{														                            \
  return invalid_val;									                  \
}														                            \
bool Config::is_ ## name ## _invalid (void)					    \
{														                            \
  return (cfg.props.name == invalid_val);				        \
}


#define DSCONF_IMPLEMENT_PROPERTY_WITH_INVALID(name, min_val, max_val, step, default_val, invalid_val)	\
DSCONF_IMPLEMENT_PROPERTY(name, min_val, max_val, step, default_val)  \
														                                          \
Config::name ## _t Config::get_invalid_ ## name (void)                \
{														                                          \
  return invalid_val;									                                \
}														                                          \
bool Config::is_ ## name ## _invalid (void)					                  \
{														                                          \
  return (cfg.props.name == invalid_val);				                      \
}                                                                     \
void Config::set_ ## name ## _invalid (void)	                        \
{														                                          \
  cfg.props.name = get_invalid_  ## name ();                          \
}

#define DSCONF_IMPLEMENT_STATIC_PROPERTY_GET(name)  \
Config::name ## _t Config::v_ ## name = 0;      \
												                        \
Config::name ## _t	Config::get_ ## name (void)	\
{												                        \
  return v_ ## name;							              \
}

#define DSCONF_IMPLEMENT_STATIC_PROPERTY(name)	\
DSCONF_IMPLEMENT_STATIC_PROPERTY_GET(name)  \
											                      \
void Config::set_ ## name (name ## _t val)	\
{											                      \
  v_ ## name = val;							            \
}	

#define DSCONF_IMPLEMENT_STATIC_COUNTER_PROPERTY(name)	\
DSCONF_IMPLEMENT_STATIC_PROPERTY_GET(name)  \
										                        \
void Config::inc_ ## name (void)		        \
{										                        \
  v_ ## name ++;						                \
}										                        \
void Config::reset_ ## name (void)		      \
{										                        \
  v_ ## name = 0;						                \
}


#define DSCONF_IMPLEMENT_BOOL_PROPERTY(name, default_val) \
bool Config::get_ ## name (void)		      \
{											                    \
  return cfg.props.name != 0;				      \
}											                    \
void Config::set_ ## name (bool new_val)  \
{											                    \
  if (new_val)								            \
	  cfg.props.name = 1;						        \
  else										                \
	  cfg.props.name = 0;						        \
}											                    \
void Config::toggle_ ## name (void)	      \
{											                    \
  set_ ## name(! get_ ## name ());	      \
}											                    \
void Config::set_default_ ## name (void)	\
{											                    \
  if (default_val)							          \
	  cfg.props.name = 1;						        \
  else										                \
	  cfg.props.name = 0;						        \
}


/*-----------------------------------------------------------------------*/
PROGMEM const uint16_t u_FirmwareVersion = MAKE_VER ( 2,4 );

PROGMEM const uint8_t u_LevelToPercent[10] = {
  0, 10, 15, 22, 32, 45, 60, 75, 88, 100
};

/*-----------------------------------------------------------------------*/
Config config;

/*-----------------------------------------------------------------------*/

#if ( CONF_STG == STG_EEPROM )
static EEMEM Config::ds_config_t eeprom_cfg;
#endif

/*-----------------------------------------------------------------------*/
void Config::set_default_values (void)
{
  /*
   * TODO: Add more lines below if you need more flags !!!
   */
  set_default_before_hints ();
  set_default_after_hints ();
  set_default_voice_recording ();
  set_default_loud_speaker_enabled ();
  set_default_alarm_clock_enabled ();

  /*
   * TODO: Add more lines below if you need more properties !!!
   */
  set_default_sleep_scenario ();
  set_default_relax_tunes ();
  set_default_volume_level ();
  set_default_record_gain_level ();
  set_default_duplex_mode ();
  set_default_vibration_level ();
  set_default_wakeup_timer_delay ();

  /*-------------------------------------------------------------------------*/
  set_default_hints_frequency ();
  set_default_hints_duty_cycle ();
  set_default_light_hints_brightness ();
  set_default_light_hints_duration ();
  set_default_sound_hints_volume ();
  set_default_sound_hints_duration ();
  /* The values above can be changed by set_default_wakeup_mode(), 
   * so make sure we set these values BEFORE set_default_wakeup_mode() */
  set_default_wakeup_mode ();

  /*-------------------------------------------------------------------------*/
  set_default_remd_sensitivity ();
  set_default_remd_required_rem_epochs ();
  set_default_remd_cooldown_epochs ();
  set_default_remd_min_move_duration ();
  set_default_remd_min_epoch_moves ();
  set_default_remd_restlessness_factor ();
  /* The values above can be changed by set_default_remd_profile(), 
   * so make sure we set these values BEFORE set_default_remd_profile() */
  set_default_remd_profile ();

  /*-------------------------------------------------------------------------*/

  /*
   * TODO: Add more lines below to control read-only status !!!
   */
  set_readonly_volume_level (false);
  set_readonly_vibration_level (false);
  set_readonly_record_gain_level (false);
  set_readonly_wakeup_timer_delay (false);
  set_readonly_wakeup_mode (false);
  set_readonly_remd_profile (false);
}


bool Config::begin (void)
{
  if (! load_from_storage ()) {
	  set_default_values ();

	  save_to_storage ();
  }
  return true;
}

void Config::set_defaults (void)
{
  erase_storage ();

  // and reboot
  soft_reset ();
}

void Config::save_to_storage (void)
{
  cfg.signature = DSCONF_SIGNATURE;

#if ( CONF_STG == STG_EEPROM )
  eeprom_update_block (&cfg, &eeprom_cfg, sizeof (cfg));

#elif ( CONF_STG == STG_FILE )
  // TODO: implement save to file

#else
  #error "Unknown storage type"
#endif
}

bool Config::load_from_storage (void)
{
#if ( CONF_STG == STG_EEPROM )
  eeprom_read_block (&cfg, (const void *)&eeprom_cfg, sizeof (cfg));

#elif ( CONF_STG == STG_FILE )
  /* open config file */
  File fp = card0.open ( "config" );
  if ( !fp)
	  return false;

  fp.read ( &cfg, sizeof ( cfg ));
  fp.close ();

#else
  #error "Unknown storage type"
#endif

  return ( cfg.signature == DSCONF_SIGNATURE );
}

void Config::erase_storage (void)
{
#if ( CONF_STG == STG_EEPROM )
  eeprom_update_word (&eeprom_cfg.signature, 0);

#elif ( CONF_STG == STG_FILE )
  // delete config file...
  card0.remove ( "config" );

#else
  #error "Unknown storage type"
#endif
}

// Convert level value (0..9) into percentage (0..100)
uint8_t Config::level_to_percent(uint8_t lvl)
{
  return ((lvl > 0 && lvl < 10) ? pgm_read_byte_far (u_LevelToPercent + lvl) : 0);
}


/*-----------------------------------------------------------------------*\
 * Configuration Properties
\*-----------------------------------------------------------------------*/

DSCONF_IMPLEMENT_BOOL_PROPERTY(before_hints, false)
DSCONF_IMPLEMENT_BOOL_PROPERTY(after_hints, false)
DSCONF_IMPLEMENT_BOOL_PROPERTY(voice_recording, false)
DSCONF_IMPLEMENT_BOOL_PROPERTY(loud_speaker_enabled, true)
DSCONF_IMPLEMENT_BOOL_PROPERTY(alarm_clock_enabled, false)
DSCONF_IMPLEMENT_PROPERTY(wakeup_timer_delay, WAKEUP_TIMER_DELAY_MIN, WAKEUP_TIMER_DELAY_MAX, 1, WAKEUP_TIMER_DELAY_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(sleep_scenario, 0, 9, 1, 0)
DSCONF_IMPLEMENT_PROPERTY(relax_tunes, 0, 9, 1, 0)
DSCONF_IMPLEMENT_PROPERTY(vibration_level, 0, 9, 1, 5)
DSCONF_IMPLEMENT_PROPERTY(volume_level, 1, 9, 1, 5)
DSCONF_IMPLEMENT_PROPERTY(record_gain_level, 0, 64, 1, RECORD_GAIN_LEVEL_AGC)
DSCONF_IMPLEMENT_PROPERTY_GET_WITH_INVALID(remd_profile, REMD_PROFILE_CONSERVATIVE, REMD_PROFILE_STRESS_BALANCE, 1, REMD_PROFILE_BALANCED, REMD_PROFILE_CUSTOM)
DSCONF_IMPLEMENT_PROPERTY(remd_sensitivity, REMD_SENSITIVITY_MIN, REMD_SENSITIVITY_MAX, 1, REMD_SENSITIVITY_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(remd_required_rem_epochs, REMD_REQUIRED_EPOCHS_MIN, REMD_REQUIRED_EPOCHS_MAX, 1, REMD_REQUIRED_EPOCHS_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(remd_cooldown_epochs, REMD_COOLDOWN_EPOCHS_MIN, REMD_COOLDOWN_EPOCHS_MAX, 1, REMD_COOLDOWN_EPOCHS_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(remd_min_move_duration, REMD_MIN_MOVE_DURATION_MIN, REMD_MIN_MOVE_DURATION_MAX, 1, REMD_MIN_MOVE_DURATION_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(remd_min_epoch_moves, REMD_MIN_EPOCH_MOVES_MIN, REMD_MIN_EPOCH_MOVES_MAX, 1, REMD_MIN_EPOCH_MOVES_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(remd_restlessness_factor, 12, 25, 1, 15)
DSCONF_IMPLEMENT_PROPERTY_GET_WITH_INVALID(duplex_mode, 1, 3, 1, 0, 0)
DSCONF_IMPLEMENT_PROPERTY_GET_WITH_INVALID(wakeup_mode, WAKEUP_MODE_LIGHT, WAKEUP_MODE_INTENSE, 1, WAKEUP_MODE_MEDIUM, WAKEUP_MODE_CUSTOM)
DSCONF_IMPLEMENT_PROPERTY(hints_frequency, 1, 9, 1, 1)
DSCONF_IMPLEMENT_PROPERTY(hints_duty_cycle, 1, 9, 1, 5)
DSCONF_IMPLEMENT_PROPERTY(light_hints_brightness,	1, 9, 1, 3)
DSCONF_IMPLEMENT_PROPERTY(sound_hints_volume,	1, 9, 1, 3)
DSCONF_IMPLEMENT_PROPERTY_WITH_INVALID(light_hints_duration, 1, 12, 1, 6, 0)
DSCONF_IMPLEMENT_PROPERTY_WITH_INVALID(sound_hints_duration, 1, 12, 1, 5, 0)
DSCONF_IMPLEMENT_STATIC_COUNTER_PROPERTY(remd_trigger_count)

/*-----------------------------------------------------------------------*\
 * Custom set-functions
\*-----------------------------------------------------------------------*/

void Config::set_duplex_mode ( duplex_mode_t val )
{
  if (val <= max_duplex_mode () && val >= min_duplex_mode()) {

	  cfg.props.duplex_mode = val;
  }
}

void Config::set_default_duplex_mode ( void )
{
  if (get_default_duplex_mode () == get_invalid_duplex_mode ()) {

	  set_duplex_mode_invalid ();
  } else {

	  set_duplex_mode (get_default_duplex_mode ());
  }
}

void Config::set_duplex_mode_invalid (void)
{
  cfg.props.duplex_mode = get_invalid_duplex_mode ();
}

void Config::set_wakeup_mode (wakeup_mode_t val)
{
  if (val <= max_wakeup_mode () && val >= min_wakeup_mode ()) {

	  cfg.props.wakeup_mode = val;

    /* update settings */
    switch (get_wakeup_mode ()) {
      case WAKEUP_MODE_LIGHT:
        set_light_hints_brightness (1);
        set_light_hints_duration (3);
        set_sound_hints_volume(1);
        set_sound_hints_duration_invalid();
        set_hints_frequency(1);
        set_hints_duty_cycle(4);
        break;

      case WAKEUP_MODE_MEDIUM:
        set_light_hints_brightness(2);
        set_light_hints_duration(5);
        set_sound_hints_volume(4);
        set_sound_hints_duration(4);
        set_hints_frequency(2);
        set_hints_duty_cycle(5);
        break;

      case WAKEUP_MODE_INTENSE:
        set_light_hints_brightness(3);
        set_light_hints_duration(8);
        set_sound_hints_volume(6);
        set_sound_hints_duration(7);
        set_hints_frequency(3);
        set_hints_duty_cycle(6);
        break;
    }

    set_default_hints_frequency();

    /* make the properties read-only */
    set_readonly_hints_frequency(true);
    set_readonly_hints_duty_cycle(true);
    set_readonly_light_hints_brightness(true);
    set_readonly_light_hints_duration(true);
    set_readonly_sound_hints_volume(true);
    set_readonly_sound_hints_duration(true);
  }
}

void Config::set_default_wakeup_mode (void)
{
  if (get_default_wakeup_mode () == get_invalid_wakeup_mode ()) {

	  set_wakeup_mode_invalid ();
  } else {

	  set_wakeup_mode (get_default_wakeup_mode ());
  }
}

void Config::set_wakeup_mode_invalid (void)
{
  cfg.props.wakeup_mode = get_invalid_wakeup_mode ();

  /* 
   * Here "invalid" actually means the "custom", or adjustable, mode.
   * Let user change properties by hand.
   */
  set_readonly_light_hints_brightness(false);
  set_readonly_light_hints_duration(false);
  set_readonly_sound_hints_volume(false);
  set_readonly_sound_hints_duration(false);
  set_readonly_hints_frequency(false);
  set_readonly_hints_duty_cycle(false);
}

void Config::set_remd_profile (remd_profile_t val)
{
  if (val <= max_remd_profile () && val >= min_remd_profile ()) {

	  cfg.props.remd_profile = val;

    /* update settings */
    switch (get_remd_profile ()) {
      case REMD_PROFILE_CONSERVATIVE:
        set_remd_sensitivity (5);
        set_remd_min_epoch_moves (13);
        set_remd_required_rem_epochs (4);
        set_remd_min_move_duration (8);
        set_remd_cooldown_epochs (60);
        // Clears the bucket very easily if you move at all. 
        // Best for avoiding false positives.
        set_remd_restlessness_factor (15);
        break;
      
      case REMD_PROFILE_MORNING_SNOOZE:
        set_remd_sensitivity (6);
        set_remd_min_epoch_moves (12);
        set_remd_required_rem_epochs (3);
        set_remd_min_move_duration (10);
        set_remd_cooldown_epochs (45);
        //You are more likely to be slightly restless while dreaming 
        // in the morning; you don't want to wipe the bucket too easily.
        set_remd_restlessness_factor (20);
        break;

      case REMD_PROFILE_BALANCED:
        set_remd_sensitivity (7);         // Balanced amplitude
        set_remd_min_epoch_moves (10);    // Requires 10 distinct "flicks" in 30s
        set_remd_required_rem_epochs (3); // Requires 3 * 30s (1.5 min) of sustained activity
        set_remd_min_move_duration (12);  // Ignores very short "micro-jitters"
        set_remd_cooldown_epochs (40);    // 20-minute break between triggers
        // Allows some minor shifting or breathing-related noise 
        // without wiping the bucket.
        set_remd_restlessness_factor (20);
        break;

      case REMD_PROFILE_AGGRESSIVE:
        set_remd_sensitivity (9);
        set_remd_min_epoch_moves (7);
        set_remd_required_rem_epochs (2);
        set_remd_min_move_duration (20);
        set_remd_cooldown_epochs (20);
        // The device prioritizes flashing the LED. 
        // It requires significant tossing to clear the bucket.
        set_remd_restlessness_factor (25);
        break;

      case REMD_PROFILE_STRESS_SHIELD:
        set_remd_sensitivity (4);
        set_remd_min_epoch_moves (13);
        set_remd_required_rem_epochs (4);
        set_remd_min_move_duration (12);
        set_remd_cooldown_epochs (90);
        // Since this is for stress protection, you want zero false 
        // triggers while awake
        set_remd_restlessness_factor (15);
        break;

      case REMD_PROFILE_STRESS_SNOOZE:
        set_remd_sensitivity (5);
        set_remd_min_epoch_moves (13);
        set_remd_required_rem_epochs (3);
        set_remd_min_move_duration (10);
        set_remd_cooldown_epochs (60);
        set_remd_restlessness_factor (15);
        break;

      case REMD_PROFILE_STRESS_BALANCE:
        set_remd_sensitivity (6);
        set_remd_min_epoch_moves (12);
        set_remd_required_rem_epochs (3);
        set_remd_min_move_duration (8);
        set_remd_cooldown_epochs (75);
        set_remd_restlessness_factor (15);
        break;
    }

    /* make the properties read-only */
    set_readonly_remd_sensitivity (true);
    set_readonly_remd_required_rem_epochs (true);
    set_readonly_remd_cooldown_epochs (true);
    set_readonly_remd_min_move_duration (true);
    set_readonly_remd_min_epoch_moves (true);
    set_readonly_remd_restlessness_factor (false); // temporarily allow this for testing phase
  }
}

void Config::set_default_remd_profile (void)
{
  if (get_default_remd_profile () == get_invalid_remd_profile ()) {

	  set_remd_profile_invalid ();
  } else {

	  set_remd_profile (get_default_remd_profile ());
  }
}

void Config::set_remd_profile_invalid (void)
{
  cfg.props.remd_profile = get_invalid_remd_profile ();

  /* 
   * Here "invalid" actually means the "custom", or adjustable, mode.
   * Let user change properties by hand.
   */
  set_readonly_remd_sensitivity (false);
  set_readonly_remd_required_rem_epochs (false);
  set_readonly_remd_cooldown_epochs (false);
  set_readonly_remd_min_move_duration (false);
  set_readonly_remd_min_epoch_moves (false);
  set_readonly_remd_restlessness_factor (false);
}


/*-----------------------------------------------------------------------*\
 * System Functions
\*-----------------------------------------------------------------------*/

uint16_t fw_version (void)
{
	return pgm_read_word_far (&u_FirmwareVersion);
}
