// Setup
.file [name="crack.prg", segments="Base,Lowmem,Patch", allowOverlap]
.segmentdef Base []
.segmentdef Lowmem []
.segmentdef Patch []

.segment Base

	* = $0400
		.import binary "highmem.bin"

.segment Lowmem
	 * = $5400
		.import binary "lowmem.bin"

	* = $f0ee
		.import binary "introtext2.bin"

//0831-0881
//f177-f192

.segment Patch
* = $5780
		sei
		ldx #$7f
		stx $dc0d
		stx $dd0d

		lda #$30
		sta $01


	!:
	SRC:
		lda $5700, x
	TGT:
		sta $0300, x	
		dex
		cpx #$ff
		bne !-
		dec SRC + 2
		dec TGT + 2
		bpl !-
		jmp $4460



* = $0a0c
		jsr BUGFIX //3  //0a0c
		nop
		// lda $b2 //2
		// ora $b3 //2
		// beq $0a99 //2

// * = $0a4b
// 		lda #17 //Final pause before returning to menu

* = $1c8d
		nop
		nop
		jsr RestoreLevel


// * = $082e
// 		jmp $0882
* = $f14c		
BUGFIX:
		.label TICKS_PER_FRAME = 34
		.label CONTINUE_LENGTH = 10
		.label TIMER_LO = $f0
		.label TIMER_HI = $f1

		lda $b2 
		ora $b3
		beq !DoContinue+
		rts

	!DoContinue:
		lda $53e4
		beq !GameOverForReal+

		lda TIMER_HI
		bne !Countdown+

		lda #CONTINUE_LENGTH
		sta TIMER_HI
		lda #1
		sta TIMER_LO

	!Countdown:
		dec TIMER_LO
		bne !+
		lda #TICKS_PER_FRAME
		sta TIMER_LO
		dec TIMER_HI
		

		lda #$01
		sta $d820 + $28 + 4
		lda TIMER_HI
		sta $5020 + $28 + 4
		sta $5420 + $28 + 4

		beq !GameOverForReal+
	!:
		lda #$01
	!GameOverForReal:	
		rts




// * = $f162
	RestoreLevel:

		lda TIMER_HI
		beq !Exit+

		lda #$0
		sta $d820 + $28 + 4
		sta TIMER_HI


	!Exit:
		lda #$04
		sta $045a, x
		rts












	

