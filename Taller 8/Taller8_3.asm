section .data
	num db 7
	msj_par db 'El numero es par', 0
	msj_impar db 'El numero es impar', 0
	longmsj_par equ $-msj_par
	longmsj_impar equ $-msj_impar

section .text
	global _start

_start:
  mov ax, [num]
  
  test ax, 01h
  jp par

  mov eax, 4
  mov ebx, 1
  mov ecx, msj_impar
  mov edx, longmsj_impar
  int 0x80
  jmp fin
  
par:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_par
  mov edx, longmsj_par
  int 0x80
  jmp fin
  
fin:
  mov eax, 1
  mov ebx, 0
  int 0x80