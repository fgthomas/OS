/**
 * @file fstdlib.c
 * @brief contains definitions for functions in fstdlib.h
 *
 * @author Forest Thomas
 * @date 12/15
 */
#include "fstdlib.h"

//this is a slightly modified version of the code
//found on osdev
//don't want to reinvent the wheel
char *itoa(int i, char *str, int base) {
	char *rv = str;
	char *low;
	if (base < 2 || base > 36) {
		*str = '\0';
		return str;
	}
	if (i < 0 && base == 10)
		*str++ = '-';
	low = str;
	do {
		*str++ = "zyxwvutsrqponmlkjihgfedcba9876543210123456789abcdefghijklmnopqrstuvwxyz"[35 + i % base];
	} while (i /= base);
	*str-- = '\0';
	while (low < str) {
		char tmp = *low;
		*low++ = *str;
		*str-- = tmp;
	}
	return rv;
};

//simple atoi, converts the base 10  string to an int
int atoi(char *str) {
	int i = -1;
	char *cp = str;
	while (*cp++)
		i++;
	int pow = 1;
	int sum = 0;
	while (i > 0) {
		sum += pow * (str[i] - '0');
		pow *= 10;
		i--;
	}
	if (str[0] == '-')
		sum = -sum;
	else
		sum += pow * (str[0] - '0');
	return sum;
}
