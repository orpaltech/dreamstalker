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

#include "ds_driver.h"

/*-----------------------------------------------------------------------*/
// put function declarations here:

/*-----------------------------------------------------------------------*/
void setup()
{
  auto drv = ds::Driver::get();

  // put your setup code here, to run once

  if (! drv->init ())
    return;

  if (! drv->start () )
  {
    // Handle the critical error
    drv->reboot_on_key ();
  }
}

/*-----------------------------------------------------------------------*/
void loop()
{
  auto drv = ds::Driver::get();

  drv->process ();

  /* End of app loop */
  _NOP ();
}

