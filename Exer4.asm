; CAP = SMALL
; 4 = 6
; 5 = 7
; space = 20
.model small
.code
.stack 100
start:

mov ah,09h
mov bl,3Eh
mov cx,7
int 10h

;C
mov ah,02h
mov cl,43h
mov dl,cl
int 21h

;O
mov ah,02h
mov cl,6Fh
mov dl,cl
int 21h

;L
mov ah,02h
mov cl,6Ch
mov dl,cl
int 21h

;L
mov ah,02h
mov cl,6Ch
mov dl,cl
int 21h

;E
mov ah,02h
mov cl,65h
mov dl,cl
int 21h

;G
mov ah,02h
mov cl,67h
mov dl,cl
int 21h

;E
mov ah,02h
mov cl,65h
mov dl,cl
int 21h

;\n
mov ah,02h
mov cl,0Ah
mov dl,cl
int 21h

mov ah,09h
mov bl,4Eh
mov cx,2
int 10h

;O
mov ah,02h
mov cl,6Fh
mov dl,cl
int 21h

;F
mov ah,02h
mov cl,66h
mov dl,cl
int 21h

;\n
mov ah,02h
mov cl,0Ah
mov dl,cl
int 21h


;C
mov ah,02h
mov cl,43h
mov dl,cl
int 21h

;O
mov ah,02h
mov cl,6Fh
mov dl,cl
int 21h

;M
mov ah,02h
mov cl,6Dh
mov dl,cl
int 21h

;P
mov ah,02h
mov cl,70h
mov dl,cl
int 21h

;U
mov ah,02h
mov cl,75h
mov dl,cl
int 21h

;T
mov ah,02h
mov cl,74h
mov dl,cl
int 21h

;E
mov ah,02h
mov cl,65h
mov dl,cl
int 21h

;R
mov ah,02h
mov cl,72h
mov dl,cl
int 21h

;\n
mov ah,02h
mov cl,0Ah
mov dl,cl
int 21h

;S
mov ah,02h
mov cl,73h
mov dl,cl
int 21h

;T
mov ah,02h
mov cl,74h
mov dl,cl
int 21h

;U
mov ah,02h
mov cl,75h
mov dl,cl
int 21h

;D
mov ah,02h
mov cl,64h
mov dl,cl
int 21h

;I
mov ah,02h
mov cl,69h
mov dl,cl
int 21h

;E
mov ah,02h
mov cl,65h
mov dl,cl
int 21h

;S
mov ah,02h
mov cl,73h
mov dl,cl
int 21h

int 27h ; terminate
end start ; end program