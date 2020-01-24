.label PADDING = 4
.label MAX_SPRITES = 16

* = $02 virtual

	TEMP1: .byte $00
	TEMP2: .byte $00
	SpriteX:
		.fill MAX_SPRITES, 0
	SpriteXMSB:
		.fill MAX_SPRITES, 0
	SpriteY:
		.fill MAX_SPRITES, 0
	SpriteColor:
		.fill MAX_SPRITES, 0
	SpritePointer:
		.fill MAX_SPRITES, 0
	SpriteOrder:
		.fill MAX_SPRITES, 0

BasicUpstart2(Entry)


Entry: 

		sei

		lda #$7f
		sta $dc0d
		sta $dd0d


		lda #$35
		sta $01

		lda #$01
		sta $d01a


		lda #$00
		sta $d012
		lda $d011
		and #$7f
		sta $d011
		lda #<IRQ
		sta $fffe	 
		lda #>IRQ
		sta $ffff
		asl $d019
		cli

		//sprite setup
		lda #$ff
		sta $d015

		ldx #$00
	!:
		lda __DATA, x
		sta SpriteX, x
		inx
		cpx #[__DATAEND - __DATA]
		bne !-

		lda #$00
		sta $d020
		sta $d021
	
	!Loop:
		jmp !Loop-




	__DATA:
		_SpriteX:
			.fill MAX_SPRITES, random() * 232 + 24
		_SpriteXMSB:
			.fill MAX_SPRITES, 0
		_SpriteY:
			.var yy = $32
			.for(var i=0; i<MAX_SPRITES; i++) {
				.byte yy
				.eval yy += random() * 20
			}
			// .fill MAX_SPRITES, $32 + random() * 180
		_SpriteColor:
			.fill MAX_SPRITES, random() * 15 + 1
		_SpritePointer:
			.fill MAX_SPRITES, $c0
		_SpriteOrder:
			.fill MAX_SPRITES, i
	__DATAEND:



	CircleX:
		.fill 256, sin((i/256) * PI * 4) * 100 + 150
	CircleY:
		.fill 256, cos((i/256) * PI * 2) * 80 + 140
	CircleIndex:
		.byte $00

	SpriteIndex:
		.byte $00
	VicSpriteIndex:
		.byte $00

	POT:
		.byte 1,2,4,8,16,32,64,128
	IPOT:
		.byte 254,253,251,247,239,223,191,127


.align $100
	* = * "VicSpriteTable"
	VicSpriteTable:
		.word IRQ.LoopStart[0].Unrolled
		.word IRQ.LoopStart[1].Unrolled
		.word IRQ.LoopStart[2].Unrolled
		.word IRQ.LoopStart[3].Unrolled
		.word IRQ.LoopStart[4].Unrolled
		.word IRQ.LoopStart[5].Unrolled
		.word IRQ.LoopStart[6].Unrolled
		.word IRQ.LoopStart[7].Unrolled

*=* "IRQ"
IRQ: {
		pha
		txa 
		pha 
		tya 
		pha 

			inc $d020

			lda VicSpriteIndex
			and #$07
			asl 
			sta SelfMod + 1
		SelfMod:
			jmp (VicSpriteTable)

		LoopStart:
			.for(var i=0; i<8; i++) {
		Unrolled:
					ldx SpriteIndex
					lda SpriteOrder, x
					tax

					lda SpriteColor, x
					sta $d027 + i
					lda SpritePointer, x
					sta $0400 + $03f8 + i


					lda SpriteXMSB, x
					beq !nomsb+
				!msb:
					lda $d010 
					ora #[pow(2,i)]
					sta $d010
					jmp !msbdone+
				!nomsb:
					lda $d010 
					and #[255 - pow(2,i)]
					sta $d010
				!msbdone:

					lda SpriteX, x
					sta $d000 + i * 2
					lda SpriteY, x
					sta $d001 + i * 2

					inc VicSpriteIndex

					ldx SpriteIndex
					inx 
					stx SpriteIndex
					cpx #MAX_SPRITES
					bne !+
					jmp !Finish+
				!:


					lda SpriteOrder, x
					tax
					lda SpriteY, x
					sec 
					sbc #PADDING * 2
					cmp $d012
					bcc !+
					jmp !nextRaster+
				!:
			}	
			jmp LoopStart


			!nextRaster:
				clc
				adc #PADDING
				sta $d012
				jmp !ExitRaster+

		// !Loop:
		// 	ldx SpriteIndex
		// 	lda SpriteOrder, x
		// 	tax

		// 	lda VicSpriteIndex
		// 	and #$07
		// 	tay

		// 	lda SpriteColor, x
		// 	sta $d027, y
		// 	lda SpritePointer, x
		// 	sta $0400 + $03f8, y


		// 	stx TEMP1
		// 	lda SpriteXMSB, x
		// 	beq !nomsb+
		// !msb:
		// 	lda $d010 
		// 	ora POT, y
		// 	sta $d010
		// 	jmp !msbdone+
		// !nomsb:
		// 	lda $d010 
		// 	and IPOT, y
		// 	sta $d010
		// !msbdone:

		// 	ldx TEMP1
		// 	tya
		// 	asl
		// 	tay
		// 	lda SpriteX, x
		// 	sta $d000, y
		// 	lda SpriteY, x
		// 	sta $d001, y

		// 	inc VicSpriteIndex

		// 	ldx SpriteIndex
		// 	inx 
		// 	stx SpriteIndex
		// 	cpx #MAX_SPRITES
		// 	beq !Finish+


		// 	lda SpriteOrder, x
		// 	tax
		// 	lda SpriteY, x
		// 	sec 
		// 	sbc #PADDING * 2
		// 	cmp $d012
		// 	bcc !Loop-
			
		// 	clc
		// 	adc #PADDING
		// 	sta $d012
		// 	jmp !ExitRaster+

		!Finish:
			lda #$00
			sta $d012
			sta VicSpriteIndex
			sta SpriteIndex

			//Demo animation
			inc CircleIndex
			lda CircleIndex
			tax
			
			ldy #$00
		!:
			lda CircleX, x
			sta SpriteX, y
			lda CircleY, x
			sta SpriteY, y
				txa
				clc
				adc #[$100 / (MAX_SPRITES)]
				tax
			iny
			cpy #MAX_SPRITES
			bne !-

			jsr Sort
	!ExitRaster:
		dec $d020

		lda $d011
		and #$7f
		sta $d011
		lda #<IRQ
		sta $fffe	 
		lda #>IRQ
		sta $ffff
		asl $d019
		pla
		tay 
		pla 
		tax
		pla
		rti
}

Sort: {	
		inc $d020
			restart:
				//SWIV adapted SORT
                ldx #$00 
                txa 
		sortloop:       
				ldy SpriteOrder,x 
                cmp SpriteY,y 
                beq noswap2 
                bcc noswap1 
                stx TEMP1 
                sty TEMP2 
                lda SpriteY,y 
                ldy SpriteOrder - 1,x 
                sty SpriteOrder,x 
                dex 
                beq swapdone 
		swaploop:       
				ldy SpriteOrder - 1,x 
                sty SpriteOrder,x 
                cmp SpriteY,y 
                bcs swapdone 
                dex 
                bne swaploop 
		swapdone:       
				ldy TEMP2 
                sty SpriteOrder, x 
                ldx TEMP1 
                ldy SpriteOrder, x 
		noswap1:
		        lda SpriteY, y 
		noswap2:
		        inx 
                cpx #MAX_SPRITES
                bne sortloop 

        dec $d020
                rts
}



* = $3000 "Sprites"

	.fill 64, $ff
	.fill 64, $aa