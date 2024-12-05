; Filename: WEEK13D.ASM
; Programmer Name: KENT A. RATO
; Date: November 8, 2024

.model small
.stack 100h
 
.data
    prompt db "Enter a single digit number: $"
    thankYou db "Thank you.$"
    nl db 0Ah, 0Dh, "$"  ; Newline for output
 
.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax
 
input_loop:
    lea dx, nl
    mov ah, 09h
    int 21h
 
    lea dx, nl
    mov ah, 09h
    int 21h
 
    ; Display the prompt
    mov ah, 09h
    lea dx, prompt
    int 21h
 
    ; Read the user input (single character input)
    mov ah, 01h
    int 21h           ; Read character into AL
 
    ; Convert ASCII to integer (subtract 30h to get actual number)
    sub al, '0'
 
    ; Check if the entered number is 0
    cmp al, 0
    je thank_you       ; If the number is 0, jump to thank_you
 
    ; If the number is not zero, loop and ask for input again
    jmp input_loop
 
thank_you:
    lea dx, nl
    mov ah, 09h
    int 21h
   
    lea dx, nl
    mov ah, 09h
    int 21h
 
    ; Display "Thank you."
    mov ah, 09h
    lea dx, thankYou
    int 21h
 
    ; Exit the program
    mov ah, 4Ch
    int 21h
end main