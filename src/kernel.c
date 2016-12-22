#include "drivers/drivers.h"
#include "lib/fstdio.h"
#include "lib/fstdlib.h"

int main() {
	clear_screen();
	init_serial();
	char buf[256] = {0};
	int i;
	for (i = 0; i < 100; i++) {
		serial_puts(itoa(i, buf, 10));
		serial_puts("\n");
	}

	return 0;
}
