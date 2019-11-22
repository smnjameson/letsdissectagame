.file [name="crack.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base []
.segmentdef Patch []

.segment Base
* = $0334
	.import binary "original.bin"

.segment Patch
	* = $0d30
			.byte 120,110,103,114,114,103,116,102
			.byte 110,103,126,107,120,102,102,102
			.byte 108,122,119,119,88 ,126,102,102
			.byte 104,88 ,88 ,116,126,94 ,92, 102
			.byte 120,121,107,117,127,96 ,96, 102
			.byte 105, 114,121,92 ,93 ,119,117,115
			.byte 103,113,115,103,108,111,116,102

	* = $26c4
			jsr $3600

	* = $3600
			inc Counter

			lda Counter
			and #$03
			bne !SkipParallax+

			ldx #$07
		!Loop:
			lda $fa48, x
			cmp #$80
			rol
			cmp #$80
			rol
			sta $fa48, x
	
			lda $ff40, x
			cmp #$80
			rol
			cmp #$80
			rol
			sta $ff40, x

			dex
			bpl !Loop-


			lda $ff47
			pha
			ldx #$06
		!Loop:
			lda $ff40, x
			sta $ff41, x
			dex
			bpl !Loop-
			pla 
			sta $ff40


		!SkipParallax:

			lda Counter
			and #$07
			bne !SkipParallax+

			ldx #$07
		!Loop:
			clc
			lda $fa58, x
			rol
			rol $fa50, x
			bcc !+
			ora #$01
		!:
			sta $fa58, x
		
			clc
			lda $fa58, x
			rol
			rol $fa50, x
			bcc !+
			ora #$01
		!:
			sta $fa58, x

			dex
			bpl !Loop-
		!SkipParallax:

	
		!Skip:
			lda $3593
			rts
	Counter:
		.byte $00


	* = $f000
	.import binary "introchars.bin"
	* = $f800
	.import binary "gamechars.bin"

	* = $4000
	.import binary "gamemap.bin"






