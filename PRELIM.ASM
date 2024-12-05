.model small
.stack 100h
.data

string  db '                                                                               ', 0dh, 0ah
        db '                   Cebu Institute of Technology - University                   ', 0dh, 0ah
        db '                       VEHICLE STICKER APPLICATION FORM                        ', 0dh, 0ah
        db '                        Please fill out the form below.                        ', 0dh, 0ah, 0ah
        db '   Personnel Type:           _______ V     Vehicle Sticker Type:  _________ V  ', 0dh, 0ah, 0ah
        db '   Name of Applicant/Driver: __________    ID Number:             ____________ ', 0dh, 0ah, 0ah
        db '   Mobile Number:            __________    Address:               ____________ ', 0dh, 0ah, 0ah
        db '   Vehicle Make(s)/Brand:    __________    Plate Number:          ____________ ', 0dh, 0ah, 0ah
        db '   Vehicle Color:            _______ V     Vehicle Type:          _________ V  ', 0dh, 0ah, 0ah, 0ah
        db '                                      SUBMIT                                   ', 0dh, 0ah, 0ah
        db '                          Copyright 2024 KENT A. RATO                          ', 0dh, 0ah, 0ah, 0ah
        db '                                    Thank You!                                  ', 0dh, 0ah, '$'


.code

;;;;;;;;;;;;;;; funtions
; gray background
fillGrayBg proc
    mov ah, 06h
    mov bh, 070h
    int 10h
    ret 
fillGrayBg endp

; red background
fillRedBg proc
    mov ah, 06h
    mov bh, 4Fh
    int 10h
    ret 
fillRedBg endp

;; not working
fillwhiteBg proc
    mov ah, 06h
    mov bh, 080h ; white color bg
    int 10h
    ret 
fillwhiteBg endp

;; Dropdown
dropDownCell proc
    mov ah, 06h
    mov bh, 4Fh
    int 10h
    ret 
dropDownCell endp

;; Input Cell color Fill
inputCell proc
    mov ah, 06h
    mov bh, 80h
    int 10h
    ret 
inputCell endp

button proc
    mov ah, 06h
    mov bh, 4Eh ; yellow text with red background
    int 10h
    ret 
button endp

start:
    mov ax, 3
    int 10h

    ; mov ch, 0 <- height position
    ; mov cl, 0 <- lenght position
    ; mov dh, 0 <- 2nd height position
    ; mov dl, 0 <- 2nd lenght position
    ; call <func> <- call function

    ; gray border left
    mov ch, 3
    mov cl, 2
    mov dh, 3
    mov dl, 2
    call fillGrayBg
 
    ; gray border right
    mov ch, 1
    mov cl, 78
    mov dh, 3
    mov dl, 78
    call fillGrayBg

    ; red background fill
    mov ch, 3
    mov cl, 3
    mov dh, 3
    mov dl, 77
    call fillRedBg
 
    ;; ambot unsa pulos ani
    xor al, al

    ; hightlight text to yellow
    mov ah, 06h
    mov ch, 3
    mov cl, 3
    mov dh, 3
    mov dl, 76
    mov bh, 0CEh ; yellow color ang blink
    int 10h

    ; background white
    mov ch, 4
    mov cl, 2
    mov dh, 19
    mov dl, 78
    call fillGrayBg

    ;input
    mov ch, 5
    mov cl, 29
    mov dh, 5
    mov dl, 38
    call inputCell

    ;input
    mov ch, 7
    mov cl, 29
    mov dh, 7
    mov dl, 38
    call inputCell

    ;input
    mov ch, 9
    mov cl, 29
    mov dh, 9
    mov dl, 38
    call inputCell

    ;input
    mov ch, 11
    mov cl, 29
    mov dh, 11
    mov dl, 38
    call inputCell

    ;input
    mov ch, 13
    mov cl, 29
    mov dh, 13
    mov dl, 38
    call inputCell

    ; dropdown icon
    mov ch, 5
    mov cl, 36
    mov dh, 5
    mov dl, 38
    call dropDownCell

    ; dropdown icon
    mov ch, 13
    mov cl, 36
    mov dh, 13
    mov dl, 38
    call dropDownCell

    ;input
    mov ch, 5
    mov cl, 66
    mov dh, 5
    mov dl, 77
    call inputCell

    ;input
    mov ch, 7
    mov cl, 66
    mov dh, 7
    mov dl, 77
    call inputCell

    ;input
    mov ch, 9
    mov cl, 66
    mov dh, 9
    mov dl, 77
    call inputCell

    ;input
    mov ch, 11
    mov cl, 66
    mov dh, 11
    mov dl, 77
    call inputCell

    ;input
    mov ch, 13
    mov cl, 66
    mov dh, 13
    mov dl, 77
    call inputCell

    ; dropdown icon
    mov ch, 5
    mov cl, 75
    mov dh, 5
    mov dl, 77
    call dropDownCell

    ; dropdown icon
    mov ch, 13
    mov cl, 75
    mov dh, 13
    mov dl, 77
    call dropDownCell

    ;; red button
    mov ch, 16
    mov cl, 36
    mov dh, 16
    mov dl, 45
    call button

    ;; thank you text
    mov ah, 06h
    mov ch, 21
    mov cl, 0
    mov dh, 21 
    mov dl, 78 
    mov bh, 08EH;
    int 10h

    mov ax, @data
    mov ds, ax

    ; print the strings
    mov ah, 09h
    lea dx, string
    int 21h
int 27h
end start
