* = $02 virtual
	mappos: .byte $00
	offset: .byte $00
	xscroll: .byte $00
	speed: .byte $00
	buffer: .byte $00
	shiftColorNow: .byte $00
	timer: .byte $00


.label maxspeed = 32

BasicUpstart2(Entry)


Entry:
		sei

		//Disable CIA interrupts
		lda #$7f
		sta $dc0d
		sta $dd0d

		//Enable Raster Interrupts
		lda #$01
		sta $d01a

		//set IRQ
		lda #<IRQ
		ldx #>IRQ
		sta $fffe
		stx $ffff

		//Set line
		lda $d011
		and #$7f
		sta $d011
		lda #IRQLine
		sta $d012

		//Bank out kernel and basic
		lda #$35
		sta $01

		//VIC Bank setup
		lda #$02
		sta $dd00 //Vic bank 2
		lda #$02 //Screen at $4000, chars at $4800
		sta $d018

		lda #$d0
		sta $d016	//38 columns, mc mode

		//Set colors
		lda #$00
		sta $d020
		sta $d021 
		lda #$0f
		sta $d022
		lda #$09
		sta $d023

		//ack interrupt
		asl $d019
		cli



		//Reset variables
		lda #$00
		sta offset
		sta mappos
		sta buffer
		sta shiftColorNow
		lda #$07
		sta xscroll
		lda #$03
		sta speed

		//Initialise map
		jsr copyInitialScreen
		jsr UpdateMap

	!Loop:
		lda shiftColorNow
		cmp #$02	//Only shift color when needed and after all other map update is done
		bne !Loop-
		lda #$00
		sta shiftColorNow
		jsr ShiftColorRam
		jmp !Loop-



copyInitialScreen: {
		//Copy first full screen of map, including colors
		ldx #39
	!:
		.for(var i=0; i<24; i++) {
			lda MAP + i * $100, x
			sta $4000 + i * $28, x
			tay
			lda COLORS, y
			sta $d800 + i * $28, x
		}
		dex
		bmi !+
		jmp !-
	!:


		//Ensure last line of screen is black to hide garbage
		ldx #39
		lda #$00
	!:
		sta $d800 + 24 * 40, x
		dex
		bpl !-
		rts
}


UpdateScroll: {
		//Apply the xscroll value 
		lda $d016
		and #$f8
		ora xscroll
		sta $d016
		rts
}



UpdateMap: {
		ldx offset
		cpx #40
		bcc !+
		jsr FullCopy

		ldx #$00
		stx offset
	!:	
		//Set up index into map data in x, and screen column in y
		txa 
		tay
		clc 
		adc mappos
		adc #39
		tax 

		//Pick the current buffer
		lda buffer
		beq !buffer1+
		jmp !buffer2+

	!buffer1:
		//Map Column copy
		.for(var i=0; i<24; i++) {
			//Copy nex t column from map
			lda MAP + i * $100, x
			//To relevant column on screen (back 1 char and down q1 char)
			sta $4028 + i * $28 - 1, y
			//Also to other buffer
			sta $4400 + i * $28 - 1,y
		}
		//set column colors
		.for(var i=0; i<24; i++) {
			lda $4028 + i * $28 - 1, y
			tax 
			lda COLORS, x
			sta $d828 + i * $28 - 1, y
		}
		rts

	!buffer2:
		//Map Column copy
		.for(var i=0; i<24; i++) {
			//Copy nex t column from map
			lda MAP + i * $100, x
			//To relevant column on screen (back 1 char and down q1 char)
			sta $4428 + i * $28 - 1, y
			//Also to other buffer
			sta $4000 + i * $28 - 1,y
		}
		//set column colors
		.for(var i=0; i<24; i++) {
			lda $4428 + i * $28 - 1, y
			tax 
			lda COLORS, x
			sta $d828 + i * $28 - 1, y
		}
		rts	
}

FullCopy: {
		//Increments base map position
		lda mappos
		clc
		adc #40
		sta mappos

		//Swap screen buffers and set screen ram again
		lda buffer
		eor #$01
		sta buffer
		asl
		asl
		asl
		asl
		ora #$02
		sta $d018

		lda #$01
		sta shiftColorNow

		rts
}

ShiftColorRam: {
		//DO NOT COPY COLUMN 39 OR GLITCH!!!!

		//Can update alternate rows only if using color per tile

		inc $d020

		//SLOW but memory friendly
		// .for(var row=0; row<24; row++) {
		// 	ldx #38
		// !:
		// 	lda $d828 + row * $28, x
		// 	sta $d800 + row * $28, x
		// 	dex
		// 	bpl !-
		// }

		//FAST but memory intensive
		.for(var row=0; row<24; row++) {
			.for(var col=0; col<39; col++) {
				lda $d828 + row * $28 + col
				sta $d800 + row * $28 + col
			}
		}


		dec $d020

		rts	
}


.label IRQLine = $2f
IRQ:
		//save state
		pha
		txa 
		pha 
		tya 
		pha 

		lda #$1b
		sta $d011

		lda #<StableIRQ
		ldx #>StableIRQ
		sta $fffe
		stx $ffff
		inc $d012
		asl $d019

		tsx
		cli

		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		
		



.align $100
StableIRQ:
		// 0-1 cycles of jitter here now
		txs   

		ldx #$07  //X * 5 + 1
	!:
		dex
		bne !-	
		nop
		nop
		nop
		clv


		//Force a branch if 0 jitter and not if 1 jitter
		//causing either 3 or 2 cycles to be added
		lda $d012
		cmp $d012
		beq !+
	!:

		//Raster is stable here!


		//Waste more cycles
		ldx #$0a
	!:
		dex
		bne !-
		nop
		nop

		//Waste an exact number of cycles + offset
		lda offset
		lsr
		sta selfmod_branch + 1
		bcc !+ //2 cycles if offset was odd, 3 if even
	!:
	selfmod_branch:
		bvc *  //relative becomes offset /2

		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop

		dec $d011
		inc $d011

		//Ack interrupt
		asl $d019

		//Point back to original IRQ
		lda #<ShiftIRQ
		ldx #>ShiftIRQ
		sta $fffe
		stx $ffff
		lda #$f1
		sta $d012

		//restore state
		pla
		tay 
		pla  
		tax 
		pla 
		rti


ShiftIRQ:
		//save state
		pha
		txa 
		pha 
		tya 
		pha 


		//Wait for next line and force invalid vic display mode
		//to hide the glitch at the bottom of thje screen
		lda $d012
		cmp $d012
		beq *-3
		lda #$7b
		sta $d011


		inc $d020

		//Update scroll
		lda xscroll
		sec 
		sbc speed
		bpl !Skip+
	!:
		clc
		adc #$08
		sta xscroll

		inc offset
		jsr UpdateMap

		lda shiftColorNow
		cmp #$01
		bne !NoShift+
		inc shiftColorNow
	!NoShift:
		lda xscroll
		bmi !-

	!Skip:
		sta xscroll
		jsr UpdateScroll


		//JOYSTICK SPEED CONTROLS
		inc timer
		lda timer
		and #$03
		bne !+
		lda $dc00
		lsr
		lsr
	!CheckLeft:
		lsr
		bcs !CheckRight+
		ldx speed
		beq !CheckDone+
		dec speed

	!CheckRight:
		lsr
		bcs !CheckDone+
		ldx speed
		cpx #maxspeed
		beq !CheckDone+
		inc speed
	!CheckDone:
	!:


		dec $d020


		//Point back to original IRQ
		lda #<IRQ
		ldx #>IRQ
		sta $fffe
		stx $ffff
		lda #IRQLine
		sta $d012


		asl $d019
		//restore state
		pla
		tay 
		pla  
		tax 
		pla 
		rti







* = $4800
	.import binary "chars.bin"
* = $5000
	MAP:
	.import binary "map.bin"
* = $6800
	COLORS:
	.import binary "colors.bin"
* = $6c00
	.fill $400, 0



