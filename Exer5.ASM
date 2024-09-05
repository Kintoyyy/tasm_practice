;Filename: EXER5.ASM
;Displaying single characters, numbers, and symbols
;KENT A. RATO
;Date: August 30, 2024

.model small
.code
.stack 100h

	start:
	
	;1st row color
	
	      mov ah,09h
	      mov bl,11h
	      mov cx,8
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;\n
	      mov ah,02h
	      mov cl,0Ah
	      mov dl,cl
	      int 21h
	
	;2nd row color blue
	      mov ah,09h
	      mov bl,11h
	      mov cx,3
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;2nd row color red
	      mov ah,09h
	      mov bl,44h
	      mov cx,2
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;2nd row color blue
	      mov ah,09h
	      mov bl,11h
	      mov cx,3
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;\n
	      mov ah,02h
	      mov cl,0Ah
	      mov dl,cl
	      int 21h
	
	;3rd row color blue
	      mov ah,09h
	      mov bl,11h
	      mov cx,1
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	
	;3rd row color red
	      mov ah,09h
	      mov bl,44h
	      mov cx,6
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;3rd row color blue
	      mov ah,09h
	      mov bl,11h
	      mov cx,1
	      int 10h
	
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;\n
	      mov ah,02h
	      mov cl,0Ah
	      mov dl,cl
	      int 21h
	
	;4th row color blue
	      mov ah,09h
	      mov bl,11h
	      mov cx,3
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;4th row color red
	      mov ah,09h
	      mov bl,44h
	      mov cx,2
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;4th row color blue
	      mov ah,09h
	      mov bl,11h
	      mov cx,3
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	;\n
	      mov ah,02h
	      mov cl,0Ah
	      mov dl,cl
	      int 21h
	
	;5th row color
	      mov ah,09h
	      mov bl,11h
	      mov cx,8
	      int 10h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      mov ah,02h
	      mov cl,20h
	      mov dl,cl
	      int 21h
	
	      int 27h
end start
