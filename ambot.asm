.model small 
.stack 100h 
.data 
    inputString db 3 dup(0)   ; Buffer for up to 2 digits + NULL terminator 
    prompt db 'Enter a two-digit number: $' 
    msgInvalid db 'Invalid input! Please enter a two-digit number.$' 
 
.code 
main: 
    ; Initialize Data Segment 
    mov ax, @data 
    mov ds, ax 
 
    ; Display prompt 
    mov dx, offset prompt 
    mov ah, 09h 
    int 21h 
 
    ; Read two characters 
    mov cx, 2                ; We want to read 2 characters 
    lea di, inputString      ; Load address of inputString into DI 
read_loop: 
    mov ah, 01h              ; Function to read a character 
    int 21h                  ; Call DOS interrupt 
    mov [di], al             ; Store the character in the buffer 
    inc di                   ; Move to the next position 
    loop read_loop           ; Repeat for 2 characters 
 
    ; Null-terminate the string 
    mov byte ptr [di], 0 
 
    ; Convert from ASCII to integer 
    lea si, inputString      ; Load address of inputString into SI 
    movzx ax, byte ptr [si]  ; Get first character 
    sub ax, '0'              ; Convert ASCII to integer 
    movzx bx, byte ptr [si+1]; Get second character 
    sub bx, '0'              ; Convert ASCII to integer 
    mov cx, ax               ; Store first digit in CX 
    mov dx, 10               ; Prepare to multiply by 10 
    mul dx                   ; AX = AX * 10 (first digit * 10) 
    add ax, bx               ; AX = AX + second digit 
 
    ; Check if the input is a valid two-digit number 
    cmp ax, 10               ; Check if less than 10 
    jb invalid_input         ; Jump if below 10 
    cmp ax, 99               ; Check if greater than 99 
    ja invalid_input         ; Jump if above 99 
 
    ; Input is valid, you can continue processing 
    ; (Add your code here) 
 
    jmp end_program 
 
invalid_input: 
    ; Display invalid input message 
    mov dx, offset msgInvalid 
    mov ah, 09h 
    int 21h 
 
end_program: 
    ; Exit program 
    mov ax, 4C00h 
    int 21h 
end main 