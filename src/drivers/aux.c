/**
 * @file aux.h
 * @brief contains functions that will make other device drivers easier to write
 *
 * @author Forest Thomas
 * @data 12/14
 */

unsigned char byte_in(unsigned short port) {
	unsigned char result;
	__asm__("in %%dx, %%al" : "=a" (result) : "d" (port));
	return result;
}

void byte_out(unsigned short port, unsigned char data) {
	__asm__("out %%al, %%dx" : : "a" (data), "d" (port));
}

unsigned short word_in(unsigned short port) {
	unsigned char result;
	__asm__("in %%dx, %%ax" : "=a" (result) : "d" (port));
	return result;
}

void word_out(unsigned short port, unsigned short data) {
	__asm__("out %%ax, %%dx" : : "a" (data), "d" (port));
}
