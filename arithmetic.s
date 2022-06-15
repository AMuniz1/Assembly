.globl _start
.section .text
_start:
  #perform various arithmetic operations

  movq $3, %rdi
  movq %rdi, %rax
  addq %rdi, %rax
  mulq %rdi
  movq $2, %rdi
  movq %rdi, %rax
  movq $4, %rdi
  mulq %rdi
  movq %rax, %rdi

  #set the exit system

  movq $60, %rax
  syscall
