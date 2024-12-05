;Filename: EXAM3.ASM
;CS243 Lab Hands-on Exam No. 3
;First Semester SY 2024-2025
;Student Name: KENT A. RATO
;Date Finished: October 04, 2024
 
 
.model small
.stack 100h
.data
    header       db "VOTER'S REGISTRATION FORM"
                 db 0ah,"Created by: name"
                 db 0ah,"Date: 10 - 03 - 2024"
                 db 0ah,0ah,"Please enter the following data: ",0ah,'$'
 
    text1      db 0ah,'First Name: $'
    text2      db 0ah,'Middle Name: $'
    text3      db 0ah,'Family Name: $'
    text4      db 0ah,'Gender: $'
 
    text5      db 0ah,'Birthday'
                 db 0ah,09h,'Month: $'
    text6      db 0ah,09h,'Day: $'
    text7      db 0ah,09h,'Year: $'
 
    text8      db 0ah,'Address'
                 db 0ah,09h,'House Number: $'
    text9      db 0ah,09h,'Street: $'
    text10     db 0ah,09h,'Barangay: $'
    text11     db 0ah,09h,'City: $'
    text12     db 0ah,09h,'Province: $'
 
    text13     db 0ah,'Educational Background'
                 db 0ah,09h,'Elementary: '
                 db 0ah,09h,09h,'Name of School: $'
    text14     db 0ah,09h,09h,'Year Graduated: $'
 
    text15     db 0ah,09h,'Junior High School: '
                 db 0ah,09h,09h,'Name of School: $'
    text16     db 0ah,09h,09h,'Year Graduated: $'
 
    text17     db 0ah,09h,'Senior High School: '
                 db 0ah,09h,09h,'Name of School: $'
    text18     db 0ah,09h,09h,'Year Graduated: $'
 
    text19     db 0ah,09h,'College: '
                 db 0ah,09h,09h,'Name of School: $'
    text20     db 0ah,09h,09h,'Course: $'
    text21     db 0ah,09h,09h,'Year Graduated: $'
 
 
    input1       db 10, ?, 10 dup(' ')
    input2       db 10, ?, 10 dup(' ')
    input3       db 10, ?, 10 dup(' ')
    input4       db 10, ?, 10 dup(' ')
    input5       db 10, ?, 10 dup(' ')
    input6       db 10, ?, 10 dup(' ')
    input7       db 10, ?, 10 dup(' ')
    input8       db 10, ?, 10 dup(' ')
    input9       db 20, ?, 20 dup(' ')
    input10      db 10, ?, 10 dup(' ')
    input11      db 10, ?, 10 dup(' ')
    input12      db 10, ?, 10 dup(' ')
    input13      db 50, ?, 50 dup(' ')
    input14      db 10, ?, 10 dup(' ')
    input15      db 50, ?, 50 dup(' ')
    input16      db 10, ?, 10 dup(' ')
    input17      db 50, ?, 50 dup(' ')
    input18      db 10, ?, 10 dup(' ')
    input19      db 50, ?, 50 dup(' ')
    input20      db 10, ?, 10 dup(' ')
    input21      db 15, ?, 15 dup(' ')
 
    outputHeader db 0ah,0AH, 'SUMMARY OF INFORMATION'
                 DB 0AH, 'Please verify if all entries are correct. $'
 
    output1      db 0ah,'First Name: $'
    output2      db 0ah,'Middle Name: $'
    output3      db 0ah,'Family Name: $'
    output4      db 0ah,'Gender: $'
 
    output5      db 0ah,'Birthday'
                 db 0ah,09h,'Month: $'
    output6      db 0ah,09h,'Day: $'
    output7      db 0ah,09h,'Year: $'
 
    output8      db 0ah,'Address'
                 db 0ah,09h,'House Number: $'
    output9      db 0ah,09h,'Street: $'
    output10     db 0ah,09h,'Barangay: $'
    output11     db 0ah,09h,'City: $'
    output12     db 0ah,09h,'Province: $'
 
    output13     db 0ah,'Educational Background'
                 db 0ah,09h,'Elementary: '
                 db 0ah,09h,09h,'Name of School: $'
    output14     db 0ah,09h,09h,'Year Graduated: $'
 
    output15     db 0ah,09h,'Junior High School: '
                 db 0ah,09h,09h,'Name of School: $'
    output16     db 0ah,09h,09h,'Year Graduated: $'
 
    output17     db 0ah,09h,'Senior High School: '
                 db 0ah,09h,09h,'Name of School: $'
    output18     db 0ah,09h,09h,'Year Graduated: $'
 
    output19     db 0ah,09h,'College: '
                 db 0ah,09h,09h,'Name of School: $'
    output20     db 0ah,09h,09h,'Course: $'
    output21     db 0ah,09h,09h,'Year Graduated: $'
 
    thanks       db 'Vote Wisely!$'
    footer       db 'Thank you for registering.$'
 
.code
 
newLine PROC
             mov  ah, 02h
             mov  dl, 13
             int  21h
             mov  ah, 02h
             mov  dl, 10
             int  21h
             ret
newLine ENDP
 
thankYou PROC
             call newLine
             call newLine
 
             mov  ah,09h
             mov  bl,0CEh
             mov  cx,12
             int  10h
             lea  dx, thanks
             mov  ah, 09h
             int  21h
 
             call newLine
             ret
thankYou ENDP
 
    start:   
             mov  ax, @data
             mov  ds, ax
 
             mov  ax, 3
             int  10h
 
             mov  ax, 1112h
             xor  bl, bl
             int  10h
 
             mov  ah, 06h
             xor  al, al
             xor  cx, cx
 
             mov  ah, 06h
             mov  ch, 0
             mov  cl, 0
             mov  dh, 0
             mov  dl, 24
             mov  bh, 01Fh
             int  10h
 
             mov  ah, 06h
             mov  ch, 1
             mov  cl, 0
             mov  dh, 1
             mov  dl, 34
             mov  bh, 02Fh
             int  10h
 
             mov  ah, 06h
             mov  ch, 2
             mov  cl, 0
             mov  dh, 2
             mov  dl, 20
             mov  bh, 03Fh
             int  10h
 
             lea  dx, header
             mov  ah, 9
             int  21h

             lea  dx, text1
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input1
             int  21h
 
             lea  dx, text2
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input2
             int  21h
 
             lea  dx, text3
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input3
             int  21h
 
             lea  dx, text4
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input4
             int  21h
 
             lea  dx, text5
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input5
             int  21h
 
             lea  dx, text6
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input6
             int  21h
 
             lea  dx, text7
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input7
             int  21h
 
             lea  dx, text8
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input8
             int  21h
 
             lea  dx, text9
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input9
             int  21h
 
             lea  dx, text10
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input10
             int  21h
 
             lea  dx, text11
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input11
             int  21h
 
             lea  dx, text12
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input12
             int  21h
 
             lea  dx, text13
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input13
             int  21h
 
             lea  dx, text14
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input14
             int  21h
 
             lea  dx, text15
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input15
             int  21h
 
             lea  dx, text16
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input16
             int  21h
 
             lea  dx, text17
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input17
             int  21h
 
             lea  dx, text18
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input18
             int  21h
 
             lea  dx, text19
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input19
             int  21h
 
             lea  dx, text20
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input20
             int  21h
 
             lea  dx, text21
             mov  ah, 9
             int  21h
 
             mov  ah, 0Ah
             lea  dx, input21
             int  21h
 

             lea  dx, outputHeader
             mov  ah, 9
             int  21h
 
             lea  dx, output1
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input1[1]
             mov  input1[bx+2], '$'
             lea  dx, input1 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output2
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input2[1]
             mov  input2[bx+2], '$'
             lea  dx, input2 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output3
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input3[1]
             mov  input3[bx+2], '$'
             lea  dx, input3 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output4
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input4[1]
             mov  input4[bx+2], '$'
             lea  dx, input4 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output5
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input5[1]
             mov  input5[bx+2], '$'
             lea  dx, input5 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output6
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input6[1]
             mov  input6[bx+2], '$'
             lea  dx, input6 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output7
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input7[1]
             mov  input7[bx+2], '$'
             lea  dx, input7 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output8
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input8[1]
             mov  input8[bx+2], '$'
             lea  dx, input8 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output9
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input9[1]
             mov  input9[bx+2], '$'
             lea  dx, input9 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output10
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input10[1]
             mov  input10[bx+2], '$'
             lea  dx, input10 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output11
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input11[1]
             mov  input11[bx+2], '$'
             lea  dx, input11 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output12
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input12[1]
             mov  input12[bx+2], '$'
             lea  dx, input12 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output13
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input13[1]
             mov  input13[bx+2], '$'
             lea  dx, input13 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output14
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input14[1]
             mov  input14[bx+2], '$'
             lea  dx, input14 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output15
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input15[1]
             mov  input15[bx+2], '$'
             lea  dx, input15 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output16
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input16[1]
             mov  input16[bx+2], '$'
             lea  dx, input16 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output17
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input17[1]
             mov  input17[bx+2], '$'
             lea  dx, input17 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output18
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input18[1]
             mov  input18[bx+2], '$'
             lea  dx, input18 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output19
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input19[1]
             mov  input19[bx+2], '$'
             lea  dx, input19 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output20
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input20[1]
             mov  input20[bx+2], '$'
             lea  dx, input20 + 2
             mov  ah, 09h
             int  21h
 
             lea  dx, output21
             mov  ah, 9
             int  21h
 
             xor  bx, bx
             mov  bl, input21[1]
             mov  input21[bx+2], '$'
             lea  dx, input21 + 2
             mov  ah, 09h
             int  21h
 
             mov  ah, 06h
             xor  al, al
             xor  cx, cx
 
             call thankYou
 
             lea  dx, footer
             mov  ah, 9
             int  21h
 

             mov  ah, 4Ch
             int  21h
end start