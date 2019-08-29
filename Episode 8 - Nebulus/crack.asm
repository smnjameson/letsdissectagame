// Setup
.file [name="crack.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base [prgFiles="test2.prg"]
.segmentdef Patch []

// Patch Code 
.segment Patch

BasicUpstart2(Entry)

Entry: {
		ldx #$00
	!:	
		lda $0900, x
		sta $d800, x
		lda $0a00, x
		sta $d900, x
		lda $0b00, x
		sta $da00, x
		lda $0c00, x
		sta $db00, x
		inx
		bne !-
		jmp 13840
}

* =$0900
	.import binary "cols.bin"

* = $80bd //STOP TIMER
	nop
	nop

* = $80d3 //INFINTE LIVES
	nop
	nop

* = $a898
	ldx #$25
	ldy #$01
	cmp #$00
	beq !Execute+
	ldx #$50
	ldy #$02
	cmp #$01
	beq !Execute+
	ldx #$75
	ldy #$03
	cmp #$02
	beq !Execute+
	ldx #$00
	ldy #$05


!Execute:
	jsr $a964









