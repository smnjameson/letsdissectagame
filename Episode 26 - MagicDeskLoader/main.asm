.segment Code [outBin="main.crt", allowOverlap]

//Initialise cart
#define MAGICDESK	//Valid values D64, MAGICDESK, GMOD2
.var CART_ZP_START = $e8 //10 bytes min
.var CART_COPY_BASE = $cf00	//192bytes required for cart, For D64 must be loadraw from loadersymbols-c64.inc
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
	LOADER_AddFile("GAME001", GAME001, __GAME001, $0801)
	LOADER_AddFile("GAME002", GAME002, __GAME002, $0801)
	LOADER_AddFile("GAME003", GAME003, __GAME003, $0801)
	
 

//FILES
BOOT:	
	.pseudopc $c000 {
		#import "menu.asm"
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


GAME001:
	.pseudopc $0801 {
		.import c64 "games/luna.prg"
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


