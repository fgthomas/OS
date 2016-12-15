#include "fstdio.h"
#include "../drivers/drivers.h"

int puts(char *str) {
	print(str);
	return 1;
}
