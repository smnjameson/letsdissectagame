/* Requires the follwing zero page values

	MultiplyNum1: .byte $00
	MultiplyNum2: .byte $00
	MultiplyNum1Hi: .byte $00
	MapLoaderTileLookup: .word $0000
	MapLoaderMapLookup: .word $0000
	MapLoaderColumn: .byte $00
	MapLoaderRow: .byte $00
*/

//These DATA constants should be aligned to $100
.const MAP_DATA = $3400
.const TILE_DATA = $2900
.const ATTR_DATA = $2800

.const TILE_WIDTH = 2
.const TILE_HEIGHT = 2

.const MAP_TILE_WIDTH = 20	//Single screen size
.const MAP_TILE_HEIGHT = 12

//The following 2 values cannot exceed 256
.const MAP_FULL_WIDTH = 40 //Full map size 
.const MAP_FULL_HEIGHT = 72




MAPLOADER: {
	.const TILE_DATA_LENGTH = TILE_WIDTH * TILE_HEIGHT

	TileToScreenOffsets:
		.fill TILE_DATA_LENGTH, mod(i, TILE_WIDTH) + floor(i/TILE_WIDTH) * $28

	DrawMap: {
			txa
			//Get Map data location
			sta MapLoaderMapLookup + 0
			lda #>MAP_DATA
			sta MapLoaderMapLookup + 1

			
			//Tile draw offsets passed in X&Y
			sty MultiplyNum1
			lda #MAP_FULL_WIDTH
			sta MultiplyNum2
			jsr Multiply

			//Now add to MapLoaderLookup
			clc
			adc MapLoaderMapLookup + 0
			sta MapLoaderMapLookup + 0
			tya 
			adc MapLoaderMapLookup + 1
			sta MapLoaderMapLookup + 1
			


			//Set screen and color target locations
			lda #$00
			sta ScreenMod + 1
			sta ColorMod + 1
			lda #>SCREEN_RAM
			sta ScreenMod + 2
			lda #$d8
			sta ColorMod + 2

			
			lda #$00
			sta MapLoaderRow
		!RowLoop:

			//Draw a row
			lda #0
			sta MapLoaderColumn
			tay

		!ColumnLoop:
			// ldy MapLoaderColumn	
			lda (MapLoaderMapLookup), y
			//Tile number in Acc

			//We need = TileNumber * TileDataLength + TILE_DATA
			sta MultiplyNum1
			lda #TILE_DATA_LENGTH
			sta MultiplyNum2
			jsr Multiply
			sta MapLoaderTileLookup + 0
			tya
			clc 
			adc #>TILE_DATA
			sta MapLoaderTileLookup + 1
			//MapLoaderTileLookup points to tile data


			ldy #$00
		!:
			lda (MapLoaderTileLookup), y
			ldx TileToScreenOffsets, y
		ScreenMod:
			sta $BEEF, x
			tax 
			lda ATTR_DATA, x
			ldx TileToScreenOffsets, y
		ColorMod:
			sta $BEEF, x
			iny
			cpy #TILE_DATA_LENGTH
			bne !-

			//Tile is now drawn


			//Now increment screen and color locations
			clc
			lda ScreenMod + 1 //Lo byte
			adc #TILE_WIDTH
			sta ScreenMod + 1 //Lo byte
			bcc !+
			inc ScreenMod + 2
		!:
			clc
			lda ColorMod + 1 //Lo byte
			adc #TILE_WIDTH
			sta ColorMod + 1 //Lo byte
			bcc !+
			inc ColorMod + 2
		!:
			//Check if we are on new row
			ldy MapLoaderColumn
			iny
			cpy #MAP_TILE_WIDTH
			beq !NextRow+
			sty MapLoaderColumn

			jmp !ColumnLoop-


		!NextRow:
			ldy MapLoaderRow
			iny
			cpy #MAP_TILE_HEIGHT
			beq !RowsComplete+
			sty MapLoaderRow


			//Increase the map loader lookup to next row
			clc
			lda MapLoaderMapLookup + 0
			adc #MAP_FULL_WIDTH
			sta MapLoaderMapLookup + 0
			lda MapLoaderMapLookup + 1
			adc #0
			sta MapLoaderMapLookup + 1

			//Move screen pointer to next tile row
			.var screenAdvance = (40 - MAP_TILE_WIDTH * TILE_WIDTH) + (TILE_HEIGHT - 1) * 40
			lda ScreenMod + 1 //Lo byte
			adc #screenAdvance
			sta ScreenMod + 1 //Lo byte
			bcc !+
			inc ScreenMod + 2	
		!:
			clc
			lda ColorMod + 1 //Lo byte
			adc #screenAdvance
			sta ColorMod + 1 //Lo byte
			bcc !+
			inc ColorMod + 2	
		!:
			jmp !RowLoop-

		!RowsComplete:
			rts
	}	

	//Multiplys 8bit 8 8bit (MultiplyNum1 * MultiplyNum2)
	//Stores 16 bit result in A(low byte) + Y(highByte)
	Multiply: {
		 lda #$00
		 tay
		 sty MultiplyNum1Hi  // remove this line for 16*8=16bit multiply
		 beq enterLoop

		doAdd:
		 clc
		 adc MultiplyNum1
		 tax

		 tya
		 adc MultiplyNum1Hi
		 tay
		 txa

		loop:
		 asl MultiplyNum1
		 rol MultiplyNum1Hi
		enterLoop:  // accumulating multiply entry point (enter with .A=lo, .Y=hi)
		 lsr MultiplyNum2
		 bcs doAdd
		 bne loop
		 rts
	}
}