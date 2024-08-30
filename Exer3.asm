.model small
.code
.stack 100
start:

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;0
mov ah,02h
mov cl,30h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;1
mov ah,02h
mov cl,31h
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

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;3
mov ah,02h
mov cl,33h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;4
mov ah,02h
mov cl,34h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;5
mov ah,02h
mov cl,35h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;6
mov ah,02h
mov cl,36h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;7
mov ah,02h
mov cl,37h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;8
mov ah,02h
mov cl,38h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;9
mov ah,02h
mov cl,39h
mov dl,cl
int 21h

;\n
mov ah,02h
mov cl,0Ah
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;!
mov ah,02h
mov cl,21h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;*
mov ah,02h
mov cl,2Ah
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;#
mov ah,02h
mov cl,23h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;$
mov ah,02h
mov cl,24h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;%
mov ah,02h
mov cl,25h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;^
mov ah,02h
mov cl,5Eh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;&
mov ah,02h
mov cl,26h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;*
mov ah,02h
mov cl,2Ah
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;(
mov ah,02h
mov cl,28h
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;)
mov ah,02h
mov cl,29h
mov dl,cl
int 21h


;\n
mov ah,02h
mov cl,0Ah
mov dl,cl
int 21h

;!
mov ah,02h
mov cl,2Dh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;_
mov ah,02h
mov cl,5Fh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;+
mov ah,02h
mov cl,2Bh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;=
mov ah,02h
mov cl,3Dh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;{
mov ah,02h
mov cl,7Bh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;}
mov ah,02h
mov cl,7Dh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;[
mov ah,02h
mov cl,5Bh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;]
mov ah,02h
mov cl,5Dh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;<
mov ah,02h
mov cl,3Ch
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;?
mov ah,02h
mov cl,3Fh
mov dl,cl
int 21h

;Space
mov ah,02h
mov cl,20h
mov dl,cl
int 21h

;;
mov ah,02h
mov cl,3bh
mov dl,cl
int 21h
int 27h ; terminate
end start ; end program