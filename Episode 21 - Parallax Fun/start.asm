.label SCREEN = $4000

BasicUpstart2(Entry)

Entry: {
		sei
		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$00
		sta $d020
		sta $d021

		lda #$35
		sta $01

		//Vic bank
		lda $dd00
		and #%11111100
		ora #%00000010
		sta $dd00

		//Screen/char pointer
		lda #%00000010
		sta $d018
		

		//Turn on mc mode
		lda $d016
		ora #%00010000
		sta $d016


		//Set colors
		ldx #$00
		lda #$0f
	!:
		sta $d800,x
		sta $d900,x
		sta $da00,x
		sta $db00,x
		inx
		bne !-


		ldx #$00
	!Loop:
		lda SCREEN + 11 * 40, x
		cmp #255
		bne !+
		lda #$06
		sta $d800 + 11 * 40, x
	!:
		inx
		cpx #120
		bne !Loop-


		lda #$0b
		sta $d022
		lda #$0c
		sta $d023

		jsr SetupIrq

		cli
	!Loop:
		lda #$f2
		cmp $d012
		bne *-3

		// inc $d020
		jsr UpdateScrolls
		// dec $d020

		jmp !Loop-

}


LayerScrollValues:
		.byte $07, $07, $07, $07
LayerScrollSpeeds:
		.byte $04, $03, $02, $01


.align $100
JumpTable:
		.word ScrollLayer1
		.word ScrollLayer2
		.word ScrollLayer3
		.word ScrollLayer4

ScrollToggle:
		.byte $00

UpdateScrolls: {
		ldx #$03
	!Loop:
		lda LayerScrollValues, x
		sec
		sbc LayerScrollSpeeds, x
		sta LayerScrollValues, x
		bcs !+
		adc #$08
		sta LayerScrollValues, x
		jsr JumpRoutine
	!:
		dex
		bpl !Loop-


		//Charachter based parallax

		//RIGHT
		ldx #$07
	!Loop:	
		lda $4ff8,x
		lsr
		bcc !+
		ora #$80
	!:	
		lsr
		bcc !+
		ora #$80
	!:		
		sta $4ff8,x
		dex
		bpl !Loop-
	!Skip:


		ldy $4ff8
		ldx #$00
	!:
		lda $4ff9, x
		sta $4ff8, x
		inx
		cpx #$07
		bne !-	
		sty $4fff

		rts


	JumpRoutine:
		txa
		asl
		sta JumpSelfMod + 1
	JumpSelfMod:
		jmp (JumpTable)
}

ScrollLayer1: {
		.for(var j=0; j<4; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}
		.for(var j=21; j<25; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}
		rts
}

ScrollLayer2: {
		.for(var j=4; j<7; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}
		.for(var j=18; j<21; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}
		rts
}

ScrollLayer3: {
		.for(var j=7; j<9; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}
		.for(var j=16; j<18; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}
		rts
}


ScrollLayer4: {
		.for(var j=9; j<16; j++) {
			ldy SCREEN + j*40
			.for(var i=1; i<40; i++) {
				lda SCREEN + j*40 + i
				sta SCREEN + j*40 + i - 1 
			}	
			sty SCREEN + j*40 + 39
		}

		.for(var j=11; j<14; j++) {
			ldy $d800 + j*40
			.for(var i=1; i<40; i++) {
				lda $d800 + j*40 + i
				sta $d800 + j*40 + i - 1 
			}	
			sty $d800 + j*40 + 39
		}


		rts
}

SetupIrq: {
		lda #$01
		sta $d01a

		lda #<IRQ1
		sta $fffe
		lda #>IRQ1
		sta $ffff
		lda #$00
		sta $d012
		lda $d011
		and #$7f
		sta $d011

		asl $d019
		rts
}

IRQ1: {
		:storeState()

			lda #%00010000
			ora LayerScrollValues + 0
			sta $d016

		lda #<IRQ2
		sta $fffe
		lda #>IRQ2
		sta $ffff
		lda #$51
		sta $d012
		asl $d019
		:restoreState()	
		rti
}

IRQ2: {
		:storeState()

		lda $d012
		cmp $d012
		beq *-3

			lda #%00010000
			ora LayerScrollValues + 1
			sta $d016

		lda #<IRQ3
		sta $fffe
		lda #>IRQ3
		sta $ffff
		lda #$6a
		sta $d012
		asl $d019
		:restoreState()	
		rti
}

IRQ3: {
		:storeState()

		lda $d012
		cmp $d012
		beq *-3

			lda #%00010000
			ora LayerScrollValues + 2
			sta $d016

		lda #<IRQ4
		sta $fffe
		lda #>IRQ4
		sta $ffff
		lda #$79
		sta $d012
		asl $d019
		:restoreState()	
		rti
}

IRQ4: {
		:storeState()

		lda $d012
		cmp $d012
		beq *-3

			lda #%00010000
			ora LayerScrollValues + 3
			sta $d016

		lda #<IRQ5
		sta $fffe
		lda #>IRQ5
		sta $ffff
		lda #$b2
		sta $d012
		asl $d019
		:restoreState()	
		rti
}

IRQ5: {
		:storeState()

		lda $d012
		cmp $d012
		beq *-3

			lda #%00010000
			ora LayerScrollValues + 2
			sta $d016

		lda #<IRQ6
		sta $fffe
		lda #>IRQ6
		sta $ffff
		lda #$c1
		sta $d012
		asl $d019
		:restoreState()	
		rti
}

IRQ6: {
		:storeState()

		lda $d012
		cmp $d012
		beq *-3

			lda #%00010000
			ora LayerScrollValues + 1
			sta $d016

		lda #<IRQ7
		sta $fffe
		lda #>IRQ7
		sta $ffff
		lda #$da
		sta $d012
		asl $d019
		:restoreState()	
		rti
}


IRQ7: {
		:storeState()

		lda $d012
		cmp $d012
		beq *-3

			lda #%00010000
			ora LayerScrollValues + 0
			sta $d016

		lda #<IRQ8
		sta $fffe
		lda #>IRQ8
		sta $ffff
		lda #$f2
		sta $d012
		asl $d019
		:restoreState()	
		rti
}

IRQ8: {
		:storeState()



		lda #<IRQ1
		sta $fffe
		lda #>IRQ1
		sta $ffff
		lda #$30
		sta $d012
		asl $d019
		:restoreState()	
		rti
}








.macro storeState() {
		pha
		txa 
		pha 
		tya
		pha
}

.macro restoreState() {
		pla
		tay 
		pla 
		tax 
		pla
}



* = $4000
.import binary "screen.bin"

* = $4800
.import binary "chars.bin"