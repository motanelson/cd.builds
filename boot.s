

.section .text
.global _start
.global screens
.extern kernel_main

_start:
        
	mov $stack_top, %rsp
	call kernel_main
	cli
1:	hlt
	jmp 1b

.section .multiboot
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

