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

#include <string.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/power.h>

#include "sound/vs10xx_mcu.h"
#include "sound/vs10xx.h"
#include "sound/vs1002.h"

#include "sound/ds_sound.h"
#include "sound/ds_codec.h"
#include "ds_config.h"
#include "ds_util.h"

using namespace DS;


/*-----------------------------------------------------------------------*/

PROGMEM const uint8_t uVolumeToVS [] = {
	VS_VOL_MIN, 
	VS_VOL_1, 
	VS_VOL_2,
	VS_VOL_3, 
	VS_VOL_4, 
	VS_VOL_5,
	VS_VOL_6,
	VS_VOL_7,
	VS_VOL_8,
	VS_VOL_MAX
};


/*-----------------------------------------------------------------------*/
AudioCodec *AudioCodec::get()
{
  static AudioCodec codec;
  return &codec;
}

/*
 * num_blocks - number of blocks in a file
 */
bool AudioCodec::write_wav_header (AudioCodec *c, uint32_t num_blocks)
{
  uint8_t idx = 0;
  uint8_t *b = c->buff; // Reuse existing class buffer

  auto pack32 = [&](uint32_t val) { memcpy(&b[idx], &val, 4); idx += 4; };
  auto pack16 = [&](uint16_t val) { memcpy(&b[idx], &val, 2); idx += 2; };
  auto packStr = [&](const char *s) { memcpy(&b[idx], s, 4); idx += 4; };

  /* Riff ChunkID */
  packStr("RIFF");
  /* ChunkSize = num_blocks * BlockAlign + 52
   *	must be <file-size> - 8 
   */
  pack32((num_blocks * ADPCM_BLOCK_ALIGN) + 52);
  /* Format */
  packStr("WAVE");

  /*SubChunk1ID*/
  packStr("fmt ");
  /* SubChunk1Size */
  pack32(20);
  /* AudioFormat - IMA ADPCM */
  pack16(WAV_FORMAT_IMA_ADPCM);
  /* NumOfChannels */
  pack16(1);
  /* SampleRate */
  pack32(ADPCM_SAMPLE_RATE);
  /* ByteRate = <SampleRate> * <BlockAlign> / <SamplesPerBlock>
   *	8000 * 256 / 505 ~= 4055 
   */
  pack32((ADPCM_SAMPLE_RATE * ADPCM_BLOCK_ALIGN) / ADPCM_SAMPLES_PER_BLOCK);
  /* BlockAlign */
  pack16(ADPCM_BLOCK_ALIGN);
  /* BitsPerSample */
  pack16(ADPCM_BITS_PER_SAMPLE);
  /* Bytes of ExtraData */
  pack16(2);
  /* ExtraData - SamplesPerBlock */
  pack16(ADPCM_SAMPLES_PER_BLOCK);

  /* SubChunk2ID */
  packStr("fact");
  /* SubChunk2Size */
  pack32(4);
  /* NumOfSamples = num_blocks * SamplesPerBlock */
  pack32(num_blocks * ADPCM_SAMPLES_PER_BLOCK);

  /* SubChunk3ID */
  packStr("data");
  /* SubChunk3Size = num_blocks * BlockAlign 
   *	must be <file-size> - 60
   */
  pack32(num_blocks * ADPCM_BLOCK_ALIGN);

  return (c->fp.write(b, 60) == 60);
}

/*-----------------------------------------------------------------------*/
bool AudioCodec::begin (void)
{
  if (! vs.init ())
	  return false;

  state = STATE_NONE;	// Set initial state
  return true;
}

void AudioCodec::end (void)
{
}

bool AudioCodec::apply_patches (void)
{
  return vs.process_patches ();
}

AudioCodec::State AudioCodec::get_state (void) const
{
  return state;
}

void AudioCodec::set_volume (uint8_t left_chan, uint8_t right_chan)
{
  if (left_chan > 9)	left_chan = 9;
  if (right_chan > 9)	right_chan = 9;

  left_chan = pgm_read_byte_far (&uVolumeToVS[ left_chan ]);
  right_chan = pgm_read_byte_far (&uVolumeToVS[ right_chan ]);

  vs.set_volume (left_chan, right_chan);
}

bool AudioCodec::playback (const char *file_name)
{
  if (get_state () != STATE_NONE)
    return false;

  // Open the file
  fp = card0.open (file_name);
  if (! fp)
	  return false;

  if (! vs.playback_start ()) {
	  fp.close();
	  return false;
  }

  // Read volume level from config 
  uint8_t vol = config.get_volume_level ();
  set_volume ( vol, vol );

  // Reset number of VS blocks processed 
  count_blocks = 0;

  // Update status flag
  state = STATE_PLAYBACK;

  return true;
}

bool AudioCodec::capture (const char *file_name)
{
  if (get_state () != STATE_NONE) return false;

  auto handle_error = [&]() {
    fp.close ();
  	card0.remove (file_name);
    Sound::get()->microphone_off ();
    Sound::get()->set_silent (false);
  };

  // Create a new file
  fp = card0.open (file_name, FILE_WRITE);
  if (! fp)
	  return false;

  Sound::get()->set_silent ();
  Sound::get()->microphone_on ();

  // Write initial file header, will be updated after */
  if (! write_wav_header ( this, 0 )) {
    handle_error ();
    return false;
  }

  bool success =  vs.adpcm_record_start ( ADPCM_SAMPLE_RATE,
                                        config.get_record_gain_level (), 
                                        ADPCM_USE_HP_FILTER);
  if (!success) {
  	handle_error ();
    return false;
  }

  // Reset number of ADPCM blocks processed
  count_blocks = 0;

  // Update status flag
  state = STATE_CAPTURE;

  return true;
}

void AudioCodec::end_playback (AudioCodec *c, bool on_error)
{
  c->vs.playback_stop ();

  c->fp.close();

  if (on_error) {
    // TODO: output error message or whatever
  }

  // Update status flag
  c->state = STATE_NONE;
}

void AudioCodec::end_capture (AudioCodec *c, bool on_error)
{
  c->vs.adpcm_record_stop ();

  // Exit silent mode
  Sound::get()->set_silent (false);

  Sound::get()->microphone_off ();

  if (!on_error) {
    // Calculate how many blocks are sitting in RAM unwritten.
    const uint16_t blocks_per_page = page_size / buff_block_size;
    uint16_t remaining_blocks = c->count_blocks % blocks_per_page;

    if (remaining_blocks > 0) {
      // Find the START of the remaining data.
      // It is located at the slot just before the current 'count_blocks' index.
      uint16_t start_pos = (c->count_blocks - remaining_blocks) % buff_num_blocks;
      uint8_t *write_ptr = &c->buff[start_pos * buff_block_size];

      c->fp.write(write_ptr, remaining_blocks * buff_block_size);
    }

    c->fp.flush();

    // Update wav header with the TOTAL number of blocks recorded
    c->fp.seek(0);
    write_wav_header (c, c->count_blocks);
  }

  c->fp.close();

  // Update status flag
  c->state = STATE_NONE;
}

void AudioCodec::process_playback (AudioCodec *c)
{
  // Check if the buffer is empty or fully processed
  if (c->count_blocks >= buff_num_blocks || c->count_blocks == 0) {
    int16_t size = c->fp.read ( c->buff, buff_size );
    
	  if (size <= 0) {
      end_playback(c, (size < 0)); // false if EOF (0), true if error (<0)
      return;
    }

    /* Pad remaining buffer with 0 if we read less than CODEC_BUF_SIZE */
    if ((uint8_t)size < buff_size) {
      memset(&c->buff[size], 0, buff_size - size);
    }

    c->count_blocks = 0; // Reset position for the new buffer
  }

  // Non-blocking send: Only send ONE SDI byte block if VS is ready
  uint16_t buff_pos = c->count_blocks * SDI_BLOCK_LEN;

  c->vs.playback_send_block(&c->buff[buff_pos]);
  c->count_blocks ++;
}

/**
 * Drains the VS FIFO and writes to SD in 512-byte aligned pages.
 * We use a 'while' loop to empty the VS completely in every cycle.
 * This prevents "Internal Overflow" which causes 2/3 data loss if the 
 * SD card has a latency spike during a write operation.
 */
void AudioCodec::process_capture (AudioCodec *c)
{   
  // Drain loop: Pull everything possible from VS
  while (c->vs.adpcm_has_block ()) 
  {
    uint16_t slot = c->count_blocks % buff_num_blocks;
    uint8_t *buff_ptr = &c->buff[slot * buff_block_size];

    if (c->vs.adpcm_read_block ( buff_ptr )) {
      c->count_blocks++;

      // Trigger write every time we fill a 512-byte 'page'
      if (c->count_blocks % blocks_per_page == 0) {

        // Find the start of the 512-byte chunk we just finished.
        // This math works for any buffer size (1K, 2K, etc.)
        uint16_t page_index = (c->count_blocks - blocks_per_page) % buff_num_blocks;
        uint8_t *write_ptr = &c->buff[page_index * buff_block_size];

        size_t written = c->fp.write ( write_ptr, page_size );
        if (written < page_size) {
          end_capture ( c, true );
          return;
        }
                
        // Break after the synchronous write to allow one main loop 
        // cycle before coming back to drain the next batch.
        break; 
      }

    } else {
      break; 
    }
  }
}

void AudioCodec::stop (void)
{
  switch (get_state ()) {
	  case STATE_PLAYBACK:
      end_playback ( this, false );
	    break;

	  case STATE_CAPTURE:
      end_capture ( this, false );
	    break;

	  default:
	    break;
  }
}

void AudioCodec::process_task (void)
{
  switch (get_state ()) {
	  case STATE_PLAYBACK:
      process_playback ( this );
	    break;

	  case STATE_CAPTURE:
      process_capture ( this );
	    break;

	  default:
	    break;
  }
}
