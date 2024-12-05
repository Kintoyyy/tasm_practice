; Filename: EXER42.ASM
; Programmer Name: KENT A. RATO
; Date: October 25, 2024
; Description: This assembly language program will prompt two integers and display their product

.model small
.stack 100h
.data
    prompt1 db 'Enter first integer (1 to 5 digits): $'
    prompt2 db 'Enter second integer (1 to 5 digits) $'
    resultMsg db 'The product of the two integers is: $'
    nL db 10, 13, '$'
    int1 dw ?
    int2 dw ?
    result dw ?
    buffer db 6, ?, 6 dup('$')   
.code 

newLine proc 
    mov ah, 09h 
    lea dx, nL  
    int 21h
    ret
newLine endp

printString proc  
    mov ah, 09h 
    int 21h
    ret
printString endp

setInput proc 
    mov ah, 0Ah
    lea dx, buffer
    int 21h

    xor ax, ax
    xor cx, cx
    mov cl, [buffer+1]
    lea si, buffer+2
    mov bx, 10

convert_loop: 
    mul bx
    mov dl, [si]
    sub dl, '0'
    add ax, dx
    inc si
    loop convert_loop
    ret
setInput endp

print proc                 
    mov cx, 0
    mov bx, 10

divide_loop: 
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz divide_loop

print_loop: 
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop print_loop
    ret
print endp 

main proc
    mov ax, @data 
    mov ds, ax

    lea dx, prompt1
    call printString 

    call setInput 
    mov int1, ax
    call newLine

    lea dx, prompt2
    call printString 

    call setInput 
    mov int2, ax
    call newLine 

    mov ax, int1
    mov bx, int2
    mul bx
    mov result, ax
	
    lea dx, resultMsg
    call printString 
	
    mov ax, result 
    call print 
	
    mov ax, 4C00h 
    int 21h
main endp
end main
