; filename: exer38.asm
; programmer name: kent a. rato
; date: october 18, 2024
; description: create a program that inputs a number. display the 
; following messages depending on the value of the number entered:

.model small
.stack 100h

.data
    inputChar db ?
    dot db '.$'
    prompt db 'enter a number: $'
    equalMessage LABEL BYTE
        db 13, 10, 'the number is equal to 5.', 13, 10, '$'
    lesserMessage LABEL BYTE
        db 13, 10, 'the number is less than 5.$'
    greaterMessage LABEL BYTE
        db 13, 10, 'the number is greater than 5.$'
.code

input_num proc
    mov ah, 01h
    int 21h
    sub al, '0'
    ret
input_num endp

print_prompt proc
    mov ah, 09h
    int 21h
    ret
print_prompt endp

ProgramStart:
    mov ax, @data
    mov ds, ax

    mov dx, OFFSET prompt
    call print_prompt

    call input_num
    mov inputChar, al

    cmp al, 5
    je equal
    jg greater
    jl lesser

    jmp Done

equal:
    mov dx, OFFSET equalMessage
    call print_prompt
    jmp Done

greater:
    mov dx, OFFSET greaterMessage
    call print_prompt
    jmp Done

lesser:
    mov dx, OFFSET lesserMessage
    call print_prompt
    jmp Done

Done:
    mov ax, 4c00h
    int 21h

end ProgramStart
