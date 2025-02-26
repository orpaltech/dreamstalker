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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <util/delay.h>
#include <avr/pgmspace.h>
#include <avr/io.h>

#include <SD.h>
#include <SPI.h>

#include "sound/vs10xx_mcu.h"
#include "sound/vs1002.h"
#include "sound/vs1003.h"
#include "sound/vs1053.h"

using namespace VLSI;

/*-----------------------------------------------------------------------*/
#define VS_PIN_XCS		PIN_PB6		/* SCI select line	*/
#define VS_PIN_XDCS		PIN_PB7		/* SDI select line	*/
#define VS_PIN_XRST		PIN_PE7		/* hardware reset line */
#define VS_PIN_DREQ		PIN_PB4		/* data request line */

#define VS_EOF			0x80

/*-----------------------------------------------------------------------*/

typedef struct s_vs_patch_file {
	uint8_t flags;
	SDFile *fp;
} vs_patch_file_t, *pvs_patch_file_t;


/*-----------------------------------------------------------------------*/
static SPISettings sci_settings, sdi_settings;



/*-----------------------------------------------------------------------*/

bool Vs10xx::init ( void )
{
  /* MCU data direction setup */
  pinMode ( VS_PIN_DREQ, INPUT );
  pinMode ( VS_PIN_XRST, OUTPUT );
  pinMode ( VS_PIN_XCS, OUTPUT );
  pinMode ( VS_PIN_XDCS, OUTPUT );

  SPI.begin();
  
  /* SCI: put SPI-controller in mode-0, bus clock to 2MHz*/
  sci_settings = SPISettings( F_CPU / 4, MSBFIRST, SPI_MODE0 );

  /* SDI: put SPI-controller in mode-0, bus clock to 4MHz*/
  sdi_settings = SPISettings( F_CPU / 2, MSBFIRST, SPI_MODE0 );

  /* Deselect data & command SPI devices */
  sci_unsel ();
  sdi_unsel ();

  hard_reset ();

  if (read_hw_spec () != VS_HW_SPEC)
    return false;

  /* Let derived class do extra initialization */
  vs_init ();

  suspend ();

  return true;
}

uint16_t Vs10xx::sci_read ( uint8_t reg )
{
  wait_for_dreq ();

  SPI.beginTransaction ( sci_settings );

  sci_select ();			/* Select SCI device */

  /* Send 2 bytes of the command */
  SPI.transfer ( SCI_READ );
  SPI.transfer ( reg );
  /* Read the register value - word at once */
  uint16_t val = SPI.transfer16 ( 0xFFFF );

  sci_unsel ();				/* Deselect SCI */
  SPI.endTransaction();

  return val;
}

void Vs10xx::sci_write ( uint8_t reg, uint16_t data )
{
  wait_for_dreq ();

  SPI.beginTransaction ( sci_settings );

  sci_select ();			/* Select SCI device */

  /* Write 2 bytes of the command */
  SPI.transfer ( SCI_WRITE );
  SPI.transfer ( reg );
  /* Write the register value - word at once */
  SPI.transfer16 ( data );

  sci_unsel ();				/* Deselect SCI */
  SPI.endTransaction();
}

void Vs10xx::sci_add ( uint8_t reg, uint16_t flags )
{
	uint16_t val;

	val = sci_read ( reg );
	sci_write ( reg, val | flags );
}

bool Vs10xx::sci_is_set ( uint8_t reg, uint16_t flags )
{
  uint16_t val;

  val = sci_read( reg );
  return ( val & flags ) == flags;
}

void Vs10xx::sci_remove ( uint8_t reg, uint16_t flags )
{
  uint16_t val;

  val = sci_read( reg );
  sci_write ( reg, val & ~flags );
}

void Vs10xx::sdi_write ( const uint8_t *block )
{
  wait_for_dreq ();

  SPI.beginTransaction ( sdi_settings );

  sdi_select ();				/* Select SDI device */

  for( uint8_t i = 0; i < SDI_BLOCK_LEN; i++) 
	  SPI.transfer ( block[i] );

  sdi_unsel ();				/* Deselect SDI */
  SPI.endTransaction ();
}

uint16_t Vs10xx::read_status ( void )
{
  return sci_read ( SCI_REG_STATUS );
}

uint16_t Vs10xx::read_mode ( void )
{
  return sci_read ( SCI_REG_MODE );
}

void Vs10xx::write_mode ( uint16_t mode )
{
	sci_write ( SCI_REG_MODE, mode );
}

uint8_t Vs10xx::read_hw_spec ( void )
{
  uint16_t	val;
  uint8_t	hws;

  val = read_status ();

  switch (SS_VER (val)) {
	case 0x4:
		hws = VS_HWS_1053;
		break;

	case 0x3:
		hws = VS_HWS_1003;
		break;

	case 0x2:
		hws = VS_HWS_1002;
		break;

	default:
		hws = VS_HWS_UNKNOWN;
		break;
  }

  return hws;
}

void Vs10xx::hard_reset ( void )
{
	digitalWrite ( VS_PIN_XRST, LOW ); 		/* force reset line low */
	delay( 10 );
	digitalWrite ( VS_PIN_XRST, HIGH );		/* restore reset line */
	delay( 100 );

	SPI.beginTransaction ( sci_settings );

	sci_select ();

	/* clock the chip a little bit*/
	for( uint8_t i = 0; i < 10; i++ )
		SPI.transfer ( 0xFF );

	sci_unsel ( );
	SPI.endTransaction ( );
}

void Vs10xx::suspend ( void )
{
  vs_suspend ();
}

void Vs10xx::resume ( void )
{
  vs_resume ();
}

void Vs10xx::soft_reset ( uint16_t mask_add, uint16_t mask_remove )
{
  uint16_t val = read_mode ();
  val &= ~mask_remove;
  val |= mask_add;
  write_mode (val | _BV(SM_SDINEW) | _BV(SM_RESET));

  wait_for_dreq ();
}

void Vs10xx::wait_for_dreq ( void )
{
  while ( LOW == digitalRead ( VS_PIN_DREQ ))
    _NOP ();
}

bool Vs10xx::is_dreq ( void )
{
  return ( HIGH == digitalRead ( VS_PIN_DREQ ) );
}

void Vs10xx::analog_pwr_down ( void )
{
	/* Set 0xFFFF to SCI_VOL to power down the analog part
	 */
	sci_write ( SCI_REG_VOL, 0xFFFFU );
}

void Vs10xx::set_volume ( uint8_t left_db, uint8_t right_db )
{
	if ( left_db > VS_VOL_MIN )		left_db = VS_VOL_MIN;
	if ( right_db > VS_VOL_MIN )	right_db = VS_VOL_MIN;

	/* For each channel, a value in the range of 0 .. 255
	 * may be defined to set its attenuation from the max volume level 
	 * (in 0.5 dB steps).
	 */
	uint16_t val = left_db;
	val = ( val << 8 ) | right_db;

	sci_write ( SCI_REG_VOL, val );
}

bool Vs10xx::adpcm_read_block ( uint8_t *buf )
{
	uint16_t fill, w;
	uint16_t count = ADPCM_BLOCK_ALIGN / 2;
	uint16_t pos = 0;

	/* Check for buffer fill to be good */
	fill = sci_read ( SCI_REG_RECFILL );

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
		w = sci_read ( SCI_REG_RECDATA );
		buf[ pos++ ] = ( w >> 8 );
		buf[ pos++ ] = ( w & 0xff );
		count--;
	}

	return true;
}

/*-----------------------------------------------------------------------*\
 * Playback
\*-----------------------------------------------------------------------*/
bool Vs10xx::playback_start (void)
{
  resume ();		/* Exit power-saving mode */

  bool res = vs_playback_start ();
  if ( !res ) {
	/* Something went wrong */
	suspend ();
  }

  return res;
}

void Vs10xx::playback_stop ( void )
{
  vs_playback_stop ();

  suspend ();		/* Return to power-saving mode */
}

void Vs10xx::playback_send_block( const uint8_t *buff )
{
  sdi_write ( buff );
}

/*-----------------------------------------------------------------------*\
 * ADPCM Recording
\*-----------------------------------------------------------------------*/
bool Vs10xx::adpcm_record_start( uint16_t sample_rate, uint8_t gain, bool highpass_filter )
{
  resume ();		/* Exit power-saving mode */

  bool res = vs_adpcm_rec_start ( sample_rate, gain, highpass_filter );
  if ( !res ) {
	/* Something went wrong.
	 * Return to power-saving mode
	 */
	suspend ();
  }

  return res;
}

void Vs10xx::adpcm_record_stop ( void )
{
  vs_adpcm_rec_stop ();

  suspend ();		/* Return to power-saving mode */
}

/*-----------------------------------------------------------------------*\
 *	SPI Bus Control Functions
\*-----------------------------------------------------------------------*/
void Vs10xx::sci_select ( void )
{
  digitalWrite ( VS_PIN_XCS, LOW );
}

void Vs10xx::sci_unsel ( void )
{
  digitalWrite ( VS_PIN_XCS, HIGH );
}

void Vs10xx::sdi_select ( void )
{
  digitalWrite ( VS_PIN_XDCS, LOW );
}

void Vs10xx::sdi_unsel ( void )
{
  digitalWrite ( VS_PIN_XDCS, HIGH );
}

/*-----------------------------------------------------------------------*\
 * Patch ROM Functions
\*-----------------------------------------------------------------------*/
bool Vs10xx::process_patches ( void )
{
  vs_patch_rom_t *rom = vs_patch_rom ();
  bool res = true;

  /* TODO: Use revision until checksum is not implemented */
  res = ( pgm_read_word_far ( &rom->revision ) == VS_PATCH_ROM_REVISION );
  if (!res)
	return false;

  res = vs_process_patches ();
  return res;
}

static vs_patch_data_t *
patch_rom_get_data ( vs_patch_rom_t *rom, uint8_t pos )
{
  int patch_count = pgm_read_word_far ( &rom->patch_count );
  int instr_count;

  if (pos > patch_count)
	return NULL;

  uint8_t *buff = (uint8_t *)rom->patch_data;

  for (uint8_t i=0; i< pos; i++) {
	instr_count = pgm_read_word_far (&((vs_patch_data_t *)buff)->count);
	buff += (sizeof(vs_patch_data_t) + (instr_count-1) * sizeof(vs_sci_instr_t));
  }
  return (vs_patch_data_t *)buff;
}

bool Vs10xx::patch_apply( vs_patch_t *patch, vs_patch_state_t *state )
{
  vs_sci_instr_t instr, *pinstr;
  vs_patch_nir_t nir;
  uint8_t index = 0;

  while ( ( nir = (*patch->next_instr) ( patch, &instr ) ) != VS_PNIR_EOP ) {
	if ( nir == VS_PNIR_ERR )	/* error */
	  return false;

	if ( nir == VS_PNIR_OK )
	  sci_write( instr.reg, instr.data );
  }

  /*
   * End of patch.
   * Check if the patch requires activations steps
   */
  while ( patch->act.num_instr && index < patch->act.num_instr ) {
	/* Send next activation command */
	pinstr = &patch->act.instr[ index++ ];
	sci_write( pinstr->reg, pinstr->data );
  }

  return true;
}

static bool 
patch_file_parse_line( const char *line_text, vs_sci_instr_t *instr )
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
patch_file_next_instr( vs_patch_t *patch, vs_sci_instr_t *instr )
{
  vs_patch_file_t *pfd = (vs_patch_file_t *)patch->user_data;
  String line;

  if (( pfd->flags & VS_EOF ) == 0) {
	line = pfd->fp->readStringUntil( '\n' );
	line.trim( );

	if( line.length( ) != 0 ) {
	  if( line.startsWith( "#" ))
		return VS_PNIR_SKIP;	/* comment line */

	  if (! patch_file_parse_line ( line.c_str(), instr ))
		return VS_PNIR_ERR;
	}
	else if ( pfd->fp->available( ) == 0 )
	  pfd->flags |= VS_EOF;
	else
	  return VS_PNIR_ERR; /* error occurred */
  }

  if ( pfd->flags & VS_EOF )
	return VS_PNIR_EOP;

  return VS_PNIR_OK;
}

bool Vs10xx::patch_process_file ( const char *file_name, 
							pvs_patch_state_t state,
							/*pfnvs_patch_handler handler_func,*/
							pfnvs_patch_init init_func,
							pfnvs_patch_end end_func )
{
  vs_patch_t		patch;
  vs_patch_file_t	patch_file;
  bool res = true;

  patch.next_instr = patch_file_next_instr;
  patch.user_data = &patch_file;

  memset ( &patch.act, 0, sizeof( patch.act ));
  memset ( &patch_file, 0, sizeof( patch_file ));

  /* open file */
  SDFile fp = SD.open (file_name, FILE_READ);
  if (! fp)
	  return false;

  patch_file.fp = &fp;

  if ( init_func ) {
	  res = (*init_func) ( &patch, state );
  }

  if ( res ) {
	  res = patch_apply ( &patch, state );
  }

  if ( end_func ) {
	  (*end_func) ( &patch, state );
  }

  fp.close ();
  return res;
}

static vs_patch_nir_t
patch_rom_data_next_instr( pvs_patch_t patch, pvs_sci_instr_t instr )
{
  vs_patch_data_t *data = (vs_patch_data_t *)patch->user_data;
  vs_sci_instr_t *src;
  uint16_t count = pgm_read_word_far ( &data->count );

  if ( patch->user_val >= count )
	return VS_PNIR_EOP;

  src = &data->instr[ patch->user_val++ ];

  instr->reg = pgm_read_byte_far ( &src->reg );
  instr->data = pgm_read_word_far ( &src->data );

  return VS_PNIR_OK;
}

bool Vs10xx::patch_process_rom ( vs_patch_rom_t *rom, 
							uint8_t patch_position, 
							pvs_patch_state_t state,
							/*pfnvs_patch_handler handler_func,*/
							pfnvs_patch_init init_func, 
							pfnvs_patch_end end_func )
{
  vs_patch_t	patch;
  bool res = true;

  patch.next_instr = patch_rom_data_next_instr;
  patch.user_data = patch_rom_get_data ( rom, patch_position );
  patch.user_val = 0;

  memset ( &patch.act, 0, sizeof( patch.act ));

  if (! patch.user_data )
	return false;

  if ( init_func ) {
	res = (*init_func) ( &patch, state );
  }

  if ( res ) {
	res = /*(*handler_func)*/ patch_apply ( &patch, state );
  }

  if ( end_func ) {
	(*end_func) ( &patch, state );
  }

  return res;
}
