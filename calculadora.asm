section .data
	Dig_Nums db "Digite dois numeros: ", 10
	len_DN equ $ - Dig_Nums
	Dig_Op db "Digite uma operação: ", 10
	len_DO equ $ - Dig_Op

section .bss
	num1 resb 64
	num2 resb 64
	op resb 1

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, Dig_Nums
	mov rdx, len_DN
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, num1
	mov rdx, 64
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, num2
	mov rdx, 64
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, Dig_Op
	mov rdx, len_DO
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, op
	mov rdx, 1
	syscall

	mov cl, [op]
	sub cl, '0'

	mov al, [num1]
	sub al, '0'

	mov bl, [num2]
	sub bl, '0'

	cmp cl, 1
	je _soma

	cmp cl, 2
	je _sub

	cmp cl, 3
	je _mul

	cmp cl, 4
	je _div

	mov rax, 60
	mov rdi, 0
	syscall

_soma:
	add al, bl
	add al, '0'
	mov [num1], al

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 64
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_sub:
	sub al, bl
	add al, '0'
	mov [num1], al

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 64
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_mul:
	mul bl
	add al, '0'
	mov [num1], al

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 64
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
_div:
	xor ah, ah
	div bl
	add al, '0'
	mov [num1], al

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 64
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
