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

#ifndef _VS10XX_DEFINED
#define _VS10XX_DEFINED

#include <stdint.h>
#include <stdbool.h>


/*-----------------------------------------------------------------------*/
/* VS10xx Codec definitions */
	/* SCI Commands */
#define	SCI_READ			0x03
#define	SCI_WRITE			0x02

	/* SCI Registers */
#define SCI_REG_MODE		0x00
#define	 SM_DIFF		  0			// Differential: 0 - normal in-phase audio, 1 - left channel inverted
#define	 SM_SETTOZERO	1			// Set to zero: 0 - right, 1 - wrong
#define	 SM_RESET		  2			// Soft reset: 1 - yes
/* NOTE: Bit 3 has device-specific meaning. Please, look into an appropriate device header file. */
/* NOTE: Bit 4 has device-specific meaning. Please, look into an appropriate device header file. */
#define  SM_TESTS 		5			// Allow SDI tests: 1 - allowed
#define  SM_STREAM		6			// Stream mode: 1 - yes
/* NOTE: Bit 7 has device-specific meaning. Please, look into an appropriate device header file. */
#define  SM_DACT		  8			// DCLK active edge: 0 - rising, 1 - falling
#define  SM_SDIORD		9			// SDI bit order: 0 - MSb first
#define  SM_SDISHARE	10		// Share SPI chip select: 1 - yes
#define  SM_SDINEW		11		// VS1002 native SPI modes: 1 - yes
#define  SM_ADPCM		  12		// ADPCM recording: 1 - active, 0 - disabled
/* NOTE: Bit 13 has device-specific meaning. Please, look into an appropriate device header file. */


#define SCI_REG_STATUS		0x01
#define	 SS_APDOWN2		3
#define	 SS_VER(reg)	(((reg) >> 4) & 0xF)

#define SCI_REG_BASS		    0x02
#define SCI_REG_CLOCKF		  0x03
#define SCI_REG_DECODETIME	0x04
#define SCI_REG_AUDATA		  0x05
#define SCI_REG_WRAM		    0x06
#define SCI_REG_WRAMADDR	  0x07
#define SCI_REG_RECDATA		  0x08
#define SCI_REG_RECFILL		  0x09
#define SCI_REG_AIADDR		  0x0A
#define SCI_REG_VOL			    0x0B
#define SCI_REG_AICTRL0		  0x0C
#define SCI_REG_AICTRL1		  0x0D
#define SCI_REG_AICTRL2		  0x0E
#define SCI_REG_AICTRL3		  0x0F

#define AICTRL1_GAIN(gain)	((1024UL * (gain)) & 0xFFFF)
#define AICTRL1_AGC			    0


namespace VLSI {
/*-----------------------------------------------------------------------*/
typedef uint8_t	vs_hwspec_t;

typedef struct s_vs_sci_instr vs_sci_instr_t, *pvs_sci_instr_t;
struct s_vs_sci_instr {
	uint8_t		reg;
	uint16_t 	data;
};

typedef struct s_vs_patch_data {
	uint16_t count;
	vs_sci_instr_t instr[1];
} vs_patch_data_t, *pvs_patch_data_t;

typedef struct s_vs_patch_rom {
	uint16_t revision;
	uint16_t patch_count;
	vs_patch_data_t	patch_data[1];
} vs_patch_rom_t, *pvs_patch_rom_t;

typedef struct s_vs_patch vs_patch_t, *pvs_patch_t;
typedef struct s_vs_patch_activation {
	vs_sci_instr_t *instr;
	uint8_t	num_instr;
} vs_patch_activation_t, *pvs_patch_activation_t;

typedef enum e_vs_patch_result {
	VS_PRES_ERR = 0,
	VS_PRES_OK = 1,
	VS_PRES_SKIP = 2,
	VS_PRES_EOP = 3,
} vs_patch_result_t;
typedef vs_patch_result_t (*pfnvs_patch_next_instr)(pvs_patch_t, pvs_sci_instr_t);

struct s_vs_patch {
	void		*user_data;
	uint16_t	user_val;
	pfnvs_patch_next_instr next_instr;
	vs_patch_activation_t act;
};

typedef struct s_vs_patch_state vs_patch_state_t, *pvs_patch_state_t;

typedef bool (*pfnvs_patch_init)(pvs_patch_t, pvs_patch_state_t);
typedef void (*pfnvs_patch_end)(pvs_patch_t, pvs_patch_state_t);


/*-----------------------------------------------------------------------*/
class Vs10xx {
public:
  // Initialize the VLSI library
  bool	init ( void );

  void	hard_reset ( void );
  void	soft_reset ( uint16_t mask_add, uint16_t mask_remove );

  void	suspend ( void );
  void	resume ( void );

  /* Sets attenuation, in -dB,
   * 0 - maximum volume,
   * 254 - minimum volume,
   * each step is 0.5dB 
   */
  void	set_volume ( uint8_t left_db, uint8_t right_db );

  bool	playback_start ( void );
  void	playback_stop ( void );
  void  playback_send_block( const uint8_t *buff );

  /* sample rate = 8000, 16000
   * gain = 1..64
   * highpass filter = true/false
   */
  bool	adpcm_record_start ( uint16_t sample_rate, uint8_t gain, bool highpass_filter );
  void	adpcm_record_stop ( void );
  bool  adpcm_read_block( uint8_t *buff );
  bool  adpcm_has_block ( void ) const;

  bool	process_patches ( void );

protected:
  // Derived classes must override !!
  virtual void vs_suspend ( void ) = 0;
  virtual void vs_resume ( void ) = 0;
  virtual bool vs_playback_start ( void ) = 0;
  virtual void vs_playback_stop ( void ) = 0;
  virtual bool vs_adpcm_rec_start ( uint16_t sample_rate, uint8_t gain, bool highpass_filter ) = 0;
  virtual void vs_adpcm_rec_stop ( void ) = 0;
  virtual vs_patch_rom_t *vs_patch_rom ( void ) = 0;

  // Derived classes may override
  virtual bool vs_init ( void ) { return true; }
  virtual bool vs_process_patches ( void ) { return true; }

protected:
  // Static operations 
  static void		sci_select ( void );
  static void		sci_unsel ( void );
  static uint16_t	sci_read ( uint8_t reg );
  static void		sci_write ( uint8_t reg, uint16_t data );

  static void		sci_add ( uint8_t reg, uint16_t flags );
  static void		sci_remove ( uint8_t reg, uint16_t flag );
  static bool 	sci_is_set ( uint8_t reg, uint16_t flag );

  static void		sdi_select ( void );
  static void		sdi_unsel ( void );
  static void		sdi_write ( const uint8_t *buff );

  static uint8_t	read_hw_spec ( void );
  static uint16_t	read_status ( void );
  static uint16_t	read_mode ( void );
  static void   write_mode ( uint16_t mode );

  static void		wait_for_dreq ( void );
  static bool	  is_dreq ( void );

  static void		analog_pwr_down ( void );

protected:

  static bool patch_process_file (const char *patch_file, 
                                pvs_patch_state_t state,
                                /*pfnvs_patch_handler handler_func,*/
                                pfnvs_patch_init init_func, 
                                pfnvs_patch_end end_func);

  static bool patch_process_rom (vs_patch_rom_t *rom, 
  							                uint8_t patch_position, 
                                pvs_patch_state_t state,
                                /*pfnvs_patch_handler handler_func,*/
                                pfnvs_patch_init init_func, 
                                pfnvs_patch_end end_func);
private:
  static bool patch_apply (vs_patch_t *patch, vs_patch_state_t *state);
};

/*-----------------------------------------------------------------------*/
};  //VLSI

#endif // _VS10XX_DEFINED
