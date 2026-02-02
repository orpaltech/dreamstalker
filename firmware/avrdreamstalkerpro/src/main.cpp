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

#include "ds_driver.h"
#include "ds_util.h"

/*-----------------------------------------------------------------------*/
File shared_fp;


/*-----------------------------------------------------------------------*/
// put function declarations here:

/*-----------------------------------------------------------------------*/
void setup()
{
  auto drv = DS::Driver::get();

  // put your setup code here, to run once

  drv->begin ();

  if (! drv->start () )
  {
    // Handle the critical error
    drv->reboot_on_key ();
  }
}

/*-----------------------------------------------------------------------*/
void loop()
{
  auto drv = DS::Driver::get();

  drv->process ();

  /* End of app loop */
  _NOP ();
}

