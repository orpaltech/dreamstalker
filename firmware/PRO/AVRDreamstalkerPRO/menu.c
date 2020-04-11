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

#include <stdio.h>
#include <string.h>

#include <avr/io.h>
#include <avr/pgmspace.h>

#include "menu.h"
#include "input/keybrd.h"
#include "display.h"
#include "fatfs/ff.h"
#include "sound/sound.h"
#include "vibro.h"
#include "rtclock.h"
#include "dreamstalker.h"

/* Peripheral controls (Platform dependent) */

#define MENU_INVALID_LEVEL	(-1)

typedef void (*pfn_activate)(void);
typedef void (*pfn_exit)(void);
typedef void (*pfn_handler)(INPUT_EVENT_BUFFER_TYPE);
typedef uint8_t (*pfn_value_read)(void);

typedef struct s_menu_desc menu_desc_t;

struct s_menu_desc {
	char label[10];
	uint8_t fmt;
	pfn_activate activate;
	pfn_exit exit;
	pfn_handler handler;
	pfn_value_read read_value;
	const menu_desc_t *sub_items;
	uint8_t sub_count;
};

/*-----------------------------------------------------------------------*/
/* Menu Handlers									 			 		 */
/*-----------------------------------------------------------------------*/

static void enhanced_be_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_af_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_sc_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_rd_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_vol_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_tu_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_del_records (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_fl_setup (INPUT_EVENT_BUFFER_TYPE);
static void enhanced_sp_setup (INPUT_EVENT_BUFFER_TYPE);

static void enhanced_be_setup_activate (void);
static void enhanced_af_setup_activate (void);
static void enhanced_sc_setup_activate (void);
static void enhanced_rd_setup_activate (void);
static void enhanced_vol_setup_activate (void);
static void enhanced_tu_setup_activate (void);
static void enhanced_del_records_activate (void);
static void enhanced_fl_setup_activate (void);
static void enhanced_sp_setup_activate (void);

static void clock_setup (INPUT_EVENT_BUFFER_TYPE);
static void wakeup_timer_setup (INPUT_EVENT_BUFFER_TYPE);
static void trigger_times_handler (INPUT_EVENT_BUFFER_TYPE);
static void remd_sensitivity_setup (INPUT_EVENT_BUFFER_TYPE);
static void duplex_mode_setup (INPUT_EVENT_BUFFER_TYPE);
static void wakeup_mode_setup (INPUT_EVENT_BUFFER_TYPE);
static void alarm_clock_setup (INPUT_EVENT_BUFFER_TYPE);
static void hints_frequency_setup (INPUT_EVENT_BUFFER_TYPE);
static void hints_duty_cycle_setup (INPUT_EVENT_BUFFER_TYPE);
static void light_hints_brightness_setup (INPUT_EVENT_BUFFER_TYPE);
static void sound_hints_volume_setup (INPUT_EVENT_BUFFER_TYPE);
static void light_hints_duration_setup (INPUT_EVENT_BUFFER_TYPE);
static void sound_hints_duration_setup (INPUT_EVENT_BUFFER_TYPE);
static void wakeup_signal_check_handler(INPUT_EVENT_BUFFER_TYPE);
static void remd_check_handler (INPUT_EVENT_BUFFER_TYPE);
static void set_defaults_handler (INPUT_EVENT_BUFFER_TYPE);

static void clock_setup_activate (void);
static void wakeup_timer_setup_activate (void);
static void trigger_counter_display (void);
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

static void clock_setup_exit (void);
static void disable_input_hold_repeat (void);

PROGMEM const menu_desc_t menu12_desc[] = {
	{
		.label = "bE-%i",
		.fmt = 1,
		.activate = enhanced_be_setup_activate,
		.read_value = get_before_hints_message,
		.handler = enhanced_be_setup,
	},
	{
		.label = "AF-%i",
		.fmt = 1,
		.activate = enhanced_af_setup_activate,
		.read_value = get_after_hints_message,
		.handler = enhanced_af_setup,
	},
	{
		.label = "Sc-%i",
		.fmt = 1,
		.activate = enhanced_sc_setup_activate,
		.read_value = get_sleep_scenario_playback,
		.handler = enhanced_sc_setup,
	},
	{
		.label = "rd-%i",
		.fmt = 1,
		.activate = enhanced_rd_setup_activate,
		.read_value = get_voice_recording,
		.handler = enhanced_rd_setup,
	},
	{
		.label = "LE-%i",
		.fmt = 1,
		.activate = enhanced_vol_setup_activate,
		.read_value = get_enh_volume_level,
		.handler = enhanced_vol_setup,
	},
	{
		.label = "tu-%i",
		.fmt = 1,
		.activate = enhanced_tu_setup_activate,
		.read_value = get_relax_tunes_playback,
		.handler = enhanced_tu_setup,
	},
	{
		.label = "dELr",
		.activate = enhanced_del_records_activate,
		.handler = enhanced_del_records,
	},
	{
		.label = "FL-%i",
		.fmt = 1,
		.activate = enhanced_fl_setup_activate,
		.read_value = get_vibration_level,
		.handler = enhanced_fl_setup,
	},
	{
		.label = "SP-%i",
		.fmt = 1,
		.activate = enhanced_sp_setup_activate,
		.read_value = get_enh_speaker,
		.handler = enhanced_sp_setup,
	},
};

PROGMEM const menu_desc_t menu_desc[] = {
	{
		.label = "CLSE",
		.handler = clock_setup,
		.activate = clock_setup_activate,
		.exit = clock_setup_exit,
	},
	{
		.label = MENU_WAKEUP_TIMER_SETUP,
		.handler = wakeup_timer_setup,
		.activate = wakeup_timer_setup_activate,
		.exit = disable_input_hold_repeat,
	},
	{
		.label = "EnSE",
		.sub_items = menu12_desc,
		.sub_count = sizeof(menu12_desc)/sizeof(menu12_desc[0]),
	},
	{
		.label = "COtr",
		.activate = trigger_counter_display,
	},
	{
		.label = "HItr",
		.handler = trigger_times_handler,
		.activate = trigger_times_activate,
		.exit = disable_input_hold_repeat
	},
	{
		.label = "d-%.2i",
		.fmt = 2,
		.handler = remd_sensitivity_setup,
		.read_value = get_remd_sensitivity,
		.activate = remd_sensitivity_setup_activate,
		.exit = disable_input_hold_repeat
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
	},
	{
		.label = "S-%.2i",
		.fmt = 2,
		.handler = sound_hints_duration_setup,
		.read_value = get_sound_hints_duration,
		.activate = sound_hints_duration_setup_activate,
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
};

#define MAX_PLANES	2

typedef struct s_menu_plane {
	uint8_t index;
	uint8_t count;
	uint8_t is_active;
} menu_plane_t;

typedef struct s_menu {
	menu_plane_t plane[MAX_PLANES];
	int8_t level;
	uint8_t res;
} menu_t;

static menu_t menu;

static
void set_unhandled (void)
{
	menu.res = MENU_UNHANDLED;
}

static
uint8_t set_handled (void)
{
	return (menu.res = MENU_HANDLED);
}

static
void set_item_exit (void)
{
	menu.res = (MENU_HANDLED | MENU_ITEM_EXIT);
}

static
uint8_t set_exit (void)
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


/* ----------------------------------------------------------------------*/
/* Menu layout accessors 												 */
/*-----------------------------------------------------------------------*/
static
const char *desc_label(const uint8_t *desc_addr, char *buf)
{
	strcpy_P(buf, (const char *)desc_addr + 0);
	return buf;
}

static
uint8_t desc_fmt(const uint8_t *desc_addr)
{
	return pgm_read_byte_near(desc_addr + sizeof(menu_desc[0].label));
}

static
pfn_activate desc_activate_func(const uint8_t *desc_addr)
{
	return (pfn_activate) pgm_read_ptr_near(desc_addr
											+ sizeof(menu_desc[0].label)
											+ sizeof(menu_desc[0].fmt) );
}

static
pfn_exit desc_exit_func(const uint8_t *desc_addr)
{
	return (pfn_exit) pgm_read_ptr_near(desc_addr
										+ sizeof(menu_desc[0].label)
										+ sizeof(menu_desc[0].fmt)
										+ sizeof(menu_desc[0].activate));
}

static
pfn_handler desc_handler(const uint8_t *desc_addr)
{
	return (pfn_handler) pgm_read_ptr_near(desc_addr
											+ sizeof(menu_desc[0].label)
											+ sizeof(menu_desc[0].fmt)
											+ sizeof(menu_desc[0].activate)
											+ sizeof(menu_desc[0].exit));
}

static
pfn_value_read desc_read_value_func(const uint8_t *desc_addr)
{
	return (pfn_value_read) pgm_read_ptr_near(desc_addr
											+ sizeof(menu_desc[0].label)
											+ sizeof(menu_desc[0].fmt)
											+ sizeof(menu_desc[0].activate)
											+ sizeof(menu_desc[0].exit)
											+ sizeof(menu_desc[0].handler));
}

static
const uint8_t *desc_sub_items(const uint8_t *desc_addr)
{
	return (const uint8_t *) pgm_read_ptr_near(desc_addr
											+ sizeof(menu_desc[0].label)
											+ sizeof(menu_desc[0].fmt)
											+ sizeof(menu_desc[0].activate)
											+ sizeof(menu_desc[0].exit)
											+ sizeof(menu_desc[0].handler)
											+ sizeof(menu_desc[0].read_value));
}

static
uint8_t desc_sub_count(const uint8_t *desc_addr)
{
	return pgm_read_byte_near(desc_addr
							+ sizeof(menu_desc[0].label)
							+ sizeof(menu_desc[0].fmt)
							+ sizeof(menu_desc[0].activate)
							+ sizeof(menu_desc[0].exit)
							+ sizeof(menu_desc[0].handler)
							+ sizeof(menu_desc[0].read_value)
							+ sizeof(menu_desc[0].sub_items));
}

static
const uint8_t *desc_addr (int level)
{
	const uint8_t *addr = (const uint8_t *)&menu_desc;
	int8_t l = 0;
	do {
		addr = addr + sizeof(menu_desc_t) * menu.plane[l].index;
		if (l< level)
			addr = desc_sub_items(addr);
	} while(level>l++);

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
pfn_handler get_handler(void)
{
	return desc_handler(get_addr());
}

static
pfn_value_read get_read_value_func(void)
{
	return desc_read_value_func(get_addr());
}

static
uint8_t get_sub_count(void)
{
	return desc_sub_count(get_addr());
}

/*-----------------------------------------------------------------------*/
/* Menu navigation														 */
/*-----------------------------------------------------------------------*/

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

/*-----------------------------------------------------------------------*/
/* Menu Functions									 			 		 */
/*-----------------------------------------------------------------------*/

static
void update_menu (void)
{
	char temp[10];
	char buf[5];
	const char *msg;
	pfn_value_read read_val;

	if (get_fmt() > 0) {
		read_val = get_read_value_func();

		snprintf(buf, 5, get_label(temp), (read_val ? read_val() : 0));
		msg = buf;
	}
	else
		msg = get_label(temp);

	disp_msg(msg, 1);
}

/*-----------------------------------------------------------------------*/
/* Menu Functions									 			 		 */
/*-----------------------------------------------------------------------*/

void menu_init (void)
{
	memset (&menu, 0, sizeof(menu));

	menu.level = MENU_INVALID_LEVEL;
	menu.plane[0].count = sizeof(menu_desc)/sizeof(menu_desc[0]);
}

void menu_enter (void)
{
	menu.level = 0;
	menu.plane[0].index = 0;

	update_menu();
}

int menu_is_active (void)
{
	return (menu.level > MENU_INVALID_LEVEL);
}

int menu_process (INPUT_EVENT_BUFFER_TYPE key_event)
{
	pfn_activate activate_fn;
	pfn_exit exit_fn;
	pfn_handler handler_fn;

	if (!menu_is_active())
		return MENU_UNHANDLED;

	set_unhandled();

	if (key_event == (KEY_SELECT | INPUT_HOLD)) {
		if (plane_is_active()) {
			// if at submenu level
			exit_fn = get_exit_func();
			if (exit_fn)
				exit_fn();
		}
		if (plane_prev() < 0)
			return set_exit();
		update_menu();
		return set_handled();
	}

	if (! plane_is_active())	{
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
			// forward event to submenu handler
			handler_fn = get_handler();
			if (handler_fn) {
				handler_fn(key_event);
				// check if deactivate the item
				if (menu.res & MENU_ITEM_EXIT) {
					plane_activate(0);
					update_menu();
				}
			}
			break;
		}
	}

	return menu.res;
}

/*-----------------------------------------------------------------------*/
/* Menu Handlers (implementation)					 			 		 */
/*-----------------------------------------------------------------------*/

void enhanced_be_setup_activate (void)
{
	disp_flag(get_before_hints_message());
}

void enhanced_be_setup (INPUT_EVENT_BUFFER_TYPE key_event)
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

void enhanced_af_setup_activate (void)
{
	disp_flag(get_after_hints_message());
}

void enhanced_af_setup (INPUT_EVENT_BUFFER_TYPE key_event)
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
	if (is_invalid_sleep_scenario_playback())
		disp_msg(" OFF", 1);
	else
		disp_dec(get_sleep_scenario_playback());
}

void enhanced_sc_setup_activate (void)
{
	disp_sleep_scenario_playback();
}

void enhanced_sc_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		if (is_invalid_sleep_scenario_playback())
			set_default_sleep_scenario_playback();
		else
			set_invalid_sleep_scenario_playback();

		disp_sleep_scenario_playback();
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_WITH_INVALID_PROPERTY(sleep_scenario_playback);

		disp_sleep_scenario_playback();
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_WITH_INVALID_PROPERTY(sleep_scenario_playback);

		disp_sleep_scenario_playback();
		set_handled();
		break;
	}
}

void enhanced_rd_setup_activate (void)
{
	disp_flag(get_voice_recording());
}

void enhanced_rd_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case KEY_PLUS:
		toggle_voice_recording();

		disp_flag(get_voice_recording());
		set_handled();
		break;
	}
}

void enhanced_vol_setup_activate (void)
{
	disp_dec(get_enh_volume_level());
}

void enhanced_vol_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_PROPERTY(enh_volume_level);

		disp_dec(get_enh_volume_level());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_PROPERTY(enh_volume_level);

		disp_dec(get_enh_volume_level());
		set_handled();
		break;
	}
}

static
void disp_relax_tunes_playback (void)
{
	if (is_invalid_relax_tunes_playback())
		disp_msg(" OFF", 1);
	else
		disp_dec(get_relax_tunes_playback());
}

void enhanced_tu_setup_activate (void)
{
	disp_relax_tunes_playback();
}

void enhanced_tu_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		if (is_invalid_relax_tunes_playback())
			set_default_relax_tunes_playback();
		else
			set_invalid_relax_tunes_playback();
		disp_relax_tunes_playback();
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_WITH_INVALID_PROPERTY(relax_tunes_playback);

		disp_relax_tunes_playback();
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_WITH_INVALID_PROPERTY(relax_tunes_playback);

		disp_relax_tunes_playback();
		set_handled();
		break;
	}
}

// TODO: show number of records ?
void enhanced_del_records_activate (void)
{
	disp_msg("SurE", 1);
}

void enhanced_del_records (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		// TODO: delete records
		disp_msg("donE", 1);
		set_item_exit();
		break;
	}
}

void enhanced_fl_setup_activate (void)
{
	disp_dec(get_vibration_level());
}

void enhanced_fl_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		if (get_vibration_level())
			vibro_on(2000, get_vibration_level());
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_PROPERTY(vibration_level);

		disp_dec(get_vibration_level());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_PROPERTY(vibration_level);

		disp_dec(get_vibration_level());
		set_handled();
		break;
	}
}

void enhanced_sp_setup_activate (void)
{
	disp_flag(get_enh_speaker());
}

void enhanced_sp_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case KEY_PLUS:
		toggle_enh_speaker();

		disp_flag(get_enh_speaker());
		set_handled();
		break;
	}
}

void clock_setup_activate (void)
{
	// setup real-time clock
	rtc_setup(RTC_SETUP_HOUR);
	rtc_show();

	input_set_hold_repeat(INPUT_HOLDREPEAT_CYCLES_DEFAULT);
}

void clock_setup_exit (void)
{
	// exit from setup
	rtc_setup(RTC_SETUP_NONE);
	rtc_hide();

	disable_input_hold_repeat();
}

void clock_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		// switch between hours and minutes
		if (rtc_get_setup() == RTC_SETUP_HOUR)
			rtc_setup(RTC_SETUP_MINUTE);
		else
			rtc_setup(RTC_SETUP_HOUR);
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		rtc_inc(-1);
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		rtc_inc(1);
		set_handled();
		break;
	}
}

void disable_input_hold_repeat (void)
{
	input_set_hold_repeat(0);
}

void wakeup_timer_setup_activate (void)
{
	disp_wakeup_timer_delay();

	input_set_hold_repeat(INPUT_HOLDREPEAT_CYCLES_FAST);
}

void wakeup_timer_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		if (is_invalid_wakeup_timer_delay())
			set_default_wakeup_timer_delay();
		else
			set_invalid_wakeup_timer_delay();
		disp_wakeup_timer_delay();
		set_handled();
		break;

	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_WITH_INVALID_PROPERTY(wakeup_timer_delay);

		disp_wakeup_timer_delay();
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_WITH_INVALID_PROPERTY(wakeup_timer_delay);

		disp_wakeup_timer_delay();
		set_handled();
		break;
	}
}

void trigger_counter_display (void)
{
	disp_dec(get_trigger_counter());
}

// TODO: implement reading triggering history
void trigger_times_activate (void)
{
	input_set_hold_repeat(INPUT_HOLDREPEAT_CYCLES_FAST);
}

void trigger_times_handler (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		set_handled();
		break;
	}
}

void remd_sensitivity_setup_activate (void)
{
	disp_dec(get_remd_sensitivity());

	input_set_hold_repeat(INPUT_HOLDREPEAT_CYCLES_FAST);
}

void remd_sensitivity_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_PROPERTY(remd_sensitivity);

		disp_dec(get_remd_sensitivity());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_PROPERTY(remd_sensitivity);

		disp_dec(get_remd_sensitivity());
		set_handled();
		break;
	}
}

void duplex_mode_setup_activate (void)
{
	disp_dec(get_duplex_mode());
}

void duplex_mode_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_PROPERTY(duplex_mode);

		disp_dec(get_duplex_mode());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_PROPERTY(duplex_mode);

		disp_dec(get_duplex_mode());
		set_handled();
		break;
	}
}

void wakeup_mode_setup_activate (void)
{
	disp_dec(get_wakeup_mode());
}

void wakeup_mode_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_MINUS:
	case (KEY_MINUS | INPUT_HOLD):
		DECREMENT_CONFIG_PROPERTY(wakeup_mode);

		disp_dec(get_wakeup_mode());
		set_handled();
		break;

	case KEY_PLUS:
	case (KEY_PLUS | INPUT_HOLD):
		INCREMENT_CONFIG_PROPERTY(wakeup_mode);

		disp_dec(get_wakeup_mode());
		set_handled();
		break;
	}
}

void alarm_clock_setup_activate (void)
{
	disp_flag(get_alarm_clock());
}

void alarm_clock_setup (INPUT_EVENT_BUFFER_TYPE key_event)
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

}

void hints_frequency_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void hints_duty_cycle_setup_activate (void)
{

}

void hints_duty_cycle_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void light_hints_brightness_setup_activate (void)
{

}

void light_hints_brightness_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void sound_hints_volume_setup_activate (void)
{

}

void sound_hints_volume_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void light_hints_duration_setup_activate (void)
{

}

void light_hints_duration_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void sound_hints_duration_setup_activate (void)
{

}

void sound_hints_duration_setup (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void wakeup_signal_check_handler (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void remd_check_handler (INPUT_EVENT_BUFFER_TYPE key_event)
{

}

void set_defaults_activate (void)
{
	disp_msg("SurE", 1);
}

void set_defaults_handler (INPUT_EVENT_BUFFER_TYPE key_event)
{
	switch(key_event)
	{
	case KEY_ENTER:
		config_set_defaults();
		set_handled();
		break;
	}
}

