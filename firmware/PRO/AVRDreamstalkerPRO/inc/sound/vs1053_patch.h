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

//{
    /*revision*/
    0x81, 0x88,
    /* patch count */
    0x01, 0x00,

    /* --> patch "IMA ADPCM Encoder Fix" */
    /* instr count */
    0x44, 0x00,
    /* commands */
    0x07, 0x50, 0x80,
    0x06, 0x00, 0x00,
    0x06, 0x90, 0x17,
    0x06, 0x00, 0xf4,
    0x06, 0x00, 0x54,
    0x06, 0x00, 0x00,
    0x06, 0x10, 0x0a,
    0x06, 0x00, 0xf4,
    0x06, 0x00, 0x56,
    0x06, 0x80, 0xb0,
    0x06, 0x24, 0x00,
    0x06, 0x07, 0x00,
    0x06, 0x57, 0x92,
    0x06, 0x00, 0x3f,
    0x06, 0x24, 0x00,
    0x06, 0x30, 0x00,
    0x06, 0x97, 0x02,
    0x06, 0x00, 0x3f,
    0x06, 0x24, 0x00,
    0x06, 0x00, 0x00,
    0x06, 0x4d, 0x00,
    0x06, 0x14, 0x00,
    0x06, 0x8f, 0x95,
    0x06, 0x00, 0x00,
    0x06, 0x4e, 0x1b,
    0x06, 0x0f, 0x28,
    0x06, 0x00, 0xe1,
    0x06, 0x06, 0x00,
    0x06, 0x16, 0x20,
    0x06, 0x00, 0x2a,
    0x06, 0xce, 0x17,
    0x06, 0x12, 0x3e,
    0x06, 0x17, 0xb8,
    0x06, 0x14, 0x3e,
    0x06, 0x12, 0xf8,
    0x06, 0x01, 0x3e,
    0x06, 0x11, 0xb8,
    0x06, 0x07, 0x00,
    0x06, 0x17, 0x97,
    0x06, 0x20, 0x00,
    0x06, 0xd2, 0xff,
    0x06, 0x30, 0x00,
    0x06, 0xd1, 0x11,
    0x06, 0x11, 0x31,
    0x06, 0x24, 0x80,
    0x06, 0x04, 0x37,
    0x06, 0x24, 0xc0,
    0x06, 0x81, 0x3b,
    0x06, 0x24, 0x80,
    0x06, 0x01, 0x31,
    0x06, 0x24, 0x80,
    0x06, 0x81, 0x3b,
    0x06, 0x24, 0x80,
    0x06, 0x04, 0x3f,
    0x06, 0x24, 0xc0,
    0x06, 0x08, 0x28,
    0x06, 0x00, 0x48,
    0x06, 0xf1, 0x36,
    0x06, 0x11, 0x98,
    0x06, 0x14, 0x28,
    0x06, 0x91, 0x9c,
    0x06, 0x00, 0x00,
    0x06, 0x4d, 0x00,
    0x06, 0x14, 0x28,
    0x06, 0x40, 0x99,
    0x06, 0x3f, 0x00,
    0x06, 0x13, 0x00,
    0x0a, 0x50, 0x00,
    /* <-- patch "IMA ADPCM Encoder Fix" */
//}
