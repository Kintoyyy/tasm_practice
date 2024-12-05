; filename: exer39.asm
; programmer name: kent a. rato
; date: october 18, 2024
; description: create a program that displays a menu for addition, subtraction, multiplication, and division.

.model small
.stack 500h

.data
    intro       db 'math operations', 13, 10, '$'
    a           db '1. addition', 13, 10, '$'
    b           db '2. subtraction', 13, 10, '$'
    c           db '3. multiplication', 13, 10, '$'
    d           db '4. division', 13, 10, '$'
    choice      db 'enter your choice: $'
    aPrompt     db 'addition$'
    aPrompt1    db 13, 10, 'enter first number: $'
    aPrompt2    db 13, 10, 'enter second number: $'
    aDisplay3   db 13, 10, 'sum: $'
    sPrompt     db 'subtraction$'
    sPrompt1    db 13, 10, 'enter first number: $'
    sPrompt2    db 13, 10, 'enter second number: $'
    sDisplay3   db 13, 10, 'difference: $'
    mPrompt     db 'multiplication$'
    mPrompt1    db 13, 10, 'enter first number: $'
    mPrompt2    db 13, 10, 'enter second number: $'
    mDisplay3   db 13, 10, 'product: $'
    dPrompt     db 'division$'
    dPrompt1    db 13, 10, 'enter first number: $'
    dPrompt2    db 13, 10, 'enter second number: $'
    dDisplay3   db 13, 10, 'quotient: $'
    eDisplay    db 'exit program$'
    invalid     db 'invalid choice!$'
    ending      db 13, 10, 'press enter to continue.$'
    negSign     db '-$'
    divZero     db 'error: division by zero is not allowed.$', 13, 10
    input1   dw ?
    input2   dw ?
    sum      dw ?
    diff     dw ?
    prod     dw ?
    quo      dw ?

.code

print_prompt proc
    mov ah, 09h
    int 21h
    ret
print_prompt endp

input_num PROC
    mov ah, 01h
    int 21h
    sub al, '0'
    mov ah, 0
    ret
input_num ENDP

input_char PROC
    mov ah, 01h
    int 21h
    ret
input_char ENDP

converter proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

    converter_loop1:
        xor dx, dx
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne converter_loop1

    converter_loop2:
        pop dx
        add dl, '0'
        mov ah, 02h
        int 21h
        dec cx
        cmp cx, 0
        jne converter_loop2

    pop dx
    pop cx
    pop bx
    pop ax
    ret
converter endp  

new_line PROC  
    mov ah, 02h
    mov dl, 13
    int 21h
    mov ah, 02h
    mov dl, 10
    int 21h
    ret
new_line ENDP

addition proc
    call new_line
    call new_line

    mov ah, 09h
    lea dx, aPrompt
    call print_prompt

    lea dx, aPrompt1
    call print_prompt
    call input_num
    mov input1, ax

    lea dx, aPrompt2
    call print_prompt
    call input_num
    mov input2, ax

    mov dx, input1
    add dx, input2
    mov sum, dx

    lea dx, aDisplay3
    call print_prompt
    mov ax, sum
    call converter

    call new_line
    ret
addition endp

subtraction proc
    call new_line
    call new_line

    mov ah, 09h
    lea dx, sPrompt
    call print_prompt

    lea dx, sPrompt1
    call print_prompt
    call input_num
    mov input1, ax

    lea dx, sPrompt2
    call print_prompt
    call input_num
    mov input2, ax

    mov ax, input1
    sub ax, input2
    mov diff, ax
    cmp ax, 0
    lea dx, sDisplay3
    call print_prompt
    jge display_result

    neg ax
    mov diff, ax

    lea dx, negSign
    call print_prompt
    display_result:
        mov ax, diff
        call converter

    call new_line
    ret
subtraction endp

multiplication proc
    call new_line
    call new_line

    mov ah, 09h
    lea dx, mPrompt
    call print_prompt

    lea dx, mPrompt1
    call print_prompt
    call input_num
    mov input1, ax

    lea dx, mPrompt2
    call print_prompt
    call input_num
    mov input2, ax

    mov ax, input1
    mov dx, input2
    mul dx
    mov prod, ax  

    lea dx, mDisplay3
    call print_prompt
    mov ax, prod
    call converter

    call new_line
    ret
multiplication endp

checkAndHandleZero PROC
    cmp bx, 0
    jne continueDivision

    lea dx, divZero
    call print_prompt

    continueDivision:
        ret
checkAndHandleZero ENDP

division proc
    call new_line
    call new_line

    mov ah, 09h
    lea dx, dPrompt
    call print_prompt

    lea dx, dPrompt1
    call print_prompt
    call input_num
    mov input1, ax

    lea dx, dPrompt2
    call print_prompt
    call input_num
    mov input2, ax

    mov ax, input1
    mov bx, input2
    call checkAndHandleZero

    xor dx, dx
    div bx
    mov quo, ax  

    lea dx, dDisplay3
    call print_prompt
    mov ax, quo
    call converter

    call new_line
    ret
division endp

invalidChoice proc  
    call new_line
    call new_line

    mov ah, 09h
    mov bl, 0CEh
    mov cx, 15
    int 10h
    lea dx, invalid
    mov ah, 09h
    int 21h

    call new_line
    ret
invalidChoice endp  

endingDisplay proc
    lea dx, ending
    call print_prompt
    call input_char
    ret
endingDisplay endp

terminate proc
    lea dx, ending
    call print_prompt
    call input_char
    mov ax, 4C00h
    int 21h
terminate endp

start:
    mov ax, @data
    mov ds, ax

    startLoop:
        mov ax, 3
        int 10h

        lea dx, intro
        call print_prompt

        mov ah, 09h
        lea dx, a        
        call print_prompt

        mov ah, 09h
        lea dx, b
        call print_prompt

        mov ah, 09h
        lea dx, c
        call print_prompt

        mov ah, 09h
        lea dx, d
        call print_prompt

        call new_line

        lea dx, choice
        call print_prompt

        mov ah, 01h
        int 21h

        cmp al, '1'  
        je doAdd
        cmp al, '2'
        je doSub
        cmp al, '3'
        je doMult
        cmp al, '4'
        je doDiv
        jne doInvalid

        doAdd:
            call addition
            call endingDisplay
            jmp startLoop
        doSub:
            call subtraction
            call endingDisplay
            jmp startLoop
        doMult:
            call multiplication
            call endingDisplay    
            jmp startLoop
        doDiv:
            call division          
            call endingDisplay
            jmp startLoop
        doInvalid:
            call invalidChoice
            call endingDisplay
            jmp startLoop

end start
