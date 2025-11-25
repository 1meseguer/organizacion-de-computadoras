section .data
	num db 7
	msj_positivo db 'El numero es positivo', 0
	msj_negativo db 'El numero es negativo', 0
	msj_cero db 'El numero es cero', 0
	longmsj_positivo equ $-msj_positivo
	longmsj_negativo equ $-msj_negativo
	longmsj_cero equ $-msj_cero

section .text
	global _start

_start:
  mov ax, [num]
  
  cmp ax, 0
  je num_cero
  
  test ax, ax
  js num_negativo

  mov eax, 4
  mov ebx, 1
  mov ecx, msj_positivo
  mov edx, longmsj_positivo
  int 0x80
  jmp fin
  
num_cero:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_cero
  mov edx, longmsj_cero
  int 0x80
  jmp fin
  
num_negativo:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_negativo
  mov edx, longmsj_negativo
  int 0x80
  jmp fin
  
fin:
  mov eax, 1
  mov ebx, 0
  int 0x80