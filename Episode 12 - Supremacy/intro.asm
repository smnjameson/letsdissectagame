// Setup
.file [name="ypmloader.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base [prgFiles="ypm.prg"]
.segmentdef Patch []

.segment Patch
:BasicUpstart2($8200)

* = $97c5
	jsr $e500

* = $e500
	txa
	pha 
	tya 
	pha 


	//Horizontal
	ldy oldx
	lda $d419
	jsr MOVCHK
	sty oldx

	clc
	adc $d000
	sta $d000

	lda $d010
	and #%00000001
	sta TEMP

	txa
	adc TEMP
	and #%00000001
	sta TEMP

	lda $d010
	and #%11111110
	ora TEMP
	sta $d010

	and #$01
	bne !+
	lda $d000
	cmp #$52
	bcs !+
	jsr $9709

	lda $d000
	cmp #$1c
	bcs !+
	lda #$1c
	sta $d000	
!:
	
	lda $d010
	and #$01
	beq !+
	lda $d000
	cmp #$01
	bcc !+

	lda $9a66
	beq !DoScroll+
	lda $9a65
	cmp #$4f
	bcs !Skip+
!DoScroll:	
	jsr $9728
!Skip:

	lda $d000
	cmp #$4c
	bcc !+
	lda #$4c
	sta $d000	
!:





	//vertical
	ldy oldy
	lda $d41a
	jsr MOVCHK
	sty oldy
	sta TEMP
	sec
	lda $d001
	sbc TEMP
	sta $d001

	cmp #$70
	bcs !+
	jsr $9766

	lda $d001
	cmp #$33
	bcs !+
	lda #$33
	sta $d001
!:

	cmp #$cf
	bcc !+
	jsr $9747

	lda $d001
	cmp #$ec
	bcc !+
	lda #$ec
	sta $d001	
!:


	pla 
	tay 
	pla 
	tax 
	lda $3e
	and #$0f
	rts

	TEMP:
		.byte 0


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