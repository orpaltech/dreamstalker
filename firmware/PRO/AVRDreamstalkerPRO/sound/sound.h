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

#ifndef _SOUND_DEFINED
#define _SOUND_DEFINED

#define CODEC_IDLE		0
#define CODEC_PLAYBACK	1
#define CODEC_CAPTURE	2

#define HP_SRC_CODEC	1
#define HP_SRC_TONEGEN	2


#ifdef __cplusplus
extern "C" {
#endif


int codec_init (void);
int codec_patch (void);
int codec_send_data (const uint8_t *data, uint16_t len);
int codec_playback (const char *file_name);
int codec_capture (const char *file_name, int highpass_filter);
void codec_stop (void);
int codec_get_status (void);
void codec_process_task (void);	// Must be called from main loop

void tonegen_init();
void tonegen_beep (int millisec);

/* Intended for use in RTC ISR. Do not call it directly! */
void tonegen_isr (void);

void hp_set_source (uint8_t hp_src);

/* Enable/shutdown loudspeaker */
void speaker_on (void);
void speaker_off (void);

/* Enable/disable system microphone */
void mic_unmute (void);
void mic_mute (void);


#ifdef __cplusplus
}
#endif

#endif // _SOUND_DEFINED
