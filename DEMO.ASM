;Filename: DEMO.ASM
; “Hello world!”
; KENT RATO
; Date: August 30, 2024

.model small
.code
.stack 100
      start:

      ; red text
            mov ah,09h
            mov bl,81h
            mov cx,12
            int 10h

      ;H
            mov ah,02h
            mov cl,48h
            mov dl,cl
            int 21h

      ;E
            mov ah,02h
            mov cl,45h
            mov dl,cl
            int 21h

      ;L
            mov ah,02h
            mov cl,4Ch
            mov dl,cl
            int 21h

      ;L
            mov ah,02h
            mov cl,4Ch
            mov dl,cl
            int 21h

      ;O
            mov ah,02h
            mov cl,4Fh
            mov dl,cl
            int 21h

      ;space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;W
            mov ah,02h
            mov cl,57h
            mov dl,cl
            int 21h

      ;O
            mov ah,02h
            mov cl,4Fh
            mov dl,cl
            int 21h

      ;R
            mov ah,02h
            mov cl,52h
            mov dl,cl
            int 21h

      ;L
            mov ah,02h
            mov cl,4Ch
            mov dl,cl
            int 21h

      ;D
            mov ah,02h
            mov cl,44h
            mov dl,cl
            int 21h

      ;!
            mov ah,02h
            mov cl,21h
            mov dl,cl
            int 21h

      ;new line
            mov ah,02h
            mov cl,0Ah
            mov dl,cl
            int 21h

      ;T
            mov ah,02h
            mov cl,54h
            mov dl,cl
            int 21h

      ;H
            mov ah,02h
            mov cl,48h
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,41h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,4Eh
            mov dl,cl
            int 21h

      ;K
            mov ah,02h
            mov cl,4Bh
            mov dl,cl
            int 21h

      ;space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;Y
            mov ah,02h
            mov cl,59h
            mov dl,cl
            int 21h

      ;O
            mov ah,02h
            mov cl,4Fh
            mov dl,cl
            int 21h

      ;U
            mov ah,02h
            mov cl,55h
            mov dl,cl
            int 21h

      ;!
            mov ah,02h
            mov cl,21h
            mov dl,cl
            int 21h

      ; red text
            mov ah,09h
            mov bl,84h
            mov cx,1
            int 10h

      ;heart
            mov ah,2
            mov dl,03h
            int 21h

      ;heart
            mov ah,2
            mov dl,04h
            int 21h

            int 27h         ; terminate
end start ; end program