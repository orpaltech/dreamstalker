/*
 * uart.h
 *
 * @date 2024/03/10
 * @author Sergey Suloev
 */

#include <termios.h>
#include <unistd.h>
#include <stdbool.h>

#ifndef SRC_UART_H_
#define SRC_UART_H_

#define DEBUG

extern int uart_sigint_fired;

struct uart_device {
	char* filename;
	int rate;
	int fd;
	struct termios *tty;
};

int uart_start(struct uart_device* dev, bool canonic);
int uart_writen(struct uart_device* dev, char *buf, size_t buf_len);
int uart_writes(struct uart_device* dev, char *string);
int uart_readn(struct uart_device* dev, char *buf, size_t buf_len);
int uart_reads(struct uart_device* dev, char *buf, size_t buf_len);
void uart_stop(struct uart_device* dev);

#endif /* SRC_UART_H_ */
