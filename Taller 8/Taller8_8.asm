section .data
	num db '0', 0

section .text
	global _start

_start:
  mov cx, 0
  
contador:
  mov al, cl
  add al, '0'
  mov [num], al
  mov ax, cx
  inc ax
  sub ax, 10
  jz fin_contador
  js continuar
  jmp fin_contador
  
continuar:
  
fin_contador:
  
  
fin:
  mov eax, 1
  mov ebx, 0
  int 0x80