.section .bss
.lcomm buf, 100

.section .text
.globl _start
_start:
    movl  $0, %ebx      #file descriptor
    movl  $buf, %ecx   #buffer point
    movl  $100, %edx   #buffer size
    movl  $3, %eax     #read sys call
    int   $0x80

    movl  buf, %ebx
    movl  $1, %eax
    int  $0x80




