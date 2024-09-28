; Filename: EXER13.ASM
; Programmer Name: KENT RATO
; Date: SEPTEMBAR 20, 2024
; Description: This assembly language program will display multiple string variables on separate lines.


.model small
.stack 200h
.data
    String1 db 'Line 1', 0dh,0ah,'$'
    String2 db 'Line 2', 0dh,0ah,'$'
    String3 db 'Line 3', 0dh,0ah,'$'
; carriage return (ASCII code 0Dh) positions the cursor to the left side of the current line of characters
; line feed (ASCII code 0Ah) moves the cursor down one line on the output device.
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