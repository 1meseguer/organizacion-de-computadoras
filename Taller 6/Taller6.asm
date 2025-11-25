section .data
	num1 db 7
	num2 db 4
	msj_mayor1 db 'El primer numero es mayor', 0
	msj_mayor2 db 'El segundo numero es mayor', 0
	longmsj_mayor1 equ $-msj_mayor1
	longmsj_mayor2 equ $-msj_mayor2

section .text
	global _start

_start:
  mov ax, [num1]
  mov bx, [num2]
  
  cmp ax, bx
  
  jg num1_mayor
  jl num2_mayor
  
num2_mayor:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_mayor2
  mov edx, longmsj_mayor2
  int 0x80

  jmp fin

num1_mayor:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_mayor1
  mov edx, longmsj_mayor1
  int 0x80
  
  jmp fin
  
fin:
  mov eax, 1
  mov ebx, 0
  int 0x80