#include "drivers/screen.h"
#include "lib/fstdio.h"
#include "lib/fstdlib.h"

int main() {
	clear_screen();
	char str[256] = {0};
	puts(itoa(50, str, 10));
	puts("\n0x");
	puts(itoa(atoi("50"), str, 16));

	return 0;
}
