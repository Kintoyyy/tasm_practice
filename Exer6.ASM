;Filename: EXER6.ASM
;Displaying single characters, numbers, and symbols
;KENT A. RATO
;Date: August 30, 2024

.model small
.code
.stack 100h

	start:
	
	;blinking
	      mov ah,09h
	      mov bl,8Eh
	      mov cx,1
	      int 10h
	
	;I
	      mov ah,02h
	      mov cl,49h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;blinking red
	      mov ah,09h
	      mov bl,84h
	      mov cx,1
	      int 10h
	
	;red heart
	      mov ah,02h
	      mov dl,03h
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;blinking
	      mov ah,09h
	      mov bl,8Eh
	      mov cx,1
	      int 10h
	
	;U
	      mov ah,02h
	      mov cl,55h
	      mov dl,cl
	      int 21h
	
	      int 27h
end start
