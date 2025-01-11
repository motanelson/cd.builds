printf "\033c\033[43;30m"
ls *.c
printf "give me a .c file gcc? "
read aaa
cp app.data cd1.iso
nasm mysys.s -o /tmp/mysys.o
/usr/bin/x86_64-linux-gnu-as -o /tmp/boot.o ./boot.s
/usr/bin/x86_64-linux-gnu-gcc -c -m64 -nostdlib $aaa -o /tmp/kernel.o
/usr/bin/x86_64-linux-gnu-ld -nostdlib -T ./link.ld /tmp/boot.o /tmp/kernel.o  -o /tmp/kernel.bin 
/usr/bin/x86_64-linux-gnu-objcopy /tmp/kernel.bin /tmp/hello.c64  --output-target binary 
cat /tmp/mysys.o /tmp/hello.c64 > /tmp/sys.bin
dd if=/tmp/sys.bin of=cd1.iso bs=1k seek=58 conv=notrunc
qemu-system-x86_64 -cdrom cd1.iso