; C 调用惯例 栈是核心
; 在调用时，只保证esp和ebp前后一致。其他寄存器都不保证

; reverse order push parameter
; call
; push eip, return addr
; eip -> function
; push esp (always a function stack pointer -> stackframe)
; subl $?, %esp 保留本地变量空间


; 返回值 eax
; 回到上一级栈帧
; ret = pop eip


