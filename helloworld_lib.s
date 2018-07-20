.section .data
msg:
    .ascii "hello world\n\0"

.section .text
.globl _start
_start:
    pushl $msg
    call  printf

    pushl $0
    call  exit

