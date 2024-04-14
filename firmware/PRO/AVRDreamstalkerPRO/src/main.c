/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2024	ORPAL Technologies, Inc.
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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include <util/delay.h>

#include <avr/io.h>
#include <avr/fuse.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>
#include <compat/ina90.h>

#include "input/ds_keybrd.h"
#include "core/adc_avr.h"
#include "core/spi_avr.h"
#include "core/uart_avr.h"
#include "core/dbg_avr.h"
#include "display/ds_display.h"
#include "display/ds_disp_msgs.h"
#include "fatfs/ff.h"
#include "fatfs/diskio.h"
#include "sound/ds_sound.h"

#include "ds_deferred.h"
#include "ds_strobe.h"
#include "ds_batmon.h"
#include "ds_menu.h"
#include "ds_leds.h"
#include "ds_vibro.h"
#include "ds_config.h"
#include "ds_remd.h"
#include "ds_rtclk.h"
#include "ds_sdcard.h"
#include "ds_util.h"
#include "shared_file.h"


/*
 *-----------------------------------------------------------------------
 * Pin configurations
 *-----------------------------------------------------------------------
 *	DDR		PORT
 *	 0		 0		- input, high impedance
 *	 0		 1		- input, pulled up
 *	 1		 0		- output, driven low
 *	 1		 1		- output, driven high
 *-----------------------------------------------------------------------
 */


FUSES =
{
#if defined (__AVR_ATmega128__)
	.low = (FUSE_SUT0 & FUSE_CKSEL3 & FUSE_CKSEL1 & FUSE_CKSEL0),
	.high = (FUSE_SPIEN & FUSE_JTAGEN & FUSE_OCDEN),
	.extended = 0xFF,

#elif defined (__AVR_ATmega1281__)
	.low = (FUSE_SUT1 & FUSE_SUT0 & FUSE_CKSEL3 & FUSE_CKSEL2 & FUSE_CKSEL0),
	.high = (FUSE_SPIEN & FUSE_JTAGEN & FUSE_OCDEN),
	.extended = 0xFF,

#endif
};


/*-----------------------------------------------------------------------*\
 * Task-specific deferred handlers
\*-----------------------------------------------------------------------*/

static 
void test_app_leds()
{
	/* Set pins to input mode */
	//DDRE &= ~(_BV(DDE3) | _BV(DDE4));
	DDRE |= (_BV(DDE3) | _BV(DDE4));
	//PORTE &= ~(_BV(PE3) | _BV(PE4));
	PORTE |= (_BV(PE3) | _BV(PE4));


	while (true) {
		_delay_ms(5000);
		//DDRE ^= (_BV(DDE3) | _BV(DDE4));
		PORTE ^= (_BV(PE3) | _BV(PE4));

		_NOP();
	}
}

static 
void test_app_display()
{
	disp_init();

	while (true) {
		disp_test_off();
		_delay_ms(5000);
		disp_test_on();
		_delay_ms(5000);
		_NOP();
	}
}

static 
void test_app_tones()
{
	//rtc_init ();
	sound_init();
	//config_init();
	//sound_update();
	sd_card_cs_init();
	//codec_init();
	//rtc_start();

	speaker_on();
	set_music_volume_level(8);

	tonegen_melody(100);

	hang();
}

static
void deferred_codec_task(deferred_context_t *pd);

static
void deferred_clear_wakeup_timer(deferred_context_t *pd);


/*-----------------------------------------------------------------------*\
 * main()
\*-----------------------------------------------------------------------*/

int main (void)
{
	int ret; 
	bool error = false;
	char msg[ 5 ];
	keybrd_event_t key_event;

	sei();						/* Enable interrupts globally */

	//test_app_leds();
	//test_app_display();
	//test_app_tones();

	// Configuration code, is executed ONCE

	avr_dbg_init ();
	rtc_init ();
	remd_init ();
	strobe_init ();
	leds_init ();
	vibro_init ();
	deferred_init ();
	disp_init ();
	batmon_init ();
	sound_init ();
	keybrd_init ();
	menu_init ();

	disp_enable ();			/* Enable system display */

	adc_enable ();			/* Enable ADC subsystem */
	adc_warm_up ();

	//uart0_open( UART_BR_250K, UART_MODE_TX );

	/* NOTE: This is the core component and many others 
	 *		won't work without it.
	 */
	rtc_start ( RTC_OPM_DEFAULT );	/* Start real-time clock.*/ 

	disp_version ( 'F', fw_version(), 1000 );

	/* IMPORTANT: This must be called prior codec_init() to avoid 
	 *			conflicts with SD card on SPI bus 
	 */
	sd_card_cs_init ();

	/* Disable hold-repeat keyboard feature */
	keybrd_hold_repeat_disable ();

	do {
		/* NOTE: Codec MUST be initialized prior SD-card 
		 *		due to the SPI line conflict.
		 */
		ret = codec_init ();
		if ( ret == 0 )	{
			// handle error
			disp_msg ( __disp_msg_codec_error__, 1 );

			error = true;
			break;
		}

		/* Display codec version */
		snprintf ( msg, 5, __disp_msg_codec_version__, ret );
		disp_msg ( msg, 1000 );

		/* SD-card initialization */
		while ( true ) {

			if (! sd_card_init ()) {

				/* handle error */
				disp_msg ( __disp_msg_no_sd__, 1 );

				/* let user insert SD-card and press ON/OFF */
				do {
					key_event = keybrd_get_event ();
					_NOP ();
				} while ( key_event != KEY_POWER );

				/* try SD-card again...*/
				disp_msg ( __disp_msg_all_dots__, 400 );

			} else {
				/* success */
				disp_msg ( __disp_msg_sd_0__, 400 );
				break;
			}
		}

		/* NOTE: SD-card might be required for the patching, 
		 *		therefore it must be called AFTER SD-card init
		 */
		if ( !codec_process_patches ()) {

			/* handle error */
			disp_msg ( __disp_msg_codec_error__, 1 );

			error = true;
			break;
		}
		
		config_init ();

		/* NOTE: The following initialization require 
		 *		the config to be loaded prior 
		 */
		/* ... */

		rtc_show ();

		batmon_start ();

		sound_start ();

	} while( false );

	keybrd_clear_events ();

	/* Main application loop */
	while ( !error ) {

		/* check to see if user has pressed a button */
		key_event = keybrd_get_event ();

		if ( key_event != KEY_NONE )
			tonegen_beep ( 100, 3, 6 );

		if ( menu_is_active () && ( key_event != KEY_NONE )) {

			ret = menu_handle( key_event );
			if ( ret & MENU_HANDLED ) {

				if ( ret & MENU_EXIT ) {
					/* exit from menu, show the clock again */
					rtc_show ();
				}

				/* event has been processed by menu */
				key_event = KEY_NONE;
			}
		}

		switch ( key_event ) {

			case ( KEY_ENTER | KEY_PLUS | KEYBRD_HOLD ): {

				deferred_start ( 0, deferred_clear_wakeup_timer );

				break;
			}

			case ( KEY_SELECT | KEYBRD_HOLD ): {

				rtc_hide ();

				menu_enter ();

				break;
			}

			case ( KEY_POWER | KEYBRD_HOLD ): {

				power_off ();

				break;
			}

			case ( KEY_CHECK ): {

				/*leds_pulse(LED2, 100, 10000, 1000, 40);

				leds_pulse(LED1, 10, 10000, 1000, 40);

				tonegen_melody(5);*/



				/*if (remd_is_running()) {

					remd_stop();

				} else {

					remd_start();
				}*/

				if ( codec_get_status () != CODEC_IDLE ) {
					codec_stop ();
				} else {

					deferred_start ( 1, deferred_codec_task );
				}

				break;
			}

			case ( KEY_ENTER ): {

				/*if (codec_get_status() == CODEC_IDLE)
				{
					codec_capture ("record.wav", 0);
					rtc_hide();
					disp_clear();
				}
				else if (codec_get_status() == CODEC_CAPTURE)
				{
					codec_stop();
					rtc_show();
				}*/
				break;
			}

		}

		codec_process_task ();

		_NOP ();

	} /* End of application loop */

	/* TODO: cleanup */

	return error;
}

/*-----------------------------------------------------------------------*\
 * Task-specific deferred handlers
\*-----------------------------------------------------------------------*/

void deferred_clear_wakeup_timer(deferred_context_t *pd)
{
	if (pd->ticks == 1)	{
		// first run
		set_invalid_wakeup_timer_delay ();

		rtc_hide ();

		disp_text ( MENU_WAKEUP_TIMER_SETUP );
	}
	else if (pd->ticks == rtc_msec_to_ticks(500)) {
		disp_wakeup_timer_delay ();
	}
	else if (pd->ticks == rtc_msec_to_ticks(1000)) {
		deferred_stop (pd);

		rtc_show ();
		// The wake-up timer is reset to 0 and turned off.
	}
}

void deferred_codec_task(deferred_context_t *pd)
{
	if (pd->ticks == 500) {

		//char newfile[50];
					
		/* start new recording */
		//make_next_file_path(newfile, 50, "/SD/SYSTEM/RECORDS", "RECORD", "WAV");
		//codec_capture (newfile);

		codec_playback("/sd/beyond.mp3");

		deferred_stop(pd);
	}
}
