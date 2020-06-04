// $dc00 - Columns - DDR is $dc02 (default %00000000)

// $dc01 - Rows - DDR is $dc03 (default %00000000)


BasicUpstart2(Entry)

#import "KeyboardMacros.asm"

Index:
	.byte $00
Entry:
		sei

		lda #$35	//Disable kernal and BASIC
		sta $01

		lda #$7f
		sta $dc0d
		sta $dd0d

		cli


	!Loop:
		lda #$ff
		cmp $d012
		bne *-3

		jsr KeyScan	//Call once per frame to update keybaord values



		isKeyPressed("X")
		bcc !+
		isKeyDown("shift")
		bcc !+		
		inc $d020
	!:


		isKeyDown("W")
		bcc !+
		isKeyDown("A")
		bcc !+		
		inc $d020
	!:


		jsr GetKeyPressed
		beq !+
		ldx Index
		sta $0400, x
		inx 
		bne !SetIndex+
		ldx #$ff
	!SetIndex:		
		stx Index
	!:

		isKeyDown("delete")
		bcc !+		
		ldx Index
		lda #$20
		sta $0400, x
		dex 
		cpx #$ff
		bne !SetIndex+
		ldx #$00
	!SetIndex:
		stx Index
	!:

		ldx #$20
		inc Timer
		lda Timer
		and #$20
		bne !+
		ldx #$a0
	!:
		txa 
		ldx Index
		sta $0400, x



	//Joystick

		lda $dc00
		and #$1f
		eor #$1f
		sta $d020

		jmp !Loop-

Timer:
	.byte $00





