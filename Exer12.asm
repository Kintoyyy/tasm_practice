; Filename: EXER12.ASM
; Programmer Name: KENT RATO
; Date: SEPTEMBAR 20, 2024
; Description: This assembly language program will display multiple string variables on a single line.

.model small
.stack 200h
.data
    String1 db 'Line 1', '$'
    String2 db 'Line 2', '$'
    String3 db 'Line 3', '$'

.code
ProgramStart:
    mov ax,@data
    mov ds,ax
    mov ah,9
    mov dx, offset String1
    int 21h

    mov dx, offset String2
    int 21h

    mov dx, offset String3
    int 21h

    mov ah,4Ch
    int 21h
end ProgramStart