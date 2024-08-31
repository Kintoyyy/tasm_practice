section .data
    ; Coordinates for the rectangle
    x1 db 50   ; Top-left x-coordinate
    y1 db 50   ; Top-left y-coordinate
    x2 db 100  ; Bottom-right x-coordinate
    y2 db 100  ; Bottom-right y-coordinate
    color db 4 ; Color of the rectangle (4 = Red in VGA mode 0x13)

section .text
    global _start

_start:
    ; Set video mode to 320x200 256-color mode
    mov ax, 0x0013
    int 0x10

    ; Draw a rectangle by plotting pixels
    mov dx, y1 ; Start from top y-coordinate
draw_vertical_lines:
    mov cx, x1 ; Start from left x-coordinate

draw_horizontal_line:
    ; Calculate offset in video memory: offset = (y * 320) + x
    mov ax, dx
    mul word [320]
    add ax, cx

    ; Draw pixel
    mov di, ax            ; Offset to DI
    mov al, [color]       ; Color value
    mov es:[di], al       ; Write color to video memory

    ; Move to the next pixel
    inc cx
    cmp cx, x2
    jb draw_horizontal_line ; Draw until x2 is reached

    ; Move to the next line
    inc dx
    cmp dx, y2
    jb draw_vertical_lines ; Continue until y2 is reached

    ; Wait for a keypress to exit
    mov ah, 0x00
    int 0x16

    ; Restore to text mode (mode 0x03)
    mov ax, 0x0003
    int 0x10

    ; Exit the program
    mov ax, 0x4c00
    int 0x21
