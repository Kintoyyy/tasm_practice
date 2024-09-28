; Filename: EXER19.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: Create a program that asks the user to input 3 characters. Then display each character on its own line.


.model small
.stack 100h
.data
    prompt1 db 'Enter first character: $'
    prompt2 db 'Enter second character: $'
    prompt3 db 'Enter third character: $'
    newline db 13, 10, '$'
    output1 db 'The first character is ', '$'
    output2 db 'The second character is ', '$'
    output3 db 'The third character is ', '$'
    firstChar db ?
    secondChar db ?
    thirdChar db ?
.code
ProgramStart:
    mov ax, @data
    mov ds, ax
 
    mov ah, 09h
    lea dx, prompt1
    int 21h
    mov ah, 01h
    int 21h
    mov firstChar, al

    mov ah, 09h
    lea dx, newline
    int 21h
 
    mov ah, 09h
    lea dx, prompt2
    int 21h
    mov ah, 01h
    int 21h
    mov secondChar, al

    mov ah, 09h
    lea dx, newline
    int 21h
 
    mov ah, 09h
    lea dx, prompt3
    int 21h
    mov ah, 01h
    int 21h
    mov thirdChar, al

    mov ah, 09h
    lea dx, newline
    int 21h
 
    mov ah, 09h
    lea dx, output1
    int 21h
    mov dl, firstChar
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h
 
    mov ah, 09h
    lea dx, output2
    int 21h
    mov dl, secondChar
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h
 
    mov ah, 09h
    lea dx, output3
    int 21h
    mov dl, thirdChar
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h
 
    mov ah, 4ch
    int 21h
end ProgramStart