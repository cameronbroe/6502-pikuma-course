    processor 6502
    seg code                            ; Define a new segment named "code"
    org $F000                           ; Define the origin of the ROM code at memory address $F000
Start:
    sei                                 ; Disable interrupts
    cld                                 ; Disable BCD decimal math mode
    ldx #$FF                            ; Load X register with value #$FF
    txs                                 ; Transfer X register to stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to $FF)
; Clear all of RAM and the TIA region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0                              ; A = #0
    ldx #$FF                            ; X = #$FF
InitMem:
    sta $0,X                            ; Store A into mem addr $0 + X
    dex                                 ; X--
    bne InitMem                         ; while X != 0
    sta $0,X                            ; Ensure $00 is zeroed out at the end

Exercise:
    lda #$A                             ; Load the A register with the hexadecimal value $A
    ldx #%1010                          ; Load the X register with the binary value %1010
                                        
    sta $80                             ; Store the value in the A register into (zero page) memory address $80
    stx $81                             ; Store the value in the X register into (zero page) memory address $81
                                        
    lda #10                             ; Load A with the decimal value 10
    clc
    adc $80                             ; Add to A the value inside RAM address $80
    clc
    adc $81                             ; Add to A the value inside RAM address $81
                                        ; A should contain (#10 + $A + %1010) = #30 (or $1E in hexadecimal)
                                        
    sta $82                             ; Store the value of A into RAM position $82

    org $FFFC                           ; End the ROM by adding required values to memory position $FFFC
    .word Start                         ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start                         ; Put 2 bytes with the break address at memory position $FFFE