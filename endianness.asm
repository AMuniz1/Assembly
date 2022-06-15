section .data

newline_char: db 10
codes: db '0123456789abcdef'

demo1: dq 0x1122334455667788 ; dq is define quad word = 8 bytes
demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88 ; db define 1 byte

section .text
global _start

print_newline:
  mov rax, 1  ; numero da chamada do sistema 1
  mov rdi, 1  ; director stdout
  mov rsi, newline_char ; endereço na memória
  mov rdx, 1  ;bytes a serem escritos
  syscall
ret

print_hex:
  mov rax, rdi ; por que rax = rdi? livro não explica

  mov rdi, 1 ; stdout
  mov rdx, 1 ; qtd de bytes?
  mov rcx, 64 ; rcx = 64 por que? Deslocar rax?

iterate:
  push rax ; salva o valor inicial de rax
  sub rcx, 4 ;subtrai 4 de rcx
  sar rax, cl ; desloca rax para 60, 56, 52, ..., 4, 0

  and rax, 0xf ; limpa todo os bits, menos os quatro menos significativos
  lea rsi, [codes+rax] ; mov rsi, codes
                      ; add rsi, rax

  mov rax, 1 ; rax e 1= write? dunno if it's right

  push rcx ; syscall alterará rcx
  syscall



  pop rcx ; what?

  pop rax  ; see line 28
  test rcx, rcx ; rcx = 0 when every digit is printed
  jnz iterate ; ZF = 0? If not, jump

  ret


_start:
  mov rdi, [demo1]  ; 1122334455667788
  call print_hex
  call print_newline

  mov rdi, [demo2]  ;8877665544332211 (inversa de line 53)
  call print_hex
  call print_newline

  mov rax, 60 ; exit()
  xor rdi, rdi
  syscall
