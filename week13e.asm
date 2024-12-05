; Filename: WEEK13E.ASM
; Programmer Name: KENT A. RATO
; Date: November 8, 2024
MAX_SIZE EQU 10
.MODEL SMALL
.STACK 100H
 
.DATA
    newline db 0Ah      ; Newline character (ASCII 10)
 
.CODE
.486
INCLUDE io.mac
 
main PROC
    .STARTUP
    mov CX, 1           ; Start the counter at 1
 
print_loop:
    cmp CX, MAX_SIZE+1  ; Compare the counter with 11 (MAX_SIZE + 1)
    jge done             ; If CX >= 11, we're done
 
    ; Print the current value of CX (integer)
    PutInt CX            ; Use the PutInt macro to print the number
    nwln                 ; Print newline after each number
 
    inc CX               ; Increment CX to print the next number
    jmp print_loop       ; Repeat the loop
 
done:
    ; Exit the program
    mov AX, 4C00h        ; DOS interrupt to terminate the program
    int 21h
 
main ENDP
END main