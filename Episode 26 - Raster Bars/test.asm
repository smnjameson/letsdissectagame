BasicUpstart2(Entry)


Entry:
		sei
		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01



	//try to stabilise here while interrupts are off
	!Retry:
		ldx #$00	
		cpx $d012	
		bne *-3		//2

		ldy #$0a //2
	!:				
		dey	
		bpl !- //10*5 + 4 cycles wasted = 54
		cpx $d012 //4
		bne !Retry- //2




		//waste some more cycles to position 0
		ldy #$09//2  //24
	!:				
		dey	
		bpl !- //9*5 + 4 cycles wasted = 49
		nop
		nop
		nop
		// nop


	//SUPRESS BAD LINES
	!repeat:
		stx $d020 //4
		stx $d021 //4

		txa		//2
		and #$07 //2
		ora #$18 //2
		sta $d011 //4

		ldx $d012 //4 

		ldy #$06 //2  //24
	!:				
		dey	
		bpl !- //6*5 + 4 cycles wasted = 34

		nop
		jmp !repeat- //3






