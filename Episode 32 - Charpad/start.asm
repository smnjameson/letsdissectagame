* = $02 virtual
	MultiplyNum1: .byte $00
	MultiplyNum2: .byte $00
	MultiplyNum1Hi: .byte $00
	MapLoaderTileLookup: .word $0000
	MapLoaderMapLookup: .word $0000
	MapLoaderColumn: .byte $00
	MapLoaderRow: .byte $00

.label SCREEN_RAM = $0400

BasicUpstart2(Entry)

#import "maploader.asm"

Entry: 
		sei
		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01
		cli

		lda #$00
		sta $d020

		lda #$00
		sta $d021
		lda #$0c
		sta $d022
		lda #$0b
		sta $d023

		lda #%00011000
		sta $d018

		lda $d016
		ora #%00010000
		sta $d016

		jsr ClearScreen

		ldx #$0a
		ldy #$3c
		jsr MAPLOADER.DrawMap

	!Loop:
		jmp !Loop-


ClearScreen: {
		lda #$00
		ldx #$00
	!:
		sta SCREEN_RAM, x
		sta SCREEN_RAM + $100, x
		sta SCREEN_RAM + $200, x
		sta SCREEN_RAM + $300, x
		dex
		bne !-
		rts
}

* = $2000
	.import binary "maps/chars.bin" 
* = $2800
	.import binary "maps/cols.bin" //ATTR_DATA
* = $2900
	.import binary "maps/tiles.bin" //TILE_DATA
* = $3400
	.import binary "maps/map.bin" //MAP_DATA

