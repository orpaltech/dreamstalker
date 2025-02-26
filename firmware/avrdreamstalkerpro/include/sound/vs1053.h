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

#ifndef _VS1053_DEFINED
#define _VS1053_DEFINED

#include "vs10xx.h"

namespace VLSI {
/*-----------------------------------------------------------------------*/
class Vs1053 : public Vs10xx {
public:
	Vs1053();
protected:
  virtual void vs_suspend ( void );
  virtual void vs_resume ( void );
  virtual bool vs_playback_start ( void );
  virtual void vs_playback_stop ( void );
  virtual bool vs_adpcm_rec_start ( uint16_t sample_rate, uint8_t gain, bool highpass_filter );
  virtual void vs_adpcm_rec_stop ( void );
  virtual vs_patch_rom_t *vs_patch_rom ( void );
  
private:
  static void set_clockf ( uint16_t mult, uint16_t add );
};

/*-----------------------------------------------------------------------*/
};  //VLSI

#endif // _VS1053_DEFINED
