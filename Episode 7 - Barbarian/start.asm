#define VERSION1



// Setup
#if VERSION2
	.file [name="Barbarian_2.prg", segments="Base,Patch,Patch2", allowOverlap]
	.segmentdef Base [prgFiles="barb_pt2.prg"]
#else
	.file [name="Barbarian_1.prg", segments="Base,Patch,Patch2", allowOverlap]
	.segmentdef Base [prgFiles="barb_pt1.prg"]
#endif
	.segmentdef Patch []
	.segmentdef Patch2 []




// Patch Code 
.segment Patch
* = $a800
#if VERSION2
	.var ScreenRamData2a = LoadBinary("colram_pt2.bin")
	.fill $800, ScreenRamData2a.get($800 + i)
#else
	.var ScreenRamData1a = LoadBinary("colram_pt1.bin")
	.fill $800, ScreenRamData1a.get($800 + i)
	// .import binary "colram_pt1.bin"
#endif



BasicUpstart2(Entry)
//Have to copy color ram into correct location
* = $0520
Entry: {
		sei
		lda #$a8 
		sta B1 + 2
		lda #$d8 
		sta B2 + 2

	!Loop:
		ldx #$00
	!:
		ldy #$30
		sty $01
	B1:
		lda $a800, x
		ldy #$37
		sty $01
	B2:
		sta $d800, x
		inx
		bne !-

		inc B1 + 2
		inc B2 + 2

		lda B2 + 2
		cmp #$dc
		bne !Loop-
		jmp $800e  //Normal entry point
}




.segment Patch2

//VERSION 1
.var BitmapData = LoadBinary("assets/sakrac.map")
.var ColorRamData = LoadBinary("assets/sakrac.col")
.var ScreenRamData = LoadBinary("assets/sakrac.scr")


//VERSION 2
#if VERSION2
	* = $c8df
	.byte $05

	.var BitmapData1 = LoadBinary("assets/stoker.map")
	.var ColorRamData1 = LoadBinary("assets/stoker.col")
	.var ScreenRamData1 = LoadBinary("assets/stoker.scr")


	.var BitmapData2 = LoadBinary("assets/stepz.map")
	.var ColorRamData2 = LoadBinary("assets/stepz.col")
	.var ScreenRamData2 = LoadBinary("assets/stepz.scr")

#else
	* = $c775
	.byte $07

	.var BitmapData1 = LoadBinary("assets/sakrac.map")
	.var ColorRamData1 = LoadBinary("assets/sakrac.col")
	.var ScreenRamData1 = LoadBinary("assets/sakrac.scr")


	.var BitmapData2 = LoadBinary("assets/sakrac.map")
	.var ColorRamData2 = LoadBinary("assets/sakrac.col")
	.var ScreenRamData2 = LoadBinary("assets/sakrac.scr")
#endif


//MAP 1
.for(var j=0; j<15; j++) {
	* = [$6000 + 32 + j * 320 + 7 * 320]
		.fill 256, BitmapData1.get(i + 256 * j)
}


.for(var j=0; j<7; j++) {
	* = [$4400 + 4 + j * 40 + 7 * 40]
		.fill 32, ScreenRamData1.get(i + 32 * j)
}


.for(var j=0; j<7; j++) {
	* = [$a800 + 4 + j * 40 + 7 * 40]
		.fill 32, ColorRamData1.get(i + 32 * j)
}

//MAP 2
// #if VERSION2
	.for(var j=0; j<15; j++) {
		* = [$d000 + j * 256]
			.fill 256, BitmapData2.get(i + 256 * j)
	}

	.for(var j=0; j<7; j++) {
		* = [$e000 + 4 + j * 40 + 7 * 40]
			.fill 32, ScreenRamData2.get(i + 32 * j)
	}

	.for(var j=0; j<7; j++) {
		* = [$e400 + 4 + j * 40 + 7 * 40]
			.fill 32, ColorRamData2.get(i + 32 * j)
	}
// #endif