; Filename: PARKING.ASM
; Simple Parking Slot Management Program
; Author: Shane Nathan B. Archival
; Date Finished: 11/21/2024
; This parking slot system is designed to register/book a parking spot in CIT-U Campus to avoid long queues
; the program is capable or creating, reading/displaying, updating, and deleting spots when necessary 

.MODEL small
.STACK 100h
.DATA

    maxSpots db 10                          ; Maximum number of parking spots
    emptyMsg db 'Empty$', 0                 ; Message to indicate the spot is empty
    parkingLot db 10 dup(20 dup('$'))       ; Array to hold names (each spot can have up to 20 chars)
    nameBuffer db 20 dup('$')               ; Temporary buffer to store a name (up to 20 chars)
    menu db 13, 10, '  CIT-U Campus Parking System Menu:', 13, 10
         db '  Created By: Shane Nathan B. Archival', 13, 10
         db '  11/28/24', 13, 10, 10
         db '  1. Create', 13, 10
         db '  2. Update', 13, 10
         db '  3. Delete', 13, 10
         db '  4. (Read) Display', 13, 10
         db '  5. Exit', 13, 10
         db 'Enter your choice: $'

    pressEnterMsg db 'Press Enter to continue:$'
    prompt db 'Enter the parking spot number (1-10): $'
    inputMsg db 'Enter name for the parking spot: $'
    updateMsg db 'Enter the new name: $'
    spotUpdate db 13, 10, 'Enter the spot number to update (1-10): $'
    spotDelete db 13, 10, 'Enter the spot number to delete (1-10): $'
    spotDeleted db 13, 10,'Spot deleted $'
    exitMsg db 'Exiting program...$'
    invalidChoice db 13, 10,'Invalid choice. Try again!$'
    newline db '', 0dh, 0ah, '$'

    promptName db 'Register new account: $'  ; Message to prompt user
    thisname db 20, 0  ; Reserve 20 bytes for the name (first byte holds the max length, 0 at the end for null termination)
    promptpass db '     r password: $'  ; Message to prompt user
    thispass db 20, 0  ; Reserve 20 bytes for the name (first byte holds the max length, 0 at the end for null termination)
    enterpass db 20, 0  ; Reserve 20 bytes for the name (first byte holds the max length, 0 at the end for null termination)
    welcome db 13, 10,'Welcome! $'  ; Message to prompt user
    promptlogin db 13, 10,' Log in: $'  ; Message to prompt user
    thislogin db 20, 0  ; Reserve 20 bytes for the name (first byte holds the max length, 0 at the end for null termination)

.CODE
start:
    ; Set up the data segment
    mov ax, @data
    mov ds, ax

    ; Clear screen
    mov ax, 0       ; Clear screen
    int 10h

    ; Print the prompt message
    mov ah, 09h
    lea dx, welcome
    int 21h

    ; Print the prompt message
    mov ah, 09h
    lea dx, promptName
    int 21h

    ; Read the name input from the user
    lea dx, thisname    ; Load the address of the name variable
    mov ah, 0Ah     ; DOS interrupt for buffered input
    int 21h         ; Call DOS interrupt

    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h

    ; Print the prompt message
    mov ah, 09h
    lea dx, promptpass
    int 21h

    ; Read the name input from the user
    lea dx, thispass    ; Load the address of the name variable
    mov ah, 0Ah     ; DOS interrupt for buffered input
    int 21h         ; Call DOS interrupt

    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h

    ; Print the prompt message
    mov ah, 09h
    lea dx, promptlogin
    int 21h

    ; Read the name input from the user
    lea dx, thislogin    ; Load the address of the name variable
    mov ah, 0Ah     ; DOS interrupt for buffered input
    int 21h         ; Call DOS interrupt

    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h

    ; Print the prompt message
    mov ah, 09h
    lea dx, promptpass
    int 21h

    ; Read the name input from the user
    lea dx, enterpass    ; Load the address of the name variable
    mov ah, 0Ah     ; DOS interrupt for buffered input
    int 21h         ; Call DOS interrupt

mainLoop:
    ; Clear screen
    mov ax, 0       ; Clear screen
    int 10h

    mov ah, 06h
    xor al, al
    xor cx, cx

    mov ah, 06h
    mov ch, 0
    mov cl, 0
    mov dh, 5
    mov dl, 44
    mov bh, 04Ah
    int 10h

    mov ah, 06h
    mov ch, 1
    mov cl, 0
    mov dh, 3
    mov dl, 44
    mov bh, 07Eh
    int 10h

    mov ah, 06h
    mov ch, 5
    mov cl, 0
    mov dh, 9
    mov dl, 44
    mov bh, 07Fh
    int 10h

    mov ah, 06h
    mov ch, 10
    mov cl, 0
    mov dh, 10
    mov dl, 44
    mov bh, 09Fh
    int 10h

    ; Display the menu
    mov dx, offset menu
    mov ah, 9
    int 21h

    ; Get user choice
    mov ah, 1
    int 21h
    sub al, '0'             ; Convert ASCII to integer (1-5)
    mov bl, al              ; Store choice in BL

    ; Process based on user choice
    cmp bl, 1               ; Create
    je printnewline
    ;jnz checkAgain

    cmp bl, 2               ; Update
    je updateSpot
    jnz checkAgain

    ; Invalid choice
    mov dx, offset invalidChoice
    mov ah, 9
    int 21h
    jmp mainLoop

printnewline:
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h
    jz createSpot

createSpot:
    ; Prompt user for the parking spot number
    mov dx, offset prompt
    mov ah, 9
    int 21h

    ; Get the parking spot number (1-10)
    mov ah, 1
    int 21h
    sub al, '0'            ; Convert ASCII to integer (1-10)
    mov cl, al             ; Store the spot number in CL
    dec cl                 ; Convert to zero-indexed (0-9)

    ; Calculate the offset: cl * 20 (each spot is 20 bytes)
    mov al, cl             ; Move cl into al (lower 8 bits of ax)
    mov bl, 20             ; Load the multiplier (20) into bl
    mul bl                 ; Multiply al by bl, result is stored in ax (ax = cl * 20)
    mov di, ax             ; Store the result in di (offset)

    ; Check if the selected spot is empty (first character is '$')
    lea si, parkingLot
    add si, di             ; Move to the start of the selected spot
    mov al, [si]           ; Load the first byte (check if the spot is empty)
    cmp al, '$'
    je printnewlineAgain       ; If empty, prompt for a name

    ; If the spot is not empty, notify the user
    jmp spotNotOccupied

printnewlineAgain:
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h
    jz promptForName

promptForName:
    ; Prompt for the name to be stored
    mov dx, offset inputMsg
    mov ah, 9
    int 21h

    ; Get name for the spot (up to 20 characters)
    lea dx, nameBuffer
    mov ah, 0Ah
    int 21h

    ; Store the name in the selected parking spot
    lea di, nameBuffer + 2 ; Skip the first two bytes of the buffer (length info)
    mov cx, 20             ; Max length of the name

storeNameLoop:
    mov al, [di]
    mov [si], al           ; Store the current character at the index in parkingLot
    inc si                 ; Move to the next character in the parking spot
    inc di                 ; Move to the next character in the name buffer
    loop storeNameLoop

    jmp mainLoop

checkAgain:
    ;check again
    cmp bl, 3
    jz deleteSpot
    jnz check4

updateSpot:
    ; Prompt user for the parking spot number to update
    mov dx, offset spotUpdate
    mov ah, 9
    int 21h

    ; Get the parking spot number (1-10)
    mov ah, 1
    int 21h
    sub al, '0'            ; Convert ASCII to integer (1-10)
    mov cl, al             ; Store the spot number in CL
    dec cl                 ; Convert to zero-indexed (0-9)

    ; Calculate the offset: cl * 20 (each spot is 20 bytes)
    mov al, cl             ; Move cl into al (lower 8 bits of ax)
    mov bl, 20             ; Load the multiplier (20) into bl
    mul bl                 ; Multiply al by bl, result is stored in ax (ax = cl * 20)
    mov di, ax             ; Store the result in di (offset)

    ; Check if the selected spot has a name
    lea si, parkingLot
    add si, di             ; Move to the start of the selected spot
    mov al, [si]
    cmp al, '$'
    je spotNotOccupied     ; If empty, notify user

    ; Prompt for the new name
    mov dx, offset updateMsg
    mov ah, 9
    int 21h

    ; Get the new name (up to 20 characters)
    lea dx, nameBuffer
    mov ah, 0Ah
    int 21h

    ; Store the new name in the selected parking spot
    lea di, nameBuffer + 2 ; Skip the first two bytes of the buffer (length info)
    mov cx, 20             ; Max length of the name

storeNewNameLoop:
    mov al, [di]
    mov [si], al           ; Store the current character at the index in parkingLot
    inc si                 ; Move to the next character in the parking spot
    inc di                 ; Move to the next character in the name buffer
    loop storeNewNameLoop

    jmp mainLoop

check4:
    ;check again
    cmp bl, 4
    jz printnewlinefirst
    jnz check5

check5:
    ;check again
    cmp bl, 5
    jz exitpart
    jnz invalidprog

invalidprog:
    mov dx, offset invalidChoice
    mov ah, 9
    int 21h
    jmp waitForEnterUpdate

spotNotOccupied:
    mov dx, offset invalidChoice
    mov ah, 9
    int 21h
    je waitForEnterUpdate

waitForEnterUpdate:
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h

    ; Prompt "Press Enter to continue" message
    mov dx, offset pressEnterMsg
    mov ah, 9
    int 21h

    mov ah, 1              ; Read a single character from standard input
    int 21h                ; The character is stored in AL
    cmp al, 13             ; Check if the character is Enter (ASCII code 13)
    jne waitForEnterUpdate ; Loop until Enter is pressed

    jmp mainLoop

deleteSpot:
    ; Prompt user for the parking spot number to delete
    mov dx, offset spotDelete
    mov ah, 9
    int 21h

    ; Get the parking spot number (1-10)
    mov ah, 1
    int 21h
    sub al, '0'            ; Convert ASCII to integer (1-10)
    mov cl, al             ; Store the spot number in CL
    dec cl                 ; Convert to zero-indexed (0-9)

    ; Calculate the offset: cl * 20 (each spot is 20 bytes)
    mov al, cl             ; Move cl into al (lower 8 bits of ax)
    mov bl, 20             ; Load the multiplier (20) into bl
    mul bl                 ; Multiply al by bl, result is stored in ax (ax = cl * 20)
    mov di, ax             ; Store the result in di (offset)

    ; Check if the spot is already empty
    lea si, parkingLot
    add si, di             ; Move to the start of the selected spot
    mov al, [si]
    cmp al, '$'
    je spotNotOccupied     ; If empty, notify user

    ; Clear the name in the selected parking spot
    mov byte ptr [si], '$'

    mov dx, offset spotDeleted
    mov ah, 9
    int 21h

    jmp waitForEnterUpdate2

exitpart:
    ;check again
    cmp bl, 5
    jz exitProgram
    jnz invalidprog

printnewlinefirst:
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h
    jz displaySpots

displaySpots:
    ; Display all parking spots
    lea si, parkingLot         ; Point to the start of the parkingLot array
    mov cx, 10                 ; Iterate through 10 parking spots

displayLoop:

    mov al, [si]               ; Load the first character of the current spot
    cmp al, '$'                ; Check if the spot is empty
    je printEmpty              ; If empty, jump to printEmpty

    ; Print the name stored in the current spot
    mov dx, si                 ; Set DX to point to the start of the name
    mov ah, 9                  ; Function to display a string
    int 21h                    ; Display the string

    ; Print a newline after the name
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h                    ; Display the newline

    jmp nextSpot               ; Jump to next spot

printEmpty:
    ; Print a message indicating the spot is empty
    mov dx, offset emptyMsg    ; Set DX to point to "Empty"
    mov ah, 9                  ; Function to display a string
    int 21h                    ; Display the "Empty" message

    ; Print a newline after the message
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h                    ; Display the newline

nextSpot:
    add si, 20                 ; Move to the next parking spot (20 bytes per spot)
    loop displayLoop            ; Decrement CX and repeat if CX != 0


    ;jmp mainLoop               ; Return to the main loop after displaying all spots

    ; Display the message "Press Enter to continue:"
    mov dx, offset pressEnterMsg
    mov ah, 9
    int 21h

    ; Wait for the user to press Enter
    mov ah, 1          ; Read a single character from standard input
    int 21h            ; The character is stored in AL
    cmp al, 13         ; Check if the character is Enter (ASCII code 13)
    jne waitForEnterUpdate2   ; If not, loop until Enter is pressed

    jmp continue       ; Jump to the next part of the program when Enter is pressed

waitForEnterUpdate2:
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h

    ; Prompt "Press Enter to continue" message
    mov dx, offset pressEnterMsg
    mov ah, 9
    int 21h

    mov ah, 1              ; Read a single character from standard input
    int 21h                ; The character is stored in AL
    cmp al, 13             ; Check if the character is Enter (ASCII code 13)
    jne waitForEnterUpdate2 ; Loop until Enter is pressed

    jmp mainLoop

waitForEnter:
    jmp $               ; Infinite loop to keep waiting until Enter is pressed

continue:
    jmp mainLoop               ; Return to the main loop after displaying all spots

exitProgram:
    mov dx, offset newline     ; Set DX to point to the newline character
    mov ah, 9                  ; Function to display a string
    int 21h
    ; Exit message and program termination
    mov dx, offset exitMsg
    mov ah, 9
    int 21h
    mov ah, 4Ch
    int 21h

END start