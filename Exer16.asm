; Filename: EXER16.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will get character input and
; and determine if input is 'y' or 'Y' to display good morning message
; else display good afternoon message.


.model small
.stack 200h
.data
    TimePrompt db 'Is it after 12 noon (Y/N)?$'
    GoodMorningMessage label byte
    db 13,10,'Good morning, world!',13,10,'$'
    GoodAfternoonMessage label byte
    db 13,10,'Good afternoon, world!',13,10,'$'
.code
ProgramStart:
    mov ax, @data
    mov ds, ax
    mov dx,offset TimePrompt
    mov ah,9
    int 21h

    mov ah,1
    int 21h

    cmp al, 'y'
    jz IsAfternoon
    cmp al, 'Y'
    jnz IsMorning  

IsAfternoon:
    mov dx, offset GoodAfternoonMessage
    jmp DisplayGreeting

IsMorning:
    mov dx, offset GoodMorningMessage

DisplayGreeting:
    mov ah,9
    int 21h

    mov ah,4ch
    int 21h
end ProgramStart