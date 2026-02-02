/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2026  ORPAL Technologies, Inc.
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
/* Standard locations */
#define RECORDS_PATH  "RECORDS"
#define STATS_PATH    "STATS"

/*-----------------------------------------------------------------------*/
#define STG_FILE		1
#define STG_EEPROM	2

#ifndef CONF_STG
	#define CONF_STG	STG_FILE
#endif

/*-----------------------------------------------------------------------*/
#define RECORD_GAIN_LEVEL_AGC 0

/*-----------------------------------------------------------------------*/
#define WAKEUP_MODE_CUSTOM    0
#define WAKEUP_MODE_LIGHT     1
#define WAKEUP_MODE_MEDIUM    2
#define WAKEUP_MODE_INTENSE   3

#define WAKEUP_TIMER_DELAY_DEFAULT	((3 * 60) + 30)     /* 3h 30min */

#define ALARM_CLOCK_DELAY_SEC 60

/*-----------------------------------------------------------------------*/
typedef enum e_remd_profile {

  REMD_PROFILE_CUSTOM             = 0,

  /* The "Snooze Filter": Engineered for maximum certainty. It ignores 
   *  light sleep "flickers" and postural shifts by requiring a high-velocity 
   *  threshold and a long 90-second (3-epoch) sustained plateau. 
   *  Best used when you are prone to waking up from the lights or 
   *  when sleep quality is the priority.
   * Use Case: Deep Night / Light Sleepers
   */
  REMD_PROFILE_CONSERVATIVE,

  /* The "Daily Driver": The standard baseline for a full night's sleep.
   *  It uses a moderate velocity wall and a 10-move threshold to catch 
   *  standard REM cycles. It provides a good balance between catching 
   *  dreams early and filtering out minor nocturnal movements.
   * Use Case: Standard Overnight
   */
  REMD_PROFILE_BALANCED,

  /* The "Early Hour Bridge": Specifically tuned for the final 2 hours 
   *  of sleep where REM is frequent but sleep is fragmented.
   *  It sets the move threshold just above common "snooze jitters" 
   *  (12 moves) and requires a 60-second (2-epoch) commitment. 
   *  It is less "deaf" than Conservative but much harder to accidentally 
   *  trigger than Balanced.
   * Use Case: 5AM - 8AM / Fragmented Sleep
   */
  REMD_PROFILE_MORNING_SNOOZE,

  /* The "Dream Hunter": High-sensitivity, instant-trigger mode. 
   *  It ignores the need for persistence (1-epoch) and lowers the 
   *  velocity wall significantly. Best used for afternoon naps or 
   *  by heavy sleepers who have difficulty remembering dreams and 
   *  want a signal the moment any movement is detected.
   * Use Case: Naps / Heavy Sleepers
   */
  REMD_PROFILE_AGGRESSIVE,

  /* The "Leave Me Alone": This is for when you are exhausted 
   *  but your mind is racing.
   */
  REMD_PROFILE_STRESS_SHIELD,

  /* The "Grey Zone" Morning: For that 5 AM to 8 AM window where you
   *  previously saw "Instant Triggers."
   */
  REMD_PROFILE_STRESS_SNOOZE,

  /* The "Safe" Discovery: For when you feel a bit more centered but 
   *  still notice "micro-jitters" in your logs.
   */
  REMD_PROFILE_STRESS_BALANCE

} remd_profile_t;

/*-----------------------------------------------------------------------*/
#define DSCONF_DECLARE_PROPERTY(name, type) \
  typedef type name ## _t;					        \
  type	min_ ## name (void);				        \
  type	max_ ## name (void);				        \
  type	step_ ## name (void);				        \
  type	get_ ## name (void);				        \
  type	get_default_ ## name (void);		    \
  void	set_ ## name (type);				        \
  void	set_default_ ## name (void);		    \
  bool	is_readonly_ ## name (void);		    \
  void	set_readonly_ ## name (bool);

#define DSCONF_DECLARE_PROPERTY_WITH_INVALID(name, type)  \
  DSCONF_DECLARE_PROPERTY(name, type)						          \
  type	get_invalid_ ## name (void);						          \
  void	set_ ## name ## _invalid (void);						      \
  bool	is_ ## name ## _invalid (void);

#define DSCONF_DECLARE_STATIC_COUNTER_PROPERTY(name, type)  \
  typedef type name ## _t;									                \
  static name ## _t v_ ## name;								              \
  type	get_ ## name (void);								                \
  void	inc_ ## name (void);								                \
  void	reset_ ## name (void);

#define DSCONF_DECLARE_BOOL_PROPERTY(name)  \
  bool	get_ ## name (void);				        \
  void	set_ ## name (bool);				        \
  void	toggle_ ## name (void);				      \
  void	set_default_ ## name (void);

#define DSCONF_DECREMENT_PROPERTY(cfg, name)          \
  if (! cfg.is_readonly_ ## name ()) {					      \
	  DS::Config::name ## _t val = cfg.get_ ## name (); \
	  /* disable values below zero !!*/					        \
	  if(val < cfg.step_ ## name ()) {					        \
	    val = cfg.max_ ## name ();						          \
    } else {												                  \
	    val -= cfg.step_ ## name ();						        \
	    if(val < cfg.min_ ## name ()) {					        \
		    val = cfg.max_ ## name ();						        \
      }                                               \
	  }													                        \
	  cfg.set_ ## name (val);								            \
  }

#define DSCONF_INCREMENT_PROPERTY(cfg, name)          \
  if (! cfg.is_readonly_ ## name ()) {					      \
	  DS::Config::name ## _t val = cfg.get_ ## name (); \
	  val += cfg.step_ ## name ();						          \
	  if (val > cfg.max_ ## name ()) {					        \
	    val = cfg.min_ ## name ();						          \
    }                                                 \
	  cfg.set_ ## name (val);								            \
  }

#define DSCONF_DECREMENT_PROPERTY_WITH_INVALID(cfg, name)	\
  if (! cfg.is_ ## name ## _invalid ())							      \
	DSCONF_DECREMENT_PROPERTY(cfg, name)

#define DSCONF_INCREMENT_PROPERTY_WITH_INVALID(cfg, name) \
  if (! cfg.is_ ## name ## _invalid ())							      \
	DSCONF_INCREMENT_PROPERTY(cfg, name)

#define DSCONF_TOGGLE_PROPERTY_WITH_INVALID(cfg, name)  \
  if (! cfg.is_readonly_ ## name ()) {					        \
	  if (cfg.is_ ## name ## _invalid ()) {						    \
	    cfg.set_default_ ## name ();						          \
    } else {												                    \
	    cfg.set_ ## name ## _invalid ();  			          \
    }                                                   \
  }


/*-----------------------------------------------------------------------*/
#define DSCONF_DEFINE_FLAG(name)		  uint8_t name : 1
#define DSCONF_DEFINE_FLAG_RO(name)		DSCONF_DEFINE_FLAG(name ## __RO)
#define DSCONF_DEFINE_FIELD(name)		  name ## _t	name


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
  // Conversion routines
  //
  static uint8_t level_to_percent(uint8_t level);

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
  DSCONF_DECLARE_PROPERTY_WITH_INVALID(light_hints_duration, uint8_t)

  /*Duration of a Series of Sound Signals*/
  DSCONF_DECLARE_PROPERTY_WITH_INVALID(sound_hints_duration, uint8_t)

  /*
   * Three REM detection profiles are available.
   * Number 0 corresponds to adjustable mode.
   */
  DSCONF_DECLARE_PROPERTY_WITH_INVALID(remd_profile, uint8_t)

  /* Sensitivity (The "Goldilocks" Window)
   *  This parameter defines the "Ceiling" or maximum allowed power for a 
   *  movement. It is the primary filter for removing blinks and finger twitches.
   * Range: 1 to 9
   * 
   * Logic: Ceiling = (Sensitivity * 5) + 20
   * 
   * * 1   Strict (Ceiling: 25): 
   * Only the most subtle, quiet eye rolls are accepted. 
   * Ignores even slightly fast eye movements.
   * 
   * * 5   Balanced (Ceiling: 45): 
   * The "Sweet Spot" found in your tests. Accepts standard 
   * closed-eye REM rolls but effectively kills finger spikes.
   * 
   * * 9   Ultra Sensitive (Ceiling: 65): 
   * Allows more vigorous or "snappy" eye movements to be 
   * counted, but may occasionally let a fast blink through.
   */
  DSCONF_DECLARE_PROPERTY(remd_sensitivity, uint8_t)

  /* Required Minimum REM Epochs
   *  This is your "Confidence Filter." It determines how long the REM burst 
   *  must last before the LEDs trigger.
   * Range: 1 to 6 (30 seconds to 3 minutes)
   * 
   *  1 Epoch (30s): "Instant Trigger."
   *    Use this only if you have very short REM cycles. It is prone to 
   *    "false starts" where a few random eye movements in light sleep 
   *      trigger the light.
   * 
   *  2 – 3 Epochs (60s – 90s): Recommended.
   *    REM sleep usually occurs in "phasic" bursts. Waiting 60-90 seconds 
   *    ensures you are actually in the dream and not just experiencing 
   *    a momentary stir.
   * 
   *  4 – 6 Epochs (2m – 3m): Very stable.
   *    You will almost never get a false positive, but you risk the REM phase 
   *    ending before the light triggers, or catching you when you are already 
   *    drifting toward waking up.
   */
  DSCONF_DECLARE_PROPERTY(remd_required_rem_epochs, uint8_t)

  /* REM Detector Cooldown Epochs
   * This prevents the device from "spamming" you with light once you are already
   *  lucid (or trying to stay asleep).
   * Range: 10 to 120 (5 minutes to 60 minutes) 
   * 
   *  20 Epochs (10 min): Very short. 
   *    Use this only for testing. If you don't become lucid on the first try,
   *    you get another "clue" 10 minutes later. High risk of waking you up. 
   * 
   *  40 – 60 Epochs (20 – 30 min): Balanced.
   *    Since REM cycles themselves usually last 10–30 minutes, this ensures 
   *    you get 1 or 2 chances per cycle.
   * 
   *  120 – 180 Epochs (60 – 90 min): "One Shot per Cycle." 
   *    This mimics the natural human sleep architecture. 
   *    You get one chance to become lucid, and then the device stays quiet 
   *    until your next REM cycle roughly 90 minutes later.
   */
  DSCONF_DECLARE_PROPERTY(remd_cooldown_epochs, uint8_t)

  /* REM Detector Required Minimum Move Duration
   * Bucket Span (Integrated Time)
   * Range: 2 to 20 (Buckets)
   * Note: Each bucket represents 50ms of integrated sensor data.
   * 
   * Duration         Interpretation
   * --------------------------------------------------------------------------
   * 1-2 Buckets      Micro-Jitter / Blinks
   * (50-100ms)       Usually too fast for a physiological REM roll. 
   *                  Often filtered out as noise or artifacts.
   *
   * 3-8 Buckets      The REM "Sweet Spot"
   * (150-400ms)      Typical duration of a closed-eye REM saccade.
   *                  This provides the best balance for dream detection.
   *
   * 9-15 Buckets     Slow Eye Drifts
   * (450-750ms)      Very deliberate, slow rolls. Common in deep REM,
   *                  but may also catch slow head-sinking movements.
   *
   * > 20 Buckets     Gross Body Movement
   * (> 1000ms)       The signal has stayed active for a full second. 
   *                  Likely a mask adjustment or turning in bed.
   */
  DSCONF_DECLARE_PROPERTY(remd_min_move_duration, uint8_t)

  /* REM Detector Minimum Required Moves Per Epoch
   *  (The "REM Burst" Threshold)
   *  This is the number of validated eye rolls (saccades) within a 30-second
   *  window required to classify that period as REM sleep.
   * Range: 3 to 20 (validated moves)
   * 
   * Setting              Value         Behavior
   * --------------------------------------------------------------------------
   * Aggressive           3–6           Triggers on the very first signs of 
   * (Snooze Mode)                      dreaming. High chance of lucidity, but 
   *                                    might flash during light sleep transitions.
   * 
   * Balanced             8–12          The "Standard" REM signature. Requires 
   * (Normal)                           a clear burst of sustained eye activity
   *                                    common in mid-night REM cycles.
   * 
   * Conservative         15+           High-intensity REM only. Use this if 
   * (Stress Shield)                    you are a light sleeper who is easily 
   *                                    woken by the LEDs.
   */
  DSCONF_DECLARE_PROPERTY(remd_min_epoch_moves, uint8_t)

  /* REM Detector Restlessness Factor (Stability Gate)
   *  Distinguishes between REM (quiet body, moving eyes) and being 
   *  awake/restless (shaking mask, head movements).
   * This factor defines the maximum "Average Jitter" allowed per 50ms 
   * bucket over a 30-second window.
   * Range: 5 to 50
   * 
   * Setting              Value         Behavior
   * --------------------------------------------------------------------------
   * High Sensitivity     10 - 15       Strict: Requires the user to be 
   * (Conservative)                     perfectly still. Best for avoiding 
   *                                    false triggers while falling asleep.
   * 
   * Standard             20 - 25       Balanced: Allows natural breathing 
   * (Balanced)                         shifts or minor mask settling without 
   *                                    invalidating the epoch.
   * Low Sensitivity      30 - 45       Forgiving: Allows significant tossing 
   * (Aggressive)                       and turning. Useful for morning REM 
   *                                    where sleep is naturally more "active."
   */
  DSCONF_DECLARE_PROPERTY(remd_restlessness_factor, uint8_t)

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
    DSCONF_DEFINE_FIELD(remd_profile);
    DSCONF_DEFINE_FIELD(remd_sensitivity);
    DSCONF_DEFINE_FIELD(remd_required_rem_epochs);
    DSCONF_DEFINE_FIELD(remd_cooldown_epochs);
    DSCONF_DEFINE_FIELD(remd_min_move_duration);
    DSCONF_DEFINE_FIELD(remd_min_epoch_moves);
    DSCONF_DEFINE_FIELD(remd_restlessness_factor);
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
    DSCONF_DEFINE_FLAG_RO(remd_profile);
    DSCONF_DEFINE_FLAG_RO(remd_sensitivity);
    DSCONF_DEFINE_FLAG_RO(remd_required_rem_epochs);
    DSCONF_DEFINE_FLAG_RO(remd_cooldown_epochs);
    DSCONF_DEFINE_FLAG_RO(remd_min_move_duration);
    DSCONF_DEFINE_FLAG_RO(remd_min_epoch_moves);
    DSCONF_DEFINE_FLAG_RO(remd_restlessness_factor);
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
