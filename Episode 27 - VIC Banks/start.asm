//Selecting a VIC Bank @ $dd00
//
//0000 - 3fff*   bank #0   %11
//4000 - 7fff    bank #1   %10
//8000 - bfff*   bank #2   %01
//c000 - ffff    bank #3   %00

//Vic reads:
//Sprite data
//Screen data
//Character set data
//Bitmap data

//* - VIC Always reads ram at a given address except for :
//9000-9FFF - Char rom copy
//1000-1FFF - Char rom copy


//d000-dfff - Not much good for code, great place for sprites and charsets


//Selecting a graphics mode $d011 (and multicolor in $d016)
//Bit 5 sets text or bitmap mode

//bit 4 of $d016 defines multicolor mode on/off


//Selecting screen/charset or bitmap locations $d018


BasicUpstart2(Entry)

Entry:
		sei 
		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01

		lda #<IRQ
		sta $fffe
		lda #>IRQ
		sta $ffff
		lda #$30
		sta $d012 
		lda $d011
		and #$7f
		sta $d011

		lda #$01
		sta $d01a

		asl $d019
		cli



		//Select a bank
		lda #%00000010
		sta $dd00

		//select char and screen location
		lda #%11110000
		sta $d018

		//Set default text mode
		lda #$1b
		sta $d011

		//set multicolor mode and colors
		lda $d016
		ora #%00010000
		sta $d016

		lda #$00
		sta $d020
		sta $d021 

		lda #$0c
		sta $d022
		lda #$0b
		sta $d023


		ldx #$00
	!:
		lda #$ff
		sta SCREEN_RAM + $000, x
		sta SCREEN_RAM + $100, x
		sta SCREEN_RAM + $200, x
		sta SCREEN_RAM + $300, x
		lda #$09
		sta $D800 + $000, x
		sta $D800 + $100, x
		sta $D800 + $200, x
		sta $D800 + $300, x

		dex
		bne !-


		.for(var i=0; i<8; i++) {
				clc
				lda #[32 * i]
				ldx #$00
			!:
				sta SCREEN_RAM + i * $28 + $04, x
				adc #$01
				inx
				cpx #$20
				bne !-
		}


	Loop:

		jmp Loop




IRQ: {	
		pha  
		txa 
		pha 
		tya 
		pha 

				inc sinusindex
				ldx sinusindex
				ldy #$48
			!:
				lda $d012
				cmp $d012
				beq *-3

				lda $d016
				and #$f8
				ora sinustable,x
				sta $d016

				inx
				dey
				bne !-

		asl $d019

		pla 
		tay 
		pla 
		tax 
		pla 
		rti

}

sinusindex:
		.byte $00
sinustable:
		.fill 256, sin(i/32 * PI * 2) * 3.5 + 3.5  //0 to 7



* = $4000
	.import binary "chars0.bin"

.label SCREEN_RAM = $7c00




