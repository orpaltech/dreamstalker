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

#ifndef _DS_DEFERRED_DEFINED
#define _DS_DEFERRED_DEFINED

#include <stdbool.h>

/* NOTE: Keep the requested minimum in order to save memory */
#define MAX_DEFERRED	2

#ifdef __cplusplus
extern "C" {
#endif

typedef struct s_deferred_context deferred_context_t;
typedef void (*pfn_deferred_handler)(deferred_context_t *);

struct s_deferred_context {
	pfn_deferred_handler handler;
	uint32_t ticks;
	uint8_t flags;
};

/*-----------------------------------------------------------------------*/
/* Deferred Execution Functions									 		 */
/*-----------------------------------------------------------------------*/

void deferred_init (void);

bool deferred_start (int slot, pfn_deferred_handler);
void deferred_stop (deferred_context_t *);
bool deferred_is_running (int slot);

/* NOTE: only for use in RTC ISR. Do not call it directly! */
void deferred_isr (void);

/* Task-specific handlers */
// Example:
//	void deferred_task(deferred_context_t *);

#ifdef __cplusplus
}
#endif

#endif // _DS_DEFERRED_DEFINED
