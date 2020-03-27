MENU:{
	.label ARROW = $fb
	.label JOY = $fd

	Entry:{
			LOADER_LoadFile("ASSETS")
			LOADER_LoadFile("MUSIC")
			LOADER_LoadFile("BOOTSTRAP")

			lda $dd00
			and #%11111100
			ora #%00000001
			sta $dd00

			lda #%00010010
			sta $d018

			lda #$01
			ldx #$00
		!:
			.for(var i=0; i<4;i++) {
				lda $8400 + i * $100, x
				tay
				lda $8e00,y
				sta $d800 + i * $100, x
			}
			dex
			bne !-

			//Turn on mc mode
			lda $d016
			ora #%00010000
			sta $d016

			//Setup IRQ
			sei
			lda #$35
			sta $01

			lda #<IRQ1
			sta $fffe
			lda #>IRQ1
			sta $ffff
			lda #$00
			sta $d012
			lda $d011
			and #$7f
			sta $d011
			lda #$01
			jsr $10ce
			cli

			//Initialise game list
			ldy #$00
			ldx #$00
		!Loop:
			lda GameList, y
		Mod1:
			sta $8400 + 6 * $28 + 22, x
			inx
			cpx #$10
			bne !+
			clc
			lda Mod1 + 1
			adc #$50
			sta Mod1 + 1
			lda Mod1 + 2
			adc #$00
			sta Mod1 + 2
			ldx #$00
		!:
			iny
			cpy #[8*16]
			bne !Loop-



		!Loop:
			lda FrameUpdate
			beq !Loop-
			dec FrameUpdate
			jsr AnimateBlood

			jsr $10df

			
			lda #$00
			jsr DrawArrow
			jsr UpdateArrow
			lda #$01
			jsr DrawArrow
			
			jsr DoColorRamp
			jmp !Loop-
	}


	DoColorRamp: {
			lda FrameTimer
			and #$01
			beq !+
			rts
		!:
			ldx ColorRampIndex
			inx
			cpx #$0c
			bne !+
			ldx #$00
		!:
			stx ColorRampIndex

			
			ldy #$0f
		!Loop:
			lda ColorRamp, x
			sta $d800 + 6 * $28 + 22, y
			sta $d800 + 10 * $28 + 22, y
			sta $d800 + 14 * $28 + 22, y
			sta $d800 + 18 * $28 + 22, y
			inx
			cpx #$0c
			bne !+
			ldx #$00
		!:
			dey
			bpl !Loop-



			ldy #$00
		!Loop:
			lda ColorRamp, x
			sta $d800 + 8 * $28 + 22, y
			sta $d800 + 12 * $28 + 22, y
			sta $d800 + 16 * $28 + 22, y
			sta $d800 + 20 * $28 + 22, y
			inx
			cpx #$0c
			bne !+
			ldx #$00
		!:
			iny
			cpy #$10
			bne !Loop-

			rts
	}


	
	.label MAX_POSITION = 10

	ArrowPosition:
			.byte $00
	ArrowBlank:
			.byte $20,$20
	ArrowLeft:
			.byte $3c,$3d
	ArrowRight:
			.byte $3e,$3f
	ArrowPosX:
			.byte $11,$11,$11,$13,$13,$13,$13,$13,$13,$13,$13
	ArrowPosY:
			.byte $02,$0b,$14,$06,$08,$0a,$0c,$0e,$10,$12,$14
	ArrowSwitch:
			.byte $03,$06,$0a,$00,$01,$01,$01,$01,$01,$02,$02
	ScreenLSB:
			.fill 25, <[$8400 + i * $28]
	ScreenMSB:
			.fill 25, >[$8400 + i * $28]

	ColorRamp:
			.byte $01,$01,$07,$03,$05,$05,$06,$06
			.byte $05,$05,$03,$07 
	ColorRampIndex:
			.byte $00

	Debounce:
			.byte $00
	DebounceTimer:
			.byte $00

	UpdateArrow: {
			ldx DebounceTimer
			beq !+
			dex
			stx DebounceTimer
			stx Debounce
		!:	

			lda $dc00
			sta JOY
			and #$1f
			cmp #$1f
			bne !+
			lda #$00
			sta Debounce
			rts
		!:

			lda Debounce	
			beq !+
			rts

		!:
		!Up:
			lda JOY
			and #$01
			bne !NotUp+
			lda ArrowPosition
			beq !NotUp+
			dec ArrowPosition
		!NotUp:

		!Dn:
			lda JOY
			and #$02
			bne !NotDn+
			lda ArrowPosition
			cmp #MAX_POSITION
			beq !NotDn+
			inc ArrowPosition
		!NotDn:

		!Lt:
			lda JOY
			and #$04
			bne !NotLt+
			lda ArrowPosition
			cmp #$03
			bcc !NotLt+
			tax
			lda ArrowSwitch, x
			sta ArrowPosition
		!NotLt:

		!Rt:
			lda JOY
			and #$08
			bne !NotRt+
			lda ArrowPosition
			cmp #$03
			bcs !NotRt+
			tax
			lda ArrowSwitch, x
			sta ArrowPosition
		!NotRt:

		!Fr:
			lda JOY
			and #$10
			bne !NotFr+
			lda ArrowPosition

			jmp BOOTSTRAP.LoadGame
		!NotFr:


			lda #$01
			sta Debounce
			lda #$10
			sta DebounceTimer
			rts
	}




	DrawArrow: {
			tax
			ldy #$00
			lda #<ArrowBlank
			sta ARROW + 0
			lda #>ArrowBlank
			sta ARROW + 1
			lda ArrowPosition
			cmp #$03
			bcc !LeftSide+
			jmp !RightSide+

		!LeftSide:	
			cpx #$00
			beq !+
			ldy #$02
		!:
			jmp !Draw+
	

		!RightSide:
			cpx #$00
			beq !+
			ldy #$04
		!:

		!Draw:
			ldx ArrowPosition
			lda ArrowPosY, x
			tax
			lda ScreenLSB, x
			sta ModScreen + 1
			lda ScreenMSB, x
			sta ModScreen + 2

			ldx ArrowPosition
			lda ArrowPosX, x
			clc
			adc ModScreen + 1
			sta ModScreen + 1
			lda ModScreen + 2
			adc #$00
			sta ModScreen + 2


			ldx #$00
		!:
			lda (ARROW),y
		ModScreen:
			sta $BEEF, x
			iny
			inx
			cpx #$02
			bne !-
			rts
	}


	AnimateBlood:{
			//8b68, 8b70
			lda FrameTimer
			and #$03
			beq !+
			rts

		!:
			ldx #$06
			ldy $8b6f
		!:
			lda $8b68,x
			sta $8b69,x
			dex
			bpl !-
			sty $8b68

			ldx #$06
			ldy $8b77
		!:
			lda $8b70,x
			sta $8b71,x
			dex
			bpl !-
			sty $8b70

			ldx #$06
			ldy $8b77
		!:
			lda $8b70,x
			sta $8b71,x
			dex
			bpl !-
			sty $8b70

			rts
					
	}

	FrameUpdate:
		.byte $00
	FrameTimer:
		.byte $00
	IRQ1: {
			pha
			lda #$0b
			sta $d022
			lda #$0c
			sta $d023

			lda #$01
			sta FrameUpdate
			inc FrameTimer

					lda #<IRQ2
					sta $fffe
					lda #>IRQ2
					sta $ffff
					lda #$70
					sta $d012	

			asl $d019		
			pla
			rti
	}

	IRQ2: {
			pha
		

			lda #$0b
			sta $d022
			lda #$08
			sta $d023

					lda #<IRQ3
					sta $fffe
					lda #>IRQ3
					sta $ffff
					lda #$b0
					sta $d012	

			asl $d019		
			pla
			rti
	}

	IRQ3: {
			pha

			lda #$08
			sta $d022
			lda #$0b
			sta $d023

					lda #<IRQ1
					sta $fffe
					lda #>IRQ1
					sta $ffff
					lda #$00
					sta $d012	

			asl $d019		
			pla
			rti
	}



}