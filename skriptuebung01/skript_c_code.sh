#!/bin/bash

touch hello.c

cat >> hello.c << EOF
#include <stdio.h>

int main(void) {
	printf("Hello World\n");
	return 0;
}
EOF

gcc -o hello hello.c
./hello

rm hello hello.c

exit 0
