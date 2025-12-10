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

#ifndef _DS_TONEGEN_DEFINED
#define _DS_TONEGEN_DEFINED

#include <stdint.h>
#include <stdbool.h>

namespace DS {
/*-----------------------------------------------------------------------*/
typedef enum e_tonegen_piece {
  TGP_NONE = 0,
  TGP_MOONLIGHT_SONATA,
  TGP_FUR_ELISE,
  TGP_INDIANA_JONES,
  TGP_ODE_TO_JOY,
  TGP_MISSION_IMPOSSIBLE,
  TGP_HAPPY_BIRTHDAY,
  TGP_AMAZING_GRACE,
  TGP_KLEINE_NACHTMUSIK,
  TGP_JINGLE_BELLS,
} tonegen_piece_t;

/*-----------------------------------------------------------------------*/

class Tonegen {
public:
  void init (void);

  void beep (uint16_t millisec, uint8_t note, uint8_t octave);

  /**
   * piece        : melody to play
   * repeat_count : 0 - unlimited
   */
  bool play_melody (tonegen_piece_t piece, uint8_t repeat_count);
  bool is_playing (void);
  void stop (void);

  /* Intended for use in RTC ISR only. Do not call it directly! */
  static void handle_isr (void);
  void stop_unsafe (void);

private:
  void irq_handler (void);
  
  char melody_get_char (void);

  typedef struct s_tonegen_melody {
    const char *head;
    const char *buffer;
    uint8_t storage_mode : 2; /* where a melody is stored */
    uint16_t ticks;
    uint16_t duration;        /* duration of current note */
    uint16_t whole_duration;  /* duration of whole note */
    uint8_t note_default_len;
    uint8_t octave_default;
    /* use count to designate melody/beep,
    * count = 0 - idle
    * count < 0 - beep
    * count > 0 - melody
    */
    int16_t count;
  } tonegen_melody_t;

  volatile tonegen_melody_t melody;
};

/*-----------------------------------------------------------------------*/
};  //DS

extern DS::Tonegen tonegen;

#endif  // _DS_TONEGEN_DEFINED