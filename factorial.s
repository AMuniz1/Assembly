.globl _start
#This will calculate the factorial of 4
#modify %rbx  to calculate another factorial

.section .text
_start:
  #%rbx will hold the original number
  movq $4, %rbx

  #store the accumulated value in %rax
  movq $1, %rax

mainloop:
  addq $0, %rbx

  jz complete

  mulq %rbx

  decq %rbx

  jmp mainloop

complete:
  movq %rax, %rdi

  movq $60, %rax
  syscall
