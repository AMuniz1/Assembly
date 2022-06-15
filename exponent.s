.globl _start
#This will calculate 2**7
#Modify %rbx and %rcx to calculate
#another exponential

.section .text
_start:
  #%rbx will hold the base
  movq $2, %rbx

  #%rcx will hold the current exponent count
  movq $7, %rcx

  #Store the accumulated value in %rax
  movq $1, %rax

mainloop:
  #adding zero will allows us to use the flags to
  #determine if %rcx has zero to begin with
  addq $0, %rcx

  #if the exponent is zero, we are done
  jz complete

  #otherwise, multiply the accumulated value by our base
  mulq %rbx

  #decrease the counter
  decq %rcx

  #go back to beggining of the loop and try again
  jmp mainloop

complete:
  #move the accumulated value to %rdi so we can return it
  movq %rax, %rdi
  #exit
  movq $60, %rax
  syscall
