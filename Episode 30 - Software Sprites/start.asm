.label MAX_SOFT_SPRITES = 16
.label SCREEN_RAM = $2800

.label SOFT_SPRITE_FONTSTART = 128
.label SOFT_SPRITE_FONTADDR = $2000 + SOFT_SPRITE_FONTSTART * 8


* = $02 virtual
	TEMP:	.byte $00
	TEMP2:	.byte $00
	SCREEN_LOOKUP:		.word $0000
	TIMER:	.byte $00
	FONT_COPY_SRC: .word $0000
	FONT_COPY_DEST: .word $0000

	SOFT_SPRITE_LOOKUPS: .fill MAX_SOFT_SPRITES * 2, 0


BasicUpstart2(Entry)

Entry:
		sei

		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01

		cli

		lda #%10101000
		sta $d018
		lda $d016
		ora #%00010000
		sta $d016
		lda #$00
		sta $d020
		lda #$06
		sta $d021
		lda #$02
		sta $d022
		lda #$00
		sta $d023

		jsr ColorScreen

			
	!loop:
		lda #$ff
		cmp $d012
		bne *-3
		inc $d020
		inc TIMER

				lda TIMER 
				and #$03
				bne !+
			
				jsr Shoot
			!:
				jsr ClearBullets
				jsr UpdateBullets
				jsr DrawBullets

		dec $d020
		jmp !loop-

ColorScreen: {
		ldx #$00
	!:
		.for(var i=0; i<4; i++) {
			lda SCREEN_RAM + $100 * i, x 
			tay 
			lda Colors, y
			sta $d800 + $100 * i, x
		}
		inx
		bne !-
		rts
}

Sinus:
	.fill 64, sin((i/64) * PI * 4) * 10 + 12

Shoot: {
		lda TIMER
		lsr
		lsr
		tay
		lda Sinus, y
		sta TEMP

		lda #$60
		ldx #$00
		ldy TEMP
		jsr AddBullet
		lda #$01
		sta SoftSprite_Delta, y

		rts
}


NextSoftSprite:
	.byte $00
SoftSprite_X:
	.fill MAX_SOFT_SPRITES, $ff 
// SoftSprite_Y:
// 	.fill MAX_SOFT_SPRITES, $ff
*=*"Char"
SoftSprite_Char:
	.fill MAX_SOFT_SPRITES, 0
SoftSprite_OriginalChar:
	.fill MAX_SOFT_SPRITES, 0
SoftSprite_Delta:
	.fill MAX_SOFT_SPRITES, 0 



AddBullet: {
		//A = Char
		//x = X Position
		//Y = Y Position
		sty TEMP
		stx TEMP2
		ldy NextSoftSprite
		sta SoftSprite_Char, y 

		tya
		asl
		tay 
		ldx TEMP
		lda Screen_Row_LSB, X 
		clc
		adc TEMP2
		sta SOFT_SPRITE_LOOKUPS + 0, y
		lda Screen_Row_MSB, x 
		adc #$00
		sta SOFT_SPRITE_LOOKUPS + 1, y 


		ldy NextSoftSprite
		tya 
		asl
		tax 
		lda (SOFT_SPRITE_LOOKUPS, x)
		sta SoftSprite_OriginalChar, y
		jsr GrabCharCopy


		lda TEMP2 
		sta SoftSprite_X, y

		tya
		tax 
		inx 
		cpx #MAX_SOFT_SPRITES
		bne !+
		ldx #$00
	!:
		stx NextSoftSprite

		//Return index in Y
		rts
}

GrabCharCopy: {
		//Acc has char to copy
		sta FONT_COPY_SRC + 0
		lda #$00
		sta FONT_COPY_SRC + 1
		//Times 8
		asl FONT_COPY_SRC + 0
		rol FONT_COPY_SRC + 1
		asl FONT_COPY_SRC + 0
		rol FONT_COPY_SRC + 1
		asl FONT_COPY_SRC + 0
		rol FONT_COPY_SRC + 1
		//Add font base address
		lda FONT_COPY_SRC + 1
		adc #$20
		sta FONT_COPY_SRC + 1

		//Acc has char to copy
		tya 
		sta FONT_COPY_DEST + 0
		lda #$00
		sta FONT_COPY_DEST + 1
		//Times 8
		asl FONT_COPY_DEST + 0
		rol FONT_COPY_DEST + 1
		asl FONT_COPY_DEST + 0
		rol FONT_COPY_DEST + 1
		asl FONT_COPY_DEST + 0
		rol FONT_COPY_DEST + 1	
		//Add font dest address

		lda FONT_COPY_DEST + 0
		clc
		adc #<SOFT_SPRITE_FONTADDR
		sta FONT_COPY_DEST + 0
		lda FONT_COPY_DEST + 1
		adc #>SOFT_SPRITE_FONTADDR
		sta FONT_COPY_DEST + 1

		tya 
		pha 

		// .break

		ldy #$00
		lda (FONT_COPY_SRC), y
		sta (FONT_COPY_DEST), y 

			//Need to impose bullet
			.for(var i=0;i<6; i++) {
				iny
				lda (FONT_COPY_SRC), y
				and $2309 + i
				ora $2301 + i
				sta (FONT_COPY_DEST), y 
			}

			
		iny
		lda (FONT_COPY_SRC), y
		sta (FONT_COPY_DEST), y 


		pla
		tay
		rts
}



Screen_Row_LSB:
		.fill 25, <[SCREEN_RAM + $28 * i]
Screen_Row_MSB:
		.fill 25, >[SCREEN_RAM + $28 * i]


DrawBullets: {
		ldy #$00
		ldx #$00
	!loop:
		lda SoftSprite_Char, y 
		beq !skip+

			//Store original
			lda (SOFT_SPRITE_LOOKUPS, x)
			sta SoftSprite_OriginalChar, y
			jsr GrabCharCopy
			

			//Draw new
			// lda SoftSprite_Char, y 
			tya 
			clc
			adc #SOFT_SPRITE_FONTSTART

			sta (SOFT_SPRITE_LOOKUPS, x)

	!skip:
		inx
		inx
		iny
		cpy #MAX_SOFT_SPRITES
		bne !loop-
		rts
}

ClearBullets: {
		ldy #$00
		ldx #$00
	!loop:
		lda SoftSprite_Char, y 
		beq !skip+

			//Restore original
			lda SoftSprite_OriginalChar, y
			sta (SOFT_SPRITE_LOOKUPS, x)

	!skip:
		inx
		inx
		iny
		cpy #MAX_SOFT_SPRITES
		bne !loop-
		rts
}



UpdateBullets: {
		ldy #$00
		ldx #$00
	!loop:
		lda SoftSprite_Char, y 
		beq !skip+


			lda SOFT_SPRITE_LOOKUPS + 0, x
			clc 
			adc SoftSprite_Delta, y 
			sta SOFT_SPRITE_LOOKUPS + 0, x
			lda SOFT_SPRITE_LOOKUPS + 1, x
			adc #$00 
			sta SOFT_SPRITE_LOOKUPS + 1, x


			lda SoftSprite_X, y 
			clc
			adc #$01
			cmp #$28
			bcc !+
			lda #$00
			sta SoftSprite_Char, y
		!:
			sta SoftSprite_X, y 


	!skip:
		inx
		inx 
		iny
		cpy #MAX_SOFT_SPRITES
		bne !loop-
		rts		
}


* = $2000
	.import binary "chars.bin"
* = $2800
	.import binary "screen.bin"
	.fill 120, 0
Colors:
	.import binary "cols.bin"