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
#include "ds_battery.h"
#include "input/ds_keybrd.h"
#include "ds_appmenu.h"
#include "ds_sqwave.h"
#include "ds_sysclock.h"
#include "ds_vibro.h"
#include "ds_remhints.h"


using namespace DS;
using namespace avr_core;

/*-----------------------------------------------------------------------*/

/*
 * Defines the key to exit from sleep mode
 */
#define KEY_EXIT_SLEEP  KEY_POWER

/*-----------------------------------------------------------------------*/
static void key_tone (bool wait = false)
{
  uint16_t duration = 80;
  Tonegen::get()->beep ( duration, 3, 6, config.get_volume_level ());
  if ( wait ) {
    SysClock::get()->wait (duration);
  }
}


/*-----------------------------------------------------------------------*/
Driver *Driver::get()
{
  static Driver drv;
  return &drv;
}

/*-----------------------------------------------------------------------*/
void Driver::alarm_clock_callback (void *context)
{
  Driver *pdrv = reinterpret_cast<Driver *>(context);

  pdrv->on_alarm_clock ();
}

void Driver::wakeup_timer_callback (void *context)
{
  Driver *pdrv = reinterpret_cast<Driver *>(context);

  pdrv->on_wakeup_timer ();
}

void Driver::remd_callback (void *context, remd_event_type_t event, uint16_t arg)
{
  Driver *pdrv = reinterpret_cast<Driver *>(context);

  if ( pdrv->is_remd_check () ) {

    // REMD testing mode 

    if ( event == REMD_EVENT_MOVE ) {
      Tonegen::get()->beep(50, 4, 7, config.get_volume_level ());
    }

  } else {

    // REMD lucid dreaming mode

    if ( event == REMD_EVENT_REM ) {
      pdrv->on_remd_stable_rem( arg );
    }
  }
}

/*-----------------------------------------------------------------------*/
#if RUN_TEST_MODE

bool Driver::begin (void)
{
  delay(600); /* Let power stabilize */

  set_mode ( OPM_NONE );

  RTClock::get()->init();
  SysClock::get()->init();
  Display::get()->init();
  Keyboard::get()->init ();
  AppMenu::get()->init();
  SquareWave::get()->init();
  Leds::get()->init();
  VibroMotor::get()->init();
  Sound::get()->init ();
  REMDetect::get()->init();
  BatteryMonitor::get()->init();

  return true;
}

void Driver::end (void)
{
  // Implement , if needed
}

bool Driver::start (void)
{
  set_mode ( OPM_NORMAL );    /* Start in normal mode */

  interrupts();   /* Enable interrupts globally */

  /* Disable hold-repeat keyboard feature by default */
  //Keyboard::get()->hold_repeat_disable ();

  /* IMPORTANT: Real-Time clock is the core component (!)
   *            Most of the other components will NOT work 
   *            without it.
   */
  RTClock::get()->start ();   /* Start real-time clock.*/ 

  SysClock::get()->start ();

  delay(1000);

  /////////
  VibroMotor::get()->start(6, 1000);
  delay(1000);
  /////////

  /*if (card0.begin ())
  {
     /////////
    Vibro::get()->start(5, 1000);
    delay(1000);
    /////////
  }*/


  Leds::get()->on(DS::LED1, 50, 0);
  Leds::get()->on(DS::LED2, 80, 0);

  Sound::get()->start();

  //Tonegen::get()->play_melody(TGP_FUR_ELISE, 1);


  return true;
}

void Driver::stop (void)
{
  noInterrupts();

  set_mode ( OPM_NONE );

  // TODO: implement, if needed
}

void Driver::process (void)
{

  delay (1000);

  key_tone ();

}

#else

bool Driver::begin (void)
{
  delay(500); /* Let power stabilize */

  // Set member variables
  remd_check = false;

  set_mode ( OPM_NONE );

  // Disable SD at very beginning
  Pins::set_out(SS);
  Pins::drive_high(SS);

  // Initialize all subsystems
  RTClock::get()->init();
  SysClock::get()->init();
  Display::get()->init();
  Keyboard::get()->init ();
  AppMenu::get()->init();
  SquareWave::get()->init();
  VibroMotor::get()->init();
  Leds::get()->init();
  Sound::get()->init ();
  REMDetect::get()->init();
  BatteryMonitor::get()->init();
  

#if ((REMD_LOG == REMD_LOG_SERIAL) || BATTMON_TEST)
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

  set_mode ( OPM_NORMAL );    /* Start in normal mode */

  interrupts();   /* Enable interrupts globally */

  /* Disable hold-repeat keyboard feature by default */
  Keyboard::get()->hold_repeat_disable ();

  RTClock::get()->start();   /* Start real-time clock.*/ 

  /* IMPORTANT: System clock is the core component (!)
   *            Most of the other components will NOT work 
   *            without it.
   */
  SysClock::get()->start ();

  disp->enable ();
  disp->version ('P', fw_version(), 1000);


  /* SD-card initialization */
  SdFile::dateTimeCallback(RTClock::fat_datetime);
  SdSpiConfig sd_spi(SS, SHARED_SPI, SD_SCK_MHZ(4));

  while (! card0.begin (sd_spi)) {

    /* handle error */
    disp->message (__disp_msg_no_sd__, 1);

    /* let user insert SD-card and press ON/OFF */
    Keyboard::get()->wait_for_key_press ( KEY_POWER );

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
    snprintf ( msg, 5, __disp_msg_codec_spec__, VS_HW_SPEC );
    disp->message ( msg, 1000 );


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

    A2DConvert::get()->enable ();
    A2DConvert::get()->warm_up ();
    BatteryMonitor::get()->start();

    Sound::get()->start();

  } while ( false );

  Keyboard::get()->clear_events ();

  return success;
}

void Driver::stop (void)
{
  noInterrupts();

  set_mode ( OPM_NONE );

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

        // Exit from menu, show the clock again
        RTClock::get()->show ();
      }

      // Event has been processed by menu 
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

      // Temporarily use this button to stop REM detector
      stop_lucid_dream ();
      
#if REMD_TEST
      
      if ( is_lucid_dreaming () ) {

        stop_lucid_dream ();
      } else {

        start_lucid_dream ();
      }

#elif RECORD_TEST
      String filepath;
      Files::make_next_file_path(filepath, RECORDS_PATH, "REC", "WAV", 5);
      
      auto codec = AudioCodec::get();
      if (codec->get_state() == AudioCodec::STATE_NONE) {

        key_tone (true);

        codec->capture (filepath.c_str());
      } else {

        codec->stop ();

        key_tone ();
      }

#elif TONEGEN_TEST
      if (Tonegen::get()->is_playing () )
        Tonegen::get()->stop ();

      else {
        delay (100);
        Tonegen::get()->play_melody(DS::TGP_KLEINE_NACHTMUSIK, 1);
      }

#elif VIBRO_TEST
      if ( vibro.is_running () ) {
        vibro.stop();

      } else {
        vibro.start(4, 0);

      }
#endif

      break;
    }

  }

  /*
   * Process different tasks
   */
  RTClock::get()->process_task ();
  REMDetect::get()->process_task ();
  AudioCodec::get()->process_task ();

}
#endif

void Driver::reboot_on_key (void)
{
  /* let user press ON/OFF */
  Keyboard::get()->wait_for_key_press (KEY_POWER);

  // and reboot
  soft_reset ();
}

void Driver::remd_start_check (void)
{
  auto remd = REMDetect::get();

  if ( remd_check )
    return;

  if ( !remd->start (remd_callback, this)) {
    return;
  }

  remd_check = true;
}

void Driver::remd_stop_check (void)
{
  auto remd = REMDetect::get();

  if (! remd_check )
    return;

  remd->stop ();
  remd_check = false;
}

void Driver::on_wakeup_timer (void)
{
  start_lucid_dream ();
}

void Driver::on_alarm_clock (void)
{

}

void Driver::on_remd_stable_rem (uint16_t intensity)
{
  auto clk = RTClock::get();

  // TODO: do actions on REM detected
  // серию вспышек и звуков во время сновидения

  // Trigger both eyes with a dream-inducing fade
#if REMD_USE_CONFIG_BRIGHTNESS
  intensity = Config::level_to_percent (config.get_light_hints_brightness ());
#endif

  REMHints::get()->start (intensity);
  /*
  // Parameters: LED, Limit (Intensity), Start, Inc, Period, Duty, Jitter, Count
  uint32_t period = 5000;
  uint8_t count = config.get_light_hints_duration ();
  uint16_t jitter = 0;
  uint8_t duty_cycle = Config::level_to_percent (config.get_hints_duty_cycle ());

  Leds::get()->sync_with_tonegen (true, LED1);

  Leds::get()->fade_rhythmic(LED1, intensity, 5, 2, period, duty_cycle, jitter, count);
  Leds::get()->fade_rhythmic(LED2, intensity, 5, 2, period, duty_cycle, jitter, count);

  Tonegen::get()->beep(period * count, 5, 4, 1);*/

  // The "Gentle Probe"
  // Ceiling: 20%, Start: 5%, Increment: 5%
  // Period: 3.5s, Duty: 70%, Jitter: 4s, Pulses: 5
  //Leds::get()->fade_rhythmic(LED1, 20, 5, 5, 3500, 70, 4000, 5);
  //Leds::get()->fade_rhythmic(LED2, 20, 5, 5, 3500, 70, 4000, 5);

  // The "Non-Rhythmic Breath"
  // Ceiling: 15%, Start: 6%, Increment: 3%
  // Period: 4s, Duty: 80%, Jitter: 10s, Pulses: 4
  //Leds::get()->fade_rhythmic(LED1, 15, 6, 3, 4000, 80, 10000, 4);
  //Leds::get()->fade_rhythmic(LED2, 15, 6, 3, 4000, 80, 10000, 4);

  // The "Single-Step Morning"
  // Ceiling: 12%, Start: 8%, Increment: 2%
  // Period: 3s, Duty: 60%, Jitter: 5s, Pulses: 3
  //Leds::get()->fade_rhythmic(LED1, 12, 8, 2, 3000, 60, 5000, 3);
  //Leds::get()->fade_rhythmic(LED2, 12, 8, 2, 3000, 60, 5000, 3);


  /* Сheck if alarm clock is enabled */
  if (config.get_alarm_clock_enabled ()) {
    
    clk->alarm_clock_set (alarm_clock_callback, this);
  }

}

void Driver::wakeup_timer_toggle (void)
{
  auto clk = RTClock::get();

  if (clk->wakeup_timer_is_set ()) {

    clk->wakeup_timer_cancel ();

  } else {

    clk->wakeup_timer_set (wakeup_timer_callback, this);
  }
}

void Driver::wakeup_timer_quick_set (keybrd_event_t key_event)
{
  auto clk = RTClock::get();
  auto disp = Display::get();

  /* Wake-Up timer */
  if ( clk->wakeup_timer_is_set ()) {

    clk->wakeup_timer_cancel ();
    return;
  }

  clk->hide();
  disp->message ( __disp_msg_set__, 500 );

  if ( key_event & KEY_MINUS ) {
    config.set_wakeup_timer_delay ( 20 );
    disp->time ( 0, 20 );

  } else {
    config.set_wakeup_timer_delay ( WAKEUP_TIMER_DELAY_DEFAULT );
    disp->time ( 0, WAKEUP_TIMER_DELAY_DEFAULT );
  }
  SysClock::get()->wait ( 800 );

  clk->wakeup_timer_set (wakeup_timer_callback, this);
  clk->show();
}

#if REMD_TEST
static volatile int16_t remd_test_ticks = -1;
#define REMD_TEST_SECONDS  60UL
#endif

void Driver::handle_sysclk (void)
{
#if REMD_TEST
  if (remd_test_ticks < 0)
    return;

  remd_test_ticks = (remd_test_ticks + 1) % REMD_TEST_SECONDS;
  if (remd_test_ticks == 0)
  {
    // timer went off
    remd_test_ticks = -1;

    REMDetect::get()->stop_unsafe ();

    Tonegen::get()->beep_unsafe(50, 4, 7, config.get_volume_level ());
  }
#endif
}

void Driver::start_lucid_dream (void)
{
  auto remd = REMDetect::get();

  if ( !remd->start_unsafe (remd_callback, this)) {
    return;
  }

#if REMD_TEST
  /* Set time, stop after REMD_TEST_SECONDS */
  remd_test_ticks = 0;
#endif
}

void Driver::stop_lucid_dream (void)
{
  auto remd = REMDetect::get();

  if ( !remd->is_running ())
    return;

  remd->stop();

#if REMD_TEST
  remd_test_ticks = -1;
#endif
}

bool Driver::is_lucid_dreaming (void) const
{
  return REMDetect::get()->is_running ();
}

void Driver::power_off (void)
{
  auto disp = Display::get();

  RTClock::get()->hide ();
  disp->message (__disp_msg_off__, 500);
  disp->disable ();

  AudioCodec::get()->stop ();
  BatteryMonitor::get()->stop ();
  REMDetect::get()->stop();
  A2DConvert::get()->disable ();	/* disable ADC to save power */

  Sound::get()->stop();

  SysClock::get()->stop (); /* Stop system clock as we don't need to process keyboard */

  set_mode( OPM_PWRSAVE );  /* Set power-save mode */

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

  set_mode( OPM_NORMAL );   /* Set normal power mode */

  SysClock::get()->start ();  /* Start the system clock first */

  disp->enable ();
  disp->message (__disp_msg_on__, 500);

  RTClock::get()->show ();

  A2DConvert::get()->enable ();
  BatteryMonitor::get()->start ();

  Sound::get()->start();

  /* Ignore keyboard events that might happen*/
  Keyboard::get()->clear_events ();
}
