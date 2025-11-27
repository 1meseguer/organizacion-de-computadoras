section .data
  char db 0
  espacio db 0

section .text
	global _start

_start:
  mov al, 130
  shr al, 1
  
  mov [char], al
  
  mov eax, 4
  mov ebx, 1
  mov ecx, char
  mov edx, 1
  int 0x80
  
  mov eax, 4
  mov ebx, 1
  mov ecx, espacio
  mov edx, 1
  int 0x80
  
cero:
  mov al, 24
  shl al, 1
  
  mov [char], al
  
  mov eax, 4
  mov ebx, 1
  mov ecx, char
  mov edx, 1
  int 0x80
  
  mov eax, 4
  mov ebx, 1
  mov ecx, espacio
  mov edx, 1
  int 0x80
  
letra_g:
  mov al, 206
  ror al, 1
  
  mov [char], al
  
  mov eax, 4
  mov ebx, 1
  mov ecx, char
  mov edx, 1
  int 0x80
  
  mov eax, 4
  mov ebx, 1
  mov ecx, espacio
  mov edx, 1
  int 0x80
  
igual:
  mov al, 158
  rol al, 1
  
  mov [char], al
  
  mov eax, 4
  mov ebx, 1
  mov ecx, char
  mov edx, 1
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80