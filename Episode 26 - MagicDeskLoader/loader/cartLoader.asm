.var FAT_INDEX = 0
.var FAT_HashTable = Hashtable()

//////////////////////////////
// Disk macros
//////////////////////////////
#if D64


	//LOADER_AddFile is invalid for disks
	.macro LOADER_AddFile(filename, srcAddress, endAddress, tgtAddress) {
		.error "LOADER_AddFile should not be called from a D64 preprocessor block"
	}	

	//Loads a file from disk
	.macro LOADER_LoadFile(filename) {
			sei

			ldx #<FNAME 
			ldy #>FNAME
			jsr CART_COPY_BASE
			bcc !+
			//Error
				ldx #$00
				lda #$02
				sta $d020
				stx $d020
				jmp * -6
		FNAME:
			.text filename
			.byte $00
		!:
	}

	//Disk boot loader code
	.macro LOADER_CreateDiskBoot(name, addr) {
		.segment DISK_BOOT [allowOverlap]
			BasicUpstart2(DEntry)
				DEntry: {
					sei
					lda #$7f
					sta $dc0d
					sta $dd0d

					lda #$00
					sta $d020
					sta $d021
					ldx #$00
				!:
					sta $d800,  x
					sta $d800 + 250,  x
					sta $d800 + 500,  x
					sta $d800 + 750,  x
					inx
					cpx #250
					bne !-

				!Loop:
				src:
					lda LoaderStart
				tgt:
					sta CART_COPY_BASE

					inc src + 1
					bne !+
					inc src + 2
				!:
					inc tgt + 1
					bne !+
					inc tgt + 2
				!:
					lda src + 2
					cmp #>LoaderEnd
					bne !Loop-
					lda src + 1
					cmp #<LoaderEnd
					bne !Loop-

					jsr KRILL_INSTALL_METHOD
					bcs error

					lda #$35
					sta $01
					cli

					LOADER_LoadFile(name)
					jmp addr
	 
				error:
				//Error
					ldx #$00
					lda #$02
					sta $d020
					stx $d020
					jmp * -6

					* = $0900 "Krill Installer"
						.import c64 "./loader/install-c64.prg"
					* = * "Krill Loader Start"
					LoaderStart:
						.import c64 "./loader/loader-c64.prg"
					LoaderEnd:
			}
		///////////////////////////////////	
	}


//////////////////////////////
// Cart macros
//////////////////////////////
#else 

	//Internal macro for laoding banks on diff carts
	.macro LoadBank() {
		#if GMOD2
			sta $de00
		#elif MAGICDESK
			sta $de00
		#endif
	}

	//Adds a file to the carts FAT table
	.var loc = 0
	.macro LOADER_AddFile(filename, srcAddress, endAddress, tgtAddress) {
		.if(FAT_HashTable.containsKey(filename)) {
			.error "Filename already present in File Allocation table"
		} else {
			.eval FAT_HashTable.put(	filename, FAT_INDEX )

			.var len = endAddress - srcAddress
			.eval loc = *
			* = ((FAT_TABLE - $8000) + 8 * FAT_INDEX) "FAT Index "
				.byte <(srcAddress & $1fff), >(srcAddress & $1fff) //Bank offset 
				.byte (srcAddress >> 13)	//Source Bank
				.byte <len, >len 						//Length
				.byte <tgtAddress, >tgtAddress  		//Target
				.byte $00
			* = loc "FAT Target"

			.print "" + filename +"  ("+toHexString(FAT_TABLE + 8 * FAT_INDEX - $8000)+") =  "+toHexString(tgtAddress)+" - "+toHexString(tgtAddress+len)
			.eval FAT_INDEX += 1;
		}
	}


	//Load a file from the cart
	.macro LOADER_LoadFile(filename) {
		.if(!FAT_HashTable.containsKey(filename)) {
			.error "Filename " + filename + " not found in FAT"
		} else {
			.var fatIndex = FAT_HashTable.get(filename)
			.var loc = ((FAT_TABLE) + 8 * fatIndex)

				sei
				lda #$00	
			ldx #<loc
			ldy #>loc
			jsr COPY_ROUTINES.StartCartLoad

			// :LoadBank()
			// lda #<loc
			// sta CART_ZP_START
			// lda #>loc
			// sta CART_ZP_START + 1
			// jsr CART_COPY_BASE
		}
	}

	
	// .var origLoc = *
	// * = $0000 "Segment size" virtual 
	// .segmentout [segments="TEST2"]
	// .var size = *
	// .print size
	// * = origLoc
	
	//Disk boot invalid on cart
	.macro LOADER_CreateDiskBoot(name, addr) {
		.error "LOADER_CreateDiskBoot should not be called from a non D64 preprocessor block"
	}
#endif

























#if D64
#else 
	* = $0000 "CARTRIDGE Code"

	.var pspc = $8000
	.pseudopc pspc {
		CART: {
			.label KILLKEY = 1                         //Left arrow
	        .word CrtStart
	        .word CrtStart
		    .byte $c3, $c2, $cd, $38, $30  //cbm80


			CrtStart:       
			    sei
				stx $d016
				jsr $fda3     //;prepare irq
				jsr $fd50    //;init memory
				jsr $fd15     //;init i/o
				jsr $ff5b    //;init video
				
			    .if(KILLKEY > 0) {
			        lda #$ff                        //Check if left-arrow key is pressed
			        sta $dc02
			        lda #$00
			        sta $dc03
			        lda #$7f
			        sta $dc00
			        lda $dc01
			        cmp #$fd
			        bne NoKill
			        cli
			        jmp ($a000)                     //Start Basic
			    }

			NoKill:    
				lda #$7f	//Disable CIA IRQ's
				sta $dc0d
				sta $dd0d
				lda #$01	//Enable RASTER IRQs
				sta $d019
				sta $d01a	

				//Create Initial blank IRQ and disable NMI
				lda #<COPY_ROUTINES.BlankIRQ
				sta $fffa
				sta $fffe
				lda #>COPY_ROUTINES.BlankIRQ
				sta $fffb
				sta $ffff

				jmp pspc + setupCopyBanks
		}		




		//================================
		// FAT Table for looking up files
		//================================
		// Maximum 256 entries
		// Example entry
		// .byte $ff,$1f,$3f			//Source location bank ($00-$3f) + Offset ($0000 - $1fff) 
		// 								//Little endian so ends at $ff,$1f,$3f
		// .byte $ff,$ff				//Length max 64k, little endian
		// .byte $ff,$ff 				//Target location
		// .byte $00					//Unused
		.align $100
		FAT_TABLE:	
			.fill CART_MAX_FILES * 8, $00


	}
		

	COPY_ROUTINES: {
		.pseudopc CART_COPY_BASE {
			start:
				.label FAT_DATA = CART_ZP_START + 2
				php
				sei
				lda #$37
				sta $01
				//Copy FAT Table data
				ldy #$07
			!:
				lda (CART_ZP_START), y
				sta FAT_DATA, y
				dey
				bpl !-

				lda FAT_DATA + 2 //Bank
				:LoadBank()
				lda FAT_DATA + 1
				ora #$80
				sta FAT_DATA + 1



				ldy #$00
				
				jmp !Skip+
			!Loop:
				ldx #$37	//Bank in cart
				stx $01

				//Source
				lda (FAT_DATA), y
				ldx #$30	//Bank out everything for copy
				stx $01
				//Dest
				sta (FAT_DATA + 5), y

				//Inc Dest
				inc FAT_DATA + 5
				bne !+
				inc FAT_DATA + 6
			!:

				//Inc Source
				inc FAT_DATA
				bne !Skip+
				ldx FAT_DATA + 1
				inx
				cpx #$a0
				bne !+
				ldx #$80
				inc FAT_DATA + 2 //Bank
				lda #$37
				sta $01
				lda FAT_DATA + 2
				:LoadBank()

			!:
				stx FAT_DATA + 1
			!Skip:

				//Decr length
				sec
				lda FAT_DATA + 3
				sbc #$01
				sta FAT_DATA + 3
				lda FAT_DATA + 4
				sbc #$00
				sta FAT_DATA + 4
				bcs !Loop-
			

				lda #$35			//Bank out cartr, kernal and basic $a000-$bfff & $e000-$ffff
				sta $01 
				
				bit $dc0d			//Ack CIA interrupts
				bit $dd0d
				plp					//Reenable Interrupts and return
				rts


			BlankIRQ:
				asl $d019
				rti



			CartEntry:
				sei
				lda #$00
				:LoadBank()

				lda #$37
				sta $01
				lda #<(FAT_TABLE)
				sta CART_ZP_START
				lda #>(FAT_TABLE)
				sta CART_ZP_START + 1

				jsr CART_COPY_BASE
		

				lda #$00
				:LoadBank()
				lda #$37
				sta $01

				lda FAT_TABLE + 5
				sta CART_ZP_START
				lda FAT_TABLE + 6
				sta CART_ZP_START + 1

				lda #$35
				sta $01

				jmp (CART_ZP_START) 


			CartLoad: {
				php
				sei
				sta CART_ZP_START 
				txa
				clc
				adc #$80
				tax
				stx CART_ZP_START + 1
				lda #$00
				:LoadBank()
				jsr CART_COPY_BASE
				plp
				rts
			}

			StartCartLoad: {
			
				:LoadBank()
				stx CART_ZP_START
				sty CART_ZP_START + 1
				jmp CART_COPY_BASE
			}

			end: //End marker for cart copy routines

		}



	}



	//================================
	// Setup the copy routines
	//================================
	setupCopyBanks:
		//BLANK OUT SCREEN
		lda #$00
		sta $d020
		sta $d021
		lda #$00
		ldx #$00
	!:
		sta $d800,x
		sta $d900,x
		sta $da00,x
		sta $db00,x
		dex
		bne !-

		//COPY  the copy code
		ldx #$00
	!:
		lda $8000 + COPY_ROUTINES, x
		sta CART_COPY_BASE, x
		inx
		cpx #[COPY_ROUTINES.end - COPY_ROUTINES.start]
		bne !-

		jmp [CART_COPY_BASE + [COPY_ROUTINES.CartEntry - COPY_ROUTINES.start]]

		
#endif
