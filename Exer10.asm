;Filename: EXER8.ASM
;Displaying strings of text
;KENT A. RATO
;Date: August 30, 2024


.model small
.stack 100h
.data

    stitle        db  'College enrollment form$'
    sName         db  'First name             Last name$'
    sAddress      db  'Street Address$'
    slocation     db  'City                   State$'
    sBday         db  'Month           Day              Year$'


.code

; Procedure to print a single character
printChar proc
    mov ah, 02h          ; DOS function to print character
    int 21h              ; Call DOS interrupt
    ret                  ; Return from procedure
printChar endp

; Procedure to print a character a specific number of times
printCharNTimes proc
    ; Parameters:
    ;   DL - character to print
    ;   CX - number of times to print

printLoop:
    call printChar       ; Print the character
    loop printLoop       ; Repeat until CX is zero
    ret                  ; Return from procedure
printCharNTimes endp

start:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Title
    mov  ah,09h
    mov  dx,offset stitle
    int  21h

    ;\n
    mov dl, 0Ah
    call printChar

    ;Name
    mov  ah,09h
    mov  dx,offset sName
    int  21h

    ;\n
    mov dl, 0Ah
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ;Print Space
    mov dl, 20h
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ; Print newline
    mov dl, 0Ah
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;Space
    mov dl, 20h
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;\n
    mov dl, 0Ah
    call printChar

    ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Address
    mov  ah,09h
    mov  dx,offset sAddress
    int  21h

    ;\n
    mov dl, 0Ah
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 43
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ;\n
    mov dl, 0Ah
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 43
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;\n
    mov dl, 0Ah
    call printChar

    
    ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> location
    mov  ah,09h
    mov  dx,offset slocation
    int  21h

    ;\n
    mov dl, 0Ah
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ;Print Space
    mov dl, 20h
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ; Print newline
    mov dl, 0Ah
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;Space
    mov dl, 20h
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 20
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;\n
    mov dl, 0Ah
    call printChar

    ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Birthday
    mov  ah,09h
    mov  dx,offset sBday
    int  21h

    ;\n
    mov dl, 0Ah
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 13
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ;Print Space
    mov dl, 20h
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 13
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ;Print Space
    mov dl, 20h
    call printChar

    ; Print ┌ (218)
    mov dl, 218
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 13
    call printCharNTimes

    ; Print ┐ (191)
    mov dl, 191
    call printChar

    ; Print newline
    mov dl, 0Ah
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 13
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;Space
    mov dl, 20h
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 13
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

        ;Space
    mov dl, 20h
    call printChar

    ; Print └ (192)
    mov dl, 192
    call printChar

    ; Print loop char
    mov dl, 196
    mov cx, 13
    call printCharNTimes

    ; Print ┘ (217)
    mov dl, 217
    call printChar

    ;\n
    mov dl, 0Ah
    call printChar

    ; Terminate program
    mov ah, 4Ch
    int 21h
end start
