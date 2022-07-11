global  _start

section .text
_start:
	; inital value of values of fibonacchi sequence (0, 1)
	xor rax, rax ; using xor we can set rax to 0 by comparing it to itself
	xor rbx, rbx ; initializing both rax and rbx to 0
	inc rbx ; increase rbx by one
	mov rcx, 10 ; iterate the loop 10 times

fibLoop:
	add rax, rbx ; get next next number of fib sequence (E.G. 0 + 1 = 1, 1 + 1 = 2, 1 + 2 = 3, ect.)
	; also consider that the result is stored in rax, so 0, 1 will become 1, 1)
	xchg rax, rbx ; swap the two values to put the higher value in rbx
	loop fibLoop

