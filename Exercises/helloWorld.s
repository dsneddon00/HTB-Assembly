global _start ; tells the code where to start iterating line by line

section .data ; data is where you place variables
    message db "Hello World"
    length equ $-message

section .text ; text is where you place your code instructions
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, length
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
