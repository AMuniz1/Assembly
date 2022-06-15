global _start

section .data

test_string: db "Oi, sumido", 0

section .text

strlen:               ;de acordo com a nosss convenção, o primeiro e único
                      ;argumento é obtido de rdi
  xor rax, rax        ; rax é zerado e depois vai armazenar o tamanho da string


.loop:  ;o laço principal começa aqui
  cmp byte [rdi+rax], 0 ;verifica se o simbolo atual é o finalizador nulo.
                          ;definitivamente precisamos de modificador 'byte',pois
                          ;a parte à esquerda e à direita de cmp devem ter
                          ;o mesmo tamanho. O operando à direita é imediato
                          ;e não contém nenhuma informação sobre o seu tamanho
                          ; desse modo, não sabemos quantos bytes devem ser
                          ; obtidos da memória e comparados com zero
  je .end ; jump se o finalizador nulo foi encontrado
  inc rax ; caso contrário, vai para o proximo simbolo e incrementa
          ; o contador
  jmp .loop


.end:
  ret ; quando 'ret' for alcançado, rax deverá armazenar o valor de retorno

_start:
  mov rdi, test_string
  call strlen
  mov rdi, rax

  mov rax, 60
  syscall
