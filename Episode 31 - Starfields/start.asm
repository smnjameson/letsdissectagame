.label SCREEN_RAM = $0400
.label BITMAP_RAM = $2000

.label STAR_LOOKUP = $02
.label JOY = $04
.label TIMER = $06
.label BITMAP_LOOKUP = $10



.label MAX_STARS = 64
.label SPAWN_OFFSET = 36
.label NUMBER_OF_SPEEDS = 3
.label MAX_SPEED = 8


BasicUpstart2(Entry)

Entry:
		sei
		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01
		cli

		lda #$3b
		sta $d011


		lda #%00111000
		sta $d018


			
		//Fill initial values
		ldx #[MAX_STARS - 1] * 2
	!:
		lda #$00
		sta BITMAP_LOOKUP + 0, x
		lda #$80
		sta BITMAP_LOOKUP + 1, x
		dex
		dex
		cpx #$fe
		bne !-


		lda #$00
		sta $d020
		sta $d021 


	!loop:
		lda #$f2
		cmp $d012
		bne *-3

		inc $d020
		
		//Joy control
		ldx #$00
		lda $dc00
		sta JOY
	//Up and down
		lda TIMER
		and #$0f
		beq !doSpeed+
		lda JOY
		lsr
		lsr
		jmp !doLeftAndRight+

	!doSpeed:
		lda JOY

		lsr
		bcs !notUp+
		ldx Speed
		inx
		cpx #MAX_SPEED
		bcc !+
		ldx #MAX_SPEED
	!:
		stx Speed
	!notUp:

		lsr
		bcs !notDn+
		ldx Speed
		dex

		bne !+
		ldx #1
	!:
		stx Speed
	!notDn:


	!doLeftAndRight:
	//left and right
		lsr
		bcs !+
		ldx #$ff
	!:
		lsr
		bcs !+
		ldx #$01
	!:
		stx RotateDir

		inc TIMER



		//Clear stars
		ldx #[MAX_STARS - 1] * 2
	!starLoop:
		lda #$00
		sta (BITMAP_LOOKUP, x)
		dex
		dex
		cpx #$fe
		bne !starLoop-


		//Calcualte locations
		ldx #[MAX_STARS - 1] * 2
		ldy #[MAX_STARS - 1]
	!starLoop:
			lda TIMER
			and StarDelay, y
			bne !SkipUpdate+

			lda StarX, y
			clc
			adc Speed
			and #$3f
			sta StarX, y

			lda StarAngle, y
			clc
			adc RotateDir
			and #$1f
			sta StarAngle, y
		!DoneRotate:


			lda StarX, y
			asl
			asl
			sta STAR_LOOKUP + 0

			lda StarAngle, y
			clc
			adc #>StarTables
			sta STAR_LOOKUP + 1

			sty Restorey + 1
			ldy #$00
			lda (STAR_LOOKUP), y
			sta BITMAP_LOOKUP + 0, x 
			iny
			lda (STAR_LOOKUP), y
			sta BITMAP_LOOKUP + 1, x

			iny
			lda (STAR_LOOKUP), y
		Restorey:
			ldy #$BEEF

			sta StarBitmask, y
		!SkipUpdate:
			dex
			dex
			dey
			cpx #$fe
			bne !starLoop-




		//Draw stars
		ldx #[MAX_STARS - 1] * 2
		ldy #[MAX_STARS - 1]
	!starLoop:
		lda StarBitmask, y
		sta (BITMAP_LOOKUP, x)
		dex
		dex
		dey
		cpx #$fe
		bne !starLoop-


		dec $d020
		jmp !loop-
	




RotateDir:
	.byte $00
Speed:
	.byte $01

StarX:
	.fill MAX_STARS, floor(random() * 64)
StarAngle:
	.fill MAX_STARS, floor(random() * 32)
StarDelay:
	.fill MAX_STARS, floor(pow(2, floor(random() * NUMBER_OF_SPEEDS) - 1))
StarBitmask:
	.fill MAX_STARS, 0

* = $0c00
		.import binary "map.bin"

* = $2000
		.fill 8192, 0

* = $4000 //data stored in lines of 256 bytes
StarTables:
		.var longest = sqrt(160*160 + 100*100)
		.for(var i=0; i<32; i++) {
			.for(var j=0; j<64; j++) {
				.var position = floor((easeInQuart(0, 1, (j + SPAWN_OFFSET)/(63 + SPAWN_OFFSET) )) * longest)
				.var x = floor(sin(i/32 * PI * 2) * position + 160)
				.var y = floor(cos(i/32 * PI * 2) * position + 100)
				.var addr = getAddr(x,y)
				.var bits = getBits(x,y)
				.word addr
				.byte bits, 0
			}
		}	


.function getAddr(x, y) {
	.if(x < 0 || x > 319) .return BITMAP_RAM
	.if(y < 0 || y > 199) .return BITMAP_RAM
	.var row = floor(y/8)
	.var col = floor(x/8)
	.var addr = row * 320 + col * 8 + y - row * 8 + BITMAP_RAM
	.return addr
}

.function getBits(x, y) {
	.if(x < 0 || x > 319) .return 0
	.if(y < 0 || y > 199) .return 0
	.var row = floor(y/8)
	.var col = floor(x/8)
	.var bits = pow(2, 7- (x - col * 8))
	.return bits
}

.function easeInQuart(start, finish, position) {
	.var d = position
	.var b = start
	.var c = finish - start
	
	.var t = d/c;
	.return (c *(t*t*t*t) + b);
}
