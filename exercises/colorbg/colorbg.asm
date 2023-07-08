	processor 6502

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Include external files containing useful definitions and macros 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	include "../utils/vcs.h"
	include "../utils/macro.h"

	seg code
	org $F000      ; Define the origin of the ROM at $F000
	
INIT:
	CLEAN_START    ; Call macro to safely clear the memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set background luminance color to yellow (NTSC color code $1E)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
START:
    lda #$2E       ; Load color code into A register
    sta COLUBK     ; Store A to memory address $09 (TIA COLUBK)

    jmp START      ; Repeat from START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC      ; Defines origin to $FFFC
    .word INIT    ; Reset vector at $FFFC (where program starts)
    .word INIT    ; Interrupt vector at $FFFE (unused by the VCS)
