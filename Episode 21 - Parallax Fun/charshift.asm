	//LEFT (2 Chars)
	ldx #$07
!:
	lda $c008,x
	asl
	rol $c000, x
	adc #$00
	sta $c008, x
	dex
	bpl !-



	//LEFT
	ldx #$07
!:
	lda $c000,x
	asl
	adc #$00
	sta $c000, x
	dex
	bpl !-



	//RIGHT
	ldx #$07
!Loop:	
	lda $c000,x
	lsr
	bcc !+
	ora #$80
!:	
	sta $c000,x
	dex
	bpl !Loop-
	



	//DOWN
	ldy $c007
	ldx #$06
!:
	lda $c000, x
	sta $c001, x
	dex 
	bpl !-	
	sty $c000



	//UP
	ldy $c000
	ldx #$00
!:
	lda $c001, x
	sta $c000, x
	inx
	cpx #$07
	bne !-	
	sty $c007

