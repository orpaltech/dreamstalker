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

#ifndef _DISPLAY_DEFINED
#define _DISPLAY_DEFINED


#ifdef __cplusplus
extern "C" {
#endif


/*-----------------------------------------------------------------------*/
/* Display Control Functions									 		 */
/*-----------------------------------------------------------------------*/

void disp_init (void);

void disp_on (void);
void disp_off (void);
void disp_clear (void);
void disp_text (const char *text);
int disp_get_cycle_ms(void);	/* length of cycle in milliseconds */

void disp_hex (uint16_t num);
void disp_dec (uint16_t num);
void disp_msg (const char *text, int cycles_delay);
void disp_version (char type, uint16_t ver, int cycles_delay);	/* display version */
void disp_flag (int flag);

/* Intended for use in RTC ISR. Do not call it directly! */
void disp_isr (void);

/* Property-specific display utilities */
void disp_wakeup_timer_delay (void);

#ifdef __cplusplus
}
#endif

#endif // _DISPLAY_DEFINED
