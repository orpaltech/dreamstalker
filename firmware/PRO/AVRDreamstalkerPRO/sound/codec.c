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

#include <string.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/power.h>

#include "../core/spi_avr.h"
#include "sound.h"
#include "../fatfs/ff.h"

#include "vs10xx_mcu.h"
#include "vs10xx.h"
#include "vs1002.h"


#ifndef min
#define min(a, b)	((a)<(b) ? (a) : (b))
#endif

/* Peripheral controls (Platform dependent) */
#define DD_MLEFT		_BV(DDG1)
#define DD_MGBUF		_BV(DDG0)
#define DD_MICP			_BV(DDE6)		// microphone on/off
#define DD_SNDOFF		_BV(DDE5)		// sound on/off
#define DD_HPTS			_BV(DDE2)
#define DD_SILENT		_BV(DDC2)		// silence detect

#define BIT_MLEFT		PG1
#define BIT_MGBUF		PG0
#define BIT_MICP		PE6
#define BIT_SNDOFF		PE5
#define BIT_HPTS		PE2
#define BIT_SILENT		PC2

#define BV_MLEFT		_BV(BIT_MLEFT)
#define BV_MGBUF		_BV(BIT_MGBUF)
#define BV_MICP			_BV(BIT_MICP)
#define BV_SNDOFF		_BV(BIT_SNDOFF)
#define BV_HPTS			_BV(BIT_HPTS)
#define BV_SILENT		_BV(BIT_SILENT)

#define CODEC_BUF_SIZE				(SDI_BLOCK_LEN * 30)
#define CODEC_FIFO_MIN_LEVEL		(SDI_BLOCK_LEN * 6)


typedef struct s_codec_context {
	FIL fp;
	uint8_t buf[CODEC_BUF_SIZE];
	uint32_t pos, count;
	volatile uint8_t status;
} codec_context_t;

static codec_context_t codec;

/*-----------------------------------------------------------------------*/
/* OpAmp Control									 		 		 	 */
/*-----------------------------------------------------------------------*/

void speaker_on (void) {
	PORTE &= ~BV_SNDOFF;
}
void speaker_off (void) {
	PORTE |= BV_SNDOFF;
}

/*-----------------------------------------------------------------------*/
/* Headphones Control									 		 		 */
/*-----------------------------------------------------------------------*/

void hp_set_source (uint8_t hp_src) {
	switch (hp_src) {
	case HP_SRC_CODEC:
		DDRG &= ~DD_MGBUF;		/* MGBUF input line */
		PORTG &= ~BV_MGBUF;		/* high-Z */
		DDRG &= ~DD_MLEFT;
		PORTG &= ~BV_MLEFT;		/* high-Z */
		break;
	case HP_SRC_TONEGEN:
		DDRG |= DD_MGBUF;		/* MGBUF output line */
		PORTG &= ~BV_MGBUF;		/* high */
		DDRG |= DD_MLEFT;
		PORTG |= BV_MLEFT;
		break;
	}
}

/*-----------------------------------------------------------------------*/
/* Microphone Control									 		 		 */
/*-----------------------------------------------------------------------*/

void mic_unmute (void) {
	PORTE |= BV_MICP;
	_delay_ms(5);
}

void mic_mute (void) {
	PORTE &= ~BV_MICP;
	_delay_ms(5);
}

/*-----------------------------------------------------------------------*/
/* CODEC Operations									 		 		 	 */
/*-----------------------------------------------------------------------*/

int codec_init (void)
{
	int ret;

	DDRE |= DD_MICP;			/* MICP output line */
	DDRE |= DD_SNDOFF;			/* SNDOFF output line */

	DDRC &= ~DD_SILENT;			/* SILENT input line */
	DDRE &= ~DD_HPTS;			/* HPTS input line */
	DDRG &= ~DD_MLEFT;			/* MLEFT input line */
	DDRG &= ~DD_MGBUF;			/* MGBUF input line */

	PORTC &= ~BV_SILENT;	/* high-Z */
	PORTE &= ~BV_HPTS;		/* high-Z */
	PORTG &= ~BV_MLEFT;		/* high-Z */
	PORTG &= ~BV_MGBUF;		/* high-Z */


	ret = vs_init();
	if (ret == 0)
		return 0;

	speaker_off();	/* Disable opamp */
	mic_mute();		/* Power down microphone */

	codec.status = CODEC_IDLE;	/* Set initial state */

	//tonegen_init();

	/* Return which hardware is in use */
	return (int) vs_get_hwspec();
}

int codec_patch (void)
{
	if (vs_get_hwspec()==VS_HWS_1002) {
		if (vs1002_patch_ima_adpcm_apply("VLSI/02_ima.cmd")==0)
			return 0;
	}

	return 1;
}

int codec_get_status (void)
{
	return codec.status;
}

int codec_send_data (const uint8_t *data, uint16_t len)
{
	return vs_sdi_write(data, len);
}

#define RIFF_WRITE_VAL2(val)					\
	val2 = (val);								\
	fres = f_write(fp, &val2, 2, &bw);			\
	if (fres != FR_OK)							\
		return 0

#define RIFF_WRITE_VAL4(val)					\
	val4 = (val);								\
	fres = f_write(fp, &val4, 4, &bw);			\
	if (fres != FR_OK)							\
		return 0


/*
 * num_blocks - number of blocks in a file
 */
static
int capture_write_header (FIL *fp, uint32_t num_blocks)
{
	FRESULT fres;
	uint16_t val2 = 0;
	uint32_t val4 = 0;
	UINT bw;

	/* ChunkID */
	fres = f_write(fp, "RIFF", 4, &bw);
	if (fres != FR_OK)
		return 0;
	/* ChunkSize = num_blocks * BlockAlign + 52 */
	/* must be <file-size> - 8 */
	RIFF_WRITE_VAL4(num_blocks * 256 + 52);

	/* Format */
	fres = f_write(fp, "WAVE", 4, &bw);
	if (fres != FR_OK)
		return 0;

	/*SubChunk1ID*/
	fres = f_write(fp, "fmt ", 4, &bw);
	if (fres != FR_OK)
		return 0;
	/* SubChunk1Size */
	RIFF_WRITE_VAL4(20);

	/* AudioFormat - IMA ADPCM */
	RIFF_WRITE_VAL2(0x11);

	/* NumOfChannels */
	RIFF_WRITE_VAL2(1);

	/* SampleRate */
	RIFF_WRITE_VAL4(8000);

	/* ByteRate = <SampleRate> * <BlockAlign> / <SamplesPerBlock>
	 * 8000 * 256 / 505 ~= 4055 */
	RIFF_WRITE_VAL4(4055);

	/* BlockAlign */
	RIFF_WRITE_VAL2(256);

	/* BitsPerSample */
	RIFF_WRITE_VAL2(4);

	/* ByteExtraData */
	RIFF_WRITE_VAL2(2);
	/* ExtraData - SamplesPerBlock */
	RIFF_WRITE_VAL2(505);

	/* SubChunk2ID */
	fres = f_write(fp, "fact", 4, &bw);
	if (fres != FR_OK)
		return 0;
	/* SubChunk2Size */
	RIFF_WRITE_VAL4(4);

	/* NumOfSamples = num_blocks * SamplesPerBlock */
	RIFF_WRITE_VAL4(num_blocks * 505);

	/* SubChunk3ID */
	fres = f_write(fp, "data", 4, &bw);
	if (fres != FR_OK)
		return 0;
	/* SubChunk3Size = num_blocks * BlockAlign */
	/* must be <file-size> - 60 */
	RIFF_WRITE_VAL4(num_blocks * 256);

	return 1;
}

int codec_playback (const char *file_name) {
	FRESULT fres;
	UINT len;

	if (codec.status != CODEC_IDLE)
		return 0;

	// read from file
	fres =	f_open(	&codec.fp, file_name, FA_READ );
	if (fres != FR_OK)
		return 0;

	fres =	f_read(	&codec.fp, codec.buf, CODEC_BUF_SIZE, &len );
	if (fres != FR_OK) {
		f_close(&codec.fp);
		return 0;
	}

	codec.count = len;
	codec.pos = 0;
	if (codec.count) {
		speaker_on();

		len = min(codec.count, SDI_BLOCK_LEN);
		codec_send_data(codec.buf, len);

		codec.pos += len;
		/* Update status flag*/
		codec.status = CODEC_PLAYBACK;
	}
	return 1;
}

int codec_capture (const char *file_name, int highpass_filter)
{
	FRESULT fres;

	if (codec.status != CODEC_IDLE)
		return 0;

	// create a new file
	fres =	f_open( &codec.fp, file_name, FA_WRITE | FA_CREATE_ALWAYS );
	if (fres != FR_OK)
		return 0;

	/* write initial file header, will be updated after */
	if (capture_write_header( &codec.fp, 0 )==0) {
		f_close(&codec.fp);
		return 0;
	}

	if (vs_adpcm_rec_start( highpass_filter )==0) {
		f_close(&codec.fp);
		return 0;
	}

	mic_unmute();

	/* Reset block counter */
	codec.count = 0;
	codec.pos = 0;

	/* Update status flag*/
	codec.status = CODEC_CAPTURE;
	return 1;
}

static
void process_playback()
{
	FRESULT fres;
	UINT len;

	len = codec.count-codec.pos;

	if (len <= CODEC_FIFO_MIN_LEVEL) {
		if (len > 0) {
			// move remaining data to the beginning of the buffer
			memmove(codec.buf, codec.buf+codec.pos, len);
			codec.count = len;
		} else
			codec.count = 0;

		// fill more data to the buffer
		fres =	f_read(	&codec.fp, codec.buf+len, CODEC_BUF_SIZE-len, &len );
		if (fres == FR_OK) {
			codec.count += len;
		}

		codec.pos = 0;
		len = codec.count;
	}

	if (len > 0) {
		len = min(len, SDI_BLOCK_LEN * 3);	/* Subject to review */

		codec_send_data(codec.buf + codec.pos, len);
		codec.pos += len;
	} else {
		codec.status = CODEC_IDLE;
		f_close(&codec.fp);
		speaker_off();
	}
}

static int step = 0;

static
void process_capture()
{
	FRESULT fres;
	UINT len;
	uint16_t fill, w;
	uint8_t *ptr;

	ptr = codec.buf;

	if(codec.pos==256) {
		/* write blocks to disk */
		fres = f_write(&codec.fp, ptr, 256, &len);
		if (fres != FR_OK) {
			/* Disk write error */
			return;
		}

		codec.count++;
		codec.pos = 0;
		step = 0;
	}

	/* Read buffer fill rate */
	fill = vs_sci_read(SCI_REG_HDAT1);
	if (fill >= 896) {
		/* To avoid buffer aliasing.*/
		return;
	}
	if (fill>=128) {
		//ptr = codec.buf;//&codec.buf[codec.pos];
		/*if(skip)
			w2= (((uint16_t) ptr[510]) << 8) | ptr[511];
		else
			w2=0;*/

		for(len=0; len<128; len++) {
			w = vs_sci_read(SCI_REG_HDAT0);
			/**(ptr + len*2)=(w >> 8);
			*(ptr + len*2 + 1)=(w & 0xff);*/
			/*if(skip && len <= 16) {
				ptr[codec.pos++]=0;
				ptr[codec.pos++]=0;
			}else {*/
				ptr[codec.pos++]=(w >> 8);
				ptr[codec.pos++]=(w & 0xff);
			//}
			//codec.pos+=2;
		}


		/* write blocks to disk */
		/*fres = f_write(&codec.fp, ptr+step*64, 64, &len);
		if (fres != FR_OK) {*/
			/* Disk write error */
			/*return;
		}*/

		step++;

		//codec.count+=2;
		//codec.pos = 0;

		/*if (codec.pos == 256) {
			codec.count++;
			codec.pos = 0;*/

			/* write blocks to disk */
			/*fres = f_write(&codec.fp, codec.buf, 256, &len);
			if (fres != FR_OK) {*/
				/* Disk write error */
				//return;
			//}
		//}

/*
		if (codec.pos==256) {
			codec.count++;
			codec.pos	= 0;

		}*/

		//if (codec.pos==1024) {

			/* write blocks to disk */
			/*fres = f_write(&codec.fp, ptr, codec.pos, &len);
			if (fres != FR_OK) {*/
				/* Disk write error */
				//return;
			//}

			//codec.pos = 0;
		//}
	}
}

void codec_stop (void)
{
	if (codec.status == CODEC_IDLE)
		return;

	if (codec.status == CODEC_PLAYBACK) {
		speaker_off();
		f_close(&codec.fp);
	}

	else if (codec.status == CODEC_CAPTURE) {
		vs_adpcm_rec_stop();

		mic_mute();

		/* update riff header */
		f_lseek(&codec.fp, 0);
		capture_write_header(&codec.fp, codec.count);
		f_close(&codec.fp);
	}

	/* Update status flag*/
	codec.status = CODEC_IDLE;
}

void codec_process_task (void)
{
	if (codec.status == CODEC_IDLE)
		return;

	if (codec.status == CODEC_PLAYBACK) {
		process_playback();
	}

	else if (codec.status == CODEC_CAPTURE) {
		process_capture();
	}
}

