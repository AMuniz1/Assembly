.globl _start
#This will return 1 if the number is odd or
#return 0 if the number is even

.section .text
_start:
  movq $2, %rbx

  movq $62, %rax

  divq %rbx

  movq %rdx, %rdi

  movq $60, %rax
  syscall
