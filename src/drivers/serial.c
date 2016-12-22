#include "serial.h"

#define PORT 0x3f8

void init_serial() {
	byte_out(PORT + 1, 0x00); //disable interrupts
	byte_out(PORT + 3, 0x80); //set DLAB
	byte_out(PORT + 0, 0x03); //set BAUD (38400)
	byte_out(PORT + 1, 0x00); //high bits of BAUD
	byte_out(PORT + 3, 0x03); //reset DLAB, 8 bits, no parity, one stop bit
	byte_out(PORT + 2, 0xc7); //enable FIFO, clear them, with 14-byte threshold
	byte_out(PORT + 4, 0x0b); //IRQs enabled, rts/dsr set
}

/**
 * Returns whether or not a byte has been received
 */
int serial_received() {
	return byte_in(PORT + 5) & 1;
}

/**
 * Reads a single byte from the seriual port
 * will hold while waiting for the port to have data
 */
unsigned char serial_in() {
	while (!serial_received())
		;

	return byte_in(PORT);
}

/**
 * Checks whether or not the port is available for
 * transmission
 * hangs
 */
int is_transmit_empty() {
	return byte_in(PORT+5) & 0x20;
}

/**
 * Writes a single byte to the serial port
 */
void serial_out(unsigned char a) {
	while(!is_transmit_empty())
		;

	byte_out(PORT, a);
}

/**
 * writes a string to the serial port
 */
void serial_puts(char *str) {
	while (*str)
		serial_out(*str++);
	serial_out('\n');
	serial_out('\r');
}
