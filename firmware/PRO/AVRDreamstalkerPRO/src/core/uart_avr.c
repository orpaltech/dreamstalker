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
#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/power.h>
#include <util/atomic.h>

#include "uart_avr.h"
#include "ds_util.h"


#if !defined( UART_RX0_BUFFER_SIZE )
#	define UART_RX0_BUFFER_SIZE 8
#endif

#if !defined( UART_TX0_BUFFER_SIZE )
#	define UART_TX0_BUFFER_SIZE 8
#endif

/*-----------------------------------------------------------------------*/
typedef struct s_uart_context {
	/* RX section */
	uint8_t rx_buf[UART_RX0_BUFFER_SIZE];
	uint8_t rx_head;
	uint8_t rx_tail;
	uint8_t rx_last_error;
	/* TX section */
	uint8_t tx_buf[UART_TX0_BUFFER_SIZE];
	uint8_t tx_head;
	uint8_t tx_tail;
} uart_context_t;

static volatile uart_context_t u0;

/*-----------------------------------------------------------------------*/
//	UART baudrate setting helpers
/*-----------------------------------------------------------------------*/
static void uart_set_br ( uint8_t ubrr_hi, uint8_t ubrr_lo, int use2x )
{
	UBRR0L = ubrr_lo;
	UBRR0H = ubrr_hi;

	if ( use2x )
		UCSR0A |= _BV(U2X0);
	else
		UCSR0A &= ~_BV(U2X0);
}

static void uart_set_9600(void)
{
#define BAUD 9600
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

static void uart_set_38400(void)
{
#undef BAUD
#define BAUD 38400
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

static void uart_set_115200(void)
{
#undef BAUD
#define BAUD 115200
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

static void uart_set_230400(void)
{
#undef BAUD
#define BAUD 230400
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

static void uart_set_250K(void)
{
#undef BAUD
#define BAUD 250000
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

static void uart_set_500K(void)
{
#undef BAUD
#define BAUD 500000
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

static void uart_set_1M(void)
{
#undef BAUD
#define BAUD 1000000
#include <util/setbaud.h> 
	uart_set_br(UBRRH_VALUE, UBRRL_VALUE, USE_2X);
}

/*-----------------------------------------------------------------------*/
// code to execute when UART0 interrupts
/*-----------------------------------------------------------------------*/
ISR(USART0_RX_vect)		/* RX Complete */
{
    uint16_t tmphead;
    uint8_t data;
    uint8_t stat;
    uint8_t lastRxError;

    /* read UART status register and UART data register */
    stat  = UCSR0A;
    data = UDR0;

    lastRxError = ( stat & (_BV(FE0)|_BV(DOR0)) );

    /* calculate buffer index */
    tmphead = ( u0.rx_head + 1 ) % UART_RX0_BUFFER_SIZE;

    if ( tmphead == u0.rx_tail ) {
        /* error: receive buffer overflow */
        lastRxError = UART_BUFFER_OVERFLOW >> 8;
    } else {
        /* store new index */
        u0.rx_head = tmphead;
        /* store received data in buffer */
        u0.rx_buf[ tmphead ] = data;
    }

    u0.rx_last_error = lastRxError;
}

ISR(USART0_UDRE_vect)	/* UDR Empty */
{
    uint16_t tmptail;

    if ( u0.tx_head != u0.tx_tail ) {

        /* calculate and store new buffer index */
        tmptail = ( u0.tx_tail + 1 ) % UART_TX0_BUFFER_SIZE;
        u0.tx_tail = tmptail;

        /* get one byte from buffer and write it to UART */
		UDR0 = u0.tx_buf[ tmptail ];

    } else {
        /* tx buffer empty, disable UDRE interrupt */
		UCSR0B &= ~_BV(UDRIE0);
    }
}

bool uart0_open ( uart_baudrate_t baudrate, uart_mode_t mode ) 
{
	/* Reset status registers */
	UCSR0A = 0;
	UCSR0B = 0;
	/* Enable receiver and(or) transmitter */
	if ( mode & UART_MODE_RX )	UCSR0B |= _BV(RXEN0);
	if ( mode & UART_MODE_TX )	UCSR0B |= _BV(TXEN0);

    /* Set baud rate */
	switch ( baudrate ) {
	case UART_BR_1M:
		uart_set_1M ();
		break;
	case UART_BR_500K:
		uart_set_500K ();
		break;
	case UART_BR_250K:
		uart_set_250K ();
		break;
	case UART_BR_230400:
		uart_set_230400 ();
		break;
	case UART_BR_115200:
		uart_set_115200 ();
		break;
	case UART_BR_38400:
		uart_set_38400 ();
		break;
	case UART_BR_9600:
		uart_set_9600 ();
		break;
	}

	/* Set frame format: */
	/*	8-bit character, 1 stop bit, No parity, */
	/* Also sets UART to asynchronous mode */
	UCSR0C = (_BV(UCSZ01) | _BV(UCSZ00));

	u0.rx_head = 0;
	u0.rx_tail = 0;
	u0.tx_head = 0;
	u0.tx_tail = 0;

    return true;
}

void uart0_send ( uint8_t data )
{
	uint16_t tmphead;

	tmphead = ( u0.tx_head + 1 ) % UART_TX0_BUFFER_SIZE;

	/* wait for free space in buffer */
	while ( tmphead == u0.tx_tail )
	;

	u0.tx_buf[ tmphead ] = data;
	u0.tx_head = tmphead;

	/* Enable UDR Empty Interrupt */
	UCSR0B |= _BV(UDRIE0);
}

void uart0_send_buf ( const uint8_t *data, uint8_t count )
{
	uint16_t idx = 0;

	while ( idx < count ) {
		uart0_send ( data[ idx ] );
		idx++;
	}
}

uint16_t uart0_read ( void )
{
	uint16_t tmptail;
	uint8_t data;

	ATOMIC_BLOCK ( ATOMIC_RESTORESTATE ) {
		if ( u0.rx_head == u0.rx_tail ) {
			return UART_NO_DATA;   /* no data available */
		}
	}

	/* calculate / store buffer index */
	tmptail = ( u0.rx_tail + 1 ) % UART_RX0_BUFFER_SIZE;
	u0.rx_tail = tmptail;

	/* get data from receive buffer */
	data = u0.rx_buf[ tmptail ];

	return ( ( (uint16_t)u0.rx_last_error ) << 8 ) | data;
}

uint16_t uart0_data_ready ( void )
{
	uint16_t ret;

	ATOMIC_BLOCK ( ATOMIC_RESTORESTATE ) {
		ret = ( UART_RX0_BUFFER_SIZE + u0.rx_head - u0.rx_tail ) % UART_RX0_BUFFER_SIZE;
	}
	return ret;
}

/*
 * Flush bytes waiting in the receive buffer. 
 * Actually ignores them.
 */
void uart0_flush ( void )
{
	ATOMIC_BLOCK ( ATOMIC_RESTORESTATE ) {
		u0.rx_head = u0.rx_tail;
	}
}

void uart0_close ( void ) 
{
	/* Disable UART receiver and transmitter */
	UCSR0B &= ~(_BV(RXEN0) | _BV(TXEN0));

	/* Flush hardware buffer */
	uint8_t dummy;
	while( UCSR0A & _BV(RXC0) ) 
		dummy = UDR0;
}
