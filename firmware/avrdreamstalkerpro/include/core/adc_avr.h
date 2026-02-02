/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2026	ORPAL Technologies, Inc.
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

#ifndef _AVR_A2DCONVERT_DEFINED
#define _AVR_A2DCONVERT_DEFINED

#include <stdbool.h>
#include <avr/power.h>

/*-----------------------------------------------------------------------*/
#define ADC_CHANNELS	2U
#define ADC_MAX_VALUE 0x3FFU  // 10bit


/*-----------------------------------------------------------------------*/
namespace avr_core {

/*-----------------------------------------------------------------------*/
typedef enum adc_channel_flag {
  ADC_CF_NONE         = 0,
  ADC_CF_VREF_2_56    = 1,
  ADC_CF_LEFT_ADJUST  = 2,
} adc_channel_flag_t;

/*-----------------------------------------------------------------------*/
typedef void (*A2DSampleCB_t)(void *context, uint16_t sample);

/*-----------------------------------------------------------------------*/
class A2DConvert {
public:
  static A2DConvert *get();
public:
  bool enable (void) ;
  void disable (void) ;

  void warm_up ( void);

  bool setup_channel(uint8_t chan, uint16_t flags = ADC_CF_NONE);
  bool start (uint8_t chan, uint16_t num_samples, A2DSampleCB_t pfcb = nullptr, void *context = nullptr);
  void stop (uint8_t chan) ;
  void enable_channel (uint8_t chan, bool enable);
  bool is_enabled (uint8_t chan);
  bool is_running (uint8_t chan);

  bool start_unsafe (uint8_t chan, uint16_t num_samples, A2DSampleCB_t pfcb = nullptr, void *context = nullptr);
  void stop_unsafe (uint8_t chan) ;

  static uint32_t get_adc_rate (void);

  /* Intended for use in system clock ISR only */
  static void handle_sysclk (void);
  static void handle_adc (void);

private:
  uint8_t get_channel( uint8_t index);
  int8_t  get_index( uint8_t chan );
  int8_t  get_next_running_index (void);
  void  convert_one ( int8_t index );
  void  irq_handler ( void);
  void  adc_handler ( void);

private:
  typedef struct s_adc_channel {
    uint8_t channel;
    uint8_t flags;
    uint16_t num_samples;
    A2DSampleCB_t pfcb;
    void *context;
  } adc_channel_t;
  
  volatile adc_channel_t adc[ADC_CHANNELS];
  volatile uint8_t chan_index;
};

/*-----------------------------------------------------------------------*/
};  //avr_core

#endif // _AVR_A2DCONVERT_DEFINED
