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

#ifndef _DS_CODEC_DEFINED
#define _DS_CODEC_DEFINED

/*-----------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>

#include <SD.h>

#include "sound/ds_tonegen.h"
#include "vs10xx_mcu.h"

#if ( VS_HW_SPEC == VS_HWS_1002 )
  #include "vs1002.h"
  #define VsCodec VLSI::Vs1002

#elif ( VS_HW_SPEC == VS_HWS_1003 )
  #include "vs1003.h"
  #define VsCodec VLSI::Vs1003

#elif ( VS_HW_SPEC == VS_HWS_1053 )
  #include "vs1053.h"
  #define VsCodec VLSI::Vs1053

#endif

/*-----------------------------------------------------------------------*/

#define CODEC_BLOCK_LEN		SDI_BLOCK_LEN
#define CODEC_BUF_BLOCKS	8UL

/* Always read a few SDI blocks from SD card at once - optmization */
#define CODEC_BUF_SIZE		( CODEC_BLOCK_LEN * CODEC_BUF_BLOCKS )

#if ( CODEC_BUF_SIZE < ADPCM_BLOCK_ALIGN )
	#error "Codec buffer is too small !!!"
#endif


/*-----------------------------------------------------------------------*/
namespace DS {

/*-----------------------------------------------------------------------*/
typedef enum e_codec_status {
	CODEC_IDLE		= 0,
	CODEC_PLAYBACK	= 1,
	CODEC_CAPTURE	= 2
} codec_status_t;


/*-----------------------------------------------------------------------*/
class AudioCodec {
public:
  bool begin (void);	/* called from Sound::begin */
  void end (void);

  bool apply_patches (void);
  bool playback (const char *file_name);
  bool capture (const char *file_name);
  void stop (void);
  codec_status_t get_status (void);
  /* Set codec volume: 0-9 */
  void set_volume (uint8_t left_chan, uint8_t right_chan);

public:
  /* Must be called in the main application loop */
  void process_task (void);

private:
  static void end_playback (AudioCodec *c, bool on_error);
  static void end_capture (AudioCodec *c, bool on_error);
  static void process_playback (AudioCodec *c);
  static void process_capture (AudioCodec *c);
private:
	SDFile		fp;
	uint8_t		buff[CODEC_BUF_SIZE];
	uint32_t	count;
	codec_status_t status;
  VsCodec vs;
};

/*-----------------------------------------------------------------------*/
}; //DS

extern DS::AudioCodec AC;

#endif // _DS_SOUND_DEFINED
