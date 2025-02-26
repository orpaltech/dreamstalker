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

#ifndef _AVR_ADC_DEFINED
#define _AVR_ADC_DEFINED

#include <stdbool.h>
#include <avr/power.h>

/*-----------------------------------------------------------------------*/
#define ADC_CHANNELS	2U


/*-----------------------------------------------------------------------*/
namespace avr_core {

/*-----------------------------------------------------------------------*/
typedef enum adc_channel_flag {
  ADC_CF_NONE         = 0,
  ADC_CF_VREF_2_56    = 1,
  ADC_CF_LEFT_ADJUST  = 2,
} adc_channel_flag_t;

/*-----------------------------------------------------------------------*/
class A2DSampleCB {
public:
  virtual void on_a2d_sample(uint16_t sample) = 0;
};

/*-----------------------------------------------------------------------*/
class A2DConv {
public:
  bool enable (void) ;
  void disable (void) ;

  void warm_up ( void);

  bool setup_channel(uint8_t chan, uint16_t flags);
  bool start (uint8_t chan, int num_samples, A2DSampleCB *pfcb = nullptr);
  void stop (uint8_t chan) ;
  void enable_channel (uint8_t chan, bool enable);
  bool is_enabled (uint8_t chan);
  bool is_running (uint8_t chan);

  static uint32_t get_adc_rate (void);

  /* Intended for use in ISR only */
  static void handle_rtc (void);  /* called every 1ms*/
  static void handle_adc (void);
  bool start_unsafe (uint8_t chan, int num_samples, A2DSampleCB *pfcb = nullptr);
  void stop_unsafe (uint8_t chan) ;

private:
  uint8_t get_channel ( int index);
  int   get_index( uint8_t chan );
  int   get_next_running_index (void);
  void  convert_one ( int index );
  void  rtc_handler ( void);
  void  adc_handler ( void);

private:
  typedef struct s_adc_channel {
    uint16_t flags;
    int num_samples;
    A2DSampleCB *pfcb;
  } adc_channel_t;
  
  volatile adc_channel_t adc[ADC_CHANNELS];
  volatile uint8_t chan_index;
  uint8_t period_ticks;
  uint8_t tick_count;   /* ticks counter*/
};

/*-----------------------------------------------------------------------*/
};  //avr_core

extern avr_core::A2DConv A2D;

#endif // _AVR_ADC_DEFINED
