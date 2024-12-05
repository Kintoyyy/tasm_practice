; Mirambel Homes Car Parking Slot Management System
; Programmer Name: JOHN WINSTON W.TABADA
; Date: November 22, 2024
; Description: Parking slot system that takes an input from a user to either
;              add someone to the slots or remove someone from the slot after parking
;              then it updates the slot when an add or remove action is done
;              then displays the parked cars in the slot
 
 
.model small
.stack 500h
.data   
    MAX_USERS    equ 10
    NAME_LENGTH  equ 20
    PASS_LENGTH  equ 20

    ; Arrays for storing user data
    user_names   db MAX_USERS * NAME_LENGTH dup('$')
    user_passes  db MAX_USERS * PASS_LENGTH dup('$')
    user_count   db 0
    
    ; Arrays for parking slots
    slot_users   db MAX_USERS * NAME_LENGTH dup('$')
    slot_status  db MAX_USERS dup(0)  ; 0=empty, 1=occupied

    temp_buffer  db 20 dup('$')  ; Temporary buffer for input comparison

    SPLASH  db  '     __  __   _                              _              _',13,10, \
                '    |  \/  | (_)  _ __    __ _   _ __ ___   | |__     ___  | |',13,10, \
                '    | |\/| | | | | ''__|  / _` | | ''_ ` _ \  | ''_ \   / _ \ | |',13,10, \
                '    | |  | | | | | |    | (_| | | | | | | | | |_) | |  __/ | |',13,10, \
                '    |_|  |_| |_| |_|     \__,_| |_| |_| |_| |_.__/   \___| |_|',13,10, \
                '              _   _',13,10, \
                '             | | | |   ___    _ __ ___     ___   ___',13,10, \
                '             | |_| |  / _ \  | `_  `_ \   / _ \ / __|',13,10, \
                '             |  _  | | (_) | | | | | | | |  __/ \__ \',13,10, \
                '             |_| |_|  \___/  |_| |_| |_|  \___| |___/',13,10,10, \
                '               Car Parking Slot Management System',13,10,10, '$'

    CREDITS db  '           JOHN WINSTON W. TABADA    NOVEMBER 22,2024',13,10,10,10,10,10,10, \
                '                    Press any key to continue....$'

    COMMANDS db '                    Enter the number of the Command!',13,10,10, \
                '                         > 1 : Clock in',13,10, \
                '                         > 2 : Clock out',13,10, \
                '                         > 3 : Check Slots',13,10, \
                '                         > 4 : Register (For New Resident)',13,10, \
                '                         > 5 : Exit Program',13,10,10,10, \
                '>>> Enter Choice: ', '$'

    LOG_IN_MSG db '                         Clock In Page',13,10,10, \
                  '> Enter Family Last Name : $'
    LOG_IN_PASSWORD db 13,10,'> Enter password : $'
    LOG_IN_SUCCESS db 13,10,10,'Clocked in successfully! Press any key to continue...', 13, 10, '$'

    LOG_OUT_MSG db '                         Clock Out Page',13,10,10, \
                  '> Enter Family Last Name : $'
    LOG_OUT_SUCCESS db 13,10,10,'Clocked out successfully! Press any key to continue...', 13, 10, '$'

    CHECK_SLOTS_MSG db '                         Mirambel Homes Parking Slot',13,10,10,'$'

    REGISTER_MSG db '                         Register Page',13,10,10, \
                    '> Enter Family Last Name : $'

    REGISTER_SUCCESS db 13,10,10,'Registered successfully! Press any key to continue...', 13, 10, '$'


    EXIT_MSG db 'Have a Good Day!',13,10,'$'
    
    LOGIN_FAILURE db 13,10,'Invalid credentials. Please try again.', 13, 10, '$'
    LOGOUT_FAILURE db 13,10,'User not found in parking slots.', 13, 10, '$'
    REGISTER_FULL db 13,10,'Registration is full. Cannot add more users.', 13, 10, '$'

    inputBuffer db 20 dup('$')
    inputLength db 0    

    ; Add slot tracking
    slot_taken db MAX_USERS dup(0)  ; 0=empty, 1=taken
    temp_name db NAME_LENGTH dup('$')
    temp_pass db PASS_LENGTH dup('$')

    ; Add this to the .data segment
    users_header db 'Users clocked in: $'

.code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ------------------- utility methods ------------------- ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

compare_strings PROC
    ; Compare strings pointed to by SI and DI
    ; Returns AL=1 if strings are equal, AL=0 otherwise
    push cx
    push si
    push di
    xor al, al      ; Clear AL (set to 0, meaning not equal)

compare_loop:
    mov al, [si]    ; Get character from first string
    mov ah, [di]    ; Get character from second string
    
    ; Check for end of strings
    cmp al, '$'
    je check_second_end
    cmp ah, '$'
    je strings_not_equal
    
    ; Compare characters
    cmp al, ah
    jne strings_not_equal
    
    inc si
    inc di
    jmp compare_loop

check_second_end:
    cmp ah, '$'
    jne strings_not_equal
    mov al, 1       ; Strings are equal
    jmp compare_done

strings_not_equal:
    xor al, al      ; Set AL to 0 (not equal)

compare_done:
    pop di
    pop si
    pop cx
    ret
compare_strings ENDP

print_string PROC
    ; Print string pointed to by SI
    push ax
    push dx
    mov dx, si
    mov ah, 09h
    int 21h
    pop dx
    pop ax
    ret
print_string ENDP
print PROC
    mov  ah, 09h
    int  21h
    ret
print ENDP
terminate PROC
    mov  ax, 4C00h
    int  21h
terminate ENDP
getInput PROC
    lea dx, inputBuffer
    mov ah, 0Ah  
    int 21h      

    mov al, inputBuffer[1]  
    mov inputLength, al
    ret
getInput ENDP
next PROC
    mov ah,01h
    int 21h

    ret
next ENDP
newLine PROC
    mov  ah, 02h
    mov  dl, 13
    int  21h
    mov  ah, 02h
    mov  dl, 10
    int  21h
    ret
newLine ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ------------------- display methods ------------------- ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

SPLASH_SCREEN PROC
    mov  ax, 6
    int  10h

    lea dx, SPLASH
    call print
    lea dx, CREDITS
    call print

    call next
    call MENU
    ret
SPLASH_SCREEN ENDP

MENU PROC
    mov  ax, 6
    int  10h

    lea dx, COMMANDS
    call print

    call getInput

    lea si, inputBuffer + 2 
    mov al, inputLength
    mov ah, 0
    mov cx, ax

    cmp cx, 1
    jne invalid

    mov al, [si]
    cmp al, '1'
    je clockin
    cmp al, '2'
    je clockout
    cmp al, '3'
    je checkslots
    cmp al, '4'
    je register
    cmp al, '5'
    je exitProg
    
    invalid:
        call MENU
        ret
    clockin:
        call CLOCK_IN
        ret
    clockout:
        call CLOCK_OUT
        ret
    checkslots:
        call CHECK_SLOTS
        ret
    register:
        call SIGN_IN
        ret
    exitProg:
        call EXIT
        ret
MENU ENDP

SIGN_IN PROC
    mov ax, 6
    int 10h
    
    ; Check if max users reached
    mov al, user_count
    cmp al, MAX_USERS
    jae full_error
    
    ; Get name
    lea dx, REGISTER_MSG
    call print
    call getInput
    
    ; Copy name to user_names array
    mov al, user_count
    mov bl, NAME_LENGTH
    mul bl
    lea di, user_names
    add di, ax
    
    lea si, inputBuffer + 2
    mov cl, inputLength
    mov ch, 0
copy_name:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_name
    mov byte ptr [di], '$'
    
    ; Get password
    lea dx, LOG_IN_PASSWORD
    call print
    call getInput
    
    ; Copy password to user_passes array
    mov al, user_count
    mov bl, PASS_LENGTH
    mul bl
    lea di, user_passes
    add di, ax
    
    lea si, inputBuffer + 2
    mov cl, inputLength
    mov ch, 0
copy_pass:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_pass
    mov byte ptr [di], '$'
    
    inc user_count
    lea dx, REGISTER_SUCCESS
    jmp sign_in_done
    
full_error:
    lea dx, REGISTER_FULL
sign_in_done:
    call print
    call next
    call MENU
    ret
SIGN_IN ENDP

CLOCK_IN PROC
    mov ax, 6
    int 10h
    
    ; Get name
    lea dx, LOG_IN_MSG
    call print
    call getInput
    
    ; Save input name
    lea si, inputBuffer + 2
    lea di, temp_name
    mov cl, inputLength
    mov ch, 0
copy_input_name:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_input_name
    mov byte ptr [di], '$'
    
    ; Get password
    lea dx, LOG_IN_PASSWORD
    call print
    call getInput
    
    ; Save input password
    lea si, inputBuffer + 2
    lea di, temp_pass
    mov cl, inputLength
    mov ch, 0
copy_input_pass:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_input_pass
    mov byte ptr [di], '$'
    
    ; Find matching user
    xor bx, bx  ; user index
    mov cl, user_count
find_user:
    push cx
    
    ; Compare name
    lea si, temp_name
    mov al, bl
    mov ah, 0
    push bx
    mov bl, NAME_LENGTH
    mul bl
    pop bx
    lea di, user_names
    add di, ax
    call compare_strings
    cmp al, 1
    jne next_user
    
    ; Compare password
    lea si, temp_pass
    mov al, bl
    mov ah, 0
    push bx
    mov bl, PASS_LENGTH
    mul bl
    pop bx
    lea di, user_passes
    add di, ax
    call compare_strings
    cmp al, 1
    je found_user
    
next_user:
    pop cx
    inc bx
    loop find_user
    jmp login_failed
    
found_user:
    pop cx
    ; Update slot status array
    mov slot_status[bx], 1    ; Mark slot as occupied
    
    ; Copy name to slot_users array
    mov al, bl
    mov bl, NAME_LENGTH
    mul bl                    ; Calculate offset
    lea si, temp_name        ; Source: temp_name
    lea di, slot_users       
    add di, ax               ; Add offset to destination
copy_to_slot:
    mov al, [si]
    mov [di], al
    cmp al, '$'             ; Check for end of string
    je copy_done
    inc si
    inc di
    jmp copy_to_slot
copy_done:
    mov byte ptr [di], '$'   ; Ensure null termination
    lea dx, LOG_IN_SUCCESS
    jmp clock_in_done
    
login_failed:
    lea dx, LOGIN_FAILURE
clock_in_done:
    call print
    call next
    call MENU
    ret
CLOCK_IN ENDP

CLOCK_OUT PROC
    mov ax, 6
    int 10h
    
    ; Get name to remove
    lea dx, LOG_OUT_MSG
    call print
    call getInput
    
    ; Save input name to temp buffer
    lea si, inputBuffer + 2
    lea di, temp_name
    mov cl, inputLength
    mov ch, 0
copy_out_name:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_out_name
    mov byte ptr [di], '$'
    
    ; Find slot to remove
    xor bx, bx      ; Initialize counter
    mov cl, user_count
find_slot:
    push cx
    push bx
    
    ; Calculate offset and compare name
    mov al, bl
    mov bl, NAME_LENGTH
    mul bl
    lea si, slot_users
    add si, ax
    lea di, temp_name
    call compare_strings
    pop bx
    
    cmp al, 1
    je found_slot
    
    pop cx
    inc bx
    loop find_slot
    jmp not_found
    
found_slot:
    pop cx          ; Clean up stack
    
    ; Clear slot_status
    mov slot_status[bx], 0
    
    ; Clear slot_users entry
    push bx
    mov al, bl
    mov bl, NAME_LENGTH
    mul bl
    lea di, slot_users
    add di, ax
    mov cx, NAME_LENGTH
clear_slot:
    mov byte ptr [di], '$'
    inc di
    loop clear_slot
    pop bx
    
    lea dx, LOG_OUT_SUCCESS
    jmp clock_out_done
    
not_found:
    lea dx, LOGOUT_FAILURE
clock_out_done:
    call print
    call next
    call MENU
    ret
CLOCK_OUT ENDP

CHECK_SLOTS PROC
    mov ax, 6
    int 10h
    
    lea dx, CHECK_SLOTS_MSG
    call print
    
    ; Count active slots
    xor cx, cx              ; Counter for active slots
    xor bx, bx              ; Slot index
count_slots:
    cmp bx, MAX_USERS
    je show_count
    cmp slot_status[bx], 1  ; Check if slot is active
    jne next_count
    inc cx                  ; Increment active slot counter
next_count:
    inc bx
    jmp count_slots
    
show_count:
    ; Display header
    lea dx, users_header
    call print
    
    ; Convert count to ASCII and display
    mov al, cl
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    
    ; Display " | 10"
    mov dl, ' '
    int 21h
    mov dl, '|'
    int 21h
    mov dl, ' '
    int 21h
    mov dl, '1'
    int 21h
    mov dl, '0'
    int 21h
    
    call newLine
    call newLine
    
    ; Display active slots
    xor bx, bx              ; Reset slot index
show_slots:
    cmp bx, MAX_USERS
    je check_done
    
    cmp slot_status[bx], 1  ; Check if slot is active
    jne next_slot
    
    ; Display slot contents
    push bx
    mov al, bl
    mov bl, NAME_LENGTH
    mul bl
    lea si, slot_users      ; Get address of slot name
    add si, ax
    call print_string       ; Print the name
    call newLine
    pop bx
    
next_slot:
    inc bx
    jmp show_slots
    
check_done:
    call next
    call MENU
    ret
CHECK_SLOTS ENDP

EXIT PROC
    mov  ax, 6
    int  10h

    lea dx, EXIT_MSG
    call print

    call terminate
    ret
EXIT ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ------------------- Main ------------------- ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
Main PROC        
    mov  ax, @data
    mov  ds, ax

    call SPLASH_SCREEN
Main ENDP
end Main