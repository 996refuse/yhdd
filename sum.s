.equ SYS_OPEN, 5
.equ SYS_READ, 3
.equ SYS_CLOSE, 6

.equ BUFFER_SIZE, 500

.section .bss
.lcomm buffer, BUFFER_SIZE

.section .text
.globl _start
_start:
    movl %esp, %ebp
    subl $8, %esp
    
open_files:
    movl $SYS_OPEN, %eax #call num
    movl 8(%ebp), %ebx   #file name
    movl $0, %ecx        #ready only
    movl $0666, %edx
    int  $0x80

    movl %eax, -4(%ebp)

read:
    movl $SYS_READ, %eax
    movl -4(%ebp), %ebx

    movl $buffer, %ecx
    movl $BUFFER_SIZE, %edx
    int  $0x80
    
    cmpl $0, %eax
    jle over_flow
    
    pushl $buffer
    decl  %eax
    pushl %eax
    call sum
    addl $8, %esp # pop twice

    movl %eax, -8(%ebp)

    movl $SYS_CLOSE, %eax
    movl -4(%ebp), %ebx
    int $0x80

    movl -8(%ebp), %ebx
    movl $1, %eax
    int  $0x80
    
over_flow:
    movl $1, %eax
    movl $-1, %ebx
    int  $0x80

sum:
    pushl %ebp
    movl %esp, %ebp
    movl $0, %eax
    movl $0, %ebx
    movl 12(%ebp), %ecx

loop:
    cmpl %ebx, 8(%ebp)
    je sum_r


    movl $0, %edx
    movb (%ecx, %ebx, 1), %dl
    addl %edx, %eax
    subl $0x30, %eax

    addl $1, %ebx
    jmp loop

sum_r:
    movl %ebp, %esp
    popl %ebp
    ret
    


    
    
    
