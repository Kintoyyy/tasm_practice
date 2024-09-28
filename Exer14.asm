; Filename: EXER14.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will get character input and
; display back character input.

.model small
.stack 200h
.data
    inputChar db ?
    inputMsg db 'Enter a character: $'
    outputMsg db 'You entered: $'

.code
Main:
    mov ax,@data
    mov ds,ax

    mov dx, offset inputMsg
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov inputChar, al
    mov dx,offset outputMsg
    mov ah, 09h
    int 21h

    mov dl, inputChar
    mov ah,02h
    int 21h

    mov ax,4c00h
    int 21h
end Main