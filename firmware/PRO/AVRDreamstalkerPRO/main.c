/*
 * This file is part of the AVR Dreamstalker software
 * (https://github.com/orpaltech/dreamstalker).
 *
 * Copyright (c) 2013-2020	ORPAL Technologies, Inc.
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
#include <compat/ina90.h>

#include "batmon.h"
#include "oddebug.h"

//#include "timers.h"
#include "strobe.h"
#include "sound/sound.h"
#include "display.h"
#include "input/keybrd.h"
#include "input/inputevent.h"
#include "menu.h"
#include "leds.h"
#include "vibro.h"
#include "sdcard.h"
#include "fatfs/ff.h"
#include "fatfs/diskio.h"
#include "core/adc_avr.h"
#include "deferred.h"
#include "dreamstalker.h"
#include "remd.h"
#include "rtclock.h"


//DDR PORT
// 0    0  - input, high impedance
// 0    1  - input, pulled up
// 1    0  - output, driven low
// 1    1  - output, driven high



/*
FUSES =
{
	.low = (FUSE_SUT0 & FUSE_CKSEL3 & FUSE_CKSEL1 & FUSE_CKSEL0),
	.high = (FUSE_BOOTSZ0 & FUSE_BOOTSZ1 & FUSE_EESAVE & FUSE_SPIEN & FUSE_JTAGEN & FUSE_OCDEN),
	.extended = 0xFF,
};*/


// this wrapper function calls _delay_ms with a known value of 1
// if you call _delay_ms(variable) then the floating point library
// is going to be included and your output file gets much larger
void delay_1ms(uint16_t ms) {
    uint16_t i;
    for(i=0;i<ms;i++)
    	_delay_ms(1.0);
}

static
void hang (void) {
	while ( 1 )
		_NOP( ) ;
}

int main(int argc, char *argv[])
{
	int ret;
	char msg[10];
	INPUT_EVENT_BUFFER_TYPE keyEvent;

	odDebugInit();

	// Configuration code, is executed ONCE

	// Configure PORTE as output
	//DDRE = 0;//((1<<DDE3) | (1<<DDE4));
	PORTE = 0xFF;//~( (1 << PE3) | (1 << PE4) );

	sei();

	rtc_init();
	adc_init();
	remd_init();
	//timers_init();
	strobe_init();
	leds_init();
	vibro_init();
	keybrd_init();
	deferred_init();
	config_init();
	disp_init();
	tonegen_init();
	menu_init();

	disp_version('F', fw_version(), 1000);

	input_set_hold_repeat(0);	/* switch-off hold-repeat feature */

	do
	{
		if (batmon_get_battery_level() < BATTERY_75_FULL) {
			disp_msg("btLo", 1);

			break;
		}

		batmon_start();

		/* Codec MUST be initialized prior SD-card
		 * because of the SPI line conflict
		 */
		ret = codec_init();
		if (ret == 0) {
			// handle error
			disp_msg("CoEr", 1);

			break;
		}

		// codec version
		snprintf(msg, 5, "Co%02u", ret);
		disp_msg(msg, 1000);

		/* SD-card initialization */
		while ( 1 )
		{
			if (sdcard_init(0)==0)
			{
				// handle error
				disp_msg("noSd", 1);
				while ((keyEvent = input_get_event()) !=KEY_ONOFF)
					_NOP( );
				disp_msg(" . . . .", 400);
			}
			else
			{
				disp_msg("Sd 0", 400);
				break;
			}
		}

		/* Patches require a SD-card access, i.e. must be called AFTER SD-card init */
		ret = codec_patch();
		if (ret == 0) {
			// handle error
			disp_msg("CoEr", 1);
			break;
		}

		rtc_show();

	} while( 0 );

	input_clear_events();

	speaker_on();

	/* application code */
	while( 1 )
	{
		// check to see if the user has pressed a button
		keyEvent = v_InputEventCount == 0 ? KEY_NONE : input_get_event();

		if (keyEvent != KEY_NONE)
		{
			tonegen_beep(80);
		}

		if (menu_is_active() && keyEvent != KEY_NONE)
		{
			ret = menu_process(keyEvent);
			if (ret & MENU_HANDLED)
			{
				if (ret & MENU_EXIT)
				{
					rtc_show();
				}

				// event has been processed by menu
				keyEvent = KEY_NONE;
			}
		}

		switch (keyEvent) {
			case (KEY_ENTER | KEY_PLUS | INPUT_HOLD):
			{
				deferred_run(0, deferred_clear_wakeup_timer);

				break;
			}

			case (KEY_SELECT | INPUT_HOLD):	// Enter main menu loop
			{
				rtc_hide();

				menu_enter();

				break;
			}

			case (KEY_ONOFF | INPUT_HOLD):
			{
				pwroff_cycle();

				break;
			}

			case KEY_CHECK:
			{
				leds_pulse(LED2, 100, 10000, 1000, 40);

				leds_pulse(LED1, 10, 10000, 1000, 40);

				break;
			}
/*
			case KEY_ENTER:
			{
				if (codec_get_status() == CODEC_IDLE)
				{
					codec_capture ("record.wav", 0);
					rtc_hide();
					disp_clear();
				}
				else if (codec_get_status() == CODEC_CAPTURE)
				{
					codec_stop();
					rtc_show();
				}
				break;
			}*/
		}

		codec_process_task();

		_NOP( );

	}

	sdcard_uninit();

	batmon_stop();

	return 0;
}

