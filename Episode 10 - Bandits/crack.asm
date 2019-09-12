// Setup
.file [name="crack.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base [prgFiles="base.prg"]
.segmentdef Patch []

// Patch Code 
.segment Patch
 * = $0800 //SYS 1808 ($0710) - Proxy to 2117($0845)
 .byte $00, $0b, $08, $01, $00, $9e, $31, $38, $30, $38, $00, $00

//Code to replace at $0800
* =  $0710
	ldx #$00
!:
	lda OrigCode,x
	sta $0800, x
	inx
	cpx #$10
	bne !-
	jmp $0845
OrigCode:
  .byte $a5, $d8, $29, $01, $f0, $16, $a9, $ea 
  .byte $8d, $12, $d0, $a9, $00, $45, $ca, $a6, $d9

* = $0740
JoyCheck:
	lda $dc00
	and #$10
	bne !+
	pla
	pla
	lda #$94
	pha
	lda #$7c
	pha
	lda #$d5
	sta $d003

	lda #$00
	ldx #$00
	!Loop:
		.for(var i=0; i<31; i++) {
			sta $a000 + i * 240, x
		}
	inx
	cpx #240
	bne !Loop-


	rts
!:
	lda $d000
	jmp $9075



* = $0f90
		lda #$01 //Infinite shield
* = $0f9e
		lda #$01 //Infinite shield

	
* = $0b5c //Permant shield activation
		and #$1e		
		cmp #$1e
		nop
		nop

* = $5008
	.fill 64, 0 //Clears the curved line separator on the right side
	.fill 8, 0
	.byte $00,$00,$3f,$3f,$3f,$3f,$3f,$3f,$00,$03,$ff,$ff,$ff,$ff,$ff,$f5
	.byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$00,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f0,$f0,$f0,$f0,$fc,$fc,$fc,$fc 

	
* = $5808 //Copy of above data for buffering
	.fill 64, 0 //Clears the curved line separator on the right side
	.fill 8, 0
	.byte $00,$00,$3f,$3f,$3f,$3f,$3f,$3f,$00,$03,$ff,$ff,$ff,$ff,$ff,$f5
	.byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$00,$f0,$f0,$f0,$f0,$f0,$f0,$f0
	.byte $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f,$f5,$f5,$f5,$f5,$f5,$f5,$f5,$f5
	.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f0,$f0,$f0,$f0,$fc,$fc,$fc,$fc 

* = $9072
	jmp JoyCheck







