; 课本上寻址模式讲的很恶心，各种基地址变址模式都晕了，其实很简单
; 根据操作对象不同只有三种

; 立即数寻址
; ebx = 233
movl $233, %ebx

; 寄存器寻址
; ebx = eax
movl %eax, %ebx

; 内存寻址
; ebx = mem[4 + eax + ecx * 2]
movl 4(%eax, %ecx, 2), %ebx

