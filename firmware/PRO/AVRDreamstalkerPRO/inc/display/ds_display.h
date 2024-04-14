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

#ifndef _DS_DISPLAY_DEFINED
#define _DS_DISPLAY_DEFINED

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif


/*-----------------------------------------------------------------------*/
/* Display Control Functions									 		 */
/*-----------------------------------------------------------------------*/

void disp_init (void);

void disp_enable (void);
void disp_enable_unsafe (void);
void disp_disable (void);
void disp_disable_unsafe (void);
bool disp_is_enabled (void);
void disp_clear (void);
void disp_clear_unsafe (void);
void disp_text (const char *text);
void disp_text_unsafe (const char *text);
uint32_t disp_get_cycle_us(void);	/* length of cycle in microseconds */

void disp_hex (uint16_t num);
void disp_num (uint16_t num);
void disp_msg (const char *text, uint16_t wait_cycles);
void disp_version (char type, uint16_t ver, uint16_t wait_cycles);	/* display version */
void disp_flag (bool flag_val);

/* Intended for use in RTC ISR. Do not call it directly! */
void display_isr (void);

/* Property-specific display utilities */
void disp_wakeup_timer_delay (void);

/* Test methods */
void disp_test_on (void);
void disp_test_off (void);

#ifdef __cplusplus
}
#endif

#endif // _DS_DISPLAY_DEFINED
