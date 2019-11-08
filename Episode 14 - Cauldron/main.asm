// Setup
.file [name="main.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base []
.segmentdef Patch []

.segment Base
*=$0400
	.import binary "c2.bin"


.segment Patch 
	* = $84a1 //Infinite magic
		nop
		nop
	// * = $870a
	// 	sta $8d
	// 	and #$04
	// 	beq !+
	// 	dec $d000
	// !:
	// 	rts

// * = $7000
//  	.import binary "font.bin"
// * = $7d00
// 	lda #$37
// 	sta $01
// 	cli 
// 	jsr $8009
// 	jmp $a7ae
