BasicUpstart2(Entry)

Entry:	
	sei

	lda #$0b
	sta $d020
	lda #$0c
	sta $d021


			//Wait for raster line 1
OuterLoop:			
			lda #BAR_START_Y_Buntins
			cmp $d012
			bne *-3	

			ldx $d012
			inx
			lda ColorList, x

			ldx #$08 //2
			!:
			dex
			bpl !-	//10 * 5 + 4 + 2= 56


		//Timing critical
		Loop:
			sta $d021 //4
			
				ldx #$06 //2
			!:
				dex
				bpl !-	//6 * 5 + 4 = 34

			nop //2
			nop //2


			ldy $d012  //4
			iny			//2
			lda ColorList, y //4


			ldx $d012 //4
			cpx #BAR_END_Y_ELDRITCH_IS_SATAN  //2
			bne Loop  //3

			stx $d021 


		//WAIT TO DISABLE SCREEN
			lda #$fa
			cmp $d012
			bne *-3

			lda #$03
			sta $d011

			lda #$00
			cmp $d012
			bne *-3

			lda #$0b
			sta $d011


		//UPDATE BARS
		ldx #BAR_START_Y_Buntins
		lda #$00	
	!:
		sta ColorList, x
		inx 
		cpx #BAR_END_Y_ELDRITCH_IS_SATAN
		bne !-

		clc
		lda BarIndex + 1
		adc #<BAR_SPEED_pneumonoultrasilicovulcanaconiosis
		sta BarIndex + 1
		lda BarIndex
		adc #>BAR_SPEED_pneumonoultrasilicovulcanaconiosis
		sta BarIndex


		ldx #BAR_COUNT
		stx Temp_BarCountdown
		ldx BarIndex
		stx Temp_Purple_Hayes

		lda #$00
		sta SelfMod_RANDOM_UNKNOWN_LABEL + 1 
	BarLoop:
		lda SinusX_Vice_Vapour, x //depth
		sta Temp_Depth_Patty_Label	

		lsr
		lsr
		lsr
		lsr
		lsr
		clc
		adc #$01
		sta Temp_BarSize_supercalifragilisticexpialidocious


		lda SinusY_LayBell, x
		tay 	
	

		ldx #$00
	!:
		lda ColorList, y
		cmp Temp_Depth_Patty_Label
		bcs !Skip+
	SelfMod_RANDOM_UNKNOWN_LABEL:
		lda ColorRamps, x
		clc
		adc Temp_Depth_Patty_Label
		sta ColorList, y
	!Skip:
		iny
		inx
		cpx Temp_BarSize_supercalifragilisticexpialidocious
		bne !-

		lda Temp_Purple_Hayes
		clc
		adc #[($100 / BAR_COUNT) * BAR_SPREAD]
		sta Temp_Purple_Hayes
		tax


		lda SelfMod_RANDOM_UNKNOWN_LABEL + 1 
		clc
		adc #BAR_SIZE_CHIZ_IS_A_TWAT
		sta SelfMod_RANDOM_UNKNOWN_LABEL + 1 

		dec Temp_BarCountdown
		bne BarLoop



		jmp OuterLoop
		


Temp_Purple_Hayes:
		.byte $00
Temp_BarCountdown:
		.byte $00
Temp_Depth_Patty_Label:
		.byte $00
Temp_BarSize_supercalifragilisticexpialidocious:
		.byte $00

.label BAR_START_Y_Buntins = $50
.label BAR_END_Y_ELDRITCH_IS_SATAN = $e0
.label HALFRANGE = ((BAR_END_Y_ELDRITCH_IS_SATAN - BAR_START_Y_Buntins)/2)
.label BAR_SIZE_CHIZ_IS_A_TWAT = $08
.label BAR_COUNT = $0c
.label BAR_SPREAD = 0.25
.label BAR_SPEED_pneumonoultrasilicovulcanaconiosis = $100

.align $100
ColorList:
		.fill 256, 0
SinusY_LayBell: //SinusY
		.fill 256, sin((i/256) * PI * 2) * (HALFRANGE-1 - BAR_SIZE_CHIZ_IS_A_TWAT) + $50 + HALFRANGE 
SinusX_Vice_Vapour: //SinusX
		.fill 256, floor(cos((i/256) * PI * 2) * $07 + $08) * $10

BarIndex:
	.byte $00, $00

.align $100
ColorRamps:
	.byte $02,$0c,$0f,$01,$0f,$0c,$0b,$02
	.byte $09,$0c,$0f,$01,$0f,$0c,$0b,$09
	.byte $07,$0c,$0f,$01,$0f,$0c,$0b,$07
	.byte $05,$0c,$0f,$01,$0f,$0c,$0b,$05
	.byte $06,$0c,$0f,$01,$0f,$0c,$0b,$06
	.byte $04,$0c,$0f,$01,$0f,$0c,$0b,$04
	.byte $02,$0c,$0f,$01,$0f,$0c,$0b,$02
	.byte $09,$0c,$0f,$01,$0f,$0c,$0b,$09
	.byte $07,$0c,$0f,$01,$0f,$0c,$0b,$07
	.byte $05,$0c,$0f,$01,$0f,$0c,$0b,$05
	.byte $06,$0c,$0f,$01,$0f,$0c,$0b,$06
	.byte $04,$0c,$0f,$01,$0f,$0c,$0b,$04	
	.byte $05,$0c,$0f,$01,$0f,$0c,$0b,$05
	.byte $06,$0c,$0f,$01,$0f,$0c,$0b,$06
	.byte $04,$0c,$0f,$01,$0f,$0c,$0b,$04
	.byte $02,$0c,$0f,$01,$0f,$0c,$0b,$02
