#!/usr/bin/bash
aaa=$1
/usr/bin/x86_64-linux-gnu-gcc -c -m64 -nostdlib ./uploads/$aaa.c -o /tmp/$aaa.o

