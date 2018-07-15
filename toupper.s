.equ SYS_OPEN, 5
.equ SYS_WRITE, 4
.equ SYS_READ, 3
.equ SYS_CLOSE, 6
.equ SYS_EXIT, 1

.equ STDIN, 0
.equ STDOUT, 1
.equ STDERR, 2

.equ BUFFER_SIZE, 500

.section .bss
.lcomm buffer, BUFFER_SIZE

.sectin .text
.globl _start
_start:
    //movl %esp, %ebp
    subl 8, %esp
    
open_files:
open_fd_in:
    movl $SYS_OPEN, %eax
    movl 8(%ebp), %ebx
    movl 0, %ecx //ready only
    movl $0666, %edx
    int 0x80

store_fd_in:
    movl %eax, -4(%ebp)

open_fd_out:
    movl $SYS_OPEN, %eax
    movl 12(%ebp), %ebx
    movl $03102, %ecx

    movl $0666
