;Filename: EXER8.ASM
;Displaying strings of text
;KENT A. RATO
;Date: August 30, 2024

.model small
.stack 100h
.data
	line1 db 'Kent A Rato$'
	line2 db 'Bachelor of Science in Computer Science 2nd Year$'
	line3 db 'College of Computer Studies$'
	line4 db 'Cebu Institute of Technology - University$'
.code

main:
	;set up data
	mov ax,@data
	mov ds, ax
	
	;line1
	mov ah,09h
	mov dx,offset line1
	int 21h
	
	;\n
	mov ah,02h
	mov cl,0Ah
	mov dl,cl
	int 21h
	
	;line2
	mov ah,09h
	mov dx,offset line2
	int 21h
	
	;\n
	mov ah,02h
	mov cl,0Ah
	mov dl,cl
	int 21h
	
	;line3
	mov ah,09h
	mov dx,offset line3
	int 21h
	
	;\n
	mov ah,02h
	mov cl,0Ah
	mov dl,cl
	int 21h
	
	;line4
	mov ah,09h
	mov dx,offset line4
	int 21h
	
int 27h
end 

