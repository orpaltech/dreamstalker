/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2026	ORPAL Technologies, Inc.
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

#include "vs10xx_mcu.h"
#include "sound/ds_tonegen.h"
#include "ds_util.h"

#if ( VS_HW_SPEC == VS_HWS_1002 )
  #include "vs1002.h"
  using VsCodec = VLSI::Vs1002;

#elif ( VS_HW_SPEC == VS_HWS_1003 )
  #include "vs1003.h"
  using VsCodec  = VLSI::Vs1003;

#elif ( VS_HW_SPEC == VS_HWS_1053 )
  #include "vs1053.h"
  using VsCodec = VLSI::Vs1053;

#endif

/*-----------------------------------------------------------------------*/

#define CODEC_BLOCK_LEN		SDI_BLOCK_LEN
#define CODEC_BUF_BLOCKS	32U

/* Always read a few SDI blocks from SD card at once - optmization */
#define CODEC_BUF_SIZE		( CODEC_BLOCK_LEN * CODEC_BUF_BLOCKS )

/*-----------------------------------------------------------------------*/

namespace DS {
/*-----------------------------------------------------------------------*/
class AudioCodec {
public:
  static AudioCodec *get();

  enum State {
	  STATE_NONE      = 0,
	  STATE_PLAYBACK	= 1,
	  STATE_CAPTURE	  = 2
  };
public:
  bool begin (void);
  void end (void);

  bool apply_patches (void);

  bool playback (const char *file_name);
  bool capture (const char *file_name);
  void stop (void);

  State get_state (void) const;
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
  static bool write_wav_header (AudioCodec *c, uint32_t num_blocks);

  static constexpr uint16_t buff_size = CODEC_BUF_SIZE;
  static constexpr uint16_t buff_block_size = ADPCM_BLOCK_ALIGN;
  static constexpr uint16_t buff_num_blocks = buff_size / buff_block_size;

  static constexpr uint16_t page_size = 512U;
  static constexpr uint16_t blocks_per_page = page_size / buff_block_size;  // How many blocks fit into one SD page?

  static_assert(buff_num_blocks >= 2 && buff_size == buff_block_size * buff_num_blocks, 
              "Codec buffer must hold at least 2 ADPCM blocks. Codec buffer size strictly equals (block_size * num_blocks) bytes.");

private:
	File		  fp;
	uint8_t		buff[buff_size];
	uint32_t	count_blocks;
	State     state;
  VsCodec   vs;
};

/*-----------------------------------------------------------------------*/
}; //DS

#endif // _DS_SOUND_DEFINED
