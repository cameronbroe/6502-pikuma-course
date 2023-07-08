    processor 6502

    seg code
    org $F000               ; Define code origin at $F000

Start:
    sei                     ; Disable interrupts
    cld                     ; Disable BCD decimal math mode
    ldx #$FF                ; Load X register with value #$FF
    txs                     ; Transfer X register to stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to $FF)
; Clear all of RAM and the TIA region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0                  ; A = #0
    ldx #$FF                ; X = #$FF

MemLoop:
    sta $0,X                ; Store A into mem addr $0 + X
    dex                     ; X--
    bne MemLoop             ; while X != 0

    sta $0,X                ; Ensure $00 is zeroed out at the end

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    org $FFFC
    .word Start             ; Reset vector at $FFFC to program start
    .word Start             ; Interrupt vector at $FFFE (unused in VCS)