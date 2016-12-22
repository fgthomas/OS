#include "drivers/screen.h"
#include "lib/fstdio.h"
#include "lib/fstdlib.h"

int main() {
	clear_screen();
	char buf[256] = {0};
	int i;
	for (i = 0; i < 100; i++) {
		puts(itoa(i, buf, 10));
		puts("\n");
	}

	return 0;
}
