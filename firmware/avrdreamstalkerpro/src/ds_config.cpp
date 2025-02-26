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

#include "ds_config.h"
#include "ds_util.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* IMPORTANT: signature must be updated on every change 
 *			made to the configuration layout !!!
 */
#define DSCONF_SIGNATURE	0x8002


/*-----------------------------------------------------------------------*/
/* Min, max, default and invalid values for various configuration properties */

#define WAKEUP_TIMER_DELAY_MIN			3				        /* 3min */
#define WAKEUP_TIMER_DELAY_MAX			(6 * 60)	    	/* 6h */


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
  return 1;												                      \
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
bool Config::is_invalid_ ## name (void)					        \
{														                            \
  return (cfg.props.name == invalid_val);				        \
}


#define DSCONF_IMPLEMENT_PROPERTY_WITH_INVALID(name, min_val, max_val, step, default_val, invalid_val)	\
DSCONF_IMPLEMENT_PROPERTY(name, min_val, max_val, step, default_val)	\
														                            \
void Config::set_invalid_ ## name (void)				        \
{														                            \
  cfg.props.name = get_invalid_  ## name ();            \
}														                            \
Config::name ## _t Config::get_invalid_ ## name (void)  \
{														                            \
  return invalid_val;									                  \
}														                            \
bool Config::is_invalid_ ## name (void)					        \
{														                            \
  return (cfg.props.name == invalid_val);				        \
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
PROGMEM const uint16_t u_FirmwareVersion = MAKE_VER ( 2,0 );

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
  set_default_loud_speaker ();
  set_default_alarm_clock ();

  /*
   * TODO: Add more lines below if you need more properties !!!
   */
  set_default_sleep_scenario ();
  set_default_relax_tunes ();
  set_default_volume_level ();
  set_default_record_gain_level ();
  set_default_remd_sensitivity ();
  set_default_duplex_mode ();
  set_default_wakeup_mode ();
  set_default_wakeup_timer_delay ();
  set_default_vibration_level ();
  set_default_hints_frequency ();
  set_default_hints_duty_cycle ();
  set_default_light_hints_brightness ();
  set_default_sound_hints_volume ();
  set_default_light_hints_duration ();
  set_default_sound_hints_duration ();

  /*
   * TODO: Add more lines below if you need more properties !!!
   */


  /*
   * TODO: Add more lines below to control read-only status !!!
   */
  set_readonly_volume_level (false);
  set_readonly_vibration_level (false);
  set_readonly_record_gain_level (false);
  set_readonly_wakeup_timer_delay (false);
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
  eeprom_update_block (&cfg, 
						&eeprom_cfg, 
						sizeof (cfg));

#elif ( CONF_STG == STG_FILE )
  // TODO: implement save to file

#else
  #error "Unknown storage type"
#endif
}

bool Config::load_from_storage (void)
{
#if ( CONF_STG == STG_EEPROM )
  eeprom_read_block ((void *)&cfg, 
					(const void *)&eeprom_cfg, 
					sizeof (cfg));

#elif ( CONF_STG == STG_FILE )
  /* open config file */
  shared_fp = SD.open ( "config", FILE_READ );
  if ( !shared_fp)
	return false;

  shared_fp.read ( &cfg, sizeof ( cfg ));
  shared_fp.close ();

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
  SD.remove("config");

#else
  #error "Unknown storage type"
#endif
}

/*-----------------------------------------------------------------------*\
 * Configuration Properties
\*-----------------------------------------------------------------------*/

DSCONF_IMPLEMENT_BOOL_PROPERTY(before_hints, false)
DSCONF_IMPLEMENT_BOOL_PROPERTY(after_hints, false)
DSCONF_IMPLEMENT_BOOL_PROPERTY(voice_recording, false)
DSCONF_IMPLEMENT_BOOL_PROPERTY(loud_speaker, true)
DSCONF_IMPLEMENT_BOOL_PROPERTY(alarm_clock, false)
DSCONF_IMPLEMENT_PROPERTY(wakeup_timer_delay, WAKEUP_TIMER_DELAY_MIN, WAKEUP_TIMER_DELAY_MAX, 1, WAKEUP_TIMER_DELAY_DEFAULT)
DSCONF_IMPLEMENT_PROPERTY(sleep_scenario, 0, 9, 1, 0)
DSCONF_IMPLEMENT_PROPERTY(relax_tunes, 0, 9, 1, 0)
DSCONF_IMPLEMENT_PROPERTY(vibration_level, 0, 9, 1, 5)
DSCONF_IMPLEMENT_PROPERTY(volume_level, 1, 9, 1, 5)
DSCONF_IMPLEMENT_PROPERTY(record_gain_level, 0, 64, 1, 0)
DSCONF_IMPLEMENT_PROPERTY(remd_sensitivity, 2, 7, 1, 4)
DSCONF_IMPLEMENT_PROPERTY_GET_WITH_INVALID(duplex_mode, 1, 3, 1, 0, 0)
DSCONF_IMPLEMENT_PROPERTY_GET_WITH_INVALID(wakeup_mode, WAKEUP_MODE_LIGHT, WAKEUP_MODE_INTENSE, 1, WAKEUP_MODE_MEDIUM, WAKEUP_MODE_CUSTOM)
DSCONF_IMPLEMENT_PROPERTY(hints_frequency, 1, 9, 1, 2)
DSCONF_IMPLEMENT_PROPERTY(hints_duty_cycle, 1, 9, 1, 4)
DSCONF_IMPLEMENT_PROPERTY(light_hints_brightness,	1, 9, 1, 3)
DSCONF_IMPLEMENT_PROPERTY(sound_hints_volume,	1, 9, 1, 3)
DSCONF_IMPLEMENT_PROPERTY(light_hints_duration,	0, 99, 1, 7)
DSCONF_IMPLEMENT_PROPERTY(sound_hints_duration,	0, 99, 1, 7)
DSCONF_IMPLEMENT_STATIC_COUNTER_PROPERTY(remd_trigger_count)


/*-----------------------------------------------------------------------*\
 * Custom set-functions
\*-----------------------------------------------------------------------*/

void Config::set_duplex_mode ( duplex_mode_t val )
{
  if (val <= max_duplex_mode () && val >= min_duplex_mode())
	  cfg.props.duplex_mode = val;
}

void Config::set_default_duplex_mode ( void )
{
  if (get_default_duplex_mode () == get_invalid_duplex_mode ()) {
	  set_invalid_duplex_mode ();

  } else {
	  set_duplex_mode (get_default_duplex_mode ());
  }
}

void Config::set_invalid_duplex_mode (void)
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
        set_light_hints_brightness (3);
        set_light_hints_duration (2);
        set_sound_hints_volume(1);
        set_sound_hints_duration(0);
        set_hints_duty_cycle(4);
        break;

      case WAKEUP_MODE_MEDIUM:
        set_light_hints_brightness(6);
        set_light_hints_duration(6);
        set_sound_hints_volume(1);
        set_sound_hints_duration(0);
        set_hints_duty_cycle(4);
        break;
        
      case WAKEUP_MODE_INTENSE:
        set_light_hints_brightness(9);
        set_light_hints_duration(10);
        set_sound_hints_volume(4);
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

void Config::set_default_wakeup_mode (void)
{
  if (get_default_wakeup_mode () == get_invalid_wakeup_mode ()) {
	  set_invalid_wakeup_mode ();

  } else {
	  set_wakeup_mode (get_default_wakeup_mode ());
  }
}

void Config::set_invalid_wakeup_mode (void)
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

/*-----------------------------------------------------------------------*\
 * System Functions
\*-----------------------------------------------------------------------*/

uint16_t fw_version (void)
{
	return pgm_read_word_far (&u_FirmwareVersion);
}
