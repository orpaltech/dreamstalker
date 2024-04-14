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

#include <string.h>
#include <avr/io.h>
#include <util/atomic.h>

#include "ds_deferred.h"


/*-----------------------------------------------------------------------*/

static volatile deferred_context_t dd[MAX_DEFERRED];


/*-----------------------------------------------------------------------*/
/* Deferred Execution Functions								 			 */
/*-----------------------------------------------------------------------*/

void deferred_init (void)
{
	memset(dd, 0, MAX_DEFERRED * sizeof(deferred_context_t));
}

bool deferred_start (int i, pfn_deferred_handler handler)
{
	if (deferred_is_running(i))
		return false;

	dd[i].handler = handler;
	dd[i].ticks = 0;
	dd[i].flags = 0;

	return true;
}

bool deferred_is_running (int i)
{
	return dd[i].handler != (pfn_deferred_handler)NULL;
}

void deferred_stop(deferred_context_t *pd)
{
	pd->handler = (pfn_deferred_handler)NULL;
}

void deferred_isr (void)
{
	int i;

	for (i=0; i<MAX_DEFERRED; i++) {
		if (deferred_is_running(i)) {
			dd[i].ticks++;
			dd[i].handler(&dd[i]);
		}
	}
}
