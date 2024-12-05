; filename: exer37.asm
; programmer name: kent a. rato
; date: october 18, 2024
; description: create a program that inputs a character. if the character 
; is the capital letter A, display message “you entered A.”, 
; else display “you entered not A.”

.model small
.stack 100h

.data
    prompt1 db 'you entered A.$'
    prompt2 db 0dh, 0ah, 'you entered not A.$'
    prompt db 0dh, 0ah, 'enter a character: $'
.code

print_prompt proc
    mov ah, 09h
    int 21h
    ret
print_prompt endp

main:
    mov ax, @data
    mov ds, ax

    lea dx, prompt
    call print_prompt

    mov ah, 01h
    int 21h
    mov bl, al

    cmp bl, 'A'
    je is_A

    lea dx, prompt2
    call print_prompt
    jmp exit

is_A:
    lea dx, prompt1
    call print_prompt

exit:
    mov ah, 4ch
    int 21h
end main
