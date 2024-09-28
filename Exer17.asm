; Filename: EXER17.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will get string input and
; display back string.



.model small
.stack 100h
.data
    MAXIMUM_STRING_LENGTH EQU 1000
    StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
    InputPrompt DB 'Enter text: $'
.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov dx, offset InputPrompt
    mov ah,9
    int 21h

    mov ah, 3fh
    mov bx, 0
    mov cx, MAXIMUM_STRING_LENGTH

    mov dx,offset StringInput
    int 21h
    and ax, ax
    js Done
    mov cx,ax

    push cx
    mov bx, offset StringInput

    pop cx
    mov ah,40h
    mov bx, 1
    mov dx,offset StringInput
    int 21h

Done:
    mov ah, 4ch
    int 21h

end ProgramStart