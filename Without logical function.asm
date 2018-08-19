;====================================================================
; Version without logical function. 
;
; Created:   14 04 2018
; Processor: AT89C2051
; Compiler:  ASEM-51 (Proteus)
;====================================================================

$NOMOD51
$INCLUDE (89C1051.MCU)

;====================================================================
; DEFINITIONS
;====================================================================

;====================================================================
; VARIABLES
;====================================================================

;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
      org   00h
      ;jmp Start
      ;mov p1, a
      mov p1, #0
      jmp Button

;====================================================================
; CODE SEGMENT
;====================================================================

      org 30h
      
Button:
      mov a, p1
      jnb p3.7, Start
      jmp Button
Start:
      cjne a,#0, V1
      mov p1, #2
      jmp L1
V1:
      cjne a,#2, V2
      mov p1, #3
      jmp L1
V2:
      cjne a,#3, V3
      mov p1, #5
      jmp L1
V3:
      cjne a,#5, V4
      mov p1, #7
      jmp L1
V4:
      cjne a,#7, V5
      mov p1, #8
      jmp L1
V5:
      cjne a,#8, V6
      mov p1, #6
      jmp L1
V6:
      cjne a,#6, V7
      mov p1, #14
      jmp L1
V7:
      cjne a,#14, L1
      mov p1, #0
      jmp L1
L1: 
      JNB P3.7, L1      
L2: 
      JB P3.7, L2    
      jmp Button

;====================================================================
      END