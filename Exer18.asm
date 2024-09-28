; Filename: EXER18.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will get string input and
; display the reverse of the string.


.model small
.stack 100h
.data
    MAXIMUM_STRING_LENGTH equ 1000
    StringToReverse db MAXIMUM_STRING_LENGTH DUP (?)
    ReverseString db MAXIMUM_STRING_LENGTH DUP (?)
.code
ProgramStart:
    mov ax, @data
    mov ds,ax
    mov ah, 3fh
    mov bx, 0
    mov cx, MAXIMUM_STRING_LENGTH

    mov dx, offset StringToReverse
    int 21h
    and ax,ax
    jz Done
    mov cx,ax

    push cx
    mov bx, offset StringToReverse
    mov si, offset ReverseString
    add si, cx
    dec si

ReverseLoop:
    mov al,[bx]
    mov [si],al
    inc bx
    dec si

    loop ReverseLoop
    pop cx
    mov ah,40h
    mov bx,1
    mov dx,offset ReverseString
    int 21h

Done:
    mov ah,4ch
    int 21h
end ProgramStart