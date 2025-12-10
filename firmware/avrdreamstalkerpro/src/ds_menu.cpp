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

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <avr/io.h>
#include <avr/pgmspace.h>

#include "input/ds_keybrd.h"
#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "sound/ds_sound.h"
#include "sound/ds_codec.h"
#include "ds_vibro.h"
#include "ds_config.h"
#include "ds_rtclock.h"
#include "ds_util.h"
#include "ds_menu.h"
#include "ds_driver.h"


using namespace DS;

/*-----------------------------------------------------------------------*/
#define RECORDS_PATH	"/SYSTEM/RECORDS"

/*-----------------------------------------------------------------------*/

#define MENU_LABEL_LEN	7
#define MENU_INVALID_LEVEL	(-1)

/*-----------------------------------------------------------------------*/
typedef void (*pfn_activate)(void);
typedef void (*pfn_exit)(void);
typedef void (*pfn_handler)(pmenu_context_t, keybrd_event_t);
typedef int (*pfn_read_value)(void);

typedef struct s_menu_desc menu_desc_t;

struct s_menu_desc {
  const char text[MENU_LABEL_LEN + 1];
  uint8_t fmt;
  pfn_activate activate;
  pfn_exit exit_fn;
  pfn_handler handler;
  pfn_read_value read_value;
  const menu_desc_t *sub_items;
  uint8_t sub_count;
};

/*-----------------------------------------------------------------------*\
 * Menu Handlers
\*-----------------------------------------------------------------------*/

static void ense_before_hints_setup (pmenu_context_t, keybrd_event_t);
static void ense_after_hints_setup (pmenu_context_t, keybrd_event_t);
static void ense_sleep_scenario_setup (pmenu_context_t, keybrd_event_t);
static void ense_recording_setup (pmenu_context_t, keybrd_event_t);
static void ense_record_gain_setup (pmenu_context_t, keybrd_event_t);
static void ense_volume_level_setup (pmenu_context_t, keybrd_event_t);
static void ense_tunes_setup (pmenu_context_t, keybrd_event_t);
static void ense_delete_records (pmenu_context_t, keybrd_event_t);
static void ense_vibration_setup (pmenu_context_t, keybrd_event_t);
static void ense_speaker_setup (pmenu_context_t, keybrd_event_t);

static void ense_before_hints_setup_activate (void);
static void ense_after_hints_setup_activate (void);
static void ense_sleep_scenario_setup_activate (void);
static void ense_recording_setup_activate (void);
static void ense_record_gain_setup_activate (void);
static void ense_volume_level_setup_activate (void);
static void ense_tunes_setup_activate (void);
static void ense_vibration_setup_activate (void);
static void ense_speaker_setup_activate (void);
static void ense_delete_records_activate (void);

static int ense_before_hints_setup_read_value (void);
static int ense_after_hints_setup_read_value (void);
static int ense_sleep_scenario_setup_read_value (void);
static int ense_recording_setup_read_value (void);
static int ense_record_gain_setup_read_value (void);
static int ense_volume_level_setup_read_value (void);
static int ense_tunes_setup_read_value (void);
static int ense_vibration_setup_read_value (void);
static int ense_speaker_setup_read_value (void);
static int remd_sensitivity_setup_read_value (void);
static int duplex_mode_setup_read_value (void);
static int wakeup_mode_setup_read_value (void);
static int alarm_clock_setup_read_value (void);
static int hints_frequency_setup_read_value (void);
static int hints_duty_cycle_setup_read_value (void);
static int light_hints_brightness_setup_read_value (void);
static int sound_hints_level_setup_read_value (void);
static int light_hints_duration_setup_read_value (void);
static int sound_hints_duration_setup_read_value (void);

static void clock_setup (pmenu_context_t, keybrd_event_t);
static void trigger_clocks_setup (pmenu_context_t, keybrd_event_t);
static void remd_sensitivity_setup (pmenu_context_t, keybrd_event_t);
static void duplex_mode_setup (pmenu_context_t, keybrd_event_t);
static void wakeup_mode_setup (pmenu_context_t, keybrd_event_t);
static void alarm_clock_setup (pmenu_context_t, keybrd_event_t);
static void hints_frequency_setup (pmenu_context_t, keybrd_event_t);
static void hints_duty_cycle_setup (pmenu_context_t, keybrd_event_t);
static void light_hints_brightness_setup (pmenu_context_t, keybrd_event_t);
static void sound_hints_level_setup (pmenu_context_t, keybrd_event_t);
static void light_hints_duration_setup (pmenu_context_t, keybrd_event_t);
static void sound_hints_duration_setup (pmenu_context_t, keybrd_event_t);
static void wakeup_signal_check_handler (pmenu_context_t, keybrd_event_t);
static void remd_check_handler (pmenu_context_t, keybrd_event_t);
static void set_defaults_handler (pmenu_context_t, keybrd_event_t);
static void save_settings_handler (pmenu_context_t, keybrd_event_t);

static void clock_setup_activate (void);
static void wakeup_timer_setup_activate (void);
static void trigger_count_display (void);
static void remd_sensitivity_setup_activate (void);
static void trigger_clocks_setup_activate (void);
static void duplex_mode_setup_activate (void);
static void wakeup_mode_setup_activate (void);
static void alarm_clock_setup_activate (void);
static void hints_frequency_setup_activate (void);
static void hints_duty_cycle_setup_activate (void);
static void light_hints_brightness_setup_activate (void);
static void sound_hints_level_setup_activate (void);
static void light_hints_duration_setup_activate (void);
static void sound_hints_duration_setup_activate (void);
static void set_defaults_activate (void);
static void save_settings_activate (void);

static void clock_setup_exit (void);
static void wakeup_timer_setup_exit (void);
static void trigger_clocks_setup_exit (void);
static void remd_sensitivity_setup_exit (void);
static void light_hints_duration_setup_exit (void);
static void sound_hints_duration_setup_exit (void);


PROGMEM const menu_desc_t desc_en_se[] = {
  {
	"bE-%i\0\0",
	1,
	ense_before_hints_setup_activate,
	nullptr,
	ense_before_hints_setup,
	ense_before_hints_setup_read_value,
  },
  {
	"AF-%i\0\0",
	1,
	ense_after_hints_setup_activate,
	nullptr,
	ense_after_hints_setup,
	ense_after_hints_setup_read_value,
  },
  {
	"Sc-%i\0\0",
	1,
	ense_sleep_scenario_setup_activate,
	nullptr,
	ense_sleep_scenario_setup,
	ense_sleep_scenario_setup_read_value,
  },
  {
	"rd-%i\0\0",
	1,
	ense_recording_setup_activate,
	nullptr,
	ense_recording_setup,
	ense_recording_setup_read_value,
  },
  {
	"rG-%i\0\0",
	1,
	ense_record_gain_setup_activate,
	nullptr,
	ense_record_gain_setup,
	ense_record_gain_setup_read_value,
  },
  {
	"LE-%i\0\0",
	1,
	ense_volume_level_setup_activate,
	nullptr,
	ense_volume_level_setup,
	ense_volume_level_setup_read_value,
  },
  {
	"tu-%i\0\0",
	1,
	ense_tunes_setup_activate,
	nullptr,
	ense_tunes_setup,
	ense_tunes_setup_read_value,
  },
  {
	"dELr\0\0\0",
	0,
	ense_delete_records_activate,
	nullptr,
	ense_delete_records,
  },
  {
	"FL-%i\0\0",
	1,
	ense_vibration_setup_activate,
	nullptr,
	ense_vibration_setup,
	ense_vibration_setup_read_value,
  },
  {
	"SP-%i\0\0",
	1,
	ense_speaker_setup_activate,
	nullptr,
	ense_speaker_setup,
	ense_speaker_setup_read_value,
  },
};


/*-----------------------------------------------------------------------*\
 * Menu Labels
\*-----------------------------------------------------------------------*/

PROGMEM const menu_desc_t desc_root[] = {
  {
	"CLSE\0\0\0",
	0,
	clock_setup_activate,
	clock_setup_exit,
	clock_setup,
  },
  {
	"UtSE\0\0\0",
	0,
	wakeup_timer_setup_activate,
	wakeup_timer_setup_exit,
	AppMenu::wakeup_timer_setup,
  },
  {
	"EnSE\0\0\0",
	0,
	nullptr,
	nullptr,
	nullptr,
	nullptr,
	desc_en_se,
	sizeof(desc_en_se)/sizeof(desc_en_se[0]),
  },
  {
	"Cotr\0\0\0",
	0,
	trigger_count_display,
  },
  {
	"CLtr\0\0\0",
	0,
	trigger_clocks_setup_activate,
	trigger_clocks_setup_exit,
	trigger_clocks_setup,
  },
  {
	// REM Detector Sensitivity 
	"d-%.2i\0",
	2,
	remd_sensitivity_setup_activate,
	remd_sensitivity_setup_exit,
	remd_sensitivity_setup,
	remd_sensitivity_setup_read_value,
  },
  {
	"du-%i\0\0",
	1,
	duplex_mode_setup_activate,
	nullptr,
	duplex_mode_setup,
	duplex_mode_setup_read_value,
  },
  {
	"UP-%i\0\0",
	1,
	wakeup_mode_setup_activate,
	nullptr,
	wakeup_mode_setup,
	wakeup_mode_setup_read_value,
  },
  {
	"AL-%i\0\0",
	1,
	alarm_clock_setup_activate,
	nullptr,
	alarm_clock_setup,
	alarm_clock_setup_read_value,
  },
  {
	"Fr-%i\0\0",
	1,
	hints_frequency_setup_activate,
	nullptr,
	hints_frequency_setup,
	hints_frequency_setup_read_value,
  },
  {
	"Od-%i\0\0",
	1,
	hints_duty_cycle_setup_activate,
	nullptr,
	hints_duty_cycle_setup,
	hints_duty_cycle_setup_read_value
  },
  {
	"br-%i\0\0",
	1,
	light_hints_brightness_setup_activate,
	nullptr,
	light_hints_brightness_setup,
	light_hints_brightness_setup_read_value,
  },
  {
	"LE-%i\0\0",
	1,
	sound_hints_level_setup_activate,
	nullptr,
	sound_hints_level_setup,
	sound_hints_level_setup_read_value,
  },
  {
	"F-%.2i\0",
	2,
	light_hints_duration_setup_activate,
	light_hints_duration_setup_exit,
	light_hints_duration_setup,
	light_hints_duration_setup_read_value,
  },
  {
	"S-%.2i\0",
	2,
	sound_hints_duration_setup_activate,
	sound_hints_duration_setup_exit,
	sound_hints_duration_setup,
	sound_hints_duration_setup_read_value,
  },
  {
	// check installed wakeup signals
	"ChUS\0\0\0",
	0,
	nullptr,
	nullptr,
	wakeup_signal_check_handler,
  },
  {
	// check REM detector 
	"Chdt\0\0\0",
	0,
	nullptr,
	nullptr,
	remd_check_handler,
  },
  {
	// Reset configuration to defaults
	"rSEt\0\0\0",
	0,
	set_defaults_activate,
	nullptr,
	set_defaults_handler,
  },
  {
	// Save configuration to EEPROM 
	"SAUE\0\0\0",
	0,
	save_settings_activate,
	nullptr,
	save_settings_handler,
  },
};


static 
void set_unhandled (menu_context_t *ctx)
{
  ctx->res = MENU_UNHANDLED;
}

static
void set_handled (menu_context_t *ctx)
{
  ctx->res |= MENU_HANDLED;
}

static
void set_return (menu_context_t *ctx)
{
  ctx->res |= MENU_RETURN;
}

static
uint8_t set_menu_exit (menu_context_t *ctx)
{
  ctx->level = MENU_INVALID_LEVEL;
  ctx->res	= (MENU_HANDLED | MENU_EXIT);

  return ctx->res;
}

bool plane_is_active (menu_context_t *ctx)
{
  return ctx->plane [ctx->level].is_active != 0;
}

void plane_activate (menu_context_t *ctx, bool activate)
{
  ctx->plane [ctx->level].is_active = (activate ? 1 : 0);
}


/* ----------------------------------------------------------------------*\
 * Menu layout accessors
\*-----------------------------------------------------------------------*/

static
const char *desc_text(const uint8_t *desc_addr, char *buf)
{
  strcpy_P(buf, (const char *)(desc_addr + offsetof(menu_desc_t, text)));
  return buf;
}

static
uint8_t desc_fmt(const uint8_t *desc_addr)
{
  return pgm_read_byte_far(desc_addr + offsetof(menu_desc_t, fmt));
}

static
pfn_activate desc_activate_func(const uint8_t *desc_addr)
{
  return (pfn_activate) pgm_read_ptr_far(desc_addr 
									+ offsetof(menu_desc_t, activate));
}

static
pfn_exit desc_exit_func(const uint8_t *desc_addr)
{
  return (pfn_exit) pgm_read_ptr_far(desc_addr
									+ offsetof(menu_desc_t, exit_fn));
}

static
pfn_handler desc_handler_func(const uint8_t *desc_addr)
{
  return (pfn_handler) pgm_read_ptr_far(desc_addr
									+ offsetof(menu_desc_t, handler));
}

static
pfn_read_value desc_read_value_func(const uint8_t *desc_addr)
{
  return (pfn_read_value) pgm_read_ptr_far(desc_addr
									+ offsetof(menu_desc_t, read_value));
}

static
const uint8_t *desc_sub_items(const uint8_t *desc_addr)
{
  return (const uint8_t *) pgm_read_ptr_far(desc_addr
									+ offsetof(menu_desc_t, sub_items));
}

static
uint8_t desc_sub_count(const uint8_t *desc_addr)
{
  return pgm_read_byte_far(desc_addr + offsetof(menu_desc_t, sub_count));
}

const uint8_t *desc_addr (pmenu_context_t ctx, int level)
{
  const uint8_t *addr = (const uint8_t *)&desc_root;
  int8_t l = 0;
  do {
	addr = addr + sizeof(menu_desc_t) * ctx->plane[l].index;
	if (l< level)
	  addr = desc_sub_items(addr);
  } while (level>l++);

  return addr;
}

const uint8_t *get_addr (pmenu_context_t ctx)
{
  return desc_addr (ctx, ctx->level);
}

const char *get_text(pmenu_context_t ctx, char *buf)
{
  return desc_text (get_addr (ctx), buf);
}

uint8_t get_fmt (pmenu_context_t ctx)
{
  return desc_fmt (get_addr (ctx));
}

uint8_t get_sub_count (pmenu_context_t ctx)
{
  return desc_sub_count (get_addr (ctx));
}

static
pfn_activate get_activate_func(pmenu_context_t ctx)
{
  return desc_activate_func (get_addr (ctx));
}

static
pfn_exit get_exit_func (pmenu_context_t ctx)
{
  return desc_exit_func (get_addr (ctx));
}

static
pfn_handler get_handler_func(pmenu_context_t ctx)
{
  return desc_handler_func (get_addr (ctx));
}

static
pfn_read_value get_read_value_func (pmenu_context_t ctx)
{
  return desc_read_value_func (get_addr (ctx));
}


/*-----------------------------------------------------------------------*\
 * Menu navigation
\*-----------------------------------------------------------------------*/

void plane_next (pmenu_context_t ctx)
{
  menu_plane_t *plane;
  uint8_t count;

  count = get_sub_count(ctx);
  plane = &ctx->plane [++ctx->level];

  plane->index = 0;
  plane->count = count;
}

int plane_prev (pmenu_context_t ctx)
{
  if (ctx->level == 0)	/*Can't move prev anymore*/
	return MENU_INVALID_LEVEL;

  return --ctx->level;
}

void index_next (pmenu_context_t ctx)
{
  menu_plane_t *plane;

  plane = &ctx->plane [ctx->level];

  plane->index = (plane->index + 1) % plane->count;
}

/*-----------------------------------------------------------------------*\
 * Menu Functions
\*-----------------------------------------------------------------------*/

void update_menu (pmenu_context_t ctx)
{
  char temp[10];
  char buf[5];
  const char *msg;
  pfn_read_value read_val;

  if (get_fmt (ctx) > 0) {
	read_val = get_read_value_func (ctx);

	snprintf(buf, 5, get_text(ctx, temp), (read_val ? read_val () : 0));
	msg = buf;
  }
  else
	msg = get_text (ctx, temp);

  Display::get()->message (msg, 1);
}

/*-----------------------------------------------------------------------*/
AppMenu menu;

/*-----------------------------------------------------------------------*/
AppMenu *AppMenu::get()
{
  return &menu;
}

/*-----------------------------------------------------------------------*/
bool AppMenu::init (void)
{
  memset (&ctx, 0, sizeof(ctx));

  ctx.level = MENU_INVALID_LEVEL;
  ctx.plane[0].count = sizeof (desc_root) / sizeof (desc_root[0]);
  return true;
}

void AppMenu::enter (void)
{
  ctx.level = 0;
  ctx.plane[0].index = 0;

  update_menu (&ctx);
}

bool AppMenu::is_active (void)
{
  return (ctx.level > MENU_INVALID_LEVEL);
}

void AppMenu::play_tone (void)
{
  tonegen.beep ( 80, 4, 6 );
}

int AppMenu::handle_key (uint8_t key_event)
{
  pfn_activate activate_fn;
  pfn_exit exit_fn;
  pfn_handler handler_fn;

  if (! is_active ())
	return MENU_UNHANDLED;

  set_unhandled(&ctx);

  if (key_event == (KEY_SELECT | KEYBRD_HOLD)) {
	play_tone ();

	if (plane_is_active (&ctx)) {
	  // if at submenu level
	  exit_fn = get_exit_func (&ctx);
	  if (exit_fn)
		exit_fn();
	}
	if (plane_prev (&ctx) < 0)
	  return set_menu_exit (&ctx);
	update_menu (&ctx);
	set_handled (&ctx);
	return MENU_HANDLED;
  }

  if (! plane_is_active (&ctx)) {
	switch (key_event) {
	  case KEY_SELECT:
	  	play_tone ();
		// move to the next menu item
		index_next (&ctx);
		update_menu (&ctx);
		set_handled (&ctx);
		break;

	  case KEY_ENTER:
	  	play_tone ();
		// enter the submenu
		if (get_sub_count (&ctx) > 0) {
			plane_next (&ctx);
			update_menu (&ctx);
		} else {
			activate_fn = get_activate_func (&ctx);
			if (activate_fn)
				activate_fn ();
			plane_activate (&ctx, true);
		}
		set_handled(&ctx);
		break;
	}

  } else {
	// if an item is activated
	play_tone ();
	switch (key_event) {
	  case KEY_SELECT:
		exit_fn = desc_exit_func (get_addr (&ctx));
		if (exit_fn)
		  exit_fn();
		// deactivate the item
		plane_activate (&ctx, false);
		update_menu (&ctx);
		set_handled (&ctx);
		break;

	  default:
		/* forward event to submenu handler */
		handler_fn = get_handler_func (&ctx);
		if (handler_fn) {
		  handler_fn(&ctx, key_event);
		  /* check if return from item */
		  if (ctx.res & MENU_RETURN) {
			plane_activate (&ctx, false);
			update_menu (&ctx);
		  }
		}
		break;
	}
  }

  return ctx.res;
}

/*-----------------------------------------------------------------------*\
 * Menu Handlers (implementation)
\*-----------------------------------------------------------------------*/

void ense_before_hints_setup_activate (void)
{
  Display::get()->flag (ense_before_hints_setup_read_value ());
}

void ense_before_hints_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_PLUS ):
	  config.toggle_before_hints ();

	  Display::get()->flag (ense_before_hints_setup_read_value ());
	  set_handled (ctx);
	  break;
  }
}

int ense_before_hints_setup_read_value (void)
{
  return config.get_before_hints();
}

void ense_after_hints_setup_activate (void)
{
  Display::get()->flag (ense_after_hints_setup_read_value ());
}

void ense_after_hints_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_PLUS ):
	  config.toggle_after_hints ();

	  Display::get()->flag ( ense_after_hints_setup_read_value ());
	  set_handled (ctx);
	  break;
  }
}

int ense_after_hints_setup_read_value (void)
{
  return config.get_after_hints ();
}

static
void disp_sleep_scenario (void)
{
  Display::get()->number (ense_sleep_scenario_setup_read_value ());
}

void ense_sleep_scenario_setup_activate (void)
{
  disp_sleep_scenario ();
}

void ense_sleep_scenario_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_ENTER ):
	  // TODO: playback
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, sleep_scenario);

	  disp_sleep_scenario ();
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, sleep_scenario);

	  disp_sleep_scenario ();
	  set_handled (ctx);
	  break;
  }
}

int ense_sleep_scenario_setup_read_value (void)
{
  return config.get_sleep_scenario();
}

void ense_recording_setup_activate ( void )
{
  Display::get()->flag (ense_recording_setup_read_value () );
}

void ense_recording_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  char newfile[50];

  switch ( key_event ) {
	
	case ( KEY_ENTER ):
	  if (AudioCodec::get()->get_status() == AUDIO_CODEC_PLAYBACK) {

		AudioCodec::get()->stop ();
	  }
	  if (AudioCodec::get()->get_status() == AUDIO_CODEC_IDLE) {

		// TODO: playback next recording
	  }
	  set_handled (ctx);
	  break;

	case ( KEY_CHECK ):
	  if (AudioCodec::get()->get_status() == AUDIO_CODEC_CAPTURE) {

		AudioCodec::get()->stop ();
	  }
	  else if (AudioCodec::get()->get_status() == AUDIO_CODEC_IDLE) {
		/*
		 * start new recording 
		 */
		Files::make_next_file_path(newfile, 50, RECORDS_PATH, "MYREC", "WAV");
		AudioCodec::get()->capture (newfile);
	  }
	  else {
		/* TODO: is a real case ? playing music ? */
	  }
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	case ( KEY_PLUS ):
	  config.toggle_voice_recording ();

	  Display::get()->flag (ense_recording_setup_read_value ());
	  set_handled (ctx);
	  break;
  }
}

int ense_recording_setup_read_value (void)
{
  return config.get_voice_recording ();
}

void ense_record_gain_setup_activate (void)
{
  Display::get()->number ( ense_record_gain_setup_read_value ());
}

void ense_record_gain_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD):
	  DSCONF_DECREMENT_PROPERTY(config, record_gain_level);

	  Display::get()->number ( ense_record_gain_setup_read_value ());
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, record_gain_level);

	  Display::get()->number ( ense_record_gain_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int ense_record_gain_setup_read_value (void)
{
  return config.get_record_gain_level ();
}

void ense_volume_level_setup_activate (void)
{
  Display::get()->number ( ense_volume_level_setup_read_value ());
}

void ense_volume_level_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, volume_level);

	  Display::get()->number ( ense_volume_level_setup_read_value ());
	  set_handled ( ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, volume_level);

	  Display::get()->number ( ense_volume_level_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int ense_volume_level_setup_read_value (void)
{
  return config.get_volume_level ();
}

static
void disp_relax_tunes (void)
{
  Display::get()->number (ense_tunes_setup_read_value ());
}

void ense_tunes_setup_activate (void)
{
  disp_relax_tunes ();
}

void ense_tunes_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_ENTER ):
	  // TODO: playback
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, relax_tunes);

	  disp_relax_tunes ();
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, relax_tunes);

	  disp_relax_tunes ();
	  set_handled (ctx);
	  break;
  }
}

int ense_tunes_setup_read_value (void)
{
  return config.get_relax_tunes ();
}

void ense_delete_records ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch( key_event )	{
	case ( KEY_ENTER ):
	  // TODO: delete records
	  Display::get()->message (__disp_msg_done__, 1);
	  set_handled (ctx);
	  set_return (ctx);
	  break;
  }
}

void ense_delete_records_activate (void)
{

}

void ense_vibration_setup_activate (void)
{
  Display::get()->number (ense_vibration_setup_read_value ());
}

void ense_vibration_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch( key_event ) {
	case ( KEY_ENTER ):
	  if (ense_vibration_setup_read_value ()) {
		VibroMotor::get()->start (ense_vibration_setup_read_value (), 2000);
	  }
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, vibration_level);

	  Display::get()->number (ense_vibration_setup_read_value ());
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, vibration_level);

	  Display::get()->number (ense_vibration_setup_read_value ());
	  set_handled (ctx);
	  break;
  }
}

int ense_vibration_setup_read_value (void)
{
  return config.get_vibration_level ();
}

void ense_speaker_setup_activate ( void )
{
  Display::get()->flag (ense_speaker_setup_read_value () );
}

void ense_speaker_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_PLUS ):
	  if (ense_speaker_setup_read_value ()) {
		Sound::get()->speaker_on ();
	  } else {
		Sound::get()->speaker_off ();
	  }

	  config.toggle_loud_speaker();
	  Display::get()->flag (ense_speaker_setup_read_value ());

	  set_handled (ctx);
	  break;
  }
}

int ense_speaker_setup_read_value (void)
{
  return config.get_loud_speaker ();
}

void clock_setup_activate (void)
{
  // setup real-time clock
  RTClock::get()->set_setup ( RTC_SETUP_HOUR );
  RTClock::get()->show ();

  Keyboard::get()->hold_repeat_default ();
}

void clock_setup_exit (void)
{
  // exit from setup
  RTClock::get()->set_setup ( RTC_SETUP_NONE );
  RTClock::get()->hide ();

  Keyboard::get()->hold_repeat_disable ();
}

void clock_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_ENTER ):
	  // switch between hours and minutes
	  if ( RTClock::get()->get_setup () == RTC_SETUP_HOUR ) {

		RTClock::get()->set_setup ( RTC_SETUP_MINUTE );
	  } else {

		RTClock::get()->set_setup ( RTC_SETUP_HOUR );
	  }

	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  RTClock::get()->setup_inc ( -1 );
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  RTClock::get()->setup_inc ( 1 );
	  set_handled (ctx);
	  break;
  }
}

void disp_wakeup_timer_delay (void)
{
  unsigned delay;
  unsigned hour, minute;
  char msg[ 6 ];

  delay = config.get_wakeup_timer_delay ();
  hour = delay / 60;
  minute = delay - ( 60U * hour );
  snprintf (msg, 6, __disp_msg_time__, hour, minute);

  Display::get()->message (msg, 1);
}

void wakeup_timer_setup_activate (void)
{
  disp_wakeup_timer_delay ();

  Keyboard::get()->hold_repeat_fast ();
}

void wakeup_timer_setup_exit (void)
{
  Keyboard::get()->hold_repeat_disable ();
}

void AppMenu::wakeup_timer_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  bool timer_on = RTClock::get()->wakeup_timer_is_set ();

  switch ( key_event ) {
	case ( KEY_ENTER ):
	  driver.wakeup_timer_toggle ();

	  disp_wakeup_timer_delay ();
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  if (! timer_on ) {

	  	DSCONF_DECREMENT_PROPERTY(config, wakeup_timer_delay );
	  	disp_wakeup_timer_delay ();
	  }

	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  if (! timer_on ) {

	  	DSCONF_INCREMENT_PROPERTY(config, wakeup_timer_delay );
	  	disp_wakeup_timer_delay ();
	  }

	  set_handled (ctx);
	  break;
  }
}

void trigger_count_display (void)
{
  Display::get()->number (config.get_remd_trigger_count ());
}

// TODO: implement reading triggering history
void trigger_clocks_setup_activate (void)
{
  Keyboard::get()->hold_repeat_fast ();
}

void trigger_clocks_setup_exit (void)
{
  Keyboard::get()->hold_repeat_disable ();
}

void trigger_clocks_setup ( pmenu_context_t, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
		break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
		break;
  }
}

void remd_sensitivity_setup_activate (void)
{
  Display::get()->number (remd_sensitivity_setup_read_value ());

  Keyboard::get()->hold_repeat_fast ();
}

void remd_sensitivity_setup_exit (void)
{
  Keyboard::get()->hold_repeat_disable ();
}

void remd_sensitivity_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, remd_sensitivity);

	  Display::get()->number (remd_sensitivity_setup_read_value ());
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, remd_sensitivity);

	  Display::get()->number (remd_sensitivity_setup_read_value ());
	  set_handled (ctx);
	  break;
  }
}

int remd_sensitivity_setup_read_value (void)
{
  return config.get_remd_sensitivity ();
}

static
void disp_duplex_mode (void)
{
  if ( config.is_invalid_duplex_mode ())
	Display::get()->message ( __disp_msg_off__, 1 );
  else
	Display::get()->number (duplex_mode_setup_read_value ());
}

void duplex_mode_setup_activate (void)
{
	disp_duplex_mode ();
}

void duplex_mode_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_ENTER ):
	  DSCONF_TOGGLE_PROPERTY_WITH_INVALID(config, duplex_mode);

	  disp_duplex_mode ();
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	  DSCONF_DECREMENT_PROPERTY_WITH_INVALID(config, duplex_mode);

	  disp_duplex_mode ();
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	  DSCONF_INCREMENT_PROPERTY_WITH_INVALID(config, duplex_mode);

	  disp_duplex_mode ();
	  set_handled (ctx);
	  break;
  }
}

int duplex_mode_setup_read_value (void)
{
  return config.get_duplex_mode ();
}

static
void disp_wakeup_mode (void)
{
  if ( config.is_invalid_wakeup_mode ())
	Display::get()->message ( __disp_msg_off__, 1 );
  else
	Display::get()->number (wakeup_mode_setup_read_value ());
}

void wakeup_mode_setup_activate ( void )
{
	disp_wakeup_mode ();
}

void wakeup_mode_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_ENTER ):
	  DSCONF_TOGGLE_PROPERTY_WITH_INVALID(config, wakeup_mode);

	  disp_wakeup_mode ();
	  set_handled (ctx);
	  break;

	case ( KEY_MINUS ):
	  DSCONF_DECREMENT_PROPERTY(config, wakeup_mode);

	  disp_wakeup_mode ();
	  set_handled (ctx);
	  break;

	case ( KEY_PLUS ):
	  DSCONF_INCREMENT_PROPERTY(config, wakeup_mode);

	  disp_wakeup_mode ();
	  set_handled (ctx);
	  break;
  }
}

int wakeup_mode_setup_read_value (void)
{
  return config.get_wakeup_mode ();
}

void alarm_clock_setup_activate (void)
{
  Display::get()->flag (alarm_clock_setup_read_value ());
}

void alarm_clock_setup ( pmenu_context_t ctx, keybrd_event_t key_event )
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_PLUS ):
	  config.toggle_alarm_clock();

	  Display::get()->flag (alarm_clock_setup_read_value ());
	  set_handled (ctx);
	  break;
  }
}

int alarm_clock_setup_read_value (void)
{
  return config.get_alarm_clock ();	
}

void hints_frequency_setup_activate (void)
{
  Display::get()->number (hints_frequency_setup_read_value ());
}

void hints_frequency_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	  DSCONF_DECREMENT_PROPERTY(config, hints_frequency );

	  Display::get()->number (hints_frequency_setup_read_value ());
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	  DSCONF_INCREMENT_PROPERTY(config, hints_frequency );

	  Display::get()->number (hints_frequency_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int hints_frequency_setup_read_value (void)
{
  return config.get_hints_frequency ();
}

void hints_duty_cycle_setup_activate (void)
{
  Display::get()->number (hints_duty_cycle_setup_read_value ());
}

void hints_duty_cycle_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	  DSCONF_DECREMENT_PROPERTY(config, hints_duty_cycle );

	  Display::get()->number (hints_duty_cycle_setup_read_value ());
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	  DSCONF_INCREMENT_PROPERTY(config, hints_duty_cycle );

	  Display::get()->number (hints_duty_cycle_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int hints_duty_cycle_setup_read_value (void)
{
  return config.get_hints_duty_cycle ();
}

void sound_hints_level_setup_activate ( void )
{
  Display::get()->number (sound_hints_level_setup_read_value () );
}

void sound_hints_level_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	  DSCONF_DECREMENT_PROPERTY(config, sound_hints_volume );

	  Display::get()->number (sound_hints_level_setup_read_value () );
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	  DSCONF_INCREMENT_PROPERTY(config, sound_hints_volume );

	  Display::get()->number (sound_hints_level_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int sound_hints_level_setup_read_value (void)
{
  return config.get_sound_hints_volume ();
}

void light_hints_brightness_setup_activate (void)
{
  Display::get()->number (light_hints_brightness_setup_read_value ());
}

void light_hints_brightness_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	  DSCONF_DECREMENT_PROPERTY(config, light_hints_brightness );

	  Display::get()->number (light_hints_brightness_setup_read_value ());
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	  DSCONF_INCREMENT_PROPERTY(config, light_hints_brightness );

	  Display::get()->number (light_hints_brightness_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int light_hints_brightness_setup_read_value (void)
{
  return config.get_light_hints_brightness ();
}

void light_hints_duration_setup_activate (void)
{
  Display::get()->number (light_hints_duration_setup_read_value ());

  Keyboard::get()->hold_repeat_fast ();
}

void light_hints_duration_setup_exit (void)
{
  Keyboard::get()->hold_repeat_disable ();
}

void light_hints_duration_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, light_hints_duration);

	  Display::get()->number (light_hints_duration_setup_read_value ());
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, light_hints_duration);

	  Display::get()->number (light_hints_duration_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int light_hints_duration_setup_read_value (void)
{
  return config.get_light_hints_duration ();
}

void sound_hints_duration_setup_activate (void)
{
  Display::get()->number (sound_hints_duration_setup_read_value ());

  Keyboard::get()->hold_repeat_fast ();
}

void sound_hints_duration_setup_exit (void)
{
  Keyboard::get()->hold_repeat_disable ();
}

void sound_hints_duration_setup ( pmenu_context_t ctx, keybrd_event_t key_event)
{
  switch ( key_event ) {
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
	  DSCONF_DECREMENT_PROPERTY(config, sound_hints_duration);

	  Display::get()->number (sound_hints_duration_setup_read_value ());
	  set_handled ( ctx );
	  break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
	  DSCONF_INCREMENT_PROPERTY(config, sound_hints_duration);

	  Display::get()->number (sound_hints_duration_setup_read_value ());
	  set_handled ( ctx );
	  break;
  }
}

int sound_hints_duration_setup_read_value (void)
{
  return config.get_sound_hints_duration ();
}

void wakeup_signal_check_handler ( pmenu_context_t, keybrd_event_t key_event )
{

}

void remd_check_handler ( pmenu_context_t, keybrd_event_t key_event)
{

}

void set_defaults_handler ( pmenu_context_t, keybrd_event_t key_event)
{
	switch ( key_event ) {
	case ( KEY_ENTER ):
		config.set_defaults ();
		/* NOTE: device will restart */
		break;
	}
}

void set_defaults_activate (void)
{

}

void save_settings_handler ( pmenu_context_t ctx, keybrd_event_t key_event)
{
	switch ( key_event ) {
	case ( KEY_ENTER ):
		config.save_to_storage ();

		set_handled (ctx);
		set_return (ctx);
		break;
	}
}

void save_settings_activate (void)
{

}
