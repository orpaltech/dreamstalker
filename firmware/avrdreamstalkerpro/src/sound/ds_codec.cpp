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

#include <string.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/power.h>

#include <SD.h>

#include "sound/vs10xx_mcu.h"
#include "sound/vs10xx.h"
#include "sound/vs1002.h"

#include "sound/ds_sound.h"
#include "sound/ds_codec.h"
#include "ds_config.h"

using namespace DS;

/*-----------------------------------------------------------------------*/
/* Handle RIFF file structure
 */
#define WAV_PUT_CHUNK(chunk)		\
	do {							\
		len = fp->write((const uint8_t*)chunk, 4);	\
		if (len == 0)				\
			return false;			\
	} while( 0 )

#define WAV_PUT_WORD(val)			\
	do {							\
		uint16_t w = (val);			\
		len = fp->write((const uint8_t*)&w, 2);		\
		if (len == 0)				\
			return false;			\
	} while( 0 )

#define WAV_PUT_DWORD(val)			\
	do {							\
		uint32_t dw = (val);		\
		len = fp->write((const uint8_t*)&dw, 4);	\
		if (len == 0)				\
			return false;			\
	} while( 0 )


/*-----------------------------------------------------------------------*/


PROGMEM const uint8_t __vol_to_reg [] = {
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


/*
 * num_blocks - number of blocks in a file
 */
static
bool write_wav_header ( SDFile *fp, uint32_t num_blocks )
{
	size_t len;

	/* Riff ChunkID */
	WAV_PUT_CHUNK( "RIFF" );
	/* ChunkSize = num_blocks * BlockAlign + 52
	 *	must be <file-size> - 8 
	 */
	WAV_PUT_DWORD( num_blocks * ADPCM_BLOCK_ALIGN + 52 );
	/* Format */
	WAV_PUT_CHUNK( "WAVE" );

	/*SubChunk1ID*/
	WAV_PUT_CHUNK( "fmt " );
	/* SubChunk1Size */
	WAV_PUT_DWORD( 20 );
	/* AudioFormat - IMA ADPCM */
	WAV_PUT_WORD( WAV_FORMAT_IMA_ADPCM );
	/* NumOfChannels */
	WAV_PUT_WORD( 1 );
	/* SampleRate */
	WAV_PUT_DWORD( ADPCM_SAMPLE_RATE );
	/* ByteRate = <SampleRate> * <BlockAlign> / <SamplesPerBlock>
	 *	8000 * 256 / 505 ~= 4055 
	 */
	WAV_PUT_DWORD( ADPCM_SAMPLE_RATE * ADPCM_BLOCK_ALIGN / ADPCM_SAMPLES_PER_BLOCK );
	/* BlockAlign */
	WAV_PUT_WORD( ADPCM_BLOCK_ALIGN );
	/* BitsPerSample */
	WAV_PUT_WORD( ADPCM_BITS_PER_SAMPLE );
	/* Bytes of ExtraData */
	WAV_PUT_WORD(2);
	/* ExtraData - SamplesPerBlock */
	WAV_PUT_WORD( ADPCM_SAMPLES_PER_BLOCK );

	/* SubChunk2ID */
	WAV_PUT_CHUNK( "fact" );
	/* SubChunk2Size */
	WAV_PUT_DWORD( 4 );
	/* NumOfSamples = num_blocks * SamplesPerBlock */
	WAV_PUT_DWORD( num_blocks * ADPCM_SAMPLES_PER_BLOCK );

	/* SubChunk3ID */
	WAV_PUT_CHUNK( "data" );
	/* SubChunk3Size = num_blocks * BlockAlign 
	 *	must be <file-size> - 60
	 */
	WAV_PUT_DWORD( num_blocks * ADPCM_BLOCK_ALIGN );

	return true;
}

/*-----------------------------------------------------------------------*/
AudioCodec AC;

/*-----------------------------------------------------------------------*/
AudioCodec *AudioCodec::get()
{
  return &AC;
}

/*-----------------------------------------------------------------------*/
bool AudioCodec::begin (void)
{
  if (! vs.init ())
	return false;

  status = AUDIO_CODEC_IDLE;	/* Set initial state */
  return true;
}

void AudioCodec::end (void)
{

}

bool AudioCodec::apply_patches (void)
{
  return vs.process_patches ();
}

e_audio_codec_state_t AudioCodec::get_status (void)
{
  return status;
}

void AudioCodec::set_volume (uint8_t left_chan, uint8_t right_chan)
{
  if (left_chan > 9)	left_chan = 9;
  if (right_chan > 9)	right_chan = 9;

  left_chan = pgm_read_byte_far (&__vol_to_reg[ left_chan ]);
  right_chan = pgm_read_byte_far (&__vol_to_reg[ right_chan ]);

  vs.set_volume (left_chan, right_chan);
}

bool AudioCodec::playback (const char *file_name)
{
  uint8_t vol;

  if (get_status() != AUDIO_CODEC_IDLE)
	return false;

  /* open the file */
  fp = SD.open (file_name, FILE_READ);
  if (! fp)
	return false;

  /*res = f_open(&shared_fp, "/sd/playback.log", 
			FA_WRITE | FA_CREATE_ALWAYS);
  if (res != FR_OK)
	return false;*/

  if (! vs.playback_start ()) {
	fp.close();

	return false;
  }

  /* Read volume level from config */
  vol = config.get_volume_level ();
  set_volume (vol, vol);

  /* Update status flag*/
  status = AUDIO_CODEC_PLAYBACK;

  return true;
}

bool AudioCodec::capture (const char *file_name)
{
  if (get_status () != AUDIO_CODEC_IDLE)
	return false;

  // create a new file
  fp = SD.open (file_name, FILE_WRITE);
  if (! fp)
	return false;

  /* Write initial file header, will be updated after */
  if (! write_wav_header ( &fp, 0 )) {
	goto error_exit0;
  }

  Sound::get()->mic_on ();

  if (! vs.adpcm_record_start (ADPCM_SAMPLE_RATE, 
							config.get_record_gain_level (), 
							ADPCM_USE_HP_FILTER)) {
	goto error_exit1;
  }

  /* Reset number of ADPCM blocks */
  count = 0;

  /* Update status flag*/
  status = AUDIO_CODEC_CAPTURE;
  return true;

error_exit1:
  Sound::get()->mic_off ();

error_exit0:
  fp.close();
  SD.remove(file_name);

  return false;
}

void AudioCodec::end_playback (AudioCodec *c, bool on_error)
{
  /* Update status flag*/
  c->status = AUDIO_CODEC_IDLE;

  c->vs.playback_stop ();

  if (on_error) {

  }

  ////////////////////
  /*UINT len;
  snprintf((char *)codec.block, 32, "bytes sent = %d\n", (int)codec.count);
  f_write( &shared_fp, codec.block, 
		strlen((const char *)codec.block), &len );*/
  ///////////////////////

  //f_close(&shared_fp);
  c->fp.close();
}

void AudioCodec::end_capture (AudioCodec *c, bool on_error)
{
  /* Update status flag*/
  c->status = AUDIO_CODEC_IDLE;

  c->vs.adpcm_record_stop ();

  Sound::get()->mic_off ();

  if (! on_error) {
	/* update wav header */
	c->fp.seek (0);
	write_wav_header (&c->fp,
					c->count);
  }

  c->fp.close ();
}

void AudioCodec::process_playback (AudioCodec *c)
{
	uint16_t	len;
	uint16_t	pos;

	len	= c->fp.read (c->buff, CODEC_BUF_SIZE);

	if (len == 0) {
		end_playback (c, true);

		return;
	}

	if (len && len < CODEC_BUF_SIZE) {
		/* Zero block ending if there is no enough data */
		memset (&c->buff[ len ], 0, 
				CODEC_BUF_SIZE - len);
	}

	if (len == 0) {
		/* Nothing to play */
		end_playback (c, false);

		return;
	}

	for (pos = 0; pos < CODEC_BUF_SIZE;
				pos += CODEC_BLOCK_LEN) {
		c->vs.playback_send_block (&c->buff[ pos ]);
	}

}

void AudioCodec::process_capture (AudioCodec *c)
{
	size_t	len;

	if (! c->vs.adpcm_read_block (c->buff))
		return;

	/*
	char msg[50];
	snprintf(msg, 50, "flush block, total blocks = %d\n", (int)c->count);
	res	= f_write( &c->fp, msg, 
				strlen(msg), &len );*/

	/* Flush buffer to disk */
	len	= c->fp.write (c->buff, ADPCM_BLOCK_ALIGN);

	if (len == 0) {
		/* Disk write error */
		end_capture (c, true);
	}

	c->count++;	/* Increment number of blocks */
}

void AudioCodec::stop (void)
{
  switch (get_status ()) {

	case AUDIO_CODEC_PLAYBACK: {
	  end_playback ( this, false );
	  break;
	}

	case AUDIO_CODEC_CAPTURE: {
	  end_capture ( this, false );
	  break;
	}

	default:
	  break;
  }
}

void AudioCodec::process_task (void)
{
  switch (get_status ()) {

	case AUDIO_CODEC_PLAYBACK:
	  process_playback (this);
	  break;

	case AUDIO_CODEC_CAPTURE:
	  process_capture (this);
	  break;

	default:
	  break;
  }
}
