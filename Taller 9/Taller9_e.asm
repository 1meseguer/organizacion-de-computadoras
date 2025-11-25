section .data
    num1 db 5
    num2 db 11
    result db 0
    msg db 'Resultado: ', 0

section .bss
    buffer resb 4

section .text
    global _start

_start:

    mov al, [num1] 
    add al, [num2]
    mov [result], al
; Convertir el resultado a ASCII
    movzx eax, byte [result]
    add eax, 49 ; Convertir el valor numérico en su correspondiente ASCII ('0' = 49)
    mov [buffer], al ; Almacenar el carácter ASCII en el buffer

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 11
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
