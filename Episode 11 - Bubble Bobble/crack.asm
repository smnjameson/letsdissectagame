// Setup
.file [name="crack.prg", segments="Base,Lowmem,Patch", allowOverlap]
.segmentdef Base []
.segmentdef Lowmem []
.segmentdef Patch []

.segment Base
	* = $0900
	.import binary "highmem.bin"
.segment Lowmem
	* = $d000
	.import binary "lowmem.bin"

.segment Patch
	BasicUpstart2(Entry)

	Entry: 
		sei
		lda #$30
		sta $01
		jmp $d900

* = $d900
		ldx #$00
	!:
	SRC:
		lda $d800, x
	TGT:
		sta $0800, x	
		inx
		inc $d020
		bne !-
		dec SRC + 2
		dec TGT + 2
		bne !-

		jmp $4460



* = $0a64
		jsr $7c40 //3
		nop
		beq $0a99
		// lda $b2 //2
		// ora $b3 //2
		// beq $0a99 //2

* = $0aa3
		lda #17 //Final pause before returning to menu

* = $d537
		nop
		nop
		jsr RestoreLevel



* = $7c40
		.label TICKS_PER_FRAME = 17
		.label CONTINUE_LENGTH = 10
		.label TIMER_LO = Timer//$f0
		.label TIMER_HI = Timer + 1//$f1
		lda $b2 
		ora $b3
		beq !DoContinue+
		rts

	!DoContinue:
		lda TIMER_HI
		bne !Countdown+

		lda #CONTINUE_LENGTH
		sta TIMER_HI
		lda #1
		sta TIMER_LO

		txa
		pha

		sec
		ldx #$07
	!:
		lda ContinueText, x
		sbc #$20
		sta $5020,x
		sta $5420,x
		lda #$01
		sta $d820,x
		dex
		bpl !-

		pla
		tax

	!Countdown:
		dec TIMER_LO
		bne !+
		lda #TICKS_PER_FRAME
		sta TIMER_LO
		dec TIMER_HI
		


		
		lda TIMER_HI
		sta $5020 + $28 + 4
		sta $5420 + $28 + 4
		
		lda #$01
		sta $d820 + $28 + 4

		lda TIMER_HI
		beq !GameOverForReal+
	!:
		lda #$01
		rts
	

	!GameOverForReal:
		lda #$00
		rts




	RestoreLevel:
		txa
		pha

		lda $fe
		beq !Exit+

		clc
		ldx #$07
	!:
		lda #$0
		sta $5020,x
		sta $5420,x
		sta $5020 + $28,x
		sta $5420 + $28,x
		dex
		bpl !-
	

	!Exit:
		pla
		tax
		lda #$04
		sta $045a, x
		rts
	Timer:
		.byte $00,$00
	ContinueText:
		.byte $40,$50,$52,$4F,$43,$45,$45,$44
* = $f11b 
		.byte $40,$42,$59,$40
* = $f120
		.byte $0a, $12
		.byte $40,$53,$48,$41,$4c,$4c,$41,$4e



//INTERESTING LOCATIONS
//Game over countdown routine $7bcb - $7bd3 
	

