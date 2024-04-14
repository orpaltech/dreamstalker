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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <avr/io.h>

#include "core/spi_avr.h"
#include "core/dbg_avr.h"
#include "fatfs/ff.h"
#include "shared_file.h"

#include "vs10xx_mcu.h"
#include "vs1002.h"
#include "vs1003.h"
#include "vs1053.h"


/*-----------------------------------------------------------------------*/

/* Hardware specification of the device is use */
static vs_hw_spec_t	vs_hws	= VS_HWS_UNKNOWN;

/*-----------------------------------------------------------------------*/


/*-----------------------------------------------------------------------*\
 * Patch ROM Functions
\*-----------------------------------------------------------------------*/
vs_patch_rom_t *vs_patch_rom (void)
{
	switch (vs_hw_spec()) {
	case VS_HWS_1002:
		return vs1002_patch_rom ();

	case VS_HWS_1003:
		return vs1003_patch_rom ();

	case VS_HWS_1053:
		return vs1053_patch_rom ();

	default:
		break;
	}

	return NULL;
}

vs_patch_data_t *vs_patch_rom_get_data(uint8_t pos)
{
	uint8_t i;
	uint8_t *buff;
	vs_patch_rom_t *rom = vs_patch_rom ();
	int patch_count = pgm_read_word_far(&rom->patch_count);
	int instr_count;

	if (pos > patch_count)
		return NULL;

	buff = (uint8_t *)rom->patch_data;

	for (i=0; i< pos; i++) {
		instr_count = pgm_read_word_far(&((vs_patch_data_t *)buff)->count);
		buff += (sizeof(vs_patch_data_t) + (instr_count-1) * sizeof(vs_sci_instr_t));
	}
	return (vs_patch_data_t *)buff;
}

/*-----------------------------------------------------------------------*/
/* Initialization and Control Functions									 */
/*-----------------------------------------------------------------------*/

void vs_wait_for_dreq (void)
{
	loop_until_bit_is_set(PINS_DREQ, BIT_DREQ);
}

bool vs_is_dreq (void)
{
	return bit_is_set(PINS_DREQ, BIT_DREQ);
}

static
void vs_read_hw_spec (void)
{
	uint16_t val;
	
	val = vs_sci_read(SCI_REG_STATUS);

	switch (SS_VER(val)) {
	case 4:
		vs_hws = VS_HWS_1053;
		break;

	case 3:
		vs_hws = VS_HWS_1003;
		break;

	case 2:
		vs_hws = VS_HWS_1002;
		break;

	default:
		vs_hws = VS_HWS_UNKNOWN;
		break;
	}
}

bool vs_init ( void )
{
	VS_DD_SETUP ();		/* Setup MCU pins */

	spi_enable ();		/* Enable SPI controller in mode-0 */

	vs_sci_unsel ();	/* Deselect data & command SPI devices */
	vs_sdi_unsel ();

	vs_hw_reset ();

	vs_read_hw_spec ();

	if ( vs_hw_spec () == VS_HWS_UNKNOWN )
		return false;

	switch ( vs_hw_spec () ) {
	case VS_HWS_1002:
		vs1002_init ();
		break;

	case VS_HWS_1003:
		vs1003_init ();
		break;

	case VS_HWS_1053:
		vs1053_init ();
		break;

	default:
		break;
	}

	vs_suspend();

	return true;
}

vs_hw_spec_t vs_hw_spec ( void )
{
	return vs_hws;
}

bool vs_process_patches ( void )
{
	vs_patch_rom_t *rom = vs_patch_rom ();
	bool res = true;

	/* TODO: Use revision until checksum is not implemented */
	res = ( pgm_read_word_far ( &rom->revision ) == VS_PATCH_ROM_REVISION );
	if (!res)
		return false;

	switch (vs_hw_spec()) {
	case VS_HWS_1002:
		res = vs1002_process_patches ();
		break;

	case VS_HWS_1003:
		res = vs1003_process_patches ();
		break;

	case VS_HWS_1053:
		res = vs1053_process_patches ();
		break;

	default:
		break;
	}

	return res;
}

bool vs_patch_apply ( vs_patch_t *patch, vs_patch_state_t *state )
{
	vs_sci_instr_t instr, *pinstr;
	vs_patch_nir_t nir;
	uint8_t index = 0;

	while ( ( nir = (*patch->next_instr) ( patch, &instr ) ) != VS_PNIR_EOP ) {
		if ( nir == VS_PNIR_ERR )	/* error */
			return false;

		if ( nir == VS_PNIR_OK )
			vs_sci_write( instr.reg, instr.data );
	}

	/*
	 * End of patch.
	 * Check if the patch requires activations steps
	 */
	while ( patch->act.num_instr && index < patch->act.num_instr ) {
		/* Send next activation command */
		pinstr = &patch->act.instr[ index++ ];
		vs_sci_write( pinstr->reg, pinstr->data );
	}

	return true;
}

static
bool vs_patch_file_parse_line( const char *line_text, vs_sci_instr_t *instr )
{
	int op, reg, val;

	/* parse the text line */
	if ( sscanf ( line_text, "%*s %x %x %x", &op, &reg, &val ) == 3 ) {
		if ( op == 2 ) {
			instr->reg = (uint8_t) reg;
			instr->data = (uint16_t) val;
			return true;
		}
	}

	return false;
}

static vs_patch_nir_t
vs_patch_file_next_instr( vs_patch_t *patch, vs_sci_instr_t *instr )
{
	vs_patch_file_t *pfd = patch->user_data;
	char line[100];

	if ( ( pfd->flags & VS_EOF ) == 0 )
	{
		if ( f_gets ( line, sizeof( line ), pfd->fp ))
		{
			if ( strchr ( line, '#' ))
				return VS_PNIR_SKIP;	/* comment line */

			if (! vs_patch_file_parse_line ( line, instr ))
				return VS_PNIR_ERR;
		}
		else if ( f_eof( pfd->fp ))
			pfd->flags |= VS_EOF;
		else
			return VS_PNIR_ERR; /* error occurred */
	}

	if ( pfd->flags & VS_EOF )
		return VS_PNIR_EOP;

	return VS_PNIR_OK;
}

bool vs_patch_process_file ( const char *file_name, 
							pvs_patch_state_t state,
							pfnvs_patch_handler handler_func,
							pfnvs_patch_init init_func,
							pfnvs_patch_end end_func )
{
	vs_patch_t		patch;
	vs_patch_file_t	patch_file;
	bool res = true;

	patch.next_instr = vs_patch_file_next_instr;
	patch.user_data = &patch_file;

	memset ( &patch.act, 0, sizeof( patch.act ));
	memset ( &patch_file, 0, sizeof( patch_file ));
	patch_file.fp = &shared_fp;

	/* open file */
	if ( f_open ( patch_file.fp, 
			file_name, FA_READ ) != FR_OK)
		return false;

	if ( init_func ) {
		res = (*init_func) ( &patch, state );
	}

	if ( res ) {
		res = (*handler_func) ( &patch, state );
	}

	if ( end_func ) {
		(*end_func) ( &patch, state );
	}

	f_close ( patch_file.fp );

	return res;
}

static vs_patch_nir_t
vs_patch_rom_data_next_instr( pvs_patch_t patch, pvs_sci_instr_t instr )
{
	vs_patch_data_t *data = patch->user_data;
	vs_sci_instr_t *src;
	uint16_t count = pgm_read_word_far ( &data->count );

	if ( patch->user_val >= count )
		return VS_PNIR_EOP;

	src = &data->instr[ patch->user_val++ ];

	instr->reg = pgm_read_byte_far ( &src->reg );
	instr->data = pgm_read_word_far ( &src->data );

	return VS_PNIR_OK;
}

bool vs_patch_process_rom ( uint8_t patch_position, 
							pvs_patch_state_t state,
							pfnvs_patch_handler handler_func,
							pfnvs_patch_init init_func, 
							pfnvs_patch_end end_func )
{
	vs_patch_t	patch;
	bool res = true;

	patch.next_instr = vs_patch_rom_data_next_instr;
	patch.user_data = vs_patch_rom_get_data ( patch_position );
	patch.user_val = 0;

	memset ( &patch.act, 0, sizeof( patch.act ));

	if (! patch.user_data )
		return false;

	if ( init_func ) {
		res = (*init_func) ( &patch, state );
	}

	if ( res ) {
		res = (*handler_func) ( &patch, state );
	}

	if ( end_func ) {
		(*end_func) ( &patch, state );
	}
	return res;
}

void vs_hw_reset ( void )
{
	XRST_LO (); 	/* force reset line low*/
	_delay_ms( 2 );
	XRST_HI ();		/* restore reset line*/
	_delay_ms( 10 );

	vs_sci_sel ();
	/* clock the chip a little bit*/
	for ( int i=0; i < 10; i++ )
		spi_xchg( 0xFF );
	vs_sci_unsel ();
	_delay_ms ( 10 );
}

void vs_suspend ( void )
{
	switch ( vs_hw_spec ()) {
	case VS_HWS_1002:
		vs1002_suspend ();
		break;

	case VS_HWS_1003:
		vs1003_suspend ();
		break;

	case VS_HWS_1053:
		vs1053_suspend ();
		break;

	default:
		break;
	}
}

void vs_resume ( void )
{
	switch ( vs_hw_spec ()) {
	case VS_HWS_1002:
		vs1002_resume ();
		break;

	case VS_HWS_1003:
		vs1003_resume ();
		break;

	case VS_HWS_1053:
		vs1053_resume ();
		break;

	default:
		break;
	}
}

void vs_sw_reset ( uint16_t mask_add, uint16_t mask_remove )
{
	uint16_t val = vs_sci_read( SCI_REG_MODE );
	val &= ~mask_remove;
	val |= mask_add;
	vs_sci_write( SCI_REG_MODE, ( val | _BV(SM_SDINEW) | _BV(SM_RESET )));

	vs_wait_for_dreq ();
}

/*-----------------------------------------------------------------------*/
/* SPI Bus Control Functions	   										 */
/*-----------------------------------------------------------------------*/

void vs_sci_sel ( void )
{
	XCS_LO ();
}
void vs_sci_unsel ( void )
{
	XCS_HI ();
}

void vs_sdi_sel ( void )
{
	XDCS_LO ();
}
void vs_sdi_unsel ( void )
{
	XDCS_HI ();
}

void vs_analog_power_down ( void )
{
	/* Set 0xFFFF to SCI_VOL to power down the analog part */
	vs_sci_write ( SCI_REG_VOL, 0xFFFFU );
}

void vs_set_volume ( uint8_t left_db, uint8_t right_db )
{
	if ( left_db > VS_VOL_MIN )		left_db = VS_VOL_MIN;
	if ( right_db > VS_VOL_MIN )	right_db = VS_VOL_MIN;

	// For each channel, a value in the range of 0 .. 255
	// may be defined to set its attenuation from the maximum volume level (in 0.5 dB steps).
	uint16_t val = left_db;
	val = ( val << 8 ) | right_db;

	vs_sci_write( SCI_REG_VOL, val );
}

/*-----------------------------------------------------------------------*/
/* SCI Control Functions   												 */
/*-----------------------------------------------------------------------*/

uint16_t vs_sci_read ( uint8_t reg )
{
	vs_wait_for_dreq ();

	spi_set_clk( clock_div_4 );	/* SPI bus clock to 2MHz*/

	vs_sci_sel ();		/* First, select SCI device */

	/* Send 2 bytes of the command */
	spi_xchg ( SCI_READ );
	spi_xchg ( reg );

	/* Read 2 bytes of the register */
	uint16_t val = ( spi_xchg ( 0xFF ) << 8 );
	val |= spi_xchg ( 0xFF );

    vs_sci_unsel ();	/* Deselect SCI */

    return val;
}

void vs_sci_write ( uint8_t reg, uint16_t data )
{
	vs_wait_for_dreq ();

	spi_set_clk ( clock_div_4 );	/* SPI bus clock to 2MHz*/

	vs_sci_sel ();		/* Select SCI device */

	/* Write 2 bytes of the command */
	spi_xchg ( SCI_WRITE );
	spi_xchg ( reg );

	/* Write 2 bytes of the register value */
	spi_xchg ( (uint8_t)( data >> 8 ));
	spi_xchg ( (uint8_t) data );

	vs_sci_unsel ();	/* Deselect SCI */
}

void vs_sci_set (uint8_t reg, uint16_t flags)
{
	uint16_t val;

	val = vs_sci_read ( reg );
	vs_sci_write ( reg, val | flags );
}

bool vs_sci_is_set ( uint8_t reg, uint16_t flags )
{
	uint16_t val;

	val = vs_sci_read( reg );
	return ( val & flags ) == flags;
}

void vs_sci_unset ( uint8_t reg, uint16_t flags )
{
	uint16_t val;

	val = vs_sci_read( reg );
	vs_sci_write ( reg, val & ~flags );
}

/*-----------------------------------------------------------------------*/
/* SDI Functions   												 		 */
/*-----------------------------------------------------------------------*/

void vs_sdi_write ( const uint8_t *block )
{
	spi_set_clk ( clock_div_2 );	/* SPI bus clock to 4MHz*/

	vs_wait_for_dreq ();

	vs_sdi_sel ();	/* Select SDI device */

	spi_xmit_multi ( block, SDI_BLOCK_LEN );

	vs_sdi_unsel ();
}

bool vs_playback_start (void)
{
	bool res = false;

	vs_resume ();	/* Exit power-saving mode */

	switch ( vs_hw_spec ()) {
	case VS_HWS_1002:
	case VS_HWS_1003:
		res = vs1002_playback_start ();
		break;

	case VS_HWS_1053:
		res = vs1053_playback_start ();
		break;

	default:
		break;
	}

	if ( !res )	/* Something went wrong */
		vs_suspend ();

	//vs_sci_set(SCI_REG_MODE, _BV(SM_DIFF));

	return res;
}

void vs_playback_stop ( void )
{
	switch ( vs_hw_spec ()) {
	case VS_HWS_1002:
	case VS_HWS_1003:
		vs1002_playback_stop ();
		break;

	case VS_HWS_1053:
		vs1053_playback_stop ();
		break;

	default:
		break;
	}

	//vs_sci_unset(SCI_REG_MODE, _BV(SM_DIFF));

	vs_suspend ();	/* Return to power-saving mode */
}

/*-----------------------------------------------------------------------*/
/* ADPCM Recording												 		 */
/*-----------------------------------------------------------------------*/

bool vs_adpcm_rec_start( uint16_t sample_rate, uint8_t gain, bool highpass_filter )
{
	bool res = false;

	vs_resume ();	/* Exit power-saving mode */

	switch ( vs_hw_spec ()) {
	case VS_HWS_1002:
		res = vs1002_adpcm_rec_start ( sample_rate, gain, highpass_filter );
		break;

	case VS_HWS_1003:
		res = vs1003_adpcm_rec_start ( sample_rate, gain, highpass_filter );
		break;

	case VS_HWS_1053:
		res = vs1053_adpcm_rec_start ( sample_rate, gain );
		break;

	default:
		break;
	}

	if ( !res )	/* Something went wrong */
		vs_suspend ();

	return res;
}

void vs_adpcm_rec_stop (void)
{
	switch ( vs_hw_spec ()) {
	case VS_HWS_1002:
		vs1002_adpcm_rec_stop ();
		break;

	case VS_HWS_1003:
		vs1003_adpcm_rec_stop ();
		break;

	case VS_HWS_1053:
		vs1053_adpcm_rec_stop ();
		break;

	default:
		return;
	}

	vs_suspend ();	/* Return to power-saving mode */
}

bool vs_adpcm_read_block( uint8_t *buffer )
{
	uint16_t fill, w;
	uint16_t count = ADPCM_BLOCK_ALIGN / 2;
	uint16_t pos = 0;

	/* Check for buffer fill to be good */
	fill = vs_sci_read ( SCI_REG_RECFILL );

	if ( fill >= 896 ) {
		/* To avoid buffer aliasing */
		return false;
	}

	if ( fill < count ) {
		/* No enough data in the buffer */
		return false;
	}

	/* Read exactly one block */
	while ( count ) {
		w = vs_sci_read ( SCI_REG_RECDATA );
		buffer[ pos++ ] = ( w >> 8 );
		buffer[ pos++ ] = ( w & 0xff );
		count--;
	}

	return true;
}
