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

#ifndef _DS_RTCLK_DEFINED
#define _DS_RTCLK_DEFINED

#include <stdbool.h>

/* Flags for Real-Time clock ISR (make sure these do not overlap) */
#define RTC_SHOW_HOUR		0x0001U
#define RTC_SHOW_MINUTE		0x0002U
#define RTC_SHOW_DOT		0x0004U
#define RTC_WAKEUP_TIMER	0x0008U
/* 0x10, 0x20 are vacant */
#define RTC_TICK_MARK	0x0040U
#define RTC_VISIBLE		0x0080U

/* RTC interrupt interval, in milliseconds */
#define RTC_INTERVAL_MSEC	1UL


#ifdef __cplusplus
extern "C" {
#endif

typedef enum e_rtc_oper_mode {
	RTC_OPM_DEFAULT = 0,
	RTC_OPM_POWERSAVE
} rtc_oper_mode_t; 

typedef enum e_rtc_setup_mode {
	RTC_SETUP_NONE	= 0,
	RTC_SETUP_HOUR,
	RTC_SETUP_MINUTE
} rtc_setup_mode_t;


void rtc_init ( void );

void rtc_start ( rtc_oper_mode_t mode );

uint32_t rtc_msec_to_ticks ( uint32_t ms );

void rtc_show ( void );
void rtc_hide ( void );
bool rtc_is_visible ( void );

void rtc_set_setup ( rtc_setup_mode_t mode );
bool rtc_is_setup ( void );
rtc_setup_mode_t rtc_get_setup ( void );
/* decrement if sign < 0, otherwise increment */
void rtc_setup_inc ( int sign );

void rtc_wait_for_tick ( void );

void rtc_flag_set ( uint16_t flag );
void rtc_flag_unset ( uint16_t flag ); 
void rtc_flag_toggle ( uint16_t flag );
bool rtc_flag_is_set ( uint16_t flag );


#ifdef __cplusplus
}
#endif

#endif // _DS_RTCLK_DEFINED
