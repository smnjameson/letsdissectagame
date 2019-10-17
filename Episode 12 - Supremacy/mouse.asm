

BasicUpstart2(Entry)

PX:
	.byte $80, $00
PY:
	.byte $80
Entry:
	sei
	lda #$7f
	sta $dc0d
	sta $dd0d
	lda #$35
	sta $01
	cli

	lda #$20
	ldx #$00
!:
	sta $0400, x
	sta $0500, x
	sta $0600, x
	sta $0700, x
	inx
	bne !-

	lda #$80
	sta $07f8
	lda #$01
	sta $d015

	lda #$00
	sta $d020
	sta $d021

	lda $dc00
	and #%00111111
	ora #%01000000
	sta $dc00

	lda $d419
	sta oldx
	lda $d41a
	sta oldy



Loop:
	ldy oldx
	lda $d419
	jsr MOVCHK
	sty oldx
	clc
	adc PX
	sta PX
	txa
	adc PX + 1
	sta PX + 1

	ldy oldy
	lda $d41a
	jsr MOVCHK
	sty oldy
	clc
	eor #$ff
	adc #$01
	clc
	adc PY
	sta PY



WaitAndLoop:
	lda #$ff
	cmp $d012
	bne *-3
	lda #$02
	cmp $d012
	bne *-3


	lda PX
	sta $d000
	lda PY 
	sta $d001
	lda PX + 1
	sta $d010


	ldx #$00
	lda $dc01
	and #$01
	bne !+
	inx
	inx
!:
	lda $dc01
	and #$10
	bne !+
	inx
!:
	stx $d020

	jmp Loop



//       ENTRY   Y    = OLD VALUE OF POT REGISTER
//              A    = CURRENT VALUE OF POT REGISTER
//      EXIT    Y    = VALUE TO USE FOR OLD VALUE
//              X, A = DELTA VALUE FOR POSITION
MOVCHK:
	  	sty old    // SAVE OLD &  NEW VALUES
        sta new
        ldx #0         
        sec             // A <=  MOD64( NEW-OLD )
        sbc old
        and #%01111111
        cmp #%01000000  // IF      > 0
        bcs !L50+
        lsr           	//         A <= A/2
        beq !L80+       //         IF      <> 0
        ldy new    		//                 Y <= NEWVALUE
        rts             //                 RETURN
!L50:
	    ora #%11000000 // ELSE    OR IN HIGH ORDER BITS
        cmp #$FF        //         IF      <> -1
        beq !L80+
        sec             //                 A <= A/2
        ror
        ldx #$FF        //                 X <= -1
        ldy new    		//               Y <= NEWVALUE
        rts             //                 RETURN
!L80:
	    lda #0          // A <= 0
        rts             // RETURN W/ Y = OLD VALUE

new: 
	.byte $00
old: 
	.byte $00
oldx:
	.byte $00
oldy:
	.byte $00



* = $2000	
	.fill 63, $ff