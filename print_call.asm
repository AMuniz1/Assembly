section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text

global _start

print_newline:
  mov rax, 1 ; identificador de syscall 'write'
  mov rdi, 1 ;descritor de arquivo stdout
  mov rsi, newline_char ; local onde os dados são obtidos
  mov rdx, 1 ; a quantidade de bytes a ser escrita
  syscall
ret


print_hex:
  mov rax, rdi
  mov rdi, 1
  mov rdx, 1
  mov rcx, 64 ; até que ponto estamos deslocando rax?

iterate:
  push rax
  sub rcx, 4
  sar rax, cl ; desloca para 60, 56, 52, ... , 4, 0
              ; o registrador cl é a menor parte de rcx
  and rax, 0xf ; limpa todos os bits, exceto os quatro menos representativos
  lea rsi, [codes + rax] ;obtém o código de caractere de um dígito hxadecimal

  mov rax, 1

  push rcx ;syscall alterará rcx
  syscall

  pop rcx

  pop rax
  test rcx, rcx ; rcx = 0 quando todos os dígitos forem mostrados
  jnz iterate

ret

_start:
  mov rdi, 0x1122334455667788
  call print_hex
  call print_newline

  mov rax, 60
  xor rdi, rdi
  syscall
