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

#ifndef _DS_SOUND_DEFINED
#define _DS_SOUND_DEFINED

/*-----------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>

/*-----------------------------------------------------------------------*/

//#define HP_SRC_CODEC	1
//#define HP_SRC_TONEGEN	2


/*-----------------------------------------------------------------------*/
namespace DS {

/*-----------------------------------------------------------------------*/
class Sound {
public:
  Sound();
public:
  bool init( void );

  void start (void);
  void stop (void);

  /* Enable/shutdown amplifier */
  void speaker_on (void);
  void speaker_off (void);

  /* Enable/disable system microphone */
  void mic_on (void);
  void mic_off (void);

};

/*-----------------------------------------------------------------------*/
}; //DS

extern DS::Sound SND;

#endif // _DS_SOUND_DEFINED
