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

#include <string.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/power.h>

#include "core/spi_avr.h"
#include "fatfs/ff.h"

#include "vs10xx_mcu.h"
#include "vs10xx.h"
#include "vs1002.h"

#include "ds_config.h"
#include "ds_sound.h"
#include "shared_file.h"


/*-----------------------------------------------------------------------*/

#define CODEC_BLOCK_LEN		SDI_BLOCK_LEN
#define CODEC_BUF_BLOCKS	8UL

/* Always read a few SDI blocks from SD card at once - optmization */
#define CODEC_BUF_SIZE		(CODEC_BLOCK_LEN * CODEC_BUF_BLOCKS)

#if ( CODEC_BUF_SIZE < ADPCM_BLOCK_ALIGN )
#	error "Codec buffer size is too small !!!"
#endif

/*-----------------------------------------------------------------------*/
/* Handle RIFF file structure								 			 */
/*-----------------------------------------------------------------------*/
#define WAV_PUT_CHUNK(chunk)				\
	do {									\
		fres = f_write(fp, chunk, 4, &len);	\
		if (fres != FR_OK)					\
			return false;					\
	} while( false )

#define WAV_PUT_WORD(val)					\
	do {									\
		uint16_t w = (val);					\
		fres = f_write(fp, &w, 2, &len);	\
		if (fres != FR_OK)					\
			return false;					\
	} while( false )

#define WAV_PUT_DWORD(val)					\
	do {									\
		uint32_t dw = (val);				\
		fres = f_write(fp, &dw, 4, &len);	\
		if (fres != FR_OK)					\
			return false;					\
	} while( false )


/*-----------------------------------------------------------------------*/

typedef struct s_codec_context  codec_context_t, *pcodec_context_t;

struct s_codec_context {
	FIL 	fp;
	uint8_t buff[CODEC_BUF_SIZE];
	uint32_t count;
	codec_status_t status;
};

static codec_context_t codec;

/*
 * For each channel, a value in the range of 0 .. 255 
 * may be defined to set its attenuation from the 
 * maximum volume level (in 0.5 dB steps). 
 */

/* Use simplifed volume-to-register mapping */

//	Vol	|	db	 |	Reg	|	Def
// ------------------------------------
//	9 	| 	0	 |	0	|	VS_VOL_MAX
//	8	|	-2	 |	4	|
//	7	|	-5	 |	10	|
//	6	|	-10	 |	20	|
//  5	|	-18	 |	36	|
//  4	|	-30	 |	60	|
//  3	|	-45	 |	90	|
//  2	|	-65	 |	130	|
//  1	|	-90	 |	180	|
//  0	|	-127 |	254	|	VS_VOL_MIN

#define VS_VOL_8	4U
#define VS_VOL_7	10U
#define VS_VOL_6	20U
#define VS_VOL_5	36U
#define VS_VOL_4	60U
#define VS_VOL_3	90U
#define VS_VOL_2	130U
#define VS_VOL_1	180U

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


/*-----------------------------------------------------------------------*/
/* CODEC Operations									 		 		 	 */
/*-----------------------------------------------------------------------*/

uint8_t codec_init (void)
{
	if (! vs_init () )
		return false;

	codec.status = CODEC_IDLE;	/* Set initial state */

	/* Which hardware is in use */
	return (uint8_t) vs_hw_spec();
}

bool codec_process_patches ( void )
{
	return vs_process_patches ();
}

codec_status_t codec_get_status ( void )
{
	return codec.status;
}

/*
 * num_blocks - number of blocks in a file
 */
static
bool write_wav_header ( FIL *fp, uint32_t num_blocks )
{
	FRESULT fres;
	UINT len;

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

void codec_set_volume ( uint8_t left_chan, uint8_t right_chan )
{
	if (left_chan > 9)	left_chan = 9;
	if (right_chan > 9)	right_chan = 9;

	left_chan = pgm_read_byte_far ( &__vol_to_reg[ left_chan ] );
	right_chan = pgm_read_byte_far ( &__vol_to_reg[ right_chan ] );

	vs_set_volume ( left_chan, right_chan );
}

static
void end_playback ( bool on_error )
{
	codec_context_t *c = &codec;

	/* Update status flag*/
	c->status = CODEC_IDLE;

	vs_playback_stop ();

	if ( on_error ) {

	}

	////////////////////
	/*UINT len;
	snprintf((char *)codec.block, 32, "bytes sent = %d\n", (int)codec.count);
	f_write( &shared_fp, codec.block, 
			strlen((const char *)codec.block), &len );*/
	///////////////////////

	//f_close(&shared_fp);
	f_close( &c->fp );
}

static
void process_playback()
{
	FRESULT res;
	UINT len;
	uint16_t pos;
	codec_context_t *c = &codec;

	res	= f_read ( &c->fp, c->buff, 
				CODEC_BUF_SIZE, &len );
	if ( res != FR_OK ) {
		end_playback ( true );

		return;
	}

	if ( len && len < CODEC_BUF_SIZE ) {
		/* Zero block ending if there is no enough data */
		memset ( &c->buff[ len ], 0, 
				CODEC_BUF_SIZE - len );
	}

	if ( len == 0 ) {
		/* Nothing to play */
		end_playback ( false );

		return;
	}

	for ( pos = 0; pos < CODEC_BUF_SIZE;
					pos += CODEC_BLOCK_LEN ) {
		vs_sdi_write ( &c->buff[ pos ] );
	}

}

bool codec_playback ( const char *file_name )
{
	FRESULT res;
	UINT len;
	uint8_t vol;
	codec_context_t *c = &codec;

	if ( codec_get_status() != CODEC_IDLE )
		return false;

	/* open the file */
	res = f_open( &c->fp, file_name, 
				FA_READ );
	if ( res != FR_OK )
		return false;

	/*res = f_open(&shared_fp, "/sd/playback.log", 
				FA_WRITE | FA_CREATE_ALWAYS);
	if (res != FR_OK)
		return false;*/

	if (! vs_playback_start () ) {
		f_close ( &c->fp );

		return false;
	}

	/* Read volume level from config */
	vol = get_music_volume_level ();
	codec_set_volume ( vol, vol );

	/* Update status flag*/
	c->status = CODEC_PLAYBACK;

	return true;
}

bool codec_capture ( const char *file_name )
{
	FRESULT res;
	codec_context_t *c = &codec;

	if ( codec_get_status() != CODEC_IDLE )
		return false;

	// create a new file
	res =	f_open(&c->fp, file_name, 
				FA_WRITE | FA_CREATE_ALWAYS);
	if (res != FR_OK)
		return false;

	/* Write initial file header, will be updated after */
	if (! write_wav_header(&c->fp, 0)) {
		goto error_exit0;
	}

	mic_power_on ();

	if (! vs_adpcm_rec_start(ADPCM_SAMPLE_RATE, 
						get_recording_gain_level(), 
						ADPCM_USE_HP_FILTER)) {
		goto error_exit1;
	}

	/* Reset number of ADPCM blocks */
	c->count = 0;

	/* Update status flag*/
	c->status = CODEC_CAPTURE;
	return true;

error_exit1:
	mic_power_off ();

error_exit0:
	f_close(&c->fp);
	f_unlink(file_name);

	return false;
}

static
void end_capture (bool on_error)
{
	codec_context_t *c = &codec;

	/* Update status flag*/
	c->status = CODEC_IDLE;

	vs_adpcm_rec_stop();

	mic_power_off ();

	if (!on_error) {
		/* update wav header */
		f_lseek(&c->fp, 0);
		write_wav_header(&c->fp, c->count);
	}

	f_close(&c->fp);
}

static
void process_capture()
{
	FRESULT res;
	UINT len;
	codec_context_t *c = &codec;

	if (! vs_adpcm_read_block( c->buff ))
		return;

	/*
	char msg[50];
	snprintf(msg, 50, "flush block, total blocks = %d\n", (int)c->count);
	res	= f_write( &c->fp, msg, 
				strlen(msg), &len );*/

	/* Flush buffer to disk */
	res	= f_write( &c->fp, c->buff, 
				ADPCM_BLOCK_ALIGN, &len );

	if (res != FR_OK) {
		/* Disk write error */
		end_capture (true);
	}

	c->count++;	/* Increment number of blocks */
}

void codec_stop (void)
{
	switch (codec_get_status()) {
		case CODEC_PLAYBACK: {
			end_playback (false);
			break;
		}

		case CODEC_CAPTURE: {
			end_capture (false);
			break;
		}

		default:
			break;
	}
}

void codec_process_task (void)
{
	switch (codec_get_status()) {
	case CODEC_PLAYBACK:
		process_playback();
		break;

	case CODEC_CAPTURE:
		process_capture();
		break;

	default:
		break;
	}
}

