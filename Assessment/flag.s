global _start

section .text
_start:
    ; push './flg.txt\x00'
    push 0              ; push NULL string terminator
    mov rdi, '/flag.txt' ; rest of file name
    push rdi            ; push to stack 
    
    ; open('rsp', 'O_RDONLY')
    mov rax, 2          ; open syscall number
    mov rdi, rsp        ; move pointer to filename
    mov rsi, 0          ; set O_RDONLY flag
    syscall

    ; read file
    lea rsi, [rdi]      ; pointer to opened file
    mov rdi, rax        ; set fd to rax from open syscall
    mov rax, 0          ; read syscall number
    mov rdx, 24         ; size to read
    syscall

    ; write output
    mov rax, 1          ; write syscall
    mov rdi, 1          ; set fd to stdout
    mov rdx, 24         ; size to read
    syscall

    ; exit
    mov rax, 60
    mov rdi, 0
    syscall

