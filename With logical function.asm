;==========================================================
; Version with logical function.
; Created:   14 04 2018
; Processor: AT89C2051
; Compiler:  ASEM-51 (Proteus)
;==========================================================
$NOMOD51
$INCLUDE (89C1051.MCU)
;========================================================
; DEFINITIONS
;==========================================================
q1 bit p1.0 ; name for Q1
q2 bit p1.1 ; name for Q2
q3 bit p1.2 ; name for Q3
q4 bit p1.3 ; name for Q4
d1 bit p3.0 ; name for D1
d2 bit p3.1 ; name for D2
d3 bit p3.2 ; name for D3
d4 bit p3.3 ; name for D4
;=========================================================
; RESET and INTERRUPT VECTORS
;==========================================================
org   00h ; transition to beginning memory space
jmp Start ; jump to Start notch
;==========================================================
; CODE SEGMENT
;==========================================================
org 30h ; transition to 30h memory space (after RESET and INTERRUPT VECTORS)
Start:
mov p1, r0 ; transmition R0 register value to port P1
; computation for D1:
mov c, q2 ; transmition Q2 to accumulator flag Ñ 
anl c, q3 ; logical «AND» flag Ñ and Q3
anl c, /q1 ; logical «AND» flag Ñ and /Q1(not Q1)
mov d1, c ; transmition flag Ñ to D1
; computation for D2:
mov c, q3 ; transmition Q3 to accumulator flag Ñ 
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q2 ; logical «AND» flag Ñ and /Q2
anl c, q4 ; logical «AND» flag Ñ and Q4
mov F0, c ; transmition flag Ñ to F0
mov c, q1 ; transmition Q1 to accumulator flag Ñ
anl c, /q2 ; logical «AND» flag Ñ and /Q2
anl c, /q3 ; logical «AND» flag Ñ and /Q3
anl c, /q4 ; logical «AND» flag Ñ and /Q4
orl c, F0 ; logical «OR» flag Ñ and F0
mov F0, c ; transmition flag Ñ to F0
mov c, q2 ; transmition Q2 to accumulator flag Ñ
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q4 ; logical «AND» flag Ñ and /Q4
anl c, q3 ; logical «AND» flag Ñ and Q3
orl c, F0 ; logical «OR» flag Ñ and F0
mov F0, c ; transmition flag Ñ to F0
mov c, q2 ; transmition Q2 to accumulator flag Ñ
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q3 ; logical «AND» flag Ñ and /Q3
anl c, q4 ; logical «AND» flag Ñ and Q4
orl c, F0 ; logical «OR» flag Ñ and F0
mov d2, c ; transmition flag Ñ to D1
clr F0 ; clean F0
; computation for D3:
mov c, q1 ; transmition Q1 to accumulator flag Ñ
anl c, /q2 ; logical «AND» flag Ñ and /Q2
anl c, /q3 ; logical «AND» flag Ñ and /Q3
anl c, /q4 ; logical «AND» flag Ñ and /Q4
mov F0, c ; transmition flag Ñ to F0
mov c, q2 ; transmition Q2 to accumulator flag Ñ
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q3 ; logical «AND» flag Ñ and /Q3
anl c, q4 ; logical «AND» flag Ñ and Q4
orl c, F0 ; logical «OR» flag Ñ and F0
mov F0, c ; transmition flag Ñ to F0
mov c, q1 ; transmition Q1 to accumulator flag Ñ
cpl c ; inversion Ñ
anl c, /q2 ; logical «AND» flag Ñ and /Q2
anl c, /q4 ; logical «AND» flag Ñ and /Q4
orl c, F0 ; logical «OR» flag Ñ and F0
mov F0, c ; transmition flag Ñ to F0
mov c, q3 ; transmition Q3 to accumulator flag Ñ
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q4 ; logical «AND» flag Ñ and /Q4
orl c, F0 ; logical «OR» flag Ñ and F0
mov d3, c ; transmition flag Ñ to D3
; computation for D4:
mov c, q2 ; transmition Q2 to accumulator flag Ñ
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q3 ; logical «AND» flag Ñ and /Q3
anl c, q4 ; logical «AND» flag Ñ and Q4
mov F0, c ; transmition flag Ñ to F0
mov c, q3 ; transmition Q3 to accumulator flag Ñ
anl c, /q1 ; logical «AND» flag Ñ and /Q1
anl c, /q2 ; logical «AND» flag Ñ and /Q2
orl c, F0 ; logical «OR» flag Ñ and F0	
mov d4, c ; transmition flag Ñ to D4
mov r0, p3 ; transmition port P3 value to register R0
call Delay ; call Delay notch
jmp Start ; jump to Start notch
Delay:
mov r2, #255 ; add full "1" to register R2
Loop0: 
mov r3, #255 ; assign full "1" to register R3
mov r4, #10 ; assign "10" number to register R4
Loop1: 
djnz r3,Loop1 ; decrement R3 and jump to Loop1 notch, if value not 0
djnz r4,Loop1 ; decrement R4 and jump to Loop1 notch, if value not 0
djnz r2,Loop0 ; decrement R2 and jump to Loop0 notch, if value not 0
ret ; return to main program
;==========================================================
END 