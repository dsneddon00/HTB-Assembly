global  _start

section .text
_start:
	;mov al,		0
	;mov bl,		0
	;inc bl ; inc unary operator increases bl by 1
	;add rax, rbx ; add binary operator adds rbx to rax
	
	xor rax, rax ; using xor we can set rax to 0 by comparing it to itself
	xor rbx, rbx
	inc rbx
	add rax, rbx
