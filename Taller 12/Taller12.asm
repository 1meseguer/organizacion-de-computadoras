%macro PRINT_SUM 3
    push eax            
    push ebx
    push ecx
    push edx
    push esi
    
    mov al, %1
    add al, %2
    add al, %3
    
    movzx eax, al
    
    mov ecx, buffer
    add ecx, 3
    
    mov byte [ecx], 10
    dec ecx
    
    conversion_loop:
        mov ebx, 10
        xor edx, edx
        div ebx
        
        add dl, '0'
        mov [ecx], dl
        dec ecx
        
        cmp eax, 0
        jnz conversion_loop
        
    inc ecx
    
    mov eax, 4
    mov ebx, 1
    mov edx, 4
    int 0x80
    
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
%endmacro

section .data

    X1 equ 5
    X2 equ 10
    X3 equ 15

section .bss
    buffer resb 4
    
section .text
    global _start

_start:
    PRINT_SUM X1, X2, X3

    mov eax, 1
    xor ebx, ebx
    int 0x80