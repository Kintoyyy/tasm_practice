; Filename: EXER15.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: This assembly language program will continuously get
; character input and display back input until Enter key is pressed.

.model small
.stack 200h
.data
.code
ProgramStart:
    EchoLoop:
        mov ah,1 ; dos keyboard input
        int 21h ; get the next key
        cmp al,13 ; was the key Enter Key?
        js EchoDone ; yes, so we're done echoing
        mov dl, al ; put the character intp DL
        mov ah,2 ; dos display output function
        int 21h ; display the character
        jmp EchoLoop ; echi next character
    
    EchoDone:
        mov ah,4ch ;dos terminate program
        int 21h
end ProgramStart