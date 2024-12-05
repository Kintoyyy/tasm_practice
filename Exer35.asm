; Filename: EXER35.ASM
; Programmer Name: kent a. rato
;date: october 18, 2024
; Description: This assembly language program will input two single-digit numbers, multiply the two numbers,
; and display the product of the two numbers.


.model small
.stack 100h
.data

    prompt1 db 'Enter first number (0-9): $'
    prompt2 db 0dh, 0ah,'Enter second number (0-9): $'
    output db 0dh, 0ah,'The product is: $'
    num1 db ?
    num2 db ?
    product db ?

.code

print_prompt proc
    mov ah, 09h
    int 21h
    ret
print_prompt endp

input_num proc
    mov ah, 01h
    int 21h
    sub al, '0'
    ret
input_num endp

print_result proc
    add product, '0'
    mov ah, 0eh
    mov al, product
    int 10h
    ret
print_result endp

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


    mov al, num1
    mov bl, num2
    mul bl
    mov product, al

    mov ah, 09h
    lea dx, output
    int 21h

    call print_result

    mov ax, 4C00h
    int 21h
end start
