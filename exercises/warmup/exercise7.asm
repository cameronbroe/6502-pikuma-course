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
    lda #10                             ; Load the A register with the decimal value 10
    sta $80                             ; Store the value from A into memory position $80

    inc $80                             ; Increment the value inside a (zero page) memory position $80
    dec $80                             ; Decrement the value inside a (zero page) memory position $80

    org $FFFC                           ; End the ROM by adding required values to memory position $FFFC
    .word Start                         ; Put 2 bytes with the reset address at memory position $FFFC
    .word Start                         ; Put 2 bytes with the break address at memory position $FFFE