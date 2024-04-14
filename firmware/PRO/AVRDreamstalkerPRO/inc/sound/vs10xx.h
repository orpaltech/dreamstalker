/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2023	ORPAL Technologies, Inc.
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

#include <stdint.h>
#include <stdbool.h>

#include "fatfs/ff.h"

/*-----------------------------------------------------------------------*/

/* VS10xx Codec definitions */
	/* SCI Commands */
#define	SCI_READ			0x03
#define	SCI_WRITE			0x02

	/* SCI Registers */
#define SCI_REG_MODE		0x00
#define	 SM_DIFF		0			// Differential: 0 - normal in-phase audio, 1 - left channel inverted
#define	 SM_SETTOZERO	1			// Set to zero: 0 - right, 1 - wrong
#define	 SM_RESET		2			// Soft reset: 1 - yes
/* NOTE: Bit 3 has device-specific meaning. Please, look into an appropriate device header file. */
/* NOTE: Bit 4 has device-specific meaning. Please, look into an appropriate device header file. */
#define  SM_TESTS 		5			// Allow SDI tests: 1 - allowed
#define  SM_STREAM		6			// Stream mode: 1 - yes
/* NOTE: Bit 7 has device-specific meaning. Please, look into an appropriate device header file. */
#define  SM_DACT		8			// DCLK active edge: 0 - rising, 1 - falling
#define  SM_SDIORD		9			// SDI bit order: 0 - MSb first
#define  SM_SDISHARE	10			// Share SPI chip select: 1 - yes
#define  SM_SDINEW		11			// VS1002 native SPI modes: 1 - yes
#define  SM_ADPCM		12			// ADPCM recording: 1 - active, 0 - disabled
/* NOTE: Bit 13 has device-specific meaning. Please, look into an appropriate device header file. */


#define SCI_REG_STATUS		0x01
#define	 SS_APDOWN2		3
#define	 SS_VER(reg)	(((reg) >> 4) & 0xF)

#define SCI_REG_BASS		0x02
#define SCI_REG_CLOCKF		0x03
#define SCI_REG_DECODETIME	0x04
#define SCI_REG_AUDATA		0x05
#define SCI_REG_WRAM		0x06
#define SCI_REG_WRAMADDR	0x07
#define SCI_REG_RECDATA		0x08
#define SCI_REG_RECFILL		0x09
#define SCI_REG_AIADDR		0x0A
#define SCI_REG_VOL			0x0B
#define SCI_REG_AICTRL0		0x0C
#define SCI_REG_AICTRL1		0x0D
#define SCI_REG_AICTRL2		0x0E
#define SCI_REG_AICTRL3		0x0F

#define SDI_BLOCK_LEN		32UL	/* amount to write to SDI device after DREQ goes high*/

#define VS_EOF				0x80

#define VS_VOL_MIN	(0xFFU-1)
#define VS_VOL_MAX	0U

#define VS_VOL_DEFAULT	0x36U

#define AICTRL1_GAIN(gain)	((1024UL * (gain)) & 0xFFFF)
#define AICTRL1_AGC			0

/*-----------------------------------------------------------------------*/

#ifdef __cplusplus
extern "C" {
#endif

typedef enum e_vs_hw_spec {
	VS_HWS_UNKNOWN	= 0,
	VS_HWS_1002		= 2,
	VS_HWS_1003		= 3,
	VS_HWS_1053		= 53,
} vs_hw_spec_t;


typedef struct s_vs_sci_instr vs_sci_instr_t, *pvs_sci_instr_t;
typedef struct s_vs_patch vs_patch_t, *pvs_patch_t;
typedef struct s_vs_patch_state vs_patch_state_t, *pvs_patch_state_t;

typedef bool (*pfnvs_patch_init)(pvs_patch_t, pvs_patch_state_t);
typedef bool (*pfnvs_patch_handler)(pvs_patch_t, pvs_patch_state_t);
typedef void (*pfnvs_patch_end)(pvs_patch_t, pvs_patch_state_t);
typedef enum e_vs_patch_nir {
	VS_PNIR_ERR = 0,
	VS_PNIR_OK = 1,
	VS_PNIR_SKIP = 2,
	VS_PNIR_EOP = 3,
} vs_patch_nir_t;
typedef vs_patch_nir_t (*pfnvs_patch_next_instr)(pvs_patch_t, pvs_sci_instr_t);

struct s_vs_sci_instr {
	uint8_t		reg;
	uint16_t 	data;
};

/*-----------------------------------------------------------------------*/

#define VS_PATCH_ROM_REVISION	0x8881U

typedef struct s_vs_patch_data {
	uint16_t count;
	vs_sci_instr_t instr[1];
} vs_patch_data_t, *pvs_patch_data_t;

typedef struct s_vs_patch_rom {
	uint16_t revision;
	uint16_t patch_count;
	vs_patch_data_t	patch_data[1];
} vs_patch_rom_t, *pvs_patch_rom_t;


/*-----------------------------------------------------------------------*/

typedef struct s_vs_patch_activation {
	vs_sci_instr_t *instr;
	uint8_t	num_instr;
} vs_patch_activation_t, *pvs_patch_activation_t;

struct s_vs_patch {
	void		*user_data;
	uint16_t	user_val;
	pfnvs_patch_next_instr next_instr;
	vs_patch_activation_t act;
};

typedef struct s_vs_patch_file {
	uint8_t flags;
	FIL *fp;
} vs_patch_file_t, *pvs_patch_file_t;


/*-----------------------------------------------------------------------*/

pvs_patch_rom_t vs_patch_rom (void);
uint32_t vs_patch_rom_size (void);

pvs_patch_data_t vs_patch_rom_get_data(uint8_t position);

bool vs_process_patches (void);

bool vs_patch_apply (pvs_patch_t patch, pvs_patch_state_t state);

bool vs_patch_process_file (const char *patch_file, 
							pvs_patch_state_t state,
							pfnvs_patch_handler handler_func,
							pfnvs_patch_init init_func, 
							pfnvs_patch_end end_func);

bool vs_patch_process_rom (uint8_t patch_position, 
							pvs_patch_state_t state,
							pfnvs_patch_handler handler_func,
							pfnvs_patch_init init_func, 
							pfnvs_patch_end end_func);

bool vs_init (void);

vs_hw_spec_t vs_hw_spec (void);

void vs_suspend (void);
void vs_resume (void);

void vs_hw_reset (void);
void vs_sw_reset (uint16_t mask_add, uint16_t mask_remove);

void vs_sci_sel (void);
void vs_sci_unsel (void);

void vs_sdi_sel (void);
void vs_sdi_unsel (void);

uint16_t vs_sci_read (uint8_t reg);
void vs_sci_write (uint8_t reg, uint16_t data);
void vs_sdi_write (const uint8_t *block);
void vs_sci_set (uint8_t reg, uint16_t flags);
void vs_sci_unset (uint8_t reg, uint16_t flags);
bool vs_sci_is_set (uint8_t reg, uint16_t flags);

void vs_analog_power_down (void);

/* Sets attenuation, in -dB,
 * 0 - maximum volume,
 * 254 - minimum volume,
 * each step is 0.5dB 
 */
void vs_set_volume (uint8_t left_db, uint8_t right_db);

bool vs_playback_start (void);
void vs_playback_stop (void);

/*
sample rate = 8000, 16000
gain = 1..64
highpass filter = true/false
*/
bool vs_adpcm_rec_start (uint16_t sample_rate, uint8_t gain, bool highpass_filter);
void vs_adpcm_rec_stop (void);

bool vs_adpcm_read_block(uint8_t *buff);

#ifdef __cplusplus
}
#endif

#endif // _VS10XX_DEFINED
