BasicUpstart2(Entry)

.label STRIP_LENGTH = 9
.label OBJECT_COUNT = 12

Entry: {
		lda #$0e
		sta $d020
		sta $d021

		lda #%00011000
		sta $d018

		//Setup screen
		jsr FillScreen

		lda #$01
		ldx #$00
	!:
		sta $d800, x
		sta $d900, x
		sta $da00, x
		sta $db00, x
		inx
		bne !-

		//PLATFORM
	// 	ldx #$08
	// !:
	// 	lda #$20
	// 	sta $0550, x
	// 	lda $0528, x
	// 	ora #$10
	// 	sta $0528, x
	// 	dex
	// 	bne !-

		:clearStrip()



	!MainLoop:
	SMOD:
		lda #$fa
		cmp $d012
		bcs *-3

		lda #$01
		sta $d021
		//Rain Effect
			// jsr DrawRainObjects
			// jsr DrawRainObjects
			// jsr DrawRainObjects
			// jsr CopyEffect

		//Snow Effect
			:clearStrip()
			jsr UpdateSnowObjects
			jsr DrawSnowObjects

		lda #$0e
		sta $d021

		dec Counter
		bne !+
		dec SMOD + 1
	!:
		jmp !MainLoop-

	Counter:
		.byte $00
}




ObjectX0:
	.fill OBJECT_COUNT, 0
ObjectX1:
	.fill OBJECT_COUNT, random() * 8
ObjectY0:
	.fill OBJECT_COUNT, 0
ObjectY1:
	.fill OBJECT_COUNT, random() * 8 * STRIP_LENGTH
ObjectY0Speed:
	.fill OBJECT_COUNT, 96 + random() * 96
ObjectY1Speed:
	.fill OBJECT_COUNT, 0
ObjectLength:
	.fill OBJECT_COUNT, $02 + random() * $08

SnowX1:
	.fill OBJECT_COUNT, random() * 32
SnowXSpeed:
	.fill OBJECT_COUNT, 40 + random() * 40
SnowSize:
	.fill OBJECT_COUNT, mod(i,2)
FlakeRotateX:
	.byte 0,1,1,1,1,1,1,0
FlakeRotateY:
	.byte 1,1,0,0,0,0,255,255
Sinus: 
	.fill 32, sin((i/32) * PI * 2) * 3.5 + 3.5

Temp:
	.byte $00
TempX:
	.byte $00
TempY:
	.byte $00


DrawSnowObjects: {
		ldx #$00
		stx Temp
	!Loop:

		//Plot
		lda ObjectY1, x
		tay
		sta TempY
		lda SnowX1, x
		tax
		lda Sinus, x
		tax
		sta TempX		
		:plotPixel()

		ldx Temp
		lda SnowSize, x
		beq !SmallOnly+

			ldx TempX
			txa
			clc
			adc FlakeRotateX, x
			bpl !+
			clc
			adc #8
			jmp !DoneX+
		!:
			cmp #8
			bcc !DoneX+
			sbc #8
		!DoneX:
			sta TempX


			lda TempY
			clc
			adc FlakeRotateY, x
			bpl !+
			clc
			adc #STRIP_LENGTH * 8
			jmp !DoneY+
		!:
			cmp #STRIP_LENGTH * 8
			bcc !DoneY+
			sbc #STRIP_LENGTH * 8
		!DoneY:
			tay
			ldx TempX
		:plotPixel()


	!SmallOnly:
		ldx Temp
		inx
		stx Temp
		cpx #OBJECT_COUNT	
		bne !Loop-
	rts
}


UpdateSnowObjects: {
		ldx #$00
	!Loop:
		clc
		lda ObjectY0, x
		adc ObjectY0Speed, x
		sta ObjectY0, x
		lda ObjectY1, x
		adc ObjectY1Speed, x
		cmp #STRIP_LENGTH * 8 
		bcc !NoWrap+
		sbc #STRIP_LENGTH * 8 
	!NoWrap:
		sta ObjectY1, x

		clc
		lda ObjectX0, x
		adc SnowXSpeed, x
		sta ObjectX0, x
		lda SnowX1, x
		adc #$00
		cmp #32
		bcc !NoWrap+
		sbc #32
	!NoWrap:
		sta SnowX1, x

		inx
		cpx #OBJECT_COUNT	
		bne !Loop-
		rts
}



DrawRainObjects: {
		ldx #$00
		stx Temp
	!Loop:
		//Clear
		lda ObjectY1, x
		tay
		lda ObjectX1, x
		tax
		:clearPixel()

		ldx Temp
		jsr UpdateObject

		//Plot
		lda ObjectY1, x
		clc
		adc ObjectLength, x
		cmp #STRIP_LENGTH * 8
		bcc !NoWrap+
		sbc #STRIP_LENGTH * 8
	!NoWrap:
		tay
		lda ObjectX1, x
		tax		
		:plotPixel()

		ldx Temp
		inx
		stx Temp
		cpx #OBJECT_COUNT	
		bne !Loop-
	rts
}

UpdateObject: {
		
		clc
		lda ObjectY0, x
		adc ObjectY0Speed, x
		sta ObjectY0, x
		lda ObjectY1, x
		adc ObjectY1Speed, x
		cmp #STRIP_LENGTH * 8 
		bcc !NoWrap+
		sbc #STRIP_LENGTH * 8 
	!NoWrap:
		sta ObjectY1, x

		rts
}

.label SplashFrequency = $40
SplashFrames:
		.fill STRIP_LENGTH, random() * SplashFrequency

CopyEffect: {
		.for(var i=0; i<STRIP_LENGTH * 8; i++) {
			lda $2000 + i
			sta $2080 + i
		}

		ldx #STRIP_LENGTH - 1
	!Loop:
		stx Temp

		lda SplashFrames, x
		sec
		sbc #$01
		bpl !+
		lda #SplashFrequency
	!:
		sta SplashFrames, x
		lsr
		lsr
		lsr

		asl
		asl
		asl
		
		tay	//Source

		txa 
		asl 
		asl 
		asl
		tax //Target

		lda $2080 + 6 ,x
		ora $2108 + 6, y	
		sta $2080 + 6 ,x	

		lda $2080 + 7 ,x
		ora $2108 + 7, y	
		sta $2080 + 7 ,x	

		ldx Temp
	!NoSplash:
		dex
		bpl !Loop-


	rts
}


PowersOfTwo:
	.byte $80,$40,$20,$10,$08,$04,$02,$01
InvPowersOfTwo:
	.byte $7f,$bf,$df,$ef,$f7,$fb,$fd,$fe


.var tmpRnd = 0
YOffsets:
	.for(var i=0; i<40; i++) {
		.eval tmpRnd += (random() * (STRIP_LENGTH*0.75) + 1)
		.byte mod(tmpRnd, STRIP_LENGTH)
	}


FillScreen: {
		ldx #0
	!Loop:
		ldy #39
	!InnerLoop:
		lda YOffsets, y 
	SMOD:
		sta $0400, y
		clc
		adc #01
		cmp #STRIP_LENGTH
		bcc !SetNewValue+
		sbc #STRIP_LENGTH
	!SetNewValue:
		sta YOffsets, y 
		dey
		bpl !InnerLoop-

		inx
		cpx #25
		beq !End+

		lda SMOD + 1
		clc
		adc #40
		sta SMOD + 1
		lda SMOD + 2
		adc #00
		sta SMOD + 2
		jmp !Loop-
	!End:
		rts
}

* = $2000
.import binary "chars.bin"





.macro clearStrip() {
	lda #$00
	.for(var i=0; i<STRIP_LENGTH * 8; i++){
		sta $2000 + i
	}
}

.macro plotPixel() {
	//x,y
	lda $2000, y
	ora PowersOfTwo, x
	sta $2000, y		
}


.macro clearPixel() {
	//x,y
	lda $2000, y
	and InvPowersOfTwo, x
	sta $2000, y		
}