section .data
	num1 db 21
	num2 db 46
	longnum1 equ $-num1
	longnum2 equ $-num2

section .text
	global _start

_start:
  mov ax, [num1]
  mov bx, [num2]
  
  cmp ax, bx
  jle ordenar
  
ordenar:
  xchg ax, bx
  
  mov eax, 4
  mov ebx, 1
  mov ecx, num1
  mov edx, longnum1
  mov ecx, num2
  mov edx, longnum2
  int 0x80
  jmp fin
  
fin:
  mov eax, 1
  mov ebx, 0
  int 0x80