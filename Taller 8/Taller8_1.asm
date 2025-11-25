section .data
	num1 db 7
	num2 db 7
	msj_iguales db 'Los numeros son iguales', 0
	msj_mayor1 db 'El primer numero es mayor', 0
	msj_mayor2 db 'El segundo numero es mayor', 0
	msj_negativo1 db 'El primer numero es negativo', 0
	msj_negativo2 db 'El segundo numero es negativo', 0
	longmsj_iguales equ $-msj_iguales
	longmsj_mayor1 equ $-msj_mayor1
	longmsj_mayor2 equ $-msj_mayor2
	longmsj_negativo1 equ $-msj_negativo1
	longmsj_negativo2 equ $-msj_negativo2

section .text
	global _start

_start:
  mov ax, [num1]
  mov bx, [num2]
  
  cmp ax, bx
  je iguales
  
  test ax, ax
  js num1_negativo
  
  test bx, bx
  js num2_negativo
  
  cmp ax, bx
  jg num1_mayor
  jl num2_mayor
  
iguales:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_iguales
  mov edx, longmsj_iguales
  int 0x80
  jmp fin
  
num1_negativo:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_negativo1
  mov edx, longmsj_negativo1
  int 0x80
  jmp fin

num2_negativo:
  mov eax, 4
  mov ebx, 1
  mov ecx, msj_negativo2
  mov edx, longmsj_negativo2
  int 0x80
  jmp fin
  
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