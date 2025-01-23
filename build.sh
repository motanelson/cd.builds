#!/usr/bin/bash
aaa=$1
cp app.data ./tmp/$aaa.iso
/usr/bin/x86_64-linux-gnu-gcc -c -m64 -nostdlib ./uploads/$aaa.c -o /tmp/$aaa.o
/usr/bin/x86_64-linux-gnu-ld -nostdlib -T ./link.ld /tmp/boot.o /tmp/$aaa.o  -o /tmp/a$aaa.bin 
/usr/bin/x86_64-linux-gnu-objcopy /tmp/a$aaa.bin /tmp/$aaa.c32  --output-target binary 
cat /tmp/mysys.o /tmp/$aaa.c32 > /tmp/$aaa.bin
dd if=/tmp/$aaa.bin of=./tmp/$aaa.iso bs=1k seek=58 conv=notrunc
rm /tmp/$aaa.o
rm /tmp/a$aaa.bin
rm /tmp/$aaa.c32
rm /tmp/$aaa.bin
