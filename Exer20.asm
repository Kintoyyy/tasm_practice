; Filename: EXER20.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: Create a program that asks user to input a character.
; Determine if character is letter A and display message “Yes, you have entered
; letter A.” If not, display “No, you have not entered letter A. You
; entered character _.”

.model small
.stack 200h
.data
    prompt db 'Enter a character: $'
    outputYes db 'Yes, you have entered letter A.$'
    outputNo db 'No, you have not entered letter A. You entered character: $'
    newline db 13, 10, '$'
    inputChar db ?

.code
ProgramStart:
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, prompt
    int 21h

    mov ah, 01h
    int 21h
    mov inputChar, al

    mov ah, 09h
    lea dx, newline
    int 21h

    cmp al, 'A'
    je isCharA

isNotCharA:
    mov ah, 09h
    lea dx, outputNo
    int 21h

    mov dl, inputChar
    mov ah, 02h
    int 21h

    jmp endProgram

isCharA:
    mov ah, 09h
    lea dx, outputYes
    int 21h

endProgram:
    mov ah, 4ch
    int 21h
end ProgramStart
