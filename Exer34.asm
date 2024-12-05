; filename: exer34.asm
; programmer name: kent a. rato
;date: october 18, 2024
; description: this assembly language program will input two single-digit numbers, subtract the two numbers,
; and display the difference of the two numbers.

.model small
.stack 100h
.data
    prompt1 db 'enter first number: $'
    prompt2 db 0dh, 0ah, 'enter second number: $'
    output db 0dh, 0ah, 'the difference is: $'
    num1 db ?
    num2 db ?
    difference db ?
.code

input_num proc
    mov ah, 01h
    int 21h
    sub al, '0'
    ret
input_num endp

print_result proc
    add difference, '0'
    mov ah, 0eh
    mov al, difference
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

    mov al, num1
    sub al, num2
    mov difference, al

    mov ah, 09h
    lea dx, output
    int 21h

    call print_result

    mov ax, 4c00h
    int 21h
end start