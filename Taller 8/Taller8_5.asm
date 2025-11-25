section .data
	num1 db 25
	num2 db 25
	msj_si db 'Ocurre acarreo', 0
	msj_no db 'No ocurre acarreo', 0
	longmsj_si equ $-msj_si
	longmsj_no equ $-msj_no

section .text
	global _start

_start:
  mov ax, [num1]
  mov bx, [num2]
  
  add ax, bx
  jo acarreo

  mov eax, 4
  mov ebx, 1
  mov ecx, msj_no
  mov edx, longmsj_no
  int 0x80
  jmp fin
  
acarreo:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_si
  mov edx, longmsj_si
  int 0x80
  jmp fin
  
fin:
  mov eax, 1
  mov ebx, 0
  int 0x80