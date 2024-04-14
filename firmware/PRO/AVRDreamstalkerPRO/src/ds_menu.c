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
#include "ds_vibro.h"
#include "ds_config.h"
#include "ds_rtclk.h"
#include "ds_util.h"
#include "ds_menu.h"

#define RECORDS_PATH	"/SD/SYSTEM/RECORDS"

/*-----------------------------------------------------------------------*/


#define MENU_INVALID_LEVEL	(-1)

typedef void (*pfn_activate)(void);
typedef void (*pfn_exit)(void);
typedef void (*pfn_handler)(keybrd_event_t);
typedef uint8_t (*pfn_read_value)(void);

typedef struct s_menu_desc menu_desc_t;

#define MENU_LABEL_LEN	10

struct s_menu_desc {
	char label[MENU_LABEL_LEN + 1];
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

static void ense_be_setup (keybrd_event_t);
static void ense_af_setup (keybrd_event_t);
static void ense_sc_setup (keybrd_event_t);
static void ense_recording_setup (keybrd_event_t);
static void ense_recording_gain_level_setup (keybrd_event_t);
static void ense_music_volume_setup (keybrd_event_t);
static void ense_tunes_setup (keybrd_event_t);
static void ense_del_records (keybrd_event_t);
static void ense_fl_setup (keybrd_event_t);
static void ense_speaker_setup (keybrd_event_t);

static void ense_be_setup_activate (void);
static void ense_af_setup_activate (void);
static void ense_sc_setup_activate (void);
static void ense_recording_setup_activate (void);
static void ense_recording_gain_level_setup_activate ();
static void ense_music_volume_setup_activate (void);
static void ense_tunes_setup_activate (void);
static void ense_del_records_activate (void);
static void ense_fl_setup_activate (void);
static void ense_speaker_setup_activate (void);

static void clock_setup (keybrd_event_t);
static void wakeup_timer_setup (keybrd_event_t);
static void trigger_times_handler (keybrd_event_t);
static void remd_sensitivity_setup (keybrd_event_t);
static void duplex_mode_setup (keybrd_event_t);
static void wakeup_mode_setup (keybrd_event_t);
static void alarm_clock_setup (keybrd_event_t);
static void hints_frequency_setup (keybrd_event_t);
static void hints_duty_cycle_setup (keybrd_event_t);
static void light_hints_brightness_setup (keybrd_event_t);
static void sound_hints_volume_setup (keybrd_event_t);
static void light_hints_duration_setup (keybrd_event_t);
static void sound_hints_duration_setup (keybrd_event_t);
static void wakeup_signal_check_handler(keybrd_event_t);
static void remd_check_handler (keybrd_event_t);
static void set_defaults_handler (keybrd_event_t);
static void save_settings_handler (keybrd_event_t);

static void clock_setup_activate (void);
static void wakeup_timer_setup_activate (void);
static void remd_trigger_counter_display (void);
static void remd_sensitivity_setup_activate (void);
static void trigger_times_activate (void);
static void duplex_mode_setup_activate (void);
static void wakeup_mode_setup_activate (void);
static void alarm_clock_setup_activate (void);
static void hints_frequency_setup_activate (void);
static void hints_duty_cycle_setup_activate (void);
static void light_hints_brightness_setup_activate (void);
static void sound_hints_volume_setup_activate (void);
static void light_hints_duration_setup_activate (void);
static void sound_hints_duration_setup_activate (void);
static void set_defaults_activate (void);
static void save_settings_activate (void);

static void clock_setup_exit (void);
static void disable_key_hold_repeat (void);


PROGMEM const menu_desc_t desc_en_se[] = {
	{
		.label = "bE-%i",
		.fmt = 1,
		.activate = ense_be_setup_activate,
		.read_value = get_before_hints_message,
		.handler = ense_be_setup,
	},
	{
		.label = "AF-%i",
		.fmt = 1,
		.activate = ense_af_setup_activate,
		.read_value = get_after_hints_message,
		.handler = ense_af_setup,
	},
	{
		.label = "Sc-%i",
		.fmt = 1,
		.activate = ense_sc_setup_activate,
		.read_value = get_sleep_scenario_playback,
		.handler = ense_sc_setup,
	},
	{
		.label = "rd-%i",
		.fmt = 1,
		.activate = ense_recording_setup_activate,
		.read_value = get_voice_recording,
		.handler = ense_recording_setup,
	},
	{
		.label = "rG-%i",
		.fmt = 1,
		.activate = ense_recording_gain_level_setup_activate,
		.read_value = get_recording_gain_level,
		.handler = ense_recording_gain_level_setup,
	},
	{
		.label = "LE-%i",
		.fmt = 1,
		.activate = ense_music_volume_setup_activate,
		.read_value = get_music_volume_level,
		.handler = ense_music_volume_setup,
	},
	{
		.label = "tu-%i",
		.fmt = 1,
		.activate = ense_tunes_setup_activate,
		.read_value = get_relax_tunes_playback,
		.handler = ense_tunes_setup,
	},
	{
		.label = "dELr",
		.activate = ense_del_records_activate,
		.handler = ense_del_records,
	},
	{
		.label = "FL-%i",
		.fmt = 1,
		.activate = ense_fl_setup_activate,
		.read_value = get_vibration_level,
		.handler = ense_fl_setup,
	},
	{
		.label = "SP-%i",
		.fmt = 1,
		.activate = ense_speaker_setup_activate,
		.read_value = get_loud_speaker,
		.handler = ense_speaker_setup,
	},
};

PROGMEM const menu_desc_t desc_root[] = {
	{
		.label = "CLSE",
		.handler = clock_setup,
		.activate = clock_setup_activate,
		.exit_fn = clock_setup_exit,
	},
	{
		.label = MENU_WAKEUP_TIMER_SETUP,
		.handler = wakeup_timer_setup,
		.activate = wakeup_timer_setup_activate,
		.exit_fn = disable_key_hold_repeat,
	},
	{
		.label = "EnSE",
		.sub_items = desc_en_se,
		.sub_count = sizeof(desc_en_se)/sizeof(desc_en_se[0]),
	},
	{
		.label = "COtr",
		.activate = remd_trigger_counter_display,
	},
	{
		.label = "HItr",
		.handler = trigger_times_handler,
		.activate = trigger_times_activate,
		.exit_fn = disable_key_hold_repeat
	},
	{
		.label = "d-%.2i",
		.fmt = 2,
		.handler = remd_sensitivity_setup,
		.read_value = get_remd_sensitivity,
		.activate = remd_sensitivity_setup_activate,
		.exit_fn = disable_key_hold_repeat
	},
	{
		.label = "du-%i",
		.fmt = 1,
		.handler = duplex_mode_setup,
		.read_value = get_duplex_mode,
		.activate = duplex_mode_setup_activate,
	},
	{
		.label = "UP-%i",
		.fmt = 1,
		.handler = wakeup_mode_setup,
		.read_value = get_wakeup_mode,
		.activate = wakeup_mode_setup_activate,
	},
	{
		.label = "AL-%i",
		.fmt = 1,
		.handler = alarm_clock_setup,
		.read_value = get_alarm_clock,
		.activate = alarm_clock_setup_activate,
	},
	{
		.label = "Fr-%i",
		.fmt = 1,
		.handler = hints_frequency_setup,
		.read_value = get_hints_frequency,
		.activate = hints_frequency_setup_activate,
	},
	{
		.label = "Od-%i",
		.fmt = 1,
		.handler = hints_duty_cycle_setup,
		.read_value = get_hints_duty_cycle,
		.activate = hints_duty_cycle_setup_activate,
	},
	{
		.label = "br-%i",
		.fmt = 1,
		.handler = light_hints_brightness_setup,
		.read_value = get_light_hints_brightness,
		.activate = light_hints_brightness_setup_activate,
	},
	{
		.label = "LE-%i",
		.fmt = 1,
		.handler = sound_hints_volume_setup,
		.read_value = get_sound_hints_volume,
		.activate = sound_hints_volume_setup_activate,
	},
	{
		.label = "F-%.2i",
		.fmt = 2,
		.handler = light_hints_duration_setup,
		.read_value = get_light_hints_duration,
		.activate = light_hints_duration_setup_activate,
		.exit_fn = disable_key_hold_repeat,
	},
	{
		.label = "S-%.2i",
		.fmt = 2,
		.handler = sound_hints_duration_setup,
		.read_value = get_sound_hints_duration,
		.activate = sound_hints_duration_setup_activate,
		.exit_fn = disable_key_hold_repeat,
	},
	{
		/*check installed wakeup signals*/
		.label = "CHUP",
		.handler = wakeup_signal_check_handler,
	},
	{
		.label = "CHdt",
		.handler = remd_check_handler,
	},
	{
		.label = "SEdt",
		.activate = set_defaults_activate,
		.handler = set_defaults_handler,
	},
	{
		.label = "SAUE",
		.activate = save_settings_activate,
		.handler = save_settings_handler,
	},
};

#define MAX_PLANES	2

typedef struct s_menu_plane {
	uint8_t index : 5;
	uint8_t count : 5;
	uint8_t is_active : 1;
} menu_plane_t;

typedef struct s_menu {
	menu_plane_t plane[MAX_PLANES];
	int8_t level;
	uint8_t res : 4;
} menu_t;

static menu_t menu;

static
void set_unhandled (void)
{
	menu.res = MENU_UNHANDLED;
}

static
void set_handled (void)
{
	menu.res |= MENU_HANDLED;
}

static
void set_return (void)
{
	menu.res |= MENU_RETURN;
}

static
uint8_t set_menu_exit (void)
{
	menu.level = MENU_INVALID_LEVEL;

	return (menu.res = (MENU_HANDLED | MENU_EXIT));
}

static
int plane_is_active (void)
{
	return menu.plane[menu.level].is_active;
}

static
void plane_activate (int activate)
{
	menu.plane[menu.level].is_active = (activate ? 1 : 0);
}


/* ----------------------------------------------------------------------*\
 * Menu layout accessors
\*-----------------------------------------------------------------------*/

static
const char *desc_label(const uint8_t *desc_addr, char *buf)
{
	strcpy_P(buf, (const char *)(desc_addr + offsetof(menu_desc_t, label)));
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
	return pgm_read_byte_far(desc_addr	+ offsetof(menu_desc_t, sub_count));
}

static
const uint8_t *desc_addr (int level)
{
	const uint8_t *addr = (const uint8_t *)&desc_root;
	int8_t l = 0;
	do {
		addr = addr + sizeof(menu_desc_t) * menu.plane[l].index;
		if (l< level)
			addr = desc_sub_items(addr);
	} while (level>l++);

	return addr;
}

static
const uint8_t *get_addr (void)
{
	return desc_addr(menu.level);
}

static
const char *get_label(char *buf)
{
	return desc_label(get_addr(), buf);
}

static
uint8_t get_fmt(void)
{
	return desc_fmt(get_addr());
}

static
pfn_activate get_activate_func(void)
{
	return desc_activate_func(get_addr());
}

static
pfn_exit get_exit_func(void)
{
	return desc_exit_func(get_addr());
}

static
pfn_handler get_handler_func(void)
{
	return desc_handler_func(get_addr());
}

static
pfn_read_value get_read_value_func(void)
{
	return desc_read_value_func(get_addr());
}

static
uint8_t get_sub_count(void)
{
	return desc_sub_count(get_addr());
}

/*-----------------------------------------------------------------------*\
 * Menu navigation
\*-----------------------------------------------------------------------*/

static
void plane_next()
{
	menu_plane_t *plane;
	uint8_t count;

	count = get_sub_count();
	plane = &menu.plane[++menu.level];

	plane->index = 0;
	plane->count = count;
}

static
int plane_prev()
{
	if (menu.level == 0)	/*Can't move prev anymore*/
		return MENU_INVALID_LEVEL;

	return --menu.level;
}

static
void index_next(void)
{
	menu_plane_t *plane;

	plane = &menu.plane[menu.level];

	plane->index = (plane->index + 1) % plane->count;
}

/*-----------------------------------------------------------------------*\
 * Menu Functions
\*-----------------------------------------------------------------------*/

static
void update_menu (void)
{
	char temp[10];
	char buf[5];
	const char *msg;
	pfn_read_value read_val;

	if (get_fmt() > 0) {
		read_val = get_read_value_func();

		snprintf(buf, 5, get_label(temp), (read_val ? read_val() : 0));
		msg = buf;
	}
	else
		msg = get_label(temp);

	disp_msg(msg, 1);
}

/*-----------------------------------------------------------------------*\
 * Menu Functions
\*-----------------------------------------------------------------------*/

void menu_init (void)
{
	memset (&menu, 0, sizeof(menu));

	menu.level = MENU_INVALID_LEVEL;
	menu.plane[0].count = sizeof(desc_root)/sizeof(desc_root[0]);
}

void menu_enter (void)
{
	menu.level = 0;
	menu.plane[0].index = 0;

	update_menu();
}

bool menu_is_active (void)
{
	return (menu.level > MENU_INVALID_LEVEL);
}

int menu_handle (uint8_t key_event)
{
	pfn_activate activate_fn;
	pfn_exit exit_fn;
	pfn_handler handler_fn;

	if (!menu_is_active())
		return MENU_UNHANDLED;

	set_unhandled();

	if (key_event == (KEY_SELECT | KEYBRD_HOLD)) {
		if (plane_is_active()) {
			// if at submenu level
			exit_fn = get_exit_func();
			if (exit_fn)
				exit_fn();
		}
		if (plane_prev() < 0)
			return set_menu_exit();
		update_menu();
		set_handled();
		return MENU_HANDLED;
	}

	if (! plane_is_active()) {
		switch (key_event) {
		case KEY_SELECT:
			// move to the next menu item
			index_next();
			update_menu();
			set_handled();
			break;

		case KEY_ENTER:
			// enter the submenu
			if (get_sub_count() > 0) {
				plane_next();
				update_menu();
			} else {
				activate_fn = get_activate_func();
				if (activate_fn)
					activate_fn();
				plane_activate(1);
			}
			set_handled();
			break;
		}
	} else {
		// if an item is activated
		switch (key_event) {
		case KEY_SELECT:
			exit_fn = get_exit_func();
			if (exit_fn)
				exit_fn();
			// deactivate the item
			plane_activate(0);
			update_menu();
			set_handled();
			break;

		default:
			/* forward event to submenu handler */
			handler_fn = get_handler_func();
			if (handler_fn) {
				handler_fn(key_event);
				/* check if return from item */
				if (menu.res & MENU_RETURN) {
					plane_activate(0);
					update_menu();
				}
			}
			break;
		}
	}

	return menu.res;
}

/*-----------------------------------------------------------------------*\
 * Menu Handlers (implementation)
\*-----------------------------------------------------------------------*/

void ense_be_setup_activate (void)
{
	disp_flag(get_before_hints_message());
}

void ense_be_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case KEY_PLUS:
		toggle_before_hints_message();

		disp_flag(get_before_hints_message());
		set_handled();
		break;
	}
}

void ense_af_setup_activate (void)
{
	disp_flag(get_after_hints_message());
}

void ense_af_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case KEY_PLUS:
		toggle_after_hints_message();

		disp_flag(get_after_hints_message());
		set_handled();
		break;
	}
}

static
void disp_sleep_scenario_playback (void)
{
	disp_num(get_sleep_scenario_playback());
}

void ense_sc_setup_activate (void)
{
	disp_sleep_scenario_playback();
}

void ense_sc_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		// TODO: playback
		set_handled();
		break;

	case KEY_MINUS:
	case ( KEY_MINUS | KEYBRD_HOLD ):
		DECREMENT_CONFIG_PROPERTY( sleep_scenario_playback );

		disp_sleep_scenario_playback ();
		set_handled ();
		break;

	case KEY_PLUS:
	case ( KEY_PLUS | KEYBRD_HOLD ):
		INCREMENT_CONFIG_PROPERTY( sleep_scenario_playback );

		disp_sleep_scenario_playback ();
		set_handled ();
		break;
	}
}

void ense_recording_setup_activate ( void )
{
	disp_flag ( get_voice_recording () );
}

void ense_recording_setup ( keybrd_event_t key_event )
{
	char newfile[50];

	switch(key_event)
	{
	case KEY_ENTER:
		if (codec_get_status() == CODEC_PLAYBACK) {
			codec_stop ();
		}
		if (codec_get_status() == CODEC_IDLE) {
			// TODO: playback next recording
		}
		set_handled();
		break;

	case KEY_CHECK:
		if (codec_get_status() == CODEC_CAPTURE) {
			codec_stop ();
		}
		else if (codec_get_status() == CODEC_IDLE) {
			/* start new recording */
			make_next_file_path(newfile, 50, RECORDS_PATH, "MYREC", "WAV");
			codec_capture (newfile);
		}
		else {
			/* TODO: is a real case ? playing music ? */
		}
		set_handled();
		break;

	case KEY_MINUS:
	case KEY_PLUS:
		toggle_voice_recording();

		disp_flag(get_voice_recording());
		set_handled();
		break;
	}
}

void ense_recording_gain_level_setup_activate (void)
{
	disp_num(get_recording_gain_level());
}

void ense_recording_gain_level_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		DECREMENT_CONFIG_PROPERTY(recording_gain_level);

		disp_num(get_recording_gain_level());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		INCREMENT_CONFIG_PROPERTY(recording_gain_level);

		disp_num(get_recording_gain_level());
		set_handled();
		break;
	}
}

void ense_music_volume_setup_activate (void)
{
	disp_num(get_music_volume_level());
}

void ense_music_volume_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		DECREMENT_CONFIG_PROPERTY(music_volume_level);

		disp_num(get_music_volume_level());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		INCREMENT_CONFIG_PROPERTY(music_volume_level);

		disp_num(get_music_volume_level());
		set_handled();
		break;
	}
}

static
void disp_relax_tunes_playback (void)
{
	disp_num ( get_relax_tunes_playback ());
}

void ense_tunes_setup_activate (void)
{
	disp_relax_tunes_playback ();
}

void ense_tunes_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		// TODO: playback
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		DECREMENT_CONFIG_PROPERTY(relax_tunes_playback);

		disp_relax_tunes_playback();
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		INCREMENT_CONFIG_PROPERTY(relax_tunes_playback);

		disp_relax_tunes_playback();
		set_handled();
		break;
	}
}

// TODO: show number of records ?
void ense_del_records_activate (void)
{
	disp_msg(__disp_msg_confirm__, 1);
}

void ense_del_records ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		// TODO: delete records
		disp_msg(__disp_msg_done__, 1);
		set_handled();
		set_return();
		break;
	}
}

void ense_fl_setup_activate (void)
{
	disp_num(get_vibration_level());
}

void ense_fl_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		if ( get_vibration_level () ) {
			vibro_on ( 2000, get_vibration_level ());
		}
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		DECREMENT_CONFIG_PROPERTY( vibration_level );

		disp_num ( get_vibration_level () );
		set_handled ();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		INCREMENT_CONFIG_PROPERTY( vibration_level );

		disp_num ( get_vibration_level () );
		set_handled ();
		break;
	}
}

void ense_speaker_setup_activate ( void )
{
	disp_flag ( get_loud_speaker () );
}

void ense_speaker_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_MINUS:
	case KEY_PLUS:
		toggle_loud_speaker();

		disp_flag(get_loud_speaker());

		if (get_loud_speaker()) {
			speaker_on ();
		} else {
			speaker_off ();
		}
		set_handled();
		break;
	}
}

void clock_setup_activate (void)
{
	// setup real-time clock
	rtc_set_setup ( RTC_SETUP_HOUR );
	rtc_show ();

	keybrd_hold_repeat_default ();
}

void clock_setup_exit (void)
{
	// exit from setup
	rtc_set_setup ( RTC_SETUP_NONE );
	rtc_hide ();

	disable_key_hold_repeat ();
}

void clock_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_ENTER:
		// switch between hours and minutes
		if ( rtc_get_setup () == RTC_SETUP_HOUR )
			rtc_set_setup ( RTC_SETUP_MINUTE );
		else
			rtc_set_setup ( RTC_SETUP_HOUR );
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		rtc_setup_inc ( -1 );
		set_handled ();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		rtc_setup_inc ( 1 );
		set_handled ();
		break;
	}
}

void disable_key_hold_repeat (void)
{
	keybrd_hold_repeat_disable ();
}

void wakeup_timer_setup_activate (void)
{
	disp_wakeup_timer_delay();

	keybrd_hold_repeat_fast ();
}

void wakeup_timer_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case ( KEY_ENTER ):
		TOGGLE_CONFIG_WITH_INVALID_PROPERTY( wakeup_timer_delay );

		disp_wakeup_timer_delay();
		set_handled();
		break;

	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
		DECREMENT_CONFIG_WITH_INVALID_PROPERTY( wakeup_timer_delay );

		disp_wakeup_timer_delay();
		set_handled();
		break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
		INCREMENT_CONFIG_WITH_INVALID_PROPERTY( wakeup_timer_delay );

		disp_wakeup_timer_delay();
		set_handled();
		break;
	}
}

void remd_trigger_counter_display (void)
{
	disp_num ( get_remd_trigger_counter ());
}

// TODO: implement reading triggering history
void trigger_times_activate (void)
{
	keybrd_hold_repeat_fast ();
}

void trigger_times_handler ( keybrd_event_t key_event )
{
	switch(key_event)
	{
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
	disp_num(get_remd_sensitivity());

	keybrd_hold_repeat_fast ();
}

void remd_sensitivity_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case ( KEY_MINUS ):
	case ( KEY_MINUS | KEYBRD_HOLD ):
		DECREMENT_CONFIG_PROPERTY ( remd_sensitivity );

		disp_num ( get_remd_sensitivity ());
		set_handled ();
		break;

	case ( KEY_PLUS ):
	case ( KEY_PLUS | KEYBRD_HOLD ):
		INCREMENT_CONFIG_PROPERTY ( remd_sensitivity );

		disp_num ( get_remd_sensitivity ());
		set_handled ();
		break;
	}
}

static
void disp_duplex_mode()
{
	if( is_invalid_duplex_mode ())
		disp_msg ( __disp_msg_off__, 1 );
	else
		disp_num ( get_duplex_mode ());
}

void duplex_mode_setup_activate (void)
{
	disp_duplex_mode();
}

void duplex_mode_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_ENTER:
		TOGGLE_CONFIG_WITH_INVALID_PROPERTY( duplex_mode );

		disp_duplex_mode();
		set_handled();
		break;

	case KEY_MINUS:
		DECREMENT_CONFIG_WITH_INVALID_PROPERTY( duplex_mode );

		disp_duplex_mode();
		set_handled();
		break;

	case KEY_PLUS:
		INCREMENT_CONFIG_WITH_INVALID_PROPERTY( duplex_mode );

		disp_duplex_mode();
		set_handled();
		break;
	}
}

static
void disp_wakeup_mode()
{
	if ( is_invalid_wakeup_mode ())
		disp_msg( __disp_msg_off__, 1 );
	else
		disp_num( get_wakeup_mode ());
}

void wakeup_mode_setup_activate ( void )
{
	disp_wakeup_mode ();
}

void wakeup_mode_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_ENTER:
		TOGGLE_CONFIG_WITH_INVALID_PROPERTY( wakeup_mode );

		disp_wakeup_mode();
		set_handled();
		break;

	case KEY_MINUS:
		DECREMENT_CONFIG_PROPERTY( wakeup_mode );

		disp_wakeup_mode();
		set_handled();
		break;

	case KEY_PLUS:
		INCREMENT_CONFIG_PROPERTY( wakeup_mode );

		disp_wakeup_mode();
		set_handled();
		break;
	}
}

void alarm_clock_setup_activate (void)
{
	disp_flag(get_alarm_clock());
}

void alarm_clock_setup ( keybrd_event_t key_event )
{
	switch(key_event)
	{
	case KEY_MINUS:
	case KEY_PLUS:
		toggle_alarm_clock();

		disp_flag(get_alarm_clock());
		set_handled();
		break;
	}
}

void hints_frequency_setup_activate (void)
{
	disp_num(get_hints_frequency());
}

void hints_frequency_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
		DECREMENT_CONFIG_PROPERTY(hints_frequency);

		disp_num(get_hints_frequency());
		set_handled();
		break;

	case KEY_PLUS:
		INCREMENT_CONFIG_PROPERTY(hints_frequency);

		disp_num(get_hints_frequency());
		set_handled();
		break;
	}
}

void hints_duty_cycle_setup_activate (void)
{
	disp_num(get_hints_duty_cycle());
}

void hints_duty_cycle_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
		DECREMENT_CONFIG_PROPERTY( hints_duty_cycle );

		disp_num(get_hints_duty_cycle());
		set_handled();
		break;

	case KEY_PLUS:
		INCREMENT_CONFIG_PROPERTY( hints_duty_cycle );

		disp_num(get_hints_duty_cycle());
		set_handled();
		break;
	}
}

void sound_hints_volume_setup_activate ( void )
{
	disp_num ( get_sound_hints_volume () );
}

void sound_hints_volume_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
		DECREMENT_CONFIG_PROPERTY( sound_hints_volume );

		disp_num ( get_sound_hints_volume () );
		set_handled ();
		break;

	case KEY_PLUS:
		INCREMENT_CONFIG_PROPERTY( sound_hints_volume );

		disp_num ( get_sound_hints_volume ());
		set_handled ();
		break;
	}
}

void light_hints_brightness_setup_activate (void)
{
	disp_num(get_light_hints_brightness());
}

void light_hints_brightness_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
		DECREMENT_CONFIG_PROPERTY(light_hints_brightness);

		disp_num(get_light_hints_brightness());
		set_handled();
		break;

	case KEY_PLUS:
		INCREMENT_CONFIG_PROPERTY(light_hints_brightness);

		disp_num(get_light_hints_brightness());
		set_handled();
		break;
	}
}

void light_hints_duration_setup_activate (void)
{
	disp_num(get_light_hints_duration());

	keybrd_hold_repeat_fast ();
}

void light_hints_duration_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		DECREMENT_CONFIG_PROPERTY(light_hints_duration);

		disp_num(get_light_hints_duration());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		INCREMENT_CONFIG_PROPERTY(light_hints_duration);

		disp_num(get_light_hints_duration());
		set_handled();
		break;
	}
}

void sound_hints_duration_setup_activate (void)
{
	disp_num(get_sound_hints_duration());

	keybrd_hold_repeat_fast ();
}

void sound_hints_duration_setup ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | KEYBRD_HOLD):
		DECREMENT_CONFIG_PROPERTY(sound_hints_duration);

		disp_num(get_sound_hints_duration());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | KEYBRD_HOLD):
		INCREMENT_CONFIG_PROPERTY(sound_hints_duration);

		disp_num(get_sound_hints_duration());
		set_handled();
		break;
	}
}

void wakeup_signal_check_handler ( keybrd_event_t key_event)
{

}

void remd_check_handler ( keybrd_event_t key_event)
{

}

void set_defaults_activate (void)
{
	disp_msg(__disp_msg_confirm__, 1);
}

void set_defaults_handler ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		config_set_defaults();
		/* NOTE: device will restart */
		break;
	}
}

void save_settings_activate (void)
{
	disp_msg(__disp_msg_confirm__, 1);
}

void save_settings_handler ( keybrd_event_t key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		config_save_to_storage ();

		set_handled();
		set_return ();
		break;
	}
}
