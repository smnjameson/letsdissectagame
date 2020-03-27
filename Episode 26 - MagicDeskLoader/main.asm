.segment Code [outBin="main.crt", allowOverlap]

//Initialise cart
#define MAGICDESK	//Valid values D64, MAGICDESK, GMOD2
.var CART_ZP_START = $e8 //10 bytes min
.var CART_COPY_BASE = $0334	//192bytes required for cart, For D64 must be loadraw from loadersymbols-c64.inc
.var CART_MAX_FILES = 256 //256 is max
.var KRILL_INSTALL_METHOD = $10dd //D64 only, Found in loadersymbols-c64.inc
#import "./loader/cartLoader.asm"

// jsr $a871

	////////////////////////////////////
	//Add cart filesystem here
	////////////////////////////////////
	
	LOADER_AddFile("BOOT", BOOT, __BOOT, $c000) //First file will auto load
	LOADER_AddFile("ASSETS", ASSETS, __ASSETS, $8400)
	LOADER_AddFile("MUSIC", MUSIC, __MUSIC, $1000)
	LOADER_AddFile("BOOTSTRAP", BOOTSTRAP, __BOOTSTRAP, $0100)
	LOADER_AddFile("GAME001", GAME001, __GAME001, $0801)
	LOADER_AddFile("GAME002", GAME002, __GAME002, $0801)
	LOADER_AddFile("GAME003", GAME003, __GAME003, $0801)

	LOADER_AddFile("GAME004", GAME004, __GAME004, $0801)
	LOADER_AddFile("GAME005", GAME005, __GAME005, $0801)
	LOADER_AddFile("GAME006", GAME006, __GAME006, $0801)
	LOADER_AddFile("GAME007", GAME007, __GAME007, $0801)
	LOADER_AddFile("GAME008", GAME008, __GAME008, $0801)
	LOADER_AddFile("GAME009", GAME009, __GAME009, $0801)
	LOADER_AddFile("GAME010", GAME010, __GAME010, $0801)
	LOADER_AddFile("GAME011", GAME011, __GAME011, $0801)
	
 

//FILES
BOOT:	
	.pseudopc $c000 {
		#import "menu.asm"

		GameList:
			.encoding "screencode_upper"
			.text "A.W. MONTY      "
			.text "BUBBLE BOBBLE   "
			.text "GALENCIA        "
			.text "MILLIE AND MOLLY"
			.text "MONTY ON THE RUN"
			.text "OLD TOWER       "
			.text "SANTRON         "
			.text "VEGETABLES DLX. "

	}
__BOOT:

MUSIC: {
	.pseudopc $1000 {
		.var music001 = LoadSid("assets/Final_Fantasy.sid") //10ce init //10df play
		// .var music001 = LoadSid("assets/sanction.sid")
		.fill music001.size, music001.getData(i)
	}
}
__MUSIC:
ASSETS: {
	.pseudopc $8400 {
		.import binary "assets/screen.bin"
		.fill 24,0
		.import binary "assets/chars.bin"
		.import binary "assets/colors.bin"
	}
}
__ASSETS:


BOOTSTRAP: {
	.pseudopc $0100 {
	TempBasic:
		.byte $00
	LoadGame: {
					clc
					adc #$04
					pha

					//Disable screen
					lda #$7f
					sta $d011
					//Stop sounds
					lda #$08
					sta $d404
					sta $d40b
					sta $d412
					lda #$00
					sta $d418

					//LOAD BANK
					pla
					asl
					asl
					asl
					tax
					sei
					lda #$00	
					ldy #>FAT_TABLE
					jsr COPY_ROUTINES.StartCartLoad

			

			  		sei
			  		lda #$00	//Disable RASTER IRQs
					sta $d019
					sta $d01a

			  		lda #$37
			  		sta $01

			  		ldx #$ff
			  		txs 
			  		lda #$2f
			  		sta $00
			 		
			 		lda #$7f
			 		sta $dc0d
			 		sta $dd0d

			 		lda #$00	//Disable RASTER IRQs
					sta $d01a
					
					asl $d019

					lda #$ff  //Turn off cart
					sta $de00				 		

					ldx #$ff
					sei
					txs
					cld 
					jsr $fd02
					
					ldx $0801
					stx TempBasic
					stx $d016
					jsr $FDA3
					jsr $FD50
					jsr $FD15
					jsr $FF5B
					cli

					jsr $E453
					jsr $E3BF
					ldx #$fb
					txs 

					lda #$00
					sta $d020
					sta $d021
					lda #$1b
					sta $d011

					ldx TempBasic
					stx $0801


			        lda #$00         // basic start
			        jsr $A871       // clr
			        jsr $A533       // re-link
			        jsr $A68E       // set current character pointer to start of basic - 1
			        jmp $A7AE       // run

		}
	}
}
__BOOTSTRAP:


GAME001:
	.pseudopc $0801 {
		.import c64 "games/luma.prg"
	}
__GAME001:
GAME002:
	.pseudopc $0801 {
		.import c64 "games/luna.prg"
	}
__GAME002:

GAME003:
	.pseudopc $0801 {
		.import c64 "games/doccosmos.prg"
	}
__GAME003:



//BONUS TITLES
GAME004:
	.pseudopc $0801 {
		.import c64 "games/1.prg"
	}
__GAME004:
GAME005:
	.pseudopc $0801 {
		.import c64 "games/2.prg"
	}
__GAME005:
GAME006:
	.pseudopc $0801 {
		.import c64 "games/3.prg"
	}
__GAME006:
GAME007:
	.pseudopc $0801 {
		.import c64 "games/4.prg"
	}
__GAME007:
GAME008:
	.pseudopc $0801 {
		.import c64 "games/5.prg"
	}
__GAME008:
GAME009:
	.pseudopc $0801 {
		.import c64 "games/6.prg"
	}
__GAME009:
GAME010:
	.pseudopc $0801 {
		.import c64 "games/7.prg"
	}
__GAME010:
GAME011:
	.pseudopc $0801 {
		.import c64 "games/8.prg"
	}
__GAME011:
