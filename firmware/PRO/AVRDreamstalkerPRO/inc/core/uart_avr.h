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

#ifndef _AVR_UART_DEFINED
#define _AVR_UART_DEFINED

#include <stdint.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    UART_BR_9600    = 9600,
    UART_BR_38400   = 38400,
    UART_BR_115200  = 115200,
    UART_BR_230400  = 230400,
    UART_BR_250K    = 250000,
    UART_BR_500K    = 500000,
    UART_BR_1M  = 1000000,
} uart_baudrate_t;

typedef enum {
    UART_MODE_RX    = 1UL,
    UART_MODE_TX    = 2UL,
    UART_MODE_ALL   = (UART_MODE_RX | UART_MODE_TX)
} uart_mode_t;


/*
** high byte error return code of uart0_read()
*/
#define UART_FRAME_ERROR      0x0800              /**< Framing Error by UART       */
#define UART_OVERRUN_ERROR    0x0400              /**< Overrun condition by UART   */
#define UART_BUFFER_OVERFLOW  0x0200              /**< receive ringbuffer overflow */
#define UART_NO_DATA          0x0100              /**< no data available to receive   */

/*
 * UART functions
 */
bool uart0_open (uart_baudrate_t baudrate, uart_mode_t mode);
void uart0_close (void) ;

void uart0_send (uint8_t data);
void uart0_send_buf (const uint8_t *data, uint8_t count);
uint16_t uart0_read (void);
uint16_t uart0_data_ready(void);

#ifdef __cplusplus
}
#endif

#endif // _AVR_UART_DEFINED