section .data
    msg db "Resultado: ", 0
    len equ $ - msg

    newline db 10, 0
    lenNL equ $ - newline
    
    error_msg db "Error: No se puede realizar una division con un dividor con valor 0"
    error_len equ $ - error_msg

section .bss
    resultado resb 1

section .text
    global _start

_start:
    ; ============================
    ; Números hardcoded
    ; ============================
    mov al, '8'       ; primer número (ASCII)
    sub al, '0'       ; convertir a entero (8)

    mov bl, '0'       ; segundo número (ASCII) -- bl = 0
    sub bl, '0'       ; convertir a entero (2)
    
    ; ============================
    ; INTERRUPCION
    ; ============================
    cmp bl, 0         ; comparar bl (divisor) con 0
    jz divisor_cero   ; saltar divisor_cero si bl es cero
    ; si no, continua

    ; ============================
    ; División AL / BL
    ; ============================
    xor ah, ah        ; limpiar AH para div
    div bl            ; resultado en AL

    ; ============================
    ; Convertir resultado a ASCII
    ; ============================
    add al, '0'
    mov [resultado], al

    ; ============================
    ; Imprimir "Resultado: "
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; ============================
    ; Imprimir el resultado
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 1
    int 0x80

    ; ============================
    ; Imprimir salto de línea
    ; ============================
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, lenNL
    int 0x80
    
    jmp salir

divisor_cero:
    ; imprimir mensaje de error
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, error_len
    int 0x80
    ; continua a la salida

    ; ============================
    ; Salir
    ; ============================
salir:
    mov eax, 1
    xor ebx, ebx
    int 0x80
