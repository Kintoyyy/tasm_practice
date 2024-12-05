; Filename: EXER36.ASM
; Programmer Name: kent a. rato
;date: october 18, 2024
; Description: This assembly language program will input two  single-digit numbers, divide the two numbers,
; and display the quotient of the two numbers.

.model small
.stack 100h
.data
    prompt1 db 'Enter first number (0-9): $'
    prompt2 db  0dh, 0ah, 'Enter second number (1-9): $'
    output db  0dh, 0ah, 'The quotient is: $'
    num1 db ?
    num2 db ?
    quotient db ?
.code

input_num proc
    mov ah, 01h
    int 21h
    sub al, '0'
    ret
input_num endp

print_result proc
    add quotient, '0'
    mov ah, 0eh
    mov al, quotient
    int 10h
    ret
print_result endp

print_prompt proc
    mov ah, 09h
    int 21h
    ret
print_prompt endp

start:
    mov ax, @data
    mov ds, ax

    lea dx, prompt1
    call print_prompt

    call input_num
    mov num1, al

    lea dx, prompt2
    call print_prompt

    call input_num
    mov num2, al

    cmp num2, 0
    je div_by_zero

    mov al, num1
    xor ah, ah
    mov bl, num2
    div bl
    mov quotient, al

    lea dx, output
    call print_prompt

    call print_result
    mov ax, 4C00h
    int 21h

    div_by_zero:
    lea dx, prompt2
    call print_prompt

    mov ax, 4C00h
    int 21h
end start