section .data
	num1 db 7
	num2 db 9
	msj_si db 'Ocurre desbordamiento', 0
	msj_no db 'No ocurre desbordamiento', 0
	longmsj_si equ $-msj_si
	longmsj_no equ $-msj_no

section .text
	global _start

_start:
  mov ax, [num1]
  mov bx, [num2]
  
  add ax, bx
  jo desbordamiento

  mov eax, 4
  mov ebx, 1
  mov ecx, msj_no
  mov edx, longmsj_no
  int 0x80
  jmp fin
  
desbordamiento:
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