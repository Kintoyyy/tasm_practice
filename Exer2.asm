;Filename: EXER2.ASM
;display using single characters:
;KENT A. RATO
;Date: August 30, 2024
.model small
.code
.stack 100
      start:

      ;K
            mov ah,02h
            mov cl,4Bh
            mov dl,cl
            int 21h

      ;e
            mov ah,02h
            mov cl,65h
            mov dl,cl
            int 21h

      ;n
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;t
            mov ah,02h
            mov cl,74h
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,41h
            mov dl,cl
            int 21h

      ;M
            mov ah,02h
            mov cl,6Dh
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,61h
            mov dl,cl
            int 21h

      ;M
            mov ah,02h
            mov cl,6Dh
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,61h
            mov dl,cl
            int 21h

      ;L
            mov ah,02h
            mov cl,6Ch
            mov dl,cl
            int 21h

      ;I
            mov ah,02h
            mov cl,69h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;R
            mov ah,02h
            mov cl,52h
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,61h
            mov dl,cl
            int 21h

      ;T
            mov ah,02h
            mov cl,74h
            mov dl,cl
            int 21h

      ;O
            mov ah,02h
            mov cl,6Fh
            mov dl,cl
            int 21h

      ;\n
            mov ah,02h
            mov cl,0Ah
            mov dl,cl
            int 21h

      ;B
            mov ah,02h
            mov cl,42h
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,61h
            mov dl,cl
            int 21h

      ;C
            mov ah,02h
            mov cl,63h
            mov dl,cl
            int 21h

      ;H
            mov ah,02h
            mov cl,68h
            mov dl,cl
            int 21h

      ;E
            mov ah,02h
            mov cl,65h
            mov dl,cl
            int 21h

      ;L
            mov ah,02h
            mov cl,6Ch
            mov dl,cl
            int 21h

      ;O
            mov ah,02h
            mov cl,6Fh
            mov dl,cl
            int 21h

      ;R
            mov ah,02h
            mov cl,72h
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

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

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;S
            mov ah,02h
            mov cl,53h
            mov dl,cl
            int 21h

      ;C
            mov ah,02h
            mov cl,63h
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

      ;N
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;C
            mov ah,02h
            mov cl,63h
            mov dl,cl
            int 21h

      ;E
            mov ah,02h
            mov cl,65h
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;I
            mov ah,02h
            mov cl,49h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
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

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;S
            mov ah,02h
            mov cl,53h
            mov dl,cl
            int 21h

      ;C
            mov ah,02h
            mov cl,63h
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

      ;N
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;C
            mov ah,02h
            mov cl,63h
            mov dl,cl
            int 21h

      ;E
            mov ah,02h
            mov cl,65h
            mov dl,cl
            int 21h


      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;2
            mov ah,02h
            mov cl,32h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;D
            mov ah,02h
            mov cl,64h
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;Y
            mov ah,02h
            mov cl,79h
            mov dl,cl
            int 21h

      ;E
            mov ah,02h
            mov cl,65h
            mov dl,cl
            int 21h

      ;A
            mov ah,02h
            mov cl,61h
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

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

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

      ;Space
            mov ah,02h
            mov cl,20h
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

      ;Space
            mov ah,02h
            mov cl,20h
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

      ;E
            mov ah,02h
            mov cl,65h
            mov dl,cl
            int 21h

      ;B
            mov ah,02h
            mov cl,62h
            mov dl,cl
            int 21h

      ;U
            mov ah,02h
            mov cl,75h
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;I
            mov ah,02h
            mov cl,69h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,6Eh
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

      ;I
            mov ah,02h
            mov cl,69h
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

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

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

      ;Space
            mov ah,02h
            mov cl,20h
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

      ;C
            mov ah,02h
            mov cl,63h
            mov dl,cl
            int 21h

      ;H
            mov ah,02h
            mov cl,68h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,6Eh
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

      ;O
            mov ah,02h
            mov cl,6Fh
            mov dl,cl
            int 21h

      ;G
            mov ah,02h
            mov cl,67h
            mov dl,cl
            int 21h

      ;Y
            mov ah,02h
            mov cl,79h
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;-
            mov ah,02h
            mov cl,2Dh
            mov dl,cl
            int 21h

      ;Space
            mov ah,02h
            mov cl,20h
            mov dl,cl
            int 21h

      ;U
            mov ah,02h
            mov cl,75h
            mov dl,cl
            int 21h

      ;N
            mov ah,02h
            mov cl,6Eh
            mov dl,cl
            int 21h

      ;I
            mov ah,02h
            mov cl,69h
            mov dl,cl
            int 21h

      ;V
            mov ah,02h
            mov cl,76h
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

      ;S
            mov ah,02h
            mov cl,73h
            mov dl,cl
            int 21h

      ;I
            mov ah,02h
            mov cl,69h
            mov dl,cl
            int 21h

      ;T
            mov ah,02h
            mov cl,74h
            mov dl,cl
            int 21h

      ;Y
            mov ah,02h
            mov cl,79h
            mov dl,cl
            int 21h


            int 27h         ; terminate
end start ; end program