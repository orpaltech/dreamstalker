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
LED4D7S_Display disp;
Driver driver;

/*-----------------------------------------------------------------------*/
bool Driver::begin (void)
{
  delay(600); /* Let power stabilize */

  RTC.init();
  disp.init();
  kbrd.init ();
  PM.init();
  menu.init();
  SQW.init();
  vibro.init();
  leds.init();
  SND.init ();
  remd.init();
  

#if ( REMD_TEST || BATTMON_TEST )
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

  /* Disable hold-repeat keyboard feature */
  kbrd.hold_repeat_disable ();

  /* NOTE: This is the core component and many others 
   *       won't work without it.
   */
  RTC.start ( RTC_OPM_NORMAL );   /* Start real-time clock.*/ 

  ///////////////////

  /*leds.on(DS::LED1, 70, 0);
  leds.on(DS::LED2, 70, 0);*/

  //leds.pulse(DS::LED1, 20, 0, 1000, 50);
  //leds.pulse(DS::LED2, 20, 0, 500, 70);

  
  disp.enable ();
  disp.version ('F', fw_version(), 1000);


  /* SD-card initialization */
  while (! card0.begin ()) {

    /* handle error */
    disp.message (__disp_msg_no_sd__, 1);

    /* let user insert SD-card and press ON/OFF */
    kbrd.wait_for_key_press (KEY_POWER);

    /* try SD-card again...*/
    disp.message (__disp_msg_all_dots__, 500);
  }

   /* SD-card found */
  disp.message (__disp_msg_sd_0__, 1000);

  do {
    if ( ! AC.begin () ) {

      // codec initialization failed!
      disp.message (__disp_msg_codec_error__, 1);

      success = false;
      break;
    }

    /* Display codec version */
    snprintf (msg, 5, __disp_msg_codec_version__, VS_HW_SPEC);
    disp.message (msg, 1000);


    if ( ! config.begin () ) {

      // initialization failed!

      success = false;
      break;
    }

    /* NOTE: The following initialization require 
    *       the config to be loaded prior 
    */
    /* ... */

    RTC.show ();

    A2D.enable ();
    A2D.warm_up ();
    PM.start();

    SND.start();

  } while ( false );

  kbrd.clear_events ();

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
  key_event = kbrd.get_event ();

  if ( menu.is_active () && ( key_event != KEY_NONE )) {

    ret = menu.handle_key( key_event );
    if ( ret & MENU_HANDLED ) {

      if ( ret & MENU_EXIT ) {

        /* exit from menu, show the clock again */
        RTC.show ();
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

      RTC.hide ();

      menu.enter ();

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

      if ( remd.is_running () ) {
        remd.stop();

      }/* else {
        remd.start();

      }*/

      break;
    }

  }

  /*
   * Process different tasks
   */
  AC.process_task ();

}

void Driver::reboot_on_key (void)
{
  /* let user press ON/OFF */
  kbrd.wait_for_key_press (KEY_POWER);

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
  if (config.get_alarm_clock ()) {
    
    RTC.alarm_clock_set (this);
  }
}

void Driver::wakeup_timer_toggle (void)
{
  if (RTC.wakeup_timer_is_set ()) {

    RTC.wakeup_timer_cancel ();

  } else {

    RTC.wakeup_timer_set (this);
  }
}

void Driver::wakeup_timer_quick_set (keybrd_event_t key_event)
{
  /* Wake-Up timer */
  if ( RTC.wakeup_timer_is_set ()) {

    RTC.wakeup_timer_cancel ();
    return;
  }

  RTC.hide();
  disp.message ( __disp_msg_set__, 500 );

  if ( key_event & KEY_MINUS ) {
    config.set_wakeup_timer_delay ( 20 );
    disp.time ( 0, 20 );

  } else {
    config.set_wakeup_timer_delay ( WAKEUP_TIMER_DELAY_DEFAULT );
    disp.time ( 0, WAKEUP_TIMER_DELAY_DEFAULT );
  }
  disp.wait_cycles ( 800 );

  RTC.wakeup_timer_set (this);
  RTC.show();
}

#if REMD_TEST
static Timer tmr;
static volatile int8_t evt_id = -1;
#define REMD_TIMEOUT_MIN  10UL
static void stop_remd (void *ctx){

  ((REMDetect *)ctx)->stop_unsafe ();
  evt_id = -1;
}
#endif

void Driver::handle_isr (void)
{
#if REMD_TEST
  if (evt_id < 0)
    return;

  tmr.update();
#endif
}

void Driver::start_lucid_dream (void)
{
  if ( !remd.start_unsafe (this) ) {
    return;
  }

#if REMD_TEST
  /* Stop after 3 min */
  evt_id = tmr.after(REMD_TIMEOUT_MIN * 60'000UL, stop_remd, &remd );
#endif
}

void Driver::power_off (void)
{
  RTC.hide ();
  disp.message (__disp_msg_off__, 500);

  AC.stop ();

  remd.stop();
  PM.stop ();
  A2D.disable ();	/* disable ADC to save power */

  SND.stop();

  disp.disable ();

  /* Restart RTC in power-save mode and 
   * keep current time for the user 
   */
  RTC.stop();
  RTC.start ( RTC_OPM_PWRSAVE );


  /*
   * Go to sleep...
   */
  set_sleep_mode ( SLEEP_MODE_PWR_SAVE );

  do {
	  kbrd.enable_key_irq ( KEY_EXIT_SLEEP );

	  /*
	   * ...Zzz...  
	   */
	  sleep_mode ();

	  kbrd.disable_key_irq ( KEY_EXIT_SLEEP );

  } while (! (kbrd.get_irq_keys() & KEY_EXIT_SLEEP));

  /* Wait for next tick and restart RTC in normal mode */
  RTC.wait_for_next_tick ();
  RTC.stop ();
  RTC.start ( RTC_OPM_NORMAL );

  disp.enable ();
  disp.message (__disp_msg_on__, 500);

  RTC.show ();

  A2D.enable ();
  PM.start ();

  SND.start();

  /* Ignore keyboard events that might happen*/
  kbrd.clear_events ();
}
