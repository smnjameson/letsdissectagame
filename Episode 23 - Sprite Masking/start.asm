BasicUpstart2(Entry)

.label SCREEN_RAM = $2800
.label SPRITE_POINTERS = SCREEN_RAM + $03F8

.label CHARX = $02
.label CHARY = $03
.label LOOKUP = $04
.label TEMP = $06

.label JOY = $fc

.label UP = %0001
.label DN = %0010
.label LT = %0100
.label RT = %1000

Entry: 
		sei
		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01
		cli

		lda #$0e
		sta $d020
		sta $d021
		lda #$0b
		sta $d023
		lda #$0c
		sta $d022


		lda #%10101000
		sta $d018

		lda $d016
		ora #%00010000
		sta $d016

		lda #$0a
		ldx #$00
	!:
		sta $d800, x
		sta $d900, x
		sta $da00, x
		sta $db00, x
		dex
		bne !-

		//Overlay hires
		lda #$c2
		sta SPRITE_POINTERS + 0
		lda #$00
		sta $d027

		//Mask
		lda #$c1
		sta SPRITE_POINTERS + 1
		lda #$0c
		sta $d028

		//Ball color
		lda #$c0
		sta SPRITE_POINTERS + 2
		lda #$05
		sta $d029


		lda #$0d
		sta $d025
		lda #$0b
		sta $d026

		lda #$07
		sta $d015
		lda #$06
		sta $d01c

		lda #$02
		sta $d01b


		lda #$80
		sta $d004
		sta $d005
		sta $d000
		sta $d001

		lda #$68
		sta $d002
		lda #$7a
		sta $d003

	!Loop:
		lda #$ff
		cmp $d012 
		bne *-3

		lda $dc00
		sta JOY

		and #[UP]
		bne !NotUp+
		dec $d005
		dec $d001
	!NotUp:

		lda JOY
		and #[DN]
		bne !NotDn+
		inc $d005
		inc $d001
	!NotDn:

		lda JOY
		and #[LT]
		bne !NotLt+
		dec $d004
		dec $d000
	!NotLt:

		lda JOY
		and #[RT]
		bne !NotRt+
		inc $d004
		inc $d000
	!NotRt:

		

		//UPDATE MASK
		lda $d000
		sec 
		sbc #$18
		lsr
		lsr
		lsr
		sta CHARX

		lda $d001
		sec 
		sbc #$32
		lsr
		lsr
		lsr
		sta CHARY	

		//Now check for top corner of "Rock"
		ldy CHARY
		lda SCREEN_ROWS_LSB, y
		clc
		adc CHARX
		sta LOOKUP + 0
		lda SCREEN_ROWS_MSB, y
		adc #$00
		sta LOOKUP + 1

		lda #$00
		sta $d002

		ldx #$00
	!:
		ldy CHECK_LOCATIONS, x
		lda (LOOKUP), y

		beq !Skip+
		jsr SetMask
		jmp !Complete+
	!Skip:
		inx
		cpx #$0f
		bne !-
	!Complete:

		jmp !Loop-
	

	SetMask:
		//A is non zero
		//Y is char offset
		tay

		lda CHARX 
		asl
		asl
		asl
		adc #$18
		adc SPRITE_OFFSETS_X, x
		clc
		adc CHAR_OFFSET_X, y
		sta $d002

		lda CHARY 
		asl
		asl
		asl
		adc #$32
		adc SPRITE_OFFSETS_Y, x
		clc
		adc CHAR_OFFSET_Y, y		
		sta $d003

		rts

	CHECK_LOCATIONS:
		.byte 39,40,41,42,43	
		.byte 79,80,81,82,83
		.byte 119,120,121,122,123

	SPRITE_OFFSETS_X:
		.byte $f8, $00, $08, $10, $18
		.byte $f8, $00, $08, $10, $18
		.byte $f8, $00, $08, $10, $18

	SPRITE_OFFSETS_Y:
		.byte $08, $08, $08, $08, $08
		.byte $10, $10, $10, $10, $10
		.byte $18, $18, $18, $18, $18

	CHAR_OFFSET_X:
		.byte $00,$00,$f8
		.fill 13, 0
		.byte $00,$00,$f8 
	CHAR_OFFSET_Y:
		.byte $00,$00,$00
		.fill 13, 0
		.byte $00,$f8,$f8 

	SCREEN_ROWS_LSB:
		.fill 25, <[SCREEN_RAM + $28 * i]
	SCREEN_ROWS_MSB:
		.fill 25, >[SCREEN_RAM + $28 * i]

* = $2000
	.import binary "chars.bin"
* = $2800
	.import binary "map.bin"

* = $3000
	.import binary "sprites.bin"