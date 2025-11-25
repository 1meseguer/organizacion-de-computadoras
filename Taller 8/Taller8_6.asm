section .data
  maximo db 0
  minimo db 0
	num1 db 21
	num2 db 46
	num3 db 87
	msj_mayor db 'Es mayor', 0
	msj_menor db 'Es menor', 0
	longmsj_mayor equ $-msj_mayor
	longmsj_menor equ $-msj_menor
	longmaximo equ $-maximo
	longminimo equ $-minimo

section .text
	global _start

_start:
  mov ax, [num1]
  mov bx, [num2]
  mov cx, [num3]
  
  cmp ax, bx
  jg comparar_ax_cx_maximo
  mov ax, bx
  
comparar_ax_cx_maximo:
  cmp ax, cx
  jg guardar_maximo
  mov ax, cx
  
guardar_maximo:
  mov [maximo], ax
  mov ax, [num1]
  mov bx, [num2]
  
  mov eax, 4
  mov ebx, 1
  mov ecx, maximo
  mov edx, longmaximo
  mov ecx, msj_mayor
  mov edx, longmsj_mayor
  int 0x80
  
  cmp ax, bx
  jl comparar_ax_cx_min
  
  mov ax, bx
  
comparar_ax_cx_min:
  cmp ax, cx
  jl guardar_min
  mov ax, cx
  
guardar_min:
  mov [minimo], ax
  
  mov eax, 4
  mov ebx, 1
  mov ecx, minimo
  mov edx, longminimo
  mov ecx, msj_menor
  mov edx, longmsj_menor
  int 0x80
  
  mov eax, 1
  mov ebx, 0
  int 0x80