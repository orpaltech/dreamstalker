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

#ifndef _REALTIME_CLOCK_DEFINED
#define _REALTIME_CLOCK_DEFINED

/* Flags for Real-Time clock ISR (make sure flags do not overlap)*/
#define RTC_SHOW_HOUR		0x01
#define RTC_SHOW_MINUTE		0x02
#define RTC_SHOW_DOT		0x04
#define RTC_WAKEUP_TIMER_IND	0x40
#define RTC_FLAG_VISIBLE	0x80

/* RTC internal ISR interval, in milliseconds */
#define RTC_INTERVAL_MSEC	1


#ifdef __cplusplus
extern "C" {
#endif

typedef enum e_rtc_setup_mode {
	RTC_SETUP_NONE	= 0,
	RTC_SETUP_HOUR,
	RTC_SETUP_MINUTE
} rtc_setup_mode_t;


void rtc_init (void);

void rtc_show (void);
void rtc_hide (void);
int rtc_is_visible (void);

void rtc_setup (rtc_setup_mode_t mode);
int rtc_is_setup (void);
rtc_setup_mode_t rtc_get_setup (void);

void rtc_flag_set(uint8_t flag);
void rtc_flag_clear(uint8_t flag);

/* decrement if sign < 0, otherwise increment */
void rtc_inc (int sign);


#ifdef __cplusplus
}
#endif

#endif // _REALTIME_CLOCK_DEFINED
