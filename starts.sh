#!/usr/bin/bash
nasm mysys.s -o /tmp/mysys.o
/usr/bin/x86_64-linux-gnu-as -o /tmp/boot.o ./boot.s
