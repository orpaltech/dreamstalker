/*
 * main.c
 *
 * @date 2024/03/10
 * @author Sergey Suloev
 */

#include <stdio.h>
#include <fcntl.h>
#include <inttypes.h>
#include <limits.h>
#include <signal.h>
#include <string.h>
#include <termios.h>
#include "uart.h"

#define SAMP_SIZE	2
#define MAX_READ_SIZE	(SAMP_SIZE * 100)

static volatile int stop_reading = 0;
static bool dump_samples = false;

void sigint_handler(int dummy) {
	printf("\n\nStopping REMD reader ...\n");
	stop_reading = 1;
	uart_sigint_fired = 1;
}

int main(int argc, char* argv[]) {
	struct uart_device dev;
	int output_fd = -1;
	int ret;
	char filename[PATH_MAX];

	signal(SIGINT, sigint_handler);

	if (argc > 1) {
		/* Try to open output file for write */
		snprintf(filename, PATH_MAX, "%s", argv [1]);

		/* Create output file descriptor */
		output_fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);
		if (output_fd < 0){
			printf("\nERROR: Failed to open output file: %d\n", output_fd);
			return 1;
		}
	}

	dev.filename = "/dev/rfcomm0";
	dev.rate = 250000;

	ret = uart_start(&dev, false);
	if (ret) {
		goto exit0;
	}

	uint8_t read_data[MAX_READ_SIZE];
	uint8_t *ptr = read_data;
	int rd_len_in = MAX_READ_SIZE;
	int rd_len, num_smpls;
	unsigned int sample;
	char samp_hex[5];
	unsigned int hi, lo;

	printf("\n *** REMD reader *** \n\n");
	uart_writes(&dev, "Hello, here's REMD reader\r\n");

	while (!stop_reading) {
		printf("Reading %d bytes...\n", rd_len_in);
		rd_len = uart_readn(&dev, (char *)ptr, rd_len_in);

		if (rd_len > 0) {
			printf("%d bytes read.\n", rd_len);

			num_smpls = 0;

			ptr = read_data; /* Always parse from start */
			int old_len = MAX_READ_SIZE - rd_len_in;
			rd_len += old_len;

			while (rd_len >= 2) {
				lo = ptr[0];
				hi = ptr[1];
				sample = lo | (hi << 8);
				snprintf(samp_hex, 5, "%04X", sample);

				if (dump_samples)
					printf("sample: %s\n", samp_hex);

				if (output_fd > 0) {
					int wr_len = write (output_fd, samp_hex, 4);
					if (wr_len != 4){
						/* Write error */
						printf("write failed: %d\n", wr_len);
						ret = 1;
						goto exit1;
					}
				}
				ptr	+= 2;
				rd_len	-= 2;

				++num_smpls; /* inc sample count */
			}

			printf("written %d samples\n", num_smpls);

			if (rd_len > 0) {
				memmove(read_data, ptr, rd_len);
				ptr = &read_data[rd_len];
				rd_len_in = MAX_READ_SIZE-rd_len;
			} else {
				ptr = read_data;
				rd_len_in = MAX_READ_SIZE;
			}
		}
	}

exit1:
	uart_stop(&dev);
exit0:
	close (output_fd);

	printf("\n *** Goodbye! *** \n\n");

	return ret;
}
