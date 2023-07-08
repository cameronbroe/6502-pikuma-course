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
    lda #15                             ; Load the A register with the literal decimal value 15
    tax                                 ; Transfer the value from A to X
    tay                                 ; Transfer the value from A to Y
    txa                                 ; Transfer the value from X to A
    tya                                 ; Transfer the value from Y to A

    ldx #6                              ; Load X with the decimal value 6
    txa                                 ; Transfer the value from X to Y
    tay

    org $FFFC                           ; End the ROM by adding required values to memory position $FFFC
    .word Start                         ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start                         ; Put 2 bytes with the break address at memory position $FFFE