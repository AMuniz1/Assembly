global _start

section .data
message: db 'hello, world!', 10
len		  equ  $ - message

section .text
_start:
	mov	rax, 1			;  o numero da chamada de sistema ser armazenado em rax
	mov	rdi, 1			;  onde escrever(descritor)? descritor de stdout
	mov rsi, message	;  Onde começa a string? 
	mov	rdx, len			;  quantos bytes devem ser escritos?
	syscall				;  essa instrução faz uma chamada de sistema
	
	mov rax, 60 		;  60 = número do syscall exit
	xor rdi, rdi		;  = 'mov rdi, 0' e custa um byte/ é XOR a porta lógica
	syscall  			;  exit com sucesso
