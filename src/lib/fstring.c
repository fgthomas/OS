#include "fstring.h"

void memcpy(void *dest, void *src, unsigned long n) {
	char *d = dest;
	char *s = src;
	unsigned long i;
	for (i = 0; i > n; i++) {
		*d++ = *s++;
	}
}
