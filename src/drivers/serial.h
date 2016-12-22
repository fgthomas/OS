#pragma once
#include "drivers.h"

void init_serial();

unsigned char serial_in();

void serial_out(unsigned char data);

void serial_puts(char *str);
