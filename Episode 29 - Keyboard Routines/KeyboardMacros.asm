.define KeyList {
	.var KeyList = List()
	//Values in this list are:
	// 0 - KeyId : can be any string but recommended something representative
	// 1 - Column number : The column number as specified in $dc00 (0-7)
	// 2 - Row Value : The inverted Row value as specified in $dc01 ($01,$02,$04,$08...)
	// Refer to https://sta.c64.org/cbm64kbdlay.html for more info
	.eval KeyList.add( List().add("X", 2, $80))
	.eval KeyList.add( List().add("W", 1, $02))
	.eval KeyList.add( List().add("A", 1, $04))
	.eval KeyList.add( List().add("shift", 1, $80))
	.eval KeyList.add( List().add("delete", 0, $01))
}



.function GetKey(keyId) {
	.for(var i=0; i<KeyList.size(); i++) {
		.if(KeyList.get(i).get(0) == keyId) {
			.return KeyList.get(i)
		}
	}
	.return List()
}

.macro isKeyDown(keyId) {
		lda KeyDownTable + GetKey(keyId).get(1)
		and #[GetKey(keyId).get(2)]
		bne !notPressed+
		sec
		jmp !Exit+
	!notPressed:
		clc
	!Exit:
}

.macro isKeyPressed(keyId) {
		lda KeyPressedTable + GetKey(keyId).get(1)
		and #[GetKey(keyId).get(2)]
		beq !notPressed+
		lda KeyDownTable + GetKey(keyId).get(1)
		and #[GetKey(keyId).get(2)]
		bne !notPressed+
		sec
		jmp !Exit+
	!notPressed:
		clc
	!Exit:
}

.macro isKeyReleased(keyId) {
		lda KeyPressedTable + GetKey(keyId).get(1)
		and #[GetKey(keyId).get(2)]
		beq !notPressed+
		lda KeyDownTable + GetKey(keyId).get(1)
		and #[GetKey(keyId).get(2)]
		beq !notPressed+
		sec
		jmp !Exit+
	!notPressed:
		clc
	!Exit:
}



//Contains the previous $DC01 values for each column, defaults to all $FF
.align $10
KeyDownPrevTable:
		.byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
//Contains the current $DC01 values for each column
KeyDownTable:
		.byte 0,0,0,0,0,0,0,0 
//Contains the keys that have changed state this frame
KeyPressedTable:
		.byte 0,0,0,0,0,0,0,0


//Keytable taken from https://sta.c64.org/cbm64kbdlay.html
KeyLookup:
		.encoding "screencode_upper"
		.text "@3579" //0
		.byte $2b,$1c,$31
		.text "@WRYIP*@"
		.text "@ADGJL;@" //2
		.text "@4860-@2"
		.text "@ZCBM.@ " //4
		.text "@SFHK:=@"
		.text "@ETUO@@Q" //6
		.text "@@XVN,/@"

KeyColumn:
		.byte 0
KeyTemp:
		.byte 0


KeyScan: {
		//Set DDR to allow selecting a keyboard column
		lda #%11111111
		sta $dc02
			//Select a column
			lda #%11111110
			sta KeyColumn
			ldy #$00
		!:
			lda KeyColumn	//Select the column
			sta $dc00

			lda $dc01
			sta KeyDownTable, y
			pha
			eor KeyDownPrevTable, y
			sta KeyPressedTable, y
			pla
			sta KeyDownPrevTable, y

			sec 	//Set the mask for the next column
			rol KeyColumn
			iny
			cpy #$08
			bne !-
		//Restore joystick Control
		lda #%00000000
		sta $dc02
		rts
}



GetKeyPressed: {
		ldx #$00
	!loop:
		lda KeyPressedTable, X
		beq !+
		and KeyDownTable, x
		bne !+
		jmp !found+
	!:
		inx
		cpx #$08
		bne !loop-
		lda #$00
		rts
	!found:
		lda KeyPressedTable, x  //$01,$02,$04,$08

		ldy #$00
	!ShiftLoop:
		lsr 
		bcs !+
		iny
		jmp !ShiftLoop-
	!:
		tya
		asl
		asl
		asl
		sta KeyTemp
		txa
		clc
		adc KeyTemp
		tax 
		lda KeyLookup, x
		rts
}



