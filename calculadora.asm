section .data
	Dig_Nums db "Digite dois numeros: ", 10
	len_DN equ $ - Dig_Nums

	Dig_OP db "Digite uma operação: ", 10
	len_DO equ $ - Dig_OP

	Erro_Msg db "Digite um numero ou uma operação valida", 10
	len_EM equ $ - Erro_Msg

section .bss
	num1 resb 2
	num2 resb 2
	op resb 2

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
	mov rdx, 2
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, num2
	mov rdx, 2
	syscall

	xor r8, r8
	mov r8b, [num1]
	sub r8, '0'

	xor r9, r9
	mov r9b, [num2]
	sub r9, '0'

	mov rax, 1
	mov rdi, 1
	mov rsi, Dig_OP
	mov rdx, len_DO
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, op
	mov rdx, 1
	syscall

	mov al, [op]

	cmp al, '+'
	je _soma

	cmp al, '-'
	je _sub

	cmp al, '*'
	je _mul

	cmp al, '/'
	je _div

	mov rax, 1
	mov rdi, 1
	mov rsi, Erro_Msg
	mov rdx, len_EM
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_soma:
	lea r10, [r8 + r9]
	add r10, '0'
	mov [num1], r10b

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 2
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_sub:
	mov r10, r8
	sub r10, r9
	add r10, '0'
	mov [num1], r10b

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 2
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_mul:
	mov r10, r8
	imul r10, r9
	add r10, '0'
	mov [num1], r10b

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 2
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

_div:
	mov rax, r8
    	xor rdx, rdx
    	idiv r9
    	mov r10, rax

	add r10, '0'
	mov [num1], r10b

	mov rax, 1
	mov rdi, 1
	mov rsi, num1
	mov rdx, 2
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
