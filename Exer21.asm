; Filename: EXER21.ASM
; Programmer Name: KETN RATO
; Date: SEPTEMBER 20, 2024
; Description: Create a program that asks for your first name, middle name, and
; family name. Then display “Hello, FIRST NAME MIDDLE NAME FAMILY NAME!”.

.MODEL small
.STACK 200h
.DATA
    regMsg db 'REGISTRATION FORM$', 0dh, 0ah
    firstNamePrompt db 0Dh, 0Ah,'Enter your first name: $'
    middleNamePrompt db 0Dh, 0Ah, 'Enter your middle name: $'
    familyNamePrompt db 0Dh, 0Ah, 'Enter your family name: $'
    greetingMessage db 0Dh, 0Ah, 'Hello, $'
    space db ' $'
    firstName db 20, 20 dup(?)
    middleName db 20, 20 dup(?)
    familyName db 20, 20 dup(?)
    exclamation db '!$'
 
 
.CODE
 
Main:
    mov ax, @data
    mov ds, ax
   
    mov dx, OFFSET regMsg
    mov ah, 09h
    int 21h
 
    mov dx, OFFSET firstNamePrompt
    mov ah, 09h
    int 21h
 
    lea dx, firstName
    mov ah, 0Ah
    int 21h
 
    mov dx, OFFSET middleNamePrompt
    mov ah, 09h
    int 21h
 
    lea dx, middleName
    mov ah, 0Ah
    int 21h
 
    mov dx, OFFSET familyNamePrompt
    mov ah, 09h
    int 21h
 
    lea dx, familyName
    mov ah, 0Ah
    int 21h
 
    mov dx, OFFSET greetingMessage
    mov ah, 09h
    int 21h
 
    lea si, firstName + 2 
    mov cl, [firstName+1] 
DisplayFirstName:
    mov dl, [si]  
    mov ah, 02h   
    int 21h
    inc si 
    loop DisplayFirstName          
 
    mov dl, ' '
    mov ah, 02h
    int 21h
 
    lea si, middleName + 2 
    mov cl, [middleName+1] 
DisplayMiddleName:
    mov dl, [si]  
    mov ah, 02h  
    int 21h
    inc si 
    loop DisplayMiddleName          
 

    mov dl, ' '
    mov ah, 02h
    int 21h
 
    lea si, familyName + 2 
    mov cl, [familyName+1] 
DisplayFamilyName:
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si 
    loop DisplayFamilyName    

    mov dl, '!'
    mov ah, 02h
    int 21h      
 
    mov ax, 4C00h
    int 21h
 
END Main
 