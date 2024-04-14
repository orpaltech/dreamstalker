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

#ifndef _DS_SOUND_DEFINED
#define _DS_SOUND_DEFINED

#include <stdint.h>
#include <stdbool.h>

#define HP_SRC_CODEC	1
#define HP_SRC_TONEGEN	2


typedef enum e_codec_status {
	CODEC_IDLE		= 0,
	CODEC_PLAYBACK	= 1,
	CODEC_CAPTURE	= 2
} codec_status_t;


#ifdef __cplusplus
extern "C" {
#endif


void sound_init (void);

void sound_start (void);
void sound_stop (void);

uint8_t codec_init (void);
bool codec_process_patches (void);
bool codec_playback (const char *file_name);
bool codec_capture (const char *file_name);
void codec_stop (void);
codec_status_t codec_get_status (void);
/* Set codec volume: 0-9 */
void codec_set_volume(uint8_t left_chan, uint8_t right_chan);
/* Must be called in the main application loop */
void codec_process_task (void);

void tonegen_init (void);	/* called from sound_init */
void tonegen_beep (uint16_t millisec, uint8_t note, uint8_t octave);
void tonegen_melody (uint8_t playback_times);

/* Enable/shutdown loudspeaker */
void speaker_on (void);
void speaker_off (void);

/* Enable/disable system microphone */
void mic_power_on (void);
void mic_power_off (void);


#ifdef __cplusplus
}
#endif

#endif // _DS_SOUND_DEFINED
