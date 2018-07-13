.section .text
.globl expose
expose:
    pushl %ebp
    movl %esp, %ebp

    movl %ebp, %ecx
    movl (%ecx), %edx
    movl 8(%edx), %eax

    movl %ebp, %esp
    popl %ebp
    ret

