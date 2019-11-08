.file [name="crack.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base []
.segmentdef Patch []

.segment Base
* = $0800
	.import binary "base.prg"

.segment Patch
	BasicUpstart2($0900)

	* = $0d7b "Infinite Lives"
		sbc #$00

	* = $0cf9 "Space to level skip"
			jsr $0700
			nop
	* = $0700
		!:
			lda $2f
			bne !-
			lda #$7f
			sta $dc00
			lda $dc01
			and #$10
			bne !+
			lda #$80
			sta $85
		!:
			rts







