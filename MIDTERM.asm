; Filename: MIDTERM.ASM
; CS243 Lab Hands-on Midterm Exam
; First Semester SY 2024-2025
; Student Name: Kent A. Rato
; Date Finished: October 10, 2024

.model small
.stack 100h
.data

    header db "  Online Grocery Order Form", 13,10, 
    db ' Programmer: KENT A. RATO', 13, 10,
    db ' Date: October 10, 2024', 13, 10, 10, '$'

    prompt1 db '  Please enter your 5 grocery items:', 13, 10, '$'
    item1 db '  Item No. 1: $'
    item2 db 13, 10, '  Item No. 2: $'
    item3 db 13, 10, '  Item No. 3: $'
    item4 db 13, 10, '  Item No. 4: $'
    item5 db 13, 10, '  Item No. 5: $'

    itemValue1 db 50 dup('$')
    itemValue2 db 50 dup('$')
    itemValue3 db 50 dup('$')
    itemValue4 db 50 dup('$')
    itemValue5 db 50 dup('$')

    tableHeader db  10, 10, 09, 09,'ORDER SUMMARY', '$'
    tableRow1  db 13, 10, '   Item No. 1:', 09, 179, ' $'
    tableRow2  db 13, 10, '   Item No. 2:', 09, 179, ' $'
    tableRow3  db 13, 10, '   Item No. 3:', 09, 179, ' $'
    tableRow4  db 13, 10, '   Item No. 4:', 09, 179, ' $'
    tableRow5  db 13, 10, '   Item No. 5:', 09, 179, ' $'

    footer db 10,10,'  Thank you for shopping!'
    db 13,10, '  Order again soon.', 13, 10, 10, '$'

.code
    print proc
        mov ah, 09h
        int 21h
        ret
    print endp

    input proc
        mov ah, 0AH
        int 21h
        ret
    input endp
start:
    mov ax, @data
    mov ds, ax

    mov ax, 3
    int 10h

    xor al, al

    lea dx, header
    call print

    lea dx, prompt1
    call print

    lea dx, item1
    call print
    lea dx, itemValue1
    call input

    lea dx, item2
    call print
    lea dx, itemValue2
    call input

    lea dx, item3
    call print
    lea dx, itemValue3
    call input

    lea dx, item4
    call print
    lea dx, itemValue4
    call input

    lea dx, item5
    call print
    lea dx, itemValue5
    call input

    mov ah, 06h
    mov ch, 11
    mov cl, 2
    mov dh, 16
    mov dl, 39
    mov bh, 70h
    int 10h

    mov ah, 06h
    mov ch, 11
    mov cl, 2
    mov dh, 11
    mov dl, 39
    mov bh, 4Eh
    int 10h

    mov ah, 06h
    mov ch, 13
    mov cl, 2
    mov dh, 13
    mov dl, 39
    mov bh, 030h
    int 10h

    mov ah, 06h
    mov ch, 15
    mov cl, 2
    mov dh, 15
    mov dl, 39
    mov bh, 030h
    int 10h

    mov ah, 06h
    mov ch, 19
    mov cl, 2
    mov dh, 19
    mov dl, 18
    mov bh, 0Ceh
    int 10h

    ; Middle line color
    mov ah, 06h
    mov ch, 12
    mov cl, 16
    mov dh, 16
    mov dl, 16
    mov bh, 78h
    int 10h

    mov ah, 06h
    mov ch, 13
    mov cl, 16
    mov dh, 13
    mov dl, 16
    mov bh, 038h
    int 10h
    
    mov ah, 06h
    mov ch, 15
    mov cl, 16
    mov dh, 15
    mov dl, 16
    mov bh, 038h
    int 10h

    lea dx, tableHeader
    call print

    lea dx, tableRow1
    call print
    lea dx, itemValue1+2
    call print

    lea dx, tableRow2
    call print
    lea dx, itemValue2+2
    call print

    lea dx, tableRow3
    call print
    lea dx, itemValue3+2
    call print

    lea dx, tableRow4
    call print
    lea dx, itemValue4+2
    call print

    lea dx, tableRow5
    call print
    lea dx, itemValue5+2
    call print

    lea dx, footer
    call print

    mov ax, 4C00h
    int 21h
end start