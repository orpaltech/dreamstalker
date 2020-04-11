/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2019	ORPAL Technologies, Inc.
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

#ifndef _VS10XX_DEFINED
#define _VS10XX_DEFINED


/* VS10xx Codec definitions */
	/* SCI Commands */
#define	SCI_READ			0x03
#define	SCI_WRITE			0x02

	/* SCI Registers */
#define SCI_REG_MODE		0x00
#define	 SM_DIFF		0			// Differential: 0 - normal in-phase audio, 1 - left channel inverted
#define	 SM_SETTOZERO	1			// Set to zero: 0 - right, 1 - wrong
#define	 SM_RESET		2			// 1 - Soft reset
#define  SM_OUTOFWAV	3			// 1 - Jump out of WAV decoding
#define  SM_PDOWN		4			// 1 - Power down
#define  SM_STREAM		6			// 1 - Stream mode
#define  SM_PLUSV		7			// 1 - MP3+V active
#define  SM_DACT		8			// DCLK active edge: 0 - rising, 1 - falling
#define  SM_SDIORD		9			// 0 - MSb first
#define  SM_SDISHARE	10			// 1 - Share SPI chip select
#define  SM_SDINEW		11			// 1 - VS1002 native SPI modes
#define  SM_ADPCM		12			// 1 - ADPCM recording active
#define  SM_ADPCM_HP	13			// 1 - ADPCM high-pass filter active

#define SCI_REG_STATUS		0x01
#define SCI_REG_BASS		0x02
#define SCI_REG_CLOCKF		0x03
#define SCI_REG_DECODETIME	0x04
#define SCI_REG_AUDATA		0x05
#define SCI_REG_WRAM		0x06
#define SCI_REG_WRAMADDR	0x07
#define SCI_REG_HDAT0		0x08
#define SCI_REG_HDAT1		0x09
#define SCI_REG_AIADDR		0x0A
#define SCI_REG_VOL			0x0B
#define SCI_REG_AICTRL0		0x0C
#define SCI_REG_AICTRL1		0x0D
#define SCI_REG_AICTRL2		0x0E
#define SCI_REG_AICTRL3		0x0F

#define SDI_BLOCK_LEN		32	// amount to write to SDI device after DREQ goes high

#define VS_EOF				0x80

#ifdef __cplusplus
extern "C" {
#endif

typedef enum e_vs_hw_spec {
	VS_HWS_UNKNOWN	= 0,
	VS_HWS_1002		= 2,
	VS_HWS_1003		= 3,
	VS_HWS_1053		= 53,
} vs_hw_spec_t;


typedef struct s_vs_sci_instr vs_sci_instr_t;
typedef struct s_vs_patch vs_patch_t;

typedef int (*pfnvs_patch_init)(vs_patch_t *);
typedef void (*pfnvs_patch_cleanup)(vs_patch_t *);
typedef int (*pfnvs_patch_get_next_instr)(vs_patch_t *, vs_sci_instr_t *);

struct s_vs_sci_instr {
	uint8_t		reg;
	uint16_t 	data;
};

struct s_vs_patch {
	void		*user_data;
	pfnvs_patch_init init;
	pfnvs_patch_cleanup cleanup;
	pfnvs_patch_get_next_instr get_next_instr;
};

typedef struct s_vs_patch_act {
	vs_sci_instr_t *instr;
	uint8_t num_instr;
	int8_t index;
} vs_patch_act_t;

typedef struct s_vs_patch_file {
	vs_patch_act_t act;
	char line[20];
	uint8_t num_instr;
	uint8_t flags;
} vs_patch_file_t;

int vs_patch_apply (vs_patch_t *patch);
int vs_patch_apply_from_file (const char *file_name, pfnvs_patch_init init_func);

int vs_init (void);

vs_hw_spec_t vs_get_hwspec (void);

void vs_hw_reset (void);

void vs_suspend (void);
void vs_resume (void);
void vs_power_down (void);

void vs_sw_reset (uint16_t mask_add, uint16_t mask_remove);

void vs_sci_select (void);
void vs_sci_unsel (void);

void vs_sdi_select (void);
void vs_sdi_unsel (void);

uint16_t vs_sci_read (uint8_t reg);
uint16_t vs_sci_read2 (uint8_t reg);
void vs_sci_write (uint8_t reg, uint16_t data);
int vs_sdi_write (const uint8_t *data, uint16_t len);

void vs_set_clockf (uint32_t xtal_freq, int clock_doubler) ;
void vs_set_volume (float left_db, float right_db);

int vs_adpcm_rec_start (int highpass_filter);
void vs_adpcm_rec_stop (void);


#ifdef __cplusplus
}
#endif

#endif // _VS10XX_DEFINED
