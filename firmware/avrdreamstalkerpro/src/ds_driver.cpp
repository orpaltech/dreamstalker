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

#include <Arduino.h>
#include <Timer.h>

#include "ds_driver.h"
#include "ds_config.h"
#include "ds_rtclock.h"
#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "sound/ds_sound.h"
#include "sound/ds_codec.h"
#include "ds_remd.h"
#include "ds_pwrman.h"
#include "input/ds_keybrd.h"
#include "ds_menu.h"
#include "ds_sqwave.h"
#include "ds_vibro.h"
#include "ds_leds.h"
#include "ds_util.h"


using namespace DS;
using namespace avr_core;

/*-----------------------------------------------------------------------*/

/*
 * Defines the key to exit from sleep mode
 */
#define KEY_EXIT_SLEEP  KEY_POWER


/*-----------------------------------------------------------------------*/
SDLib::SDClass &card0 = SDLib::SD;


/*-----------------------------------------------------------------------*/
static void key_tone ( void )
{
  tonegen.beep ( 80, 3, 6 );
}


/*-----------------------------------------------------------------------*/
Driver driver;

/*-----------------------------------------------------------------------*/
void Driver::alarm_clock_callback (void *context)
{
  Driver *pdrv = static_cast<Driver *>(context);

  pdrv->on_alarm_clock ();
}

void Driver::wakeup_timer_callback (void *context)
{
  Driver *pdrv = static_cast<Driver *>(context);

  pdrv->on_wakeup_timer ();
}

/*-----------------------------------------------------------------------*/
bool Driver::begin (void)
{
  delay(600); /* Let power stabilize */

  RTClock::get()->init();
  Display::get()->init();
  Keyboard::get()->init ();
  PowerMan::get()->init();
  AppMenu::get()->init();
  SquareWave::get()->init();
  VibroMotor::get()->init();
  Leds::get()->init();
  Sound::get()->init ();
  REMDetect::get()->init();
  

#if ( TEST_REMD || TEST_BATTMON )
  Serial.begin( UART0_BITRATE );
  while (!Serial) {
    _NOP(); // wait for serial port to connect
  }
#endif

  return true;
}

void Driver::end (void)
{
  // Implement , if needed
}

bool Driver::start (void)
{
  bool success = true;
  char msg[ 5 ];

  interrupts();   /* Enable interrupts globally */

  /* Disable hold-repeat keyboard feature by default */
  Keyboard::get()->hold_repeat_disable ();

  /* IMPORTANT: Real-Time clock is the core component (!)
   *            Most of the other components will NOT work 
   *            without it.
   */
  RTClock::get()->start ( RTC_OPM_NORMAL );   /* Start real-time clock.*/ 

  ///////////////////

  /*leds.on(DS::LED1, 70, 0);
  leds.on(DS::LED2, 70, 0);*/

  //leds.pulse(DS::LED1, 20, 0, 1000, 50);
  //leds.pulse(DS::LED2, 20, 0, 500, 70);

  
  Display::get()->enable ();
  Display::get()->version ('F', fw_version(), 1000);


  /* SD-card initialization */
  while (! card0.begin ()) {

    /* handle error */
    Display::get()->message (__disp_msg_no_sd__, 1);

    /* let user insert SD-card and press ON/OFF */
    Keyboard::get()->wait_for_key_press (KEY_POWER);

    /* try SD-card again...*/
    Display::get()->message (__disp_msg_all_dots__, 500);
  }

   /* SD-card found */
  Display::get()->message (__disp_msg_sd_0__, 1000);

  do {
    if ( ! AudioCodec::get()->begin () ) {

      // codec initialization failed!
      Display::get()->message (__disp_msg_codec_error__, 1);

      success = false;
      break;
    }

    /* Display codec version */
    snprintf (msg, 5, __disp_msg_codec_spec__, VS_HW_SPEC);
    Display::get()->message (msg, 1000);


    if ( ! config.begin () ) {

      // initialization failed!

      success = false;
      break;
    }

    /* NOTE: The following initialization require 
    *       the config to be loaded prior 
    */
    /* ... */

    RTClock::get()->show ();

    A2DConv::get()->enable ();
    A2DConv::get()->warm_up ();
    PowerMan::get()->start();

    Sound::get()->start();

  } while ( false );

  Keyboard::get()->clear_events ();

  return success;
}

void Driver::stop (void)
{
  // TODO: implement, if needed
}

void Driver::process (void)
{
  int ret;
  keybrd_event_t key_event;

  // put your main code here, to run repeatedly:

  /* check to see if user has pressed a button */
  key_event = Keyboard::get()->get_event ();

  if ( AppMenu::get()->is_active () && ( key_event != KEY_NONE )) {

    ret = AppMenu::get()->handle_key( key_event );
    if ( ret & MENU_HANDLED ) {

      if ( ret & MENU_EXIT ) {

        /* exit from menu, show the clock again */
        RTClock::get()->show ();
      }

      /* event has been processed by menu */
      key_event = KEY_NONE;
    }
  }


  switch ( key_event ) {

    case ( KEY_ENTER | KEY_MINUS | KEYBRD_HOLD ): 
    case ( KEY_ENTER | KEY_PLUS | KEYBRD_HOLD ): {
      key_tone ();
      wakeup_timer_quick_set ( key_event );
      break;
    }

    case ( KEY_SELECT | KEYBRD_HOLD ): {
      key_tone ();

      RTClock::get()->hide ();

      AppMenu::get()->enter ();

      break;
    }

    case ( KEY_POWER | KEYBRD_HOLD ): {
      key_tone ();

      power_off ();

      break;
    }

    case ( KEY_CHECK ): {
      key_tone ();

      /*if (tonegen.is_playing () )
        tonegen.stop ();

      else {
        delay (200);
        tonegen.play_melody(DS::TGP_FUR_ELISE, 0);
        
      }*/

      /*if ( vibro.is_running () ) {
        vibro.stop();

      } else {
        vibro.start(4, 0);

      }*/

      if ( REMDetect::get()->is_running () ) {
        REMDetect::get()->stop();

      }/* else {
        REMDetect::get()->start();

      }*/

      break;
    }

  }

  /*
   * Process different tasks
   */
  AudioCodec::get()->process_task ();

}

void Driver::reboot_on_key (void)
{
  /* let user press ON/OFF */
  Keyboard::get()->wait_for_key_press (KEY_POWER);

  // and reboot
  soft_reset ();
}

void Driver::on_wakeup_timer (void)
{
  start_lucid_dream ();
}

void Driver::on_alarm_clock (void)
{

}

void Driver::on_remd_event (remd_event_type_t event)
{
  // TODO: do actions on REM detected
  // серию вспышек и звуков во время сновидения

  /* Сheck if alarm clock is enabled */
  if (config.get_alarm_clock_enabled ()) {
    
    RTClock::get()->alarm_clock_set (alarm_clock_callback, this);
  }
}

void Driver::wakeup_timer_toggle (void)
{
  if (RTClock::get()->wakeup_timer_is_set ()) {

    RTClock::get()->wakeup_timer_cancel ();

  } else {

    RTClock::get()->wakeup_timer_set (wakeup_timer_callback, this);
  }
}

void Driver::wakeup_timer_quick_set (keybrd_event_t key_event)
{
  /* Wake-Up timer */
  if ( RTClock::get()->wakeup_timer_is_set ()) {

    RTClock::get()->wakeup_timer_cancel ();
    return;
  }

  RTClock::get()->hide();
  Display::get()->message ( __disp_msg_set__, 500 );

  if ( key_event & KEY_MINUS ) {
    config.set_wakeup_timer_delay ( 20 );
    Display::get()->time ( 0, 20 );

  } else {
    config.set_wakeup_timer_delay ( WAKEUP_TIMER_DELAY_DEFAULT );
    Display::get()->time ( 0, WAKEUP_TIMER_DELAY_DEFAULT );
  }
  Display::get()->wait_cycles ( 800 );

  RTClock::get()->wakeup_timer_set (wakeup_timer_callback, this);
  RTClock::get()->show();
}

#if TEST_REMD
static Timer tmr;
static volatile int8_t evt_id = -1;
#define REMD_TIMEOUT_MIN  120UL
static void stop_remd (void *ctx){

  ((REMDetect *)ctx)->stop_unsafe ();
  evt_id = -1;
}
#endif

void Driver::handle_isr (void)
{
#if TEST_REMD
  if (evt_id < 0)
    return;

  tmr.update();
#endif
}

void Driver::start_lucid_dream (void)
{
  if ( !REMDetect::get()->start_unsafe (this) ) {
    return;
  }

#if TEST_REMD
  /* Stop after N min */
  evt_id = tmr.after(REMD_TIMEOUT_MIN * 60'000UL, stop_remd, REMDetect::get() );
#endif
}

void Driver::power_off (void)
{
  RTClock::get()->hide ();
  Display::get()->message (__disp_msg_off__, 500);

  AudioCodec::get()->stop ();

  REMDetect::get()->stop();
  PowerMan::get()->stop ();
  A2DConv::get()->disable ();	/* disable ADC to save power */

  Sound::get()->stop();

  Display::get()->disable ();

  /* Restart RTC in power-save mode and 
   * keep current time for the user 
   */
  RTClock::get()->stop();
  RTClock::get()->start ( RTC_OPM_PWRSAVE );


  /*
   * Go to sleep...
   */
  set_sleep_mode ( SLEEP_MODE_PWR_SAVE );

  do {
	  Keyboard::get()->enable_key_irq ( KEY_EXIT_SLEEP );

	  /*
	   * ...Zzz...  
	   */
	  sleep_mode ();

	  Keyboard::get()->disable_key_irq ( KEY_EXIT_SLEEP );

  } while (! (Keyboard::get()->get_irq_keys() & KEY_EXIT_SLEEP));

  /* Wait for next tick and restart RTC in normal mode */
  RTClock::get()->wait_for_next_tick ();
  RTClock::get()->stop ();
  RTClock::get()->start ( RTC_OPM_NORMAL );

  Display::get()->enable ();
  Display::get()->message (__disp_msg_on__, 500);

  RTClock::get()->show ();

  A2DConv::get()->enable ();
  PowerMan::get()->start ();

  Sound::get()->start();

  /* Ignore keyboard events that might happen*/
  Keyboard::get()->clear_events ();
}
