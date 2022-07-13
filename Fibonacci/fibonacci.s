global  _start
extern printf, scanf

section .bss
	userInput resb 1

section .data
	message db "Input Max Fib:", 0x0a ; 0x0a is the new line character
	outputFmt db "%d", 0x0a, 0x00 ; %d prints out an integer, 0x0a is \n, and 0x00 is a null character for terminating printf
	inputFmt db "%d", 0x00

section .text
_start:
	call printLabel
	call getInput
	call init
	call fibLoop
	call exit

printLabel:
	mov rax, 1 ; rax: syscall 1
	mov rdi, 1 ; using 1 for stdout
	mov rsi, message ; pointing to message from .data
	mov rdx, 15 ; print length of 15 bytes
	syscall ; executes the standard out
	ret

getInput:
	sub rsp, 8 ; align stack to 16 bytes
	mov rdi, inputFmt ; 1st parameter
	mov rsi, userInput ; 2nd parameter
	call scanf ; scanf(inputFmt, outputFmt)
	add rsp, 8 ; restore stack alignment
	ret

init:
	; inital value of values of fibonacchi sequence (0, 1)
	xor rax, rax ; using xor we can set rax to 0 by comparing it to itself
	xor rbx, rbx ; initializing both rax and rbx to 0
	inc rbx ; increase rbx by one
	ret	

printFib:
	push rax ; push register to the stack
	push rbx ; push register to the stack
	mov rdi, outputFmt ; 1st argument (printing format)
	mov rsi, rbx ; 2nd argument (Fib num)
	call printf	
	pop rbx ; restore register from the stack
	pop rax ; restore register from the stack
	ret	

fibLoop:
	call printFib
	add rax, rbx ; get next next number of fib sequence (E.G. 0 + 1 = 1, 1 + 1 = 2, 1 + 2 = 3, ect.)
	; also consider that the result is stored in rax, so 0, 1 will become 1, 1)
	xchg rax, rbx ; swap the two values to put the higher value in rbx
	cmp rbx, [userInput] ; if we have reached 10, then we want to exit our loop
	js fibLoop ; jump to fibLoop if rbx < 0
	ret	

exit:
	mov rax, 60
	mov rdi, 0
	syscall
