; Filename: EXER29.ASM
; Programmer Name: Kent A. Rato
; Date: September 28, 2024
; Description : Make a program to input two integers, divide the first by
; the second integer, and display the quotient of the two
; integers.


.model small
.stack 100h
.data
    input1 db 'Enter first integer (dividend): $'
    input2 db 13,10,'Enter second integer (divisor): $'
    in1    dw ?
    in2    dw ?
    sum    dw ?
    sum1   db 20 DUP ('$')
    res    db 13,10,'Quotient: $'
.code

    itoa: 
          push ax
          push bx
          push cx
          push dx

          mov  cx, 0              ; Counter for digits
          mov  bx, 10             ; Base for decimal conversion

    loop1:
          xor  dx, dx             ; Clear DX for division
          div  bx                 ; Divide AX by 10
          push dx                 ; Push remainder onto stack
          inc  cx                 ; Increment digit count
          cmp  ax, 0              ; Check if quotient is zero
          jne  loop1

    loop2:
          pop  dx                 ; Pop remainder from stack
          add  dl, '0'            ; Convert to ASCII character
          mov  ah, 02h            ; Function to print a character
          int  21h
          dec  cx                 ; Decrement digit count
          cmp  cx, 0              ; Check if all digits are printed
          jne  loop2

          pop  dx
          pop  cx
          pop  bx
          pop  ax
          ret

    start:
          mov  ax, @data
          mov  ds, ax

          lea  dx, input1
          mov  ah, 9
          int  21h

          mov  ah, 01h
          int  21h
          sub  al, '0'
          mov  ah, 0
          mov  in1, ax

          lea  dx, input2
          mov  ah, 9
          int  21h

          mov  ah, 01h
          int  21h
          sub  al, '0'
          mov  ah, 0
          mov  in2, ax

          mov  ax, in1
          xor  dx, dx
          mov  bx, in2
          div  bx
          mov  sum, ax
   
          lea  dx, res
          mov  ah, 9
          int  21h

          mov  ax, sum
          call itoa
          mov  dx, offset sum1
          mov  ah, 9
          int  21h


          int  27h
end start