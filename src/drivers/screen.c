/**
 * @file screen.c
 * @brief Contains functions for manipulating a text based screen
 *
 * @author Forest Thomas
 * @date 12/14
 */
#include "screen.h"
#define VIDEO_ADDRESS 0xb8000
#define ROWS 25
#define COLS 80

//registers and ports
#define INDEX_L 0x3d4
#define INDEX_H 0x3d5

//ports
#define SCRN_CTRL 0x3d4
#define SCRN_DATA 0x3d5

//defines the color of our screen
//0xf = White on black
#define COLOR 0xf

void print_char(char c, int x, int y) {
	volatile char *mem = (volatile char *) VIDEO_ADDRESS;
	int offset = (x+y*COLS);
	mem[2*offset] = c;
}

int get_offset() {
	unsigned short pos = 0;
	byte_out(SCRN_CTRL, 0xf);
	pos = byte_in(SCRN_DATA);

	byte_out(SCRN_CTRL, 0xe);
	pos |= byte_in(SCRN_DATA) << 8;

	return pos;
}

void set_cursor(unsigned char x, unsigned char y) {
	unsigned short pos = x + y*COLS;
	byte_out(SCRN_CTRL, 0xf);
	byte_out(SCRN_DATA, (unsigned char) pos & 0xff);
	
	byte_out(SCRN_CTRL, 0xe);
	byte_out(SCRN_DATA, (unsigned char) (pos>>8) & 0xff);
}

void print(char *str) {
	int offset = get_offset();
	unsigned char y = offset / COLS;
	unsigned char x = offset % COLS;
	char c;
	while (*str) {
		c = *str;
		if (c == '\n') {
			x = 0;
			y++;
		} else {
			print_char(c, x, y);
			x++;
		}
		str++;

		if (x >= COLS) {
			x = 0;
			y++;
		}
		if (y >= ROWS) {
			memcpy((void *) VIDEO_ADDRESS, (void *) ((char *) VIDEO_ADDRESS) + 2*COLS, 2*(ROWS-1)*COLS);
			y = 0;
		}
	}
	set_cursor(x, y);
}

void clear_screen() {
	set_cursor(0, 0);
	char *mem = (char *) VIDEO_ADDRESS;
	int i;
	for (i = 0; i < ROWS*COLS; i++) {
		mem[0] = '\0';
		mem[1] = COLOR;
		mem += 2;
	}
}
