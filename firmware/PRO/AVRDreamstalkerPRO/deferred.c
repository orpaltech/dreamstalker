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

#include <avr/io.h>
#include <util/atomic.h>

#include "deferred.h"
#include "display.h"
#include "menu.h"
#include "dreamstalker.h"
#include "rtclock.h"

/* Peripheral controls (Platform dependent) */

static deferred_context_t d[NUM_DEFERRED];


static void
reset_context(deferred_context_t *pctx);

/*-----------------------------------------------------------------------*/
/* Deferred Execution Functions								 			 */
/*-----------------------------------------------------------------------*/

void deferred_init (void)
{
	int i;

	for (i=0; i<NUM_DEFERRED; i++)
	{
		d[i].reset = reset_context;

		d[i].reset(&d[i]);
	}
}

int deferred_run (int i, pfn_deferred_handler handler)
{
	if (deferred_is_running(i))
		return 0;

	d[i].handler = handler;
	return 1;
}

int deferred_is_running (int i)
{
	return d[i].handler != (pfn_deferred_handler)0;
}

void deferred_isr (void)
{
	int i;

	for (i=0; i<NUM_DEFERRED; i++)
	{
		if (deferred_is_running(i)) {
			d[i].ticks++;
			d[i].handler(&d[i]);
		}
	}
}

void reset_context(deferred_context_t *pctx)
{
	pctx->ticks = 0;
	pctx->handler = (pfn_deferred_handler)0;
}

/*-----------------------------------------------------------------------*/
/* Task-specific deferred handlers										 */
/*-----------------------------------------------------------------------*/

void deferred_clear_wakeup_timer(deferred_context_t *pctx)
{
	if (pctx->ticks == 1)
	{
		// first run
		set_invalid_wakeup_timer_delay();

		rtc_hide();

		disp_text(MENU_WAKEUP_TIMER_SETUP);
	}
	else if (pctx->ticks == 500)
	{
		disp_wakeup_timer_delay();
	}
	else if (pctx->ticks == 1000)
	{
		reset_context(pctx);
		rtc_show();
		// The wake-up timer is reset to 0 and turned off.
	}
}

