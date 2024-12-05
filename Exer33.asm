;filename: exer33.asm
;name: kent a. rato
;date: october 18, 2024
;description: this assembly language program will input 
; two single-digit numbers, add the two numbers,
; and display the sum of the two numbers.

.model small
.stack 100h
.data

    num1 db ?
    num2 db ?
    sum db ?
    prompt1 db 'enter first number (0-9): $'
    prompt2 db 0dh, 0ah, 'enter second number (0-9): $'
    prompt3 db 0dh, 0ah, 'the sum is: $'

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

main proc
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
    add al, num2
    mov sum, al

    lea dx, prompt3
    mov ah, 09h
    int 21h

    add sum, '0'
    mov dl, sum
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
main endp
end main