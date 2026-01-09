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
#include "ds_remdetect.h"
#include "ds_pwrman.h"
#include "input/ds_keybrd.h"
#include "ds_appmenu.h"
#include "ds_sqwave.h"
#include "ds_vibro.h"
#include "ds_leds.h"


using namespace DS;
using namespace avr_core;

/*-----------------------------------------------------------------------*/

/*
 * Defines the key to exit from sleep mode
 */
#define KEY_EXIT_SLEEP  KEY_POWER


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

void Driver::remd_callback(void *context, remd_event_type_t event)
{
  Driver *pdrv = static_cast<Driver *>(context);

  pdrv->on_remd_event( event );
}

/*-----------------------------------------------------------------------*/
#if RUN_TEST_MODE

bool Driver::begin (void)
{
  delay(600); /* Let power stabilize */

  RTClock::get()->init();
  //Keyboard::get()->init ();
  SQWave::get()->init();
  Vibro::get()->init();
  Leds::get()->init();
  Sound::get()->init ();

  return true;
}

void Driver::end (void)
{
  // Implement , if needed
}

bool Driver::start (void)
{
  interrupts();   /* Enable interrupts globally */

  /* Disable hold-repeat keyboard feature by default */
  //Keyboard::get()->hold_repeat_disable ();

  /* IMPORTANT: Real-Time clock is the core component (!)
   *            Most of the other components will NOT work 
   *            without it.
   */
  RTClock::get()->start ( RTC_OPM_NORMAL );   /* Start real-time clock.*/ 


  //delay(1000);

  /////////
  Vibro::get()->start(5, 500);
  delay(1000);
  /////////

  /*if (card0.begin ())
  {
     /////////
    Vibro::get()->start(5, 1000);
    delay(1000);
    /////////
  }*/

  Sound::get()->start();

  //Vibro::get()->start(5, 500);

  //Leds::get()->on(DS::LED1, 70, 0);
  //Leds::get()->on(DS::LED2, 70, 0);

  tonegen.play_melody(TGP_FUR_ELISE, 0);

  //Leds::get()->pulse(DS::LED1, 50, 0, 1000, 50);
  //Leds::get()->pulse(DS::LED2, 50, 0, 500, 70);


  return true;
}

void Driver::stop (void)
{
  noInterrupts();

  // TODO: implement, if needed
}

void Driver::process (void)
{

}

#else

bool Driver::begin (void)
{
  delay(600); /* Let power stabilize */

  RTClock::get()->init();
  Display::get()->init();
  Keyboard::get()->init ();
  PowerMan::get()->init();
  AppMenu::get()->init();
  SQWave::get()->init();
  Vibro::get()->init();
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
  auto disp = Display::get();

  interrupts();   /* Enable interrupts globally */

  /* Disable hold-repeat keyboard feature by default */
  Keyboard::get()->hold_repeat_disable ();

  /* IMPORTANT: Real-Time clock is the core component (!)
   *            Most of the other components will NOT work 
   *            without it.
   */
  RTClock::get()->start ( RTC_OPM_NORMAL );   /* Start real-time clock.*/ 


  disp->enable ();
  disp->version ('P', fw_version(), 1000);


  /* SD-card initialization */
  while (! card0.begin ()) {

    /* handle error */
    disp->message (__disp_msg_no_sd__, 1);

    /* let user insert SD-card and press ON/OFF */
    Keyboard::get()->wait_for_key_press (KEY_POWER);

    /* try SD-card again...*/
    disp->message (__disp_msg_all_dots__, 500);
  }

   /* SD-card found */
  disp->message (__disp_msg_sd_0__, 1000);

  do {
    if ( ! AudioCodec::get()->begin () ) {

      // codec initialization failed!
      disp->message (__disp_msg_codec_error__, 1);

      success = false;
      break;
    }

    /* Display codec version */
    snprintf (msg, 5, __disp_msg_codec_spec__, VS_HW_SPEC);
    disp->message (msg, 1000);


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

#if TEST_REMD
  // create a new file
  //const char *filename = "RECORDS/REMDSAMP.HEX";
  const char *filename = "RECORDS/REMDSAMP.BIN";
  if (card0.exists(filename))
    card0.remove(filename);
  remd_fp = card0.open (filename, FILE_WRITE);
  if (! remd_fp)
	  return false;
#endif

  return success;
}

void Driver::stop (void)
{
  noInterrupts();

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

      /*if ( REMDetect::get()->is_running () ) {
        REMDetect::get()->stop();

      } else {
        REMDetect::get()->start();

      }*/

      break;
    }

  }

  /*
   * Process different tasks
   */
  AudioCodec::get()->process_task ();

#if TEST_REMD
  auto premd = REMDetect::get();
  if (premd->file_buf_ready) {
    if ( remd_fp ) {
      // copy buffer and release it
      memcpy( remd_buf, (const void *)premd->file_buf, 512 );
      /*remd_buf[0] = '\0';
      int index = 0;
      while (index < 256) {
        //sprintf(remd_hex, "%04X", premd->file_buf[index++]);
        //Strings::hex_str (premd->file_buf[index++], remd_hex, 4);
        String hex = Strings::hex_str (premd->file_buf[index++]);
        strcat(remd_buf, hex.c_str() );
      }*/
    }
    premd->file_buf_ready = false;

    if ( remd_fp ) {
      // write to SD card
      //remd_fp.write(remd_buf);
      remd_fp.write((const uint8_t*)remd_buf, 512);
    }
  }
#endif

}
#endif

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

  //Serial.println("EPOCH_RESULT: REM");
  
  //REMDetect::get()->stop_unsafe ();

  /* Сheck if alarm clock is enabled */
  if (config.get_alarm_clock_enabled ()) {
    
    RTClock::get()->alarm_clock_set (alarm_clock_callback, this);
  }
}

void Driver::wakeup_timer_toggle (void)
{
  auto rtck = RTClock::get();

  if (rtck->wakeup_timer_is_set ()) {

    rtck->wakeup_timer_cancel ();

  } else {

    rtck->wakeup_timer_set (wakeup_timer_callback, this);
  }
}

void Driver::wakeup_timer_quick_set (keybrd_event_t key_event)
{
  auto rtck = RTClock::get();
  auto disp = Display::get();

  /* Wake-Up timer */
  if ( rtck->wakeup_timer_is_set ()) {

    rtck->wakeup_timer_cancel ();
    return;
  }

  rtck->hide();
  disp->message ( __disp_msg_set__, 500 );

  if ( key_event & KEY_MINUS ) {
    config.set_wakeup_timer_delay ( 20 );
    disp->time ( 0, 20 );

  } else {
    config.set_wakeup_timer_delay ( WAKEUP_TIMER_DELAY_DEFAULT );
    disp->time ( 0, WAKEUP_TIMER_DELAY_DEFAULT );
  }
  disp->wait_cycles ( 800 );

  rtck->wakeup_timer_set (wakeup_timer_callback, this);
  rtck->show();
}

#if TEST_REMD
static Timer tmr;
static volatile int8_t evt_id = -1;
#define REMD_TIMEOUT_MIN  180UL
static void stop_remd (void *context)
{
  Driver *prd = static_cast<Driver *>(context);
  REMDetect::get()->stop_unsafe ();
  evt_id = -1;

  if (prd->remd_fp) {
    prd->remd_fp.flush();
    prd->remd_fp.close();
  }
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
  if ( !REMDetect::get()->start_unsafe (
                  remd_callback, this) ) {
    return;
  }

#if TEST_REMD
  /* Stop after REMD_TIMEOUT_MIN */
  evt_id = tmr.after(REMD_TIMEOUT_MIN * 60'000UL, stop_remd, this );
#endif
}

void Driver::power_off (void)
{
  auto rtck = RTClock::get();
  auto disp = Display::get();

  rtck->hide ();
  disp->message (__disp_msg_off__, 500);

  AudioCodec::get()->stop ();

  REMDetect::get()->stop();
  PowerMan::get()->stop ();
  A2DConv::get()->disable ();	/* disable ADC to save power */

  Sound::get()->stop();

  disp->disable ();

  /* Restart RTC in power-save mode and 
   * keep current time for the user 
   */
  rtck->stop();
  rtck->start ( RTC_OPM_PWRSAVE );


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
  rtck->wait_for_next_tick ();
  rtck->stop ();
  rtck->start ( RTC_OPM_NORMAL );

  disp->enable ();
  disp->message (__disp_msg_on__, 500);

  rtck->show ();

  A2DConv::get()->enable ();
  PowerMan::get()->start ();

  Sound::get()->start();

  /* Ignore keyboard events that might happen*/
  Keyboard::get()->clear_events ();
}
