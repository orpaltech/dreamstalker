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

#ifndef _DS_DISP_MSGS_DEFINED
#define _DS_DISP_MSGS_DEFINED


/*-----------------------------------------------------------------------*/

#define __disp_msg_battery_low__	"btLo"

#define __disp_msg_codec_error__    "CoEr"
#define __disp_msg_codec_version__	"Co%02u"

#define __disp_msg_no_sd__			"noSd"
#define __disp_msg_sd_0__           "Sd 0"
#define __disp_msg_sd_error__		"SdEr"

#define __disp_msg_on__				"  On"
#define __disp_msg_off__    		" OFF"

#define __disp_msg_set__    		"SEt-"

#define __disp_msg_done__			"donE"
#define __disp_msg_confirm__		"SurE"

#define __disp_msg_time__			"%02u.%02u"
#define __disp_msg_version__		"%c%1u.%02u"

#define __disp_msg_bad_number__		"EEEE"

#define __disp_msg_all_dots__       " . . . ."


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif

#endif // _DS_DISP_MSGS_DEFINED
