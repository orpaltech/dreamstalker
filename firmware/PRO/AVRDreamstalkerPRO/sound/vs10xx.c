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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/power.h>

#include "../core/spi_avr.h"
#include "../oddebug.h"
#include "../fatfs/ff.h"
#include "../shared_file.h"

#include "vs10xx_mcu.h"
#include "vs1002.h"
#include "vs1003.h"
#include "vs1053.h"


/* Avoid using stack because we execute only 1 patch at a time */
static vs_patch_t		vs_patch;
static vs_patch_file_t	vs_patch_file;

/* Hardware specification of the device is use */
static vs_hw_spec_t	vs_hws	= VS_HWS_UNKNOWN;

/*-----------------------------------------------------------------------*/
/* Initialization and Control Functions									 */
/*-----------------------------------------------------------------------*/

static
void vs_wait_for_dreq (void)
{
	loop_until_bit_is_set(PINS_DREQ, BIT_DREQ);
}

static
void vs_read_hwspec (void)
{
	uint16_t stat;

	stat = vs_sci_read(SCI_REG_STATUS);

	if ((stat & 0x40) == 0x40)
		vs_hws = VS_HWS_1053;

	else if ((stat & 0x30) == 0x30)
		vs_hws = VS_HWS_1003;

	else if ((stat & 0x20) == 0x20)
		vs_hws = VS_HWS_1002;

	else
		vs_hws = VS_HWS_UNKNOWN;
}

int vs_init (void)
{
	VS_DD_SETUP();

	spi_enable();		/* Enable SPI controller in mode-0 */

	vs_sci_unsel();		/* deselect both data & command SPI devices */
	vs_sdi_unsel();

	vs_hw_reset();

	vs_read_hwspec();
	if (vs_get_hwspec()==VS_HWS_UNKNOWN)
		return 0;

	/*
	 * These two need to be set after hardware reset
	 */
	vs_set_clockf(VS_XTAL_FREQ, VS_USE_CLK_DOUBLER);
	vs_set_volume(5, 5);		/* volume for 2 channels, in -dB */

	return 1;
}

vs_hw_spec_t vs_get_hwspec (void) { return vs_hws; }

int vs_patch_apply (vs_patch_t *patch)
{
	vs_sci_instr_t instr;
	int ret;
	if(patch->init) {
		ret=(*patch->init)(patch);
		if (!ret)
			return 0;
	}

	while((ret = (*patch->get_next_instr)(patch, &instr)) != 0) {
		if(ret==2)	// end of patch
			break;
		vs_sci_write(instr.reg, instr.data);
	}

	if(patch->cleanup)
		(*patch->cleanup)(patch);

	return ret ? 1 : 0;
}

static
int vs_patch_file_parse_line(const char *instr_text, vs_sci_instr_t *instr)
{
	int op, reg, val;

	// parse the text line
	if (sscanf(instr_text, "%*s %x %x %x", &op, &reg, &val) == 3) {
		if(op==2) {
			instr->reg = (uint8_t)reg;
			instr->data = (uint16_t)val;
			return 1;
		}
	}

	return 0;
}

static
int vs_patch_file_next_instr(vs_patch_t *patch, vs_sci_instr_t *instr)
{
	vs_patch_file_t *pfd = patch->user_data;

	if ((pfd->flags & VS_EOF) == 0)
	{
		if (f_gets(pfd->line, sizeof(pfd->line), &shared_fp))
		{
			if(strchr(pfd->line, '#'))
				return 1;	/* comment line */
			if (vs_patch_file_parse_line (pfd->line, instr)==0)
				return 0;
			pfd->num_instr++;
/*			// check if lines have been read
			if(pfd->num_instr == 1333) {
				PORTE ^= (1<<PE3);
			}
*/
		}
		else if (f_eof(&shared_fp))
			pfd->flags |= VS_EOF;
		else
			return 0; // error occurred
	}

	if (pfd->flags & VS_EOF) {
		if(pfd->act.num_instr==0 || pfd->act.index==pfd->act.num_instr)
			return 2;

		// send next activation command
		memcpy(instr, &pfd->act.instr[pfd->act.index++], sizeof(*instr));
	}

	return 1;
}

static
void vs_patch_file_close(vs_patch_t *patch)
{
	f_close(&shared_fp);
}

int vs_patch_apply_from_file (const char *file_name,
							pfnvs_patch_init init_func)
{
	if (init_func)
		vs_patch.init = init_func;
	else vs_patch.init = 0;
	vs_patch.get_next_instr = vs_patch_file_next_instr;
	vs_patch.cleanup = vs_patch_file_close;
	vs_patch.user_data = &vs_patch_file;
	memset(&vs_patch_file, 0, sizeof(vs_patch_file));

	if (f_open(&shared_fp, file_name, FA_READ) != FR_OK)	/* open file */
		return 0;

	return vs_patch_apply(&vs_patch);
}

void vs_hw_reset (void)
{
	XRST_LOW(); 	// force reset line low
	_delay_ms(2);
	XRST_HIGH();	// restore reset line
	_delay_ms(10);

	vs_sci_select();
	//clock the chip a bit
	for(int i=0; i<10; i++)
		spi_xchg(0xFF);
	vs_sci_unsel();
	_delay_ms(10);
}

void vs_suspend (void)
{
	switch (vs_get_hwspec()) {
	case VS_HWS_1002:
		vs1002_suspend ();
		break;

	case VS_HWS_1003:
	case VS_HWS_1053:
		vs1003_suspend ();
		break;

	default:
		break;
	}
}

void vs_resume (void)
{
	switch (vs_get_hwspec()) {
	case VS_HWS_1002:
		vs1002_resume ();
		break;

	case VS_HWS_1003:
	case VS_HWS_1053:
		vs1003_resume ();
		break;

	default:
		break;
	}
}

void vs_power_down(void)
{
	// TODO
}

void vs_sw_reset (uint16_t mask_add, uint16_t mask_remove)
{
	uint16_t val;

	val = vs_sci_read(SCI_REG_MODE);
	val &= ~mask_remove;
	val |= (mask_add | _BV(SM_RESET));
	vs_sci_write(SCI_REG_MODE, val);

	_delay_ms(10);
}


/*-----------------------------------------------------------------------*/
/* SPI Bus Control Functions	   										 */
/*-----------------------------------------------------------------------*/

void vs_sci_select (void) {	XCS_LOW(); }
void vs_sci_unsel (void) { XCS_HIGH(); }

void vs_sdi_select (void) { XDCS_LOW(); }
void vs_sdi_unsel (void) { XDCS_HIGH(); }

void vs_set_clockf (uint32_t xtal_freq, int clock_doubler)
{
	switch (vs_get_hwspec()) {
	case VS_HWS_1002:
		vs1002_set_clockf (xtal_freq, clock_doubler);
		break;

	case VS_HWS_1003:
	case VS_HWS_1053:
		vs1003_set_clockf (xtal_freq, clock_doubler);
		break;

	default:
		break;
	}
}

void vs_set_volume (float left_db, float right_db)
{
	uint16_t val, left;
	uint8_t right;

	// For each channel, a value in the range of 0 .. 255
	// may be defined to set its attenuation from the maximum volume level (in 0.5 dB steps).
	left = (uint16_t)(left_db / 0.5f);
	right = (uint8_t)(right_db / 0.5f);

	val = ((left << 8) | (right));
	vs_sci_write(SCI_REG_VOL, val);
	_delay_ms(2);
}

/*-----------------------------------------------------------------------*/
/* SCI Control Functions   												 */
/*-----------------------------------------------------------------------*/

uint16_t vs_sci_read (uint8_t reg)
{
	uint16_t val;
	clock_div_t div;

	vs_wait_for_dreq();

	div = spi_set_clk(clock_div_8);		/* SPI bus clock to 1MHz*/

	vs_sci_select();					/* First, select SCI device */

	/* Send 2 bytes of the command */
	spi_xchg(SCI_READ);
	spi_xchg(reg);

	/* Read 2 bytes of the register */
	val = (spi_xchg(0xFF) << 8);
	val |= spi_xchg(0xFF);

    vs_sci_unsel();	/* Deselect SCI */
    spi_set_clk(div);
    return val;
}

void vs_sci_write (uint8_t reg, uint16_t data)
{
	clock_div_t div;

	vs_wait_for_dreq();

	div = spi_set_clk(clock_div_4);	/* SPI bus clock to 2MHz*/

	vs_sci_select();				/* First, select SCI device */

	/* Write 2 bytes of the command */
	spi_xchg(SCI_WRITE);
	spi_xchg(reg);

	/* Write 2 bytes of the register value */
	spi_xchg((uint8_t)(data >> 8));
	spi_xchg((uint8_t)data);

	vs_sci_unsel();	/* Deselect SCI */
	spi_set_clk(div);
}

/*-----------------------------------------------------------------------*/
/* SDI Functions   												 		 */
/*-----------------------------------------------------------------------*/

int vs_sdi_write (const uint8_t *data, uint16_t len)
{
	int	cnt;
	clock_div_t	div;
	if(len==0)	return 0;

	div = spi_set_clk(clock_div_2);	/* SPI bus clock to 4MHz*/

	vs_sdi_select();				/* First, select SDI device */

	while(len > 0) {
		vs_wait_for_dreq();

		if(len>SDI_BLOCK_LEN)
			cnt=SDI_BLOCK_LEN;
		else
			cnt=len;

		spi_xmit_multi(data, cnt);

		data += cnt;
		len -= cnt;
	}

	vs_sdi_unsel();
	spi_set_clk(div);
	return len;
}

/*-----------------------------------------------------------------------*/
/* ADPCM Recording												 		 */
/*-----------------------------------------------------------------------*/

int vs_adpcm_rec_start(int highpass_filter)
{
	switch (vs_get_hwspec()) {
	case VS_HWS_1002:
		vs1002_adpcm_rec_start(highpass_filter);
		break;
	case VS_HWS_1003:
		vs1003_adpcm_rec_start(highpass_filter);
		break;
	case VS_HWS_1053:
		vs1053_adpcm_rec_start();
		break;
	default:
		return 0;
	}

	return 1;
}

void vs_adpcm_rec_stop (void)
{
	switch (vs_get_hwspec()) {
	case VS_HWS_1002:
		vs1002_adpcm_rec_stop();
		break;
	case VS_HWS_1003:
		vs1003_adpcm_rec_stop();
		break;
	case VS_HWS_1053:
		vs1053_adpcm_rec_stop();
		break;
	default:
		return;
	}
}
