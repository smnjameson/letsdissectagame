//Standard imports
#import "./syslabels.asm"

//Potential screen buffer locations
.label SCREEN_BUFFER_0 = $0400
.label SCREEN_BUFFER_1 = $4400

//Basic upstart patching
.file [name="tapper.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base []
.segmentdef Patch []
.segment Patch
    BasicUpstart2($c053)

* = $8efb
    .import binary "./mdew.bin"

* = $838a
    cpx #$80
    bne L_8372
    jmp $0900

* = $3aaa
        clc 
        adc #$01
        nop
        jsr ColorFetch

* = $0900
        lda #$00
        ldx #$07
    !:
        sta $d860, x
        sta $d860 + $28, x
        sta $d860 + $50, x
        sta $d860 + $78, x
        dex
        bpl !-
        jmp $9000
ColorTemp:
        .byte $00
ColorIndex:
        .byte $00
ColorRamp:
        .byte $01,$0d,$05,$08,$09,$08,$05,$0d
        .byte $01,$0d,$05,$08,$09,$08,$05,$0d
ColorFetch:
        stx ColorTemp

        ldx ColorIndex
        inx
        cpx #$10
        bne !+
        ldx #$00
    !:
        stx ColorIndex
        lda ColorRamp, x

        ldx ColorTemp
        rts



.segment Base
//Start of disassembled code
* = $0800 "Base Address"


    L_0800:
        .byte $00,$0c

    L_0802:
        php 

        .byte $e2,$07,$9e,$34,$39,$32,$33,$35,$00

    L_080c:
        .fill $34, $0

    L_0840:
        .fill $40, $ff

    L_0880:
        .fill $40, $0

    L_08c0:
        .fill $40, $ff

    L_0900:
        .fill $40, $0

    L_0940:
        .fill $40, $ff

    L_0980:
        .fill $40, $0

    L_09c0:
        .fill $40, $ff

    L_0a00:
        .fill $40, $0

    L_0a40:
        .fill $40, $ff

    L_0a80:
        .fill $40, $0

    L_0ac0:
        .fill $40, $ff

    L_0b00:
        .fill $40, $0
        .fill $40, $ff

    L_0b80:
        .fill $40, $0
        .fill $40, $ff

    L_0c00:
        .fill $40, $0

    L_0c40:
        .fill $40, $ff

    L_0c80:
        .fill $40, $0

    L_0cc0:
        .fill $40, $ff

    L_0d00:
        .fill $40, $0

    L_0d40:
        .fill $40, $ff

    L_0d80:
        .fill $40, $0

    L_0dc0:
        .fill $40, $ff

    L_0e00:
        .fill $40, $0

    L_0e40:
        .fill $40, $ff

    L_0e80:
        .fill $40, $0

    L_0ec0:
        .fill $40, $ff

    L_0f00:
        .fill $40, $0

    L_0f40:
        .fill $40, $ff

    L_0f80:
        .fill $40, $0

    L_0fc0:
        .fill $40, $ff

    L_1000:
        .fill $40, $0

    L_1040:
        .fill $40, $ff

    L_1080:
        .fill $40, $0

    L_10c0:
        .fill $40, $ff

    L_1100:
        .fill $40, $0

    L_1140:
        .fill $40, $ff

    L_1180:
        .fill $40, $0

    L_11c0:
        .fill $40, $ff

    L_1200:
        .fill $40, $0
        .fill $40, $ff

    L_1280:
        .fill $40, $0
        .fill $40, $ff

    L_1300:
        .fill $40, $0

    L_1340:
        .fill $40, $ff

    L_1380:
        .fill $40, $0

    L_13c0:
        .fill $40, $ff

    L_1400:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_14c0:
        .fill $40, $ff

    L_1500:
        .fill $40, $0

    L_1540:
        .fill $40, $ff
        .fill $40, $0

    L_15c0:
        .fill $40, $ff

    L_1600:
        .fill $40, $0

    L_1640:
        .fill $40, $ff

    L_1680:
        .fill $40, $0

    L_16c0:
        .fill $40, $ff

    L_1700:
        .fill $40, $0

    L_1740:
        .fill $40, $ff

    L_1780:
        .fill $40, $0

    L_17c0:
        .fill $40, $ff

    L_1800:
        .fill $40, $0

    L_1840:
        .fill $40, $ff

    L_1880:
        .fill $40, $0

    L_18c0:
        .fill $40, $ff

    L_1900:
        .fill $40, $0
        .fill $40, $ff

    L_1980:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_1a80:
        .fill $40, $0
        .fill $40, $ff

    L_1b00:
        .fill $40, $0

    L_1b40:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_1c00:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_1d00:
        .fill $40, $0

    L_1d40:
        .fill $40, $ff
        .fill $40, $0

    L_1dc0:
        .fill $40, $ff

    L_1e00:
        .fill $40, $0

    L_1e40:
        .fill $40, $ff

    L_1e80:
        .fill $40, $0

    L_1ec0:
        .fill $40, $ff

    L_1f00:
        .fill $40, $0
        .fill $40, $ff

    L_1f80:
        .fill $40, $0
        .fill $40, $ff

    L_2000:
        ldy #$fd
        sty $5a
        ldy #$00
        sty $68
        sty $66
        lda #$98
        sta $60
        lda #$20
        sta $61
        lda #$50
        sta $69
        lda #$68
        sta $67
    L_201a:
        lda ($60),y
        sta ($68),y
    L_201e:
        jsr L_2037
        sta ($66),y
        txa 
        tay 
        iny 
        bne L_201a
        inc $61
        inc $67
        inc $69
    L_202e:
        lda #$68
        cmp $69
        bne L_201a
        jmp L_2083
    L_2037:
        clc 
        tax 
        and #$c0
        ror 
        ror 
        ror 
        ror 
        ror 
        ror 
        sta $62
        txa 
        and #$30
        ror 
        ror 
        adc $62
        sta $62
        txa 
        and #$0c
        rol 
        rol 
        adc $62
        sta $62
        txa 
        and #$03
        rol 
    L_2059:
        rol 
        rol 
        rol 
        rol 
    L_205d:
        rol 
        adc $62
        pha 
        tya 
        tax 
        and #$3f
        cmp #$3f
        beq L_207d
        inc $5a
        bne L_2074
        lda #$fd
        sta $5a
        jmp L_207f
    L_2074:
        clc 
    L_2075:
        lda $5a
        adc #$02
        bne L_207d
        iny 
        iny 
    L_207d:
        pla 
        rts 


    L_207f:
        dey 
    L_2080:
        dey 
        pla 
        rts 


    L_2083:
        lda #$00
        sta vSprPriority
        lda #$ff
        sta vSprMCM
        lda #$0a
        sta vSprMCMCol0
        lda #$00
        sta vSprMCMCol1
        rts 



        .byte $00,$00,$00,$00,$f0,$f0,$0f,$f3,$f0,$37,$ae,$bc,$3e,$ae,$ac,$de
        .byte $be,$ec,$d7,$ae,$b0,$d5,$f7,$f0,$f5,$55,$5c,$37,$ff,$dc,$3d,$ff
        .byte $5c,$0d,$55,$70,$03,$ff,$c0,$0e,$ff,$c0,$3a,$af,$b0,$ea,$aa

    L_20c7:
        .byte $b0,$ea
        .byte $ea,$ac,$ef,$ea,$fc,$f5,$eb,$ab,$35,$7a,$ab,$3d,$5e,$ab,$40

    L_20d8:
        .byte $00,$f0,$f0,$0f,$f3,$f0,$3f
        .byte $ae,$bc,$fe,$ae,$ac,$de,$be,$ec,$d7,$ae,$bc,$d5

    L_20eb:
        .byte $f7,$f0,$df
        .byte $55,$70

    L_20f0:
        .byte $f7,$ff,$dc,$37,$d7,$dc
        .byte $3d,$f5,$dc,$0d,$7f,$5c,$03,$55,$70

    L_20ff:
        rol $c0ff,x
    L_2102:
        nop 
        tax 

        .byte $b0,$eb,$ab,$b0,$eb,$bd,$ec,$ff,$d7,$eb,$d5,$75,$7b,$d5,$75

    L_2113:
        .byte $7b
        .byte $35,$7f,$fb,$41,$00,$00,$00,$03,$fc,$00,$0f,$ef,$00,$39,$75,$c0
        .byte $39,$f7,$c0,$3b,$eb,$00,$0e,$af,$00,$03,$b0,$00,$03,$b0,$00

    L_2133:
        asl.a $00ac
        asl.a $00fb
        asl.a $00ab

        .byte $03,$ac,$00,$03,$f0,$00

    L_2142:
        ora.a $005c
        and $57,x

        .byte $00,$f5,$55,$c0,$d5,$55,$c0,$dd,$55,$c0,$dd,$5d,$c0,$dd,$5d,$c0
        .byte $42,$03,$fc,$00,$0f,$ef,$00,$39,$75,$c0,$39,$f7,$c0,$3b,$ef,$00
        .byte $3a,$ab,$00,$0e,$ac,$00,$0f,$ac,$00,$03,$ac,$00,$03,$ab,$00,$0e
        .byte $ba,$c0,$ce,$ba,$c0,$fe,$ba,$cc,$f3,$ab,$0f,$dc,$fc,$3b,$dc,$dc
        .byte $3b,$d7,$57,$dc,$37,$57,$5c,$35,$dd,$70,$0d,$55,$c0,$0d,$57,$00
        .byte $43,$00,$00,$00,$03,$c3,$c0,$0f,$ff,$f0,$37,$ae,$bc,$3e,$ae,$ac
        .byte $de,$ef,$ac,$d7,$ae,$b0,$dd,$f7,$f0,$f7,$55,$5c,$37,$ff,$dc,$3d
        .byte $ff,$5c,$0d,$55,$70,$03,$ff,$c0,$0e

    L_21c0:
        .byte $ff,$00,$3a
        .byte $aa,$ff,$ea,$af,$d7,$eb,$b7,$d7,$eb,$f5,$d7,$ef,$75,$d7,$35,$5f
        .byte $d7,$35,$7a,$bc,$44,$00

    L_21d9:
        .byte $f0,$f0,$0f,$f3,$f0,$3f
        .byte $ae,$bc,$fe,$ae,$ac,$de,$be,$ec,$d7,$ae,$bc,$d5,$f7,$c0,$d5,$55
        .byte $5c,$f7,$d5,$fc,$35,$ff,$dc,$3d,$7f,$57,$0d,$5f,$57,$3b,$77,$57
        .byte $eb,$d5,$dc,$ea,$d7,$f0,$ef,$5e,$ac,$fd,$5e,$ac,$f5,$7a,$fc,$ed
        .byte $eb,$ab,$eb,$aa,$ab,$3a,$aa,$ab,$45,$00

    L_2219:
        .byte $00,$00,$03,$fc,$00,$0f,$ef,$00
        .byte $3d,$75,$c0,$39,$f7,$c0,$3b,$eb,$00,$0e,$af,$00,$0f,$b0,$00,$03
        .byte $bc,$00,$03,$ac,$00,$0e,$ab,$00,$0e,$eb,$00,$0e,$fc,$00,$03,$ab
        .byte $00,$03,$fc,$ff,$0d,$5f,$d7,$0d,$7b,$d7,$35,$fa,$d7,$d7,$7a,$d7
        .byte $dd,$7f,$d7,$d5,$d5,$7c,$46,$03,$fc,$00,$0f,$ef,$00,$3d,$75,$c0
        .byte $39,$75,$c0,$3b,$ef,$00,$3a,$ab,$00,$0e,$ac,$00,$0f,$af,$00,$03
        .byte $ab,$f0,$03,$aa,$dc,$0e,$ab,$57,$0e,$af,$57,$0e,$ab,$57,$03,$ae
        .byte $dc,$03,$fe,$b0,$0d,$d7,$f0,$0d,$5d,$70,$0d,$5d,$70,$0f,$75,$5c
        .byte $03,$f5,$dc,$03,$55,$dc,$47,$00,$00,$10,$00,$00,$10,$00,$00,$10
        .byte $00,$00,$ea,$00,$03,$fa,$00,$0f,$7e,$00,$0d,$5e,$03,$cd,$5e,$03
        .byte $cd,$5c,$02,$8d,$5c,$02,$8d,$5c,$02,$8d,$5c,$02,$8d,$5c,$02,$aa
        .byte $9c,$02,$aa,$9c,$03,$cd,$5c,$03,$0f,$7c,$0f,$03,$78,$0c,$03,$f8
        .byte $0c,$00,$00,$0c,$00,$00,$48,$00,$00,$00,$0f,$cf,$00,$35,$75

    L_22e0:
        .byte $70,$35
        .byte $55,$70,$d5,$55,$5c,$d5,$55,$5c,$d5,$55,$5c,$35,$fd,$7c,$35,$55
        .byte $f0,$0d,$57,$c0,$0d,$57,$00,$0f,$ff,$c0,$3a,$fa,$bc,$ea,$aa

    L_2301:
        ldy L_aaea
        ldy $baea
        ldy $baea
        ldy $baea
        ldy L_ba3a,x

        .byte $f0,$3a,$ba,$b0,$3a,$ba,$b0,$49,$00,$00,$00,$00,$ff,$00,$03,$aa

    L_2320:
        cpy #$0e
        tax 

        .byte $b0,$0e,$aa,$b0,$03,$aa,$c0,$03

    L_232b:
        tax 
        cpy #$00

        .byte $eb,$00,$00,$eb,$00,$00,$eb,$00,$03,$aa,$c0,$03,$aa,$c0,$00,$eb
        .byte $0c,$00,$3c,$0f,$30,$3c,$37,$f0,$3f,$37,$dc,$d7,$dc,$df,$d7,$5c
        .byte $d5,$55,$70,$3d,$5d,$70,$03,$5d,$70,$4a,$03,$fb,$fc,$00,$ea,$fb
        .byte $03,$aa,$ab,$03,$aa,$ab,$03,$ae,$ab,$0e,$ae,$ab,$0e,$af,$ab,$0e
        .byte $af,$ab,$0e,$af,$ab,$0e,$bf,$ab,$0e,$b3,$af

    L_2379:
        .byte $3a,$f3,$ab,$3a,$b3,$af,$3a,$f3,$ab,$3a,$b3,$ab,$3a,$b3,$ab,$3a
        .byte $b3,$ab,$0f,$f3,$ff,$3f

    L_238f:
        cpy #$fc

        .byte $ff,$c0,$fc,$ff,$c0,$fc,$4b,$00,$00,$0f,$00,$00,$35,$00,$00,$df
        .byte $00,$00,$da,$00,$00,$de,$00,$00,$df,$00,$00,$3d,$00,$00,$3f,$00
        .byte $00,$0f,$00,$00,$05,$00,$00,$fd,$00,$03,$bf,$00,$0e,$be,$00,$0e
        .byte $bb,$00,$3b,$eb,$00,$3a,$ee,$00,$3a,$eb,$00,$3e,$eb,$00,$d7,$ee
        .byte $00,$d5,$eb,$00,$3f,$ef,$4c,$ff,$00,$00,$5f,$c0,$00,$7f,$c0,$00
        .byte $6b,$f0,$00,$7b,$70,$00

    L_23e7:
        sbc.a $0070,x
        adc.a $00c0,x
        sbc $c0,x

        .byte $00,$f7,$00,$00,$57,$00,$00,$7f,$00,$00,$fe,$c0,$00,$fe,$b0,$00
        .byte $be,$ac,$00,$ab,$ab,$00,$ea,$fb,$00,$aa,$eb,$00,$af,$ab,$00,$f5
        .byte $ef,$00,$b5,$7c,$00,$ad,$70,$00,$4d,$0f,$ef,$fc,$03,$ab,$ac,$0e
        .byte $aa,$ac,$0e,$aa,$ac,$0e,$ba,$ac,$3a,$ba,$b0,$3a,$ba,$b0,$3a,$ea
        .byte $c0,$3a,$ea,$c0,$3a,$eb,$c0,$3a,$ea,$c0,$3a,$fa,$b0,$3a,$ba,$b0
        .byte $0e,$ba,$b0,$0e,$ae,$ac,$0e,$ae,$ac,$03,$ff,$fc,$03,$f7,$f0,$0f
        .byte $df,$f0,$3f,$7f,$f0,$3f,$7f,$f0,$4e,$00,$00,$00,$00,$00,$3f,$00
        .byte $00,$f5,$00,$03,$af,$00

    L_2465:
        asl.a $00b7
    L_2468:
        asl.a $00de

        .byte $3a,$da,$00,$3a,$ff,$00,$3b,$3d,$00,$3a,$df,$00

    L_2477:
        asl.a $00df

        .byte $0f,$b5,$00,$0e,$bf,$00,$03,$be,$00,$03,$bb,$00,$00,$eb,$00,$00
        .byte $ee,$00,$00,$eb,$00,$00,$eb,$00,$00,$ee,$00,$00,$eb,$4f,$ff,$00
        .byte $00,$d5,$c0,$00,$7f,$b0,$00

    L_24a1:
        dec.a $00b0,x

        .byte $7f,$ac,$00,$7b,$ac,$00,$6b,$eb,$00,$fd,$eb,$00,$7d,$fb,$00,$f5
        .byte $eb,$00,$f7,$eb,$00,$5f,$ac,$00,$fe,$ac,$00,$fe,$bc,$00,$be,$f0
        .byte $00

    L_24c5:
        tax 
        bcs L_24c8
    L_24c8:
        nop 

        .byte $f0,$00,$ab,$c0,$00,$aa,$c0,$00,$fa,$c0,$00,$ab,$c0,$00,$50,$00
        .byte $00,$10,$00,$00,$10,$00,$00,$10,$00,$00,$ea,$00,$03,$fa,$00,$0f
        .byte $7e,$00,$0d,$5e,$f0,$0d,$5e,$b0,$0d,$5c,$28,$0d,$5c,$28,$0d,$5c
        .byte $0a,$0d,$5c,$0a,$0d,$5c,$02

    L_2500:
        tax 

        .byte $9c,$02,$aa,$9c,$03,$cd,$5c,$03,$0f,$7c,$0f,$03,$78,$0c,$03,$f8
        .byte $0c,$00,$00,$0c,$00,$00,$51,$00,$00,$0f,$00,$00,$35,$00

    L_251f:
        .byte $00,$df,$00,$00,$da,$00,$00
        .byte $de,$00,$00,$df,$00,$00,$3d,$00,$00,$3f,$00,$00,$0f,$00,$00,$05
        .byte $00,$03,$fd,$00,$0f,$bf,$00,$0e,$be,$00,$0e,$bb,$00,$3b,$ab,$00
        .byte $fa,$ee,$03,$ea,$eb,$ff,$aa,$eb,$d7,$ab,$ee,$37,$bc,$eb,$0c,$c0
        .byte $ef,$52,$ff,$00,$00,$5f,$c0,$00,$7f,$c0,$00,$6b,$f0,$00,$7b,$70
        .byte $00

    L_2567:
        sbc.a $0070,x
        adc.a $00c0,x
        sbc $c0,x

        .byte $00,$f7,$00,$00,$57,$00,$00,$7f,$fc,$00,$fe,$af,$00,$fe,$aa,$c0
        .byte $be,$aa,$b0,$aa,$be,$b0,$ea,$ce,$b0,$aa,$ce,$b0,$aa,$ff,$c0,$ea
        .byte $d7,$00,$aa,$d7,$00,$ab,$3c,$00,$53,$00,$0f,$fc,$00,$35,$ff,$00
        .byte $37,$ff,$00,$26,$bf,$00,$37,$b7,$00,$3f,$f5,$00,$d7,$d5,$00,$ff
        .byte $f7,$00,$0f,$d7,$00,$05,$5c,$00,$0f,$fc,$00,$3e,$ff,$00,$3f,$eb
        .byte $3c,$3e,$ea,$d7,$ef,$aa,$df,$ae,$aa,$35,$fa,$be,$d7,$aa,$fa,$d7
        .byte $ab,$ea,$3f,$ff,$be,$00,$00,$ff,$54,$00,$00,$00,$00,$00,$00,$c0
        .byte $00,$00,$c0,$00,$00,$70,$00,$00,$70,$00,$00,$c0
        .fill $14, $0
        .byte $c0,$00,$00,$c0,$00,$00,$c0,$00,$00,$b0,$00,$00,$b0,$00,$00,$ac
        .byte $00,$00,$ab,$00,$00,$ab,$00,$00,$55,$0e,$af,$f0,$3e,$aa,$c0,$3e
        .byte $ab,$00,$3e,$af,$00,$3e,$ab,$00,$ee,$ac,$3c,$eb,$ab,$fc,$eb,$aa
        .byte $bf,$eb,$ea,$af,$ea,$fe,$af,$fa,$bf,$ff,$3a,$f0,$0f,$3a,$b0,$03
        .byte $3a,$b0,$00,$3a,$b0,$00

    L_2645:
        asl.a $00ac
        asl.a $00ac
    L_264b:
        asl.a $00ac

        .byte $0f,$f0,$00,$3f,$f0,$00,$3f,$f0,$00

    L_2657:
        lsr $3e,x

    L_2659:
         .byte $af,$f0,$3a,$ab,$00,$3a,$af,$00,$3a,$af,$00,$3a,$af,$00,$3a
        .byte $ae,$c0,$3a,$ba,$c0,$ea,$ba,$c0,$eb,$fa,$b0,$ea,$fa,$af,$ea,$fe
        .byte $af,$ea,$ce,$af,$ea,$c3,$ef,$ea,$c0,$3c,$ea,$c0,$3c,$ea,$c0,$3c
        .byte $ea,$c0,$30,$3f,$c0,$00,$3f,$c0,$00,$ff,$c0,$00,$ff,$c0,$00,$57
        .byte $3e,$bf,$f0,$3a,$ab,$00,$3a,$ab,$00,$3a,$ac,$00,$3a,$ac,$00,$3a
        .byte $ac,$00,$3a,$ac,$00,$0e,$ac,$00,$0e,$bf,$00,$0e,$ab,$c0,$0e,$ab
        .byte $f0,$03,$aa

    L_26bb:
        .byte $fc,$00
        .byte $ea,$bc,$00,$ea,$ac,$00,$3a,$b0,$00,$3a,$f0,$00,$0f,$f0,$00,$03
        .byte $f0,$00,$03,$f0,$00,$0f,$c0,$00,$0f,$c0,$58,$00,$00,$3f,$00,$00
        .byte $ff,$00,$00,$ff,$00,$03,$fe,$00,$03,$76,$00

    L_26e8:
        .byte $03,$57,$00,$03,$5f,$00,$00,$df,$00,$00,$d7,$00,$00
        .byte $35,$00,$00,$0f,$00,$00,$ff,$00,$03,$3f,$00

    L_2700:
        asl.a $00ae
        asl.a $00ae
        asl.a $00bb

        .byte $03,$ea,$00,$03,$fa,$00,$03,$bf,$00,$03,$aa,$00,$00,$fa,$59,$fc
        .byte $00,$30,$57,$00,$dc,$df,$03,$5c,$9a,$03,$70,$db

    L_2725:
        ora $ff5c

    L_2728:
         .byte $3b,$70,$d7,$3b
        .byte $c0,$ff,$ea,$c0,$ff,$eb,$00,$57,$ac,$00,$5e,$ac,$00,$fe,$b0,$00

    L_273c:
        ldx.a $00c0,y

        .byte $eb,$00,$00,$eb,$30,$ff,$ff,$d7,$c3,$aa,$d5,$c3,$aa,$d7,$c3,$ff
        .byte $ff,$c3,$ec,$00,$c3,$ec,$00,$3c,$5a,$00,$03,$f0,$00,$00,$30,$00
        .byte $03,$ff,$00,$3e,$ba,$00,$ea,$fe,$00,$eb,$af,$00,$eb

    L_276c:
        sbc L_3d00

        .byte $f7,$00,$35,$55,$0f,$35,$5f,$35,$fd,$7a,$35,$eb,$5f,$3f,$ac,$d5
        .byte $37,$f0,$37,$37,$00,$cf,$37,$ff,$f5,$35,$55,$d5,$0f,$55,$d5,$00
        .byte $f7,$b7,$00,$03,$b7,$00,$03,$af,$5b,$30,$00,$00,$30,$00,$00,$ff
        .byte $00,$00,$ba,$f0,$00

    L_27a4:
        inc.a $00ac,x

        .byte $eb,$ac,$00,$fb,$ac,$00,$7d,$f0,$00

    L_27b0:
        eor $70,x

        .byte $00,$d5,$70,$f0,$b5,$ff,$5c,$d7,$ab,$5c,$5c,$eb,$fc,$70,$3c,$dc
        .byte $cc,$00,$dc,$7f,$ff,$5c,$5d,$57,$7c,$5d,$55,$f0,$7b,$7f,$c0,$7b
        .byte $00,$00,$eb,$00,$00,$5c,$3a

    L_27d9:
        tax 

        .byte $b0,$0e,$ba,$c0,$03,$ff,$00,$03,$57,$00,$0f,$ff,$c0,$3a,$ee,$b0
        .byte $3b,$ab,$b0,$eb,$ab,$ac,$ee,$aa,$ec,$3f,$ff,$f0,$0d,$55,$c0,$35
        .byte $57,$00,$35,$5f,$00,$35,$5c,$00,$35,$70,$00,$35,$70,$03,$0d,$70
        .byte $0f,$0d,$5f,$f7,$0d,$55,$5c,$03,$ff,$f0,$00,$00,$00,$5d,$00,$00

    L_281a:
        .byte $f0,$00,$00,$30,$00,$03,$ff,$00
        .byte $3e,$ba,$00,$ea,$fe,$00,$eb,$af,$00,$eb,$bd,$00,$3d,$f7,$00,$37
        .byte $55,$00,$35,$ff,$03,$fd,$7a,$03,$ab,$5f,$03,$ac,$d5,$00,$f0,$37
        .byte $00,$00,$0f,$00,$00,$f5,$3f,$ff,$d5,$fd,$55,$d5,$d7,$ff,$b5,$d7
        .byte $ff,$b7,$3c,$03,$af,$5e,$f0,$00

    L_285a:
        .byte $00,$30,$00,$00,$ff,$00,$00
        .byte $ba,$f0,$00

    L_2864:
        inc.a $00ac,x

        .byte $eb,$ac,$00,$ef,$ac,$00,$7d,$f0,$00,$57,$70,$c0,$fd,$73,$f0,$b5
        .byte $fd,$70,$d7,$ad,$70,$5c,$eb,$f0,$70,$3f,$70,$cc,$03,$70,$7f,$ff
        .byte $70,$5d,$55,$5c,$5d,$55,$f0,$7b,$ff,$c0,$7b

    L_2892:
        .byte $00,$00,$eb,$00,$00
        .byte $5e,$3a,$aa,$b0,$0e,$ba,$c0,$03,$ff,$00,$03,$57,$00,$0f,$ff,$c0
        .byte $3a,$ee,$b0,$3b,$ab,$b0,$eb,$ab,$ac,$ee,$aa,$ec,$3f,$ff

    L_28b5:
        .byte $f0,$0d
        .byte $55,$c0,$0d,$57,$00,$35,$57,$0c,$35,$5c,$0f,$35,$5c,$07,$35,$70
        .byte $07,$35,$5c,$37,$0d,$57,$d7,$0d,$55,$5c,$03,$ff,$f0,$00,$00,$00
        .byte $5f,$0f,$fc,$00,$0e,$ab,$3c,$3e,$af,$eb,$ef,$be,$ab,$eb,$fa,$ab
        .byte $ea,$ab,$fc,$3e,$fd,$70,$3f,$5d,$f0,$ff,$7f,$f0,$ff,$f5,$70,$ff
        .byte $57,$f0,$fd,$5f,$c0,$ff,$7e,$80,$ff

    L_2900:
        .byte $5f,$f0,$ff
        .byte $d5,$f0

    L_2905:
        inc L_ec80 + $3f,x

        .byte $3a,$ad,$ec,$3a,$ab,$ec,$3a,$aa,$ac,$3a,$ea,$ab,$3a,$ea,$ab,$61
        .byte $0f,$fc,$00,$0e,$eb,$3c,$3e,$af,$eb,$ef,$be,$ab,$f7

    L_2925:
        .byte $fa,$ab,$f7,$eb,$ff
        .byte $35,$fd,$77,$37,$5d,$f5,$ff,$77,$f5,$fb,$f5,$7f,$fb,$57,$fb,$fb
        .byte $5f,$bb,$fb,$7e,$bb,$fa,$df,$bb,$fa,$d7,$fb,$fa,$f5,$7b,$3a,$ff
        .byte $eb,$3a,$bb,$eb,$3e,$ba,$af,$0e,$aa,$ac

    L_2954:
        asl $acaa

        .byte $62,$00,$f3,$00,$03,$ae,$c0,$03,$aa,$c0,$3f,$af,$f0,$ef,$be,$ac
        .byte $eb,$ea,$ab,$ea,$ab,$eb,$ea,$ff,$ff,$3f,$d7,$5c,$0d,$ef,$bc,$0d
        .byte $fd,$fc,$0d,$75,$70,$03,$ff,$ff,$03,$ff,$ff,$00,$ff,$fc,$3e,$bd
        .byte $f0,$fa,$b5,$7c,$ea,$af,$eb,$ea,$aa,$ab,$eb,$aa,$ab,$eb,$aa,$ab
        .byte $63,$00,$f3,$00,$03

    L_299c:
        ldx $03c0
        tax 
        cpy #$3f

        .byte $af,$f0,$f7

    L_29a5:
        inc L_f580 + $2c,x
        nop 

        .byte $ab,$f7,$eb,$eb,$35,$ff,$fc,$35,$d7,$5c,$3f,$fd,$fc,$3a,$f5,$70
        .byte $3a,$ff,$ff,$3a,$ff,$ff,$0e,$fd,$fc,$0e,$d7,$70,$0e,$b7,$7c,$0e
        .byte $b5,$7b,$0e,$bf,$eb,$03,$ae,$ab,$03,$aa,$ab,$03,$aa,$bb,$64,$0f
        .byte $fc,$00,$0e,$eb,$3c,$3e,$af,$eb,$ef,$be,$ab,$eb,$fa,$ab,$ea,$ab
        .byte $fc,$3e,$fd,$70,$3f,$5d,$f0,$ff,$7f,$f0,$ff,$f5,$70,$fd,$57,$f0
        .byte $3d,$7f,$c0,$ff,$5e,$80,$ff

    L_2a00:
        .byte $5f
        .byte $c0,$0e,$d5,$ff,$3a,$bf,$d7,$3a,$f7,$d7,$eb,$b5,$d7,$ea,$b5,$d7
        .byte $ea,$bf,$d7,$ea

    L_2a15:
        nop 
        ldy $0365,x

        .byte $f0,$fc,$0e,$ef,$ab,$0e,$ae,$ab,$3e,$ba,$af,$ef,$ea,$fc,$ea,$af
        .byte $f0,$ea,$fd,$70,$3f,$5d,$70,$3f,$5f,$f0,$ff,$f7,$dc,$fd,$5f,$57
        .byte $fd,$7f,$57,$3f,$57,$57,$ff,$5d,$dc,$ff,$fd,$70,$3b,$eb,$c0,$3a
        .byte $ab,$b0,$3a,$ae,$b0,$0e,$ba,$b0,$0f,$ea,$ac,$0e,$aa,$ac,$66,$00
        .byte $f3,$00,$03,$ae,$c0,$03,$aa,$c0,$3f,$af,$f0,$ef,$be,$ac,$eb,$ea
        .byte $ab,$ea

    L_2a6b:
        .byte $ab,$eb
        .byte $ea,$ff,$ff,$3f,$d7,$5f,$0d,$ef,$bc,$0d,$fd,$fc,$0d,$75,$70,$03
        .byte $ff,$fc,$03,$ff,$fc,$00,$ff,$ff,$0f

    L_2a86:
        ldx $3ad7

        .byte $b7,$d7,$eb,$f5,$d7,$ea,$b5,$d7,$ea,$b5,$d7,$3b,$ef,$bc,$67,$00
        .byte $fc,$00,$03,$eb,$00,$0e,$ab,$f0,$0e,$be,$ac,$0e,$fa,$ab,$3f,$ab
        .byte $eb,$ea,$bf,$ff,$ea,$d7,$5f,$ef,$d7,$7c,$3d,$ef,$dc,$0d,$ff,$57
        .byte $0d,$77,$57,$03,$f7,$57,$03,$f5,$dc,$0e,$bf,$b0,$3a,$ee,$b0,$3b
        .byte $ab,$b0,$3a,$ae,$ac,$0e,$be,$ac,$0f,$fa,$ac,$0e,$aa,$ac,$68,$00
        .byte $f3,$00,$03,$ff,$c0,$0f,$ff,$c0,$0f,$dd,$40,$0f,$55,$40,$3f,$b6
        .byte $c0,$3d,$f7,$c0,$fd,$55,$40,$3f,$5f,$c0,$ff,$7c,$00,$3d,$5f,$00
        .byte $03,$55,$00,$3f,$df,$00,$ea,$de,$c0,$ea,$de,$c0,$ee

    L_2b06:
        tsx 
    L_2b07:
        beq L_2b07

        .byte $ab,$fc,$de,$ab,$fb,$df,$ee,$eb,$d7,$7e,$af,$37,$7f,$fc,$69,$00
        .byte $f3,$00,$03,$ff,$c0,$0f,$ff,$c0,$0f,$dd,$40,$3f,$a6,$80,$3f,$b6
        .byte $c0,$3d,$f7,$c0,$fd,$55,$00,$ff,$5f,$30,$ff,$74,$fc,$3d,$5f,$fc
        .byte $03,$55,$30,$0f,$df,$00,$3a,$d7,$00,$ea,$b7,$fc,$eb,$af,$ab,$ef
        .byte $ae,$ab,$f7,$ef,$af,$35,$ff,$fc,$3d,$d7,$c0,$0d,$5e,$c0,$6a,$03
        .byte $fc,$00

    L_2b5b:
        asl L_fcc0 + $2b

        .byte $3a,$af,$ab,$3a,$fa,$ab,$3b,$ff,$fc,$3f,$f7,$5c,$ed,$d7,$70,$eb
        .byte $df,$f0,$ea,$fd,$5c,$3a,$bd,$fc,$0e,$af,$70,$3f,$ed,$f0,$eb,$fd
        .byte $70,$ea,$f5,$f0,$eb,$bf,$ac,$fa,$eb,$bc,$3a,$af,$f0,$3e,$be,$c0
        .byte $3e,$fa,$c0,$3b,$ea,$c0,$3a,$aa,$c0,$6b,$00,$00,$00,$03,$fc,$00
        .byte $0e,$eb,$fc,$3a,$af,$ab,$3a,$fa,$ab,$3b,$ff,$fc,$ff,$d7,$70,$ed
        .byte $df,$f0,$eb,$7d,$5c,$eb,$55,$fc,$fa,$d5,$70,$3a,$d7,$f0,$3e,$b7
        .byte $c0,$ee,$bd,$c0,$eb,$af,$00,$ea,$ed,$c0,$ea,$f5,$70,$ea

    L_2bcc:
        inc $c0,x

        .byte $eb,$af,$b0,$fa,$ae,$b0,$3a,$bb,$c0,$6c,$00,$f3,$00,$03,$ff,$c0
        .byte $0f,$ff,$c0,$0f,$dd,$40,$3f,$a6,$80,$3f,$b6,$c0,$3d,$f7,$c0

    L_2bed:
        sbc L_4000 + $55,x

        .byte $ff,$7f,$c0,$ff,$5d,$00,$3d,$5f,$00,$03,$55,$c0,$0f,$df,$c0,$3a

    L_2c00:
        .byte $d7
        .byte $b0,$ea,$be,$ff,$ea,$ae,$d7,$eb,$b7,$d7,$ff,$f5,$d7,$37,$75,$d7
        .byte $35,$7f,$d7,$35,$fa,$bc,$6d,$00,$f3,$c0,$0f,$ff,$c0,$0f,$ff,$f0
        .byte $3f,$ae,$b0,$3f,$b6,$f0,$ff,$a6,$b0,$fd,$ff,$c0,$fd,$55,$c0,$3f
        .byte $5f,$f0,$3d,$7f,$dc,$03,$5f,$57,$3f,$df,$57,$ea,$f7,$57,$ea,$d5
        .byte $dc,$eb,$5f,$fc,$ed,$5e,$dc,$3d,$7a,$b7,$3d,$fa,$b7,$0f,$ea,$b7
        .byte $0e,$ae,$cc,$03,$aa,$c0,$6e,$00,$00,$00,$03,$fc,$00,$0e,$eb,$fc
        .byte $3a,$af,$ab,$3a,$fa,$ab,$3b,$ff,$fc,$3f,$d7,$70,$f7,$df,$f0,$f7

    L_2c71:
        adc $fd5c,x
        eor $fc,x
        and L_7040 + $1d,x
        ora L_f040 + $1f

        .byte $3f,$57,$c0,$fb,$f5,$c0,$ea,$af,$ff,$ea,$be,$d7,$eb,$f7,$d7,$ef
        .byte $b5,$d7,$ea,$b5,$d7,$ea,$bf,$d7,$eb,$fa,$bc,$6f,$03,$fc,$00,$0e
        .byte $eb,$fc,$3e,$af,$ab,$3a,$ba,$ab,$3b,$ff,$ff,$3f,$d7,$5c,$f7,$df
        .byte $70,$f7,$d7,$50,$fd,$7d,$fc,$fd,$57,$dc,$3d,$5f,$57,$3d,$5f,$57
        .byte $eb,$77,$57,$eb,$f5,$dc,$ea,$ed,$f0,$eb,$af,$c0,$ea,$be,$c0,$fa
        .byte $ba,$c0,$3a,$fa,$c0,$3e,$ea,$c0,$3b,$aa,$c0,$70,$00,$00,$00,$00
        .byte $3f,$00,$0f,$fa,$fc,$fe,$ea,$ab,$ea,$aa,$ab,$ea,$bb,$ac,$3e,$dd
        .byte $f0,$0f,$ae,$bc,$37,$be,$dc,$37,$f7,$dc,$0d,$55,$70,$03,$5d,$70
        .byte $03

    L_2cfd:
        eor $c0,x

        .byte $00,$ff,$00,$0f,$d5,$f0,$3a,$bf,$ac,$eb,$aa,$bb,$ea,$ba,$ab,$eb
        .byte $ab,$bb,$3b,$ea,$bb,$3a,$ee,$bb,$71,$ff,$f0,$ff,$ea,$be,$ab,$ea
        .byte $aa,$ac,$fb,$aa,$ac,$3b,$ea,$f0,$0d,$7f,$70,$0f,$ae,$bc,$37,$bf
        .byte $bc,$35,$ee,$dc,$0d,$77,$5c,$03,$5d,$70,$3f

    L_2d3a:
        eor L_eb40 + $30,x
        cmp L_fbc0,x
        cmp $fc,x

        .byte $eb,$bf,$af,$ed,$ea,$bb,$ed,$fb,$ab,$ed,$7a,$ab,$3d,$5e,$bb,$0f
        .byte $fa,$eb,$03,$ee,$ec,$72,$00,$f0,$00,$03,$fc,$00,$03,$ff,$00,$0f
        .byte $7d,$c0,$0d,$55,$40,$0d,$f7,$f0

    L_2d6a:
        .byte $3f,$ef
        .byte $bc,$35,$f5,$dc,$35,$5f,$5c,$3d,$55,$5c,$0f,$5f,$70,$0f,$75,$c0
        .byte $37,$f5,$70,$d5,$b5,$f0,$d9,$d5,$dc,$d5,$d7,$5c,$d7,$5f,$77,$35
        .byte $5e,$d7,$35,$7e,$d7,$0d,$7a,$fc,$0f,$fa,$b0,$73,$00,$3c,$00,$00
        .byte $ff,$00,$03,$ff,$00,$03,$5f,$c0,$0d,$57,$40,$35,$55,$70,$3d,$f7
        .byte $f0,$37,$ef,$bc,$35,$f5,$dc,$3d,$5f,$5c,$03,$55,$70,$3f,$5d,$70
        .byte $f7,$d5,$c0,$d5,$ff,$c0,$d9,$ef,$b0,$d5,$ea,$b0,$d7,$fa,$f0,$35
        .byte $7f,$7c,$35,$57,$5c,$0d,$55,$5c,$03,$ff,$f0,$74,$00,$00,$00,$00
        .byte $3f,$00,$0f,$fa,$fc,$fe,$ea,$ab,$ea

    L_2de5:
        tax 

        .byte $ab,$ea,$bb,$ac,$3e,$dd,$f0,$0f,$ae,$bc,$37,$bf,$9c,$37,$d5,$dc
        .byte $0d,$55,$70,$03,$5d,$70,$03

    L_2dfd:
        eor $c0,x

        .byte $00,$ff,$00,$0f,$d5,$ff,$3a,$bf,$d7,$eb,$f7,$d7,$ef,$b5,$d7,$ea
        .byte $b5,$d7,$eb,$ff,$d7,$3e,$aa,$bc,$75,$ff,$f0,$ff,$ea,$be,$ab,$ea
        .byte $aa,$ac,$fb,$aa,$ac,$3b,$ea,$f0,$0d,$7f,$70,$0f,$ae,$bc,$37,$ae
        .byte $bc,$35,$f7,$fc,$0d,$57,$dc,$03,$5f,$57,$00,$df,$57,$0f,$f7,$57
        .byte $3a,$f5,$dc,$3b,$ef,$f0,$3b,$ae,$bc,$3a,$be,$ac,$3e,$fa

    L_2e4d:
        cpx L_ee00 + $f
        ldy $aa0e
        ldy L_bb0e,x
        ldy.a $0076

        .byte $3c,$00,$00,$ff,$00,$03,$ff,$00,$03,$5f,$c0,$0d,$57,$70,$35,$55
        .byte $70,$3d,$f7,$f0,$37,$ef,$bc,$35,$f5,$dc,$0d,$5f,$5c,$3f,$55,$70
        .byte $d7,$5d,$70,$d5,$d5,$c0,$d9,$ff,$b0,$d5,$ea,$ff,$d7

    L_2e86:
        inc L_f5c0 + $17

        .byte $f7,$d7,$35,$55,$d7,$3d,$75,$d7,$0f,$ff,$d7,$0e,$aa,$bc,$77,$00
        .byte $f0,$00,$03,$fc,$00,$03,$ff,$00,$0f,$7d,$c0,$0d,$55,$40,$35,$f7
        .byte $f0,$3f,$ef,$b0,$3d,$f5,$c0,$35,$5f,$fc,$35,$55,$dc,$0d,$57,$57
        .byte $3f,$7f,$57,$f5,$d7,$57,$d5,$d7,$dc,$d7,$5f,$b0,$d5,$5e,$b0,$d5
        .byte $7a,$b0,$35,$ea,$b0,$3f,$aa,$b0,$3a,$aa,$c0,$3a,$aa,$c0,$78,$00
        .byte $3f,$00,$00,$ee,$c0,$0c,$ea,$c0,$3b,$ea,$fc,$3a,$ff,$fb,$3a,$af
        .byte $eb,$0f

    L_2eeb:
        tax 

        .byte $ab,$03,$fa,$bc,$f3,$ff,$fc,$d7,$ff,$f0,$d4,$ff,$fc,$34,$ff,$fc
        .byte $ec,$3f,$f0,$ec,$ff,$fc,$ef,$ef,$fc,$ea,$ab,$fc,$ea,$aa

    L_2f0a:
        .byte $ab
        .byte $3e,$ea,$ab,$03,$aa,$ab,$03,$aa,$ac,$03,$aa,$ac,$79,$00,$f3,$00
        .byte $03,$ae,$c0,$33,$ab,$c0,$ef,$aa,$f0,$eb,$aa,$ac,$ea,$fa,$bf,$3a
        .byte $bf,$fb,$3a,$af,$eb,$0e,$aa,$ab,$0f,$ea,$ac,$0d,$ff,$fc,$0d,$ff
        .byte $f0,$c3,$7f,$c0,$73,$55,$c0,$df,$d5,$c0,$df,$ff,$f0,$3a,$bf,$ac
        .byte $ea,$aa,$af,$ea

    L_2f4f:
        .byte $ab,$ab,$fb,$ab,$ab,$3f
        .byte $aa,$ab,$7a,$03,$cf,$00,$0f,$ff,$c0,$0f,$ff,$c0,$0f,$ff,$c0,$0f
        .byte $ff,$c0,$3f,$ff,$c0,$3f

    L_2f6b:
        .byte $ff,$f0,$3f,$ff,$f0,$3f,$ff,$f0,$0f,$ff
        .byte $c0,$00,$ff,$00,$3f,$55,$f0,$fb,$d7,$ac,$ea,$fe,$ac,$ea,$aa,$ac
        .byte $ea,$aa,$ac,$fa,$ba,$bc,$3a,$ba,$b0,$3a,$aa,$b0,$3a,$ba,$f0,$0e
        .byte $aa,$c0,$7b,$03,$ff,$00,$0e,$aa,$c0,$0e,$aa,$b0,$3a,$aa

    L_2fa3:
        bcs L_2fdf
        ldx L_0f80 + $30,y

        .byte $eb,$f0,$0f,$ff,$f0,$0f,$ff,$f0,$0f,$ff,$c0,$03,$ff,$c0,$00,$ff
        .byte $00,$0f

    L_2fba:
        eor $f0,x

        .byte $3a,$ff,$ac,$ea,$aa,$ab,$ea,$be,$ab,$ea,$eb,$ab,$ea,$eb,$ab,$ea
        .byte $eb,$ab,$3e,$eb,$ac,$3a,$be,$ac,$3a,$aa,$ac,$7c,$3f,$c0,$ff,$fa
        .byte $bf,$ab,$ea

    L_2fdf:
        tax 

        .byte $ab,$ea,$aa,$af,$3f,$aa,$fc,$0e,$ea,$b0,$0f,$aa,$fc,$37,$fa,$bc
        .byte $37,$aa,$dc,$0d,$ea,$dc,$03,$7b,$70,$03,$5d,$70,$00

    L_2ffd:
        cmp $c0,x

    L_2fff:
         .byte $0f,$ff,$fc,$3a,$bf,$ef,$3b
        .byte $aa,$bb,$3a,$ab,$ab,$fb,$bb,$bb,$eb,$ab,$ab,$ef,$ae,$af,$ae,$ae
        .byte $ec,$7d,$00,$00,$00,$00,$3c,$00,$00,$ff,$00,$00,$ff,$00,$03,$ff
        .byte $c0,$0d,$7f,$70,$0d,$7f,$70,$3d,$5f,$7c

    L_3030:
        and $5f,x

        .byte $5c,$35,$5d,$5c,$0f,$5d,$f0,$03,$55,$c0,$00,$d7,$c0,$3d,$ff,$f0
        .byte $37,$bf,$b4,$d7,$ea,$f4,$df,$bf,$bc,$de,$aa,$ac,$de,$aa,$ac,$3e
        .byte $aa,$ac,$0e,$aa

    L_3056:
        ldy.a $007e

        .byte $00,$00,$00,$00,$00,$00,$00,$3f,$00,$00,$ff,$00,$03,$df,$00,$03
        .byte $55,$00

    L_306b:
        asl.a $00ba

        .byte $0f,$df,$00,$0d,$f5,$00,$0d,$55,$00,$03,$75,$00,$03,$75,$01,$f0
        .byte $d7,$06,$6f,$f5,$0e,$be,$d7,$09,$97,$be,$0e,$fb,$aa,$0d,$9e,$ba
        .byte $03,$f3,$ff,$00,$80,$3a,$00,$00,$0f,$7f,$00,$00,$00,$00,$0c,$c0
        .byte $03,$39,$70,$ff,$36,$ac,$fc,$19,$eb,$ff,$eb,$6c,$ff,$f5,$b0,$7f
        .byte $0f,$f0,$7f,$f7,$00,$7c,$37,$00,$ff,$f7,$00,$ff,$37,$00,$ea,$d7
        .byte $00,$ea,$dc,$00,$ae,$fc,$00,$bf,$c0,$00,$b0,$00,$00,$f0,$00,$00
        .byte $ec,$00,$00,$bf,$00,$00,$eb,$00,$00,$80,$00,$3a,$ac,$00,$3e,$ac
        .byte $00,$d7,$ac,$03,$55,$fc,$0d,$57,$f0,$35,$7f,$70,$35,$fd,$70,$35
        .byte $f5,$c0,$0d,$75,$c0

    L_30f3:
        ora L_c05d

        .byte $03,$5d,$70,$00

    L_30fa:
        .byte $fb,$70,$00,$eb,$5c,$03,$ef,$df,$03
        .byte $ac,$3b,$00,$f0,$eb,$00,$00,$ec,$00,$00

    L_310d:
        .byte $3c,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $81,$00

    L_3119:
        .byte $00,$3f,$00,$00,$ff,$00,$03,$d7,$00
        .byte $0e,$ba,$00,$0e,$db,$00,$0f,$5f,$00,$0d,$d5,$0d,$cd,$5d,$36,$73
        .byte $7d,$ae,$b3,$55,$69,$dc,$f5,$ed,$9f,$d7,$36,$ba,$d7,$0f,$fa,$df
        .byte $0d,$de,$be,$0d,$de,$aa,$0d,$73,$ba,$0d,$c3,$ff,$03,$c0,$3a,$00
        .byte $00,$0f,$00,$00,$03,$82,$c0,$00,$00,$f0,$00,$00,$fc,$00,$00,$ff
        .byte $00,$00,$7c,$00,$00,$7f,$00,$00,$7f,$c0,$f0,$ff,$03,$a7,$ff,$02
        .byte $75,$ff,$c2,$5b,$ff,$f3,$b6,$eb,$c3,$6f,$aa,$f0,$de,$bb,$dd,$70
        .byte $bf,$d5,$c0,$b0,$3f,$00,$f0,$00,$00,$af,$00,$00,$ba,$c0,$00,$ea
        .byte $b0,$00

    L_3194:
        tax 

        .byte $b0,$00,$83,$00,$3a,$ff,$00,$3b,$57,$00,$0d,$5c,$00,$0d,$5c,$00
        .byte $0d,$5c,$00,$0d,$7c,$00,$0d,$7c,$00,$35,$fc,$00,$35,$dc,$00,$35
        .byte $d7,$00,$37,$d7,$00,$37,$37,$00,$37,$37,$00,$3f,$3f,$00,$eb,$3b
        .byte $03

    L_31c6:
        ldy $03eb
        ldy $03ef,x
        beq L_320a

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$84,$00,$00,$00,$00,$03,$f0
        .byte $00

    L_31df:
        asl.a $00ac
        asl.a $00af
        rol L_0f80 + $2b,x

        .byte $3a,$ab,$35,$fa,$bd,$35,$fe,$d7,$3f,$0f,$f7,$0d,$03,$fd,$0d,$3c
        .byte $d5,$0d,$fb,$d7,$0d,$7b,$37,$03,$7a,$fd,$00,$fb,$b5,$00,$3f,$af
        .byte $00,$03

    L_320a:
        tax 

        .byte $00,$03,$ab,$00,$00,$ff,$00,$00,$35,$00,$00,$ef,$85,$00,$00,$00
        .byte $0f,$c0,$00,$fa,$b0,$00

    L_3221:
        nop 
        bcs L_3224
    L_3224:
        tax 
        cpy #$00
        tax 
        cpy #$00

        .byte $fa,$c0,$00,$5f,$00,$00,$df,$00,$00,$fc,$00,$00,$5c,$00,$00,$5c
        .byte $f0,$00,$73,$bf,$00,$7e,$b5,$c0,$7a,$b5,$70,$eb,$bf,$70,$ab,$f3
        .byte $70,$ab,$03,$c0,$fc,$0d,$70,$70,$0f,$70,$f0,$03,$c0,$86,$3f,$aa
        .byte $c0,$f5

    L_325c:
        nop 
        cpy #$f5
        inc L_37ac + $4,x

        .byte $ff,$b0,$37,$35,$f0,$37,$35,$c0,$ff,$35,$c0,$ea,$f5,$c0,$3f,$37
        .byte $00,$fb,$37,$00,$ef,$37,$00,$eb,$37,$00,$fb,$ff,$c0,$3c,$ea,$c0
        .byte $00,$3f,$00,$00,$3f,$00,$00,$3b,$00,$00,$3a,$c0,$00,$3e,$c0,$00
        .byte $0f,$00,$00,$00,$00,$87,$00,$00,$00,$00,$00,$fc,$00,$0f,$af,$00
        .byte $0e,$ab,$00,$3a,$ae,$00,$3a,$ab,$00,$3e,$be,$00,$0e,$d7,$00,$03
        .byte $df,$00,$03,$fd,$00,$00,$d5,$00,$3c,$d7,$03,$fb,$35,$0d,$7a,$fd
        .byte $35,$7b,$b5,$37,$fb,$af,$37,$3f,$aa,$0f,$03,$ab,$35,$c0,$ff,$37
        .byte $c0,$35,$0f,$00,$3f,$88,$00,$00,$00,$3f,$c0,$00,$fa,$b0,$00

    L_32e1:
        nop 

        .byte $b0,$00,$fa,$f0,$00

    L_32e7:
        tax 

        .byte $c3,$c0,$fa,$cd,$70,$5f,$0d,$70,$7f,$03,$c0,$fc,$01,$c0,$5c,$f1
        .byte $c0,$5f,$bd,$c0,$73,$b5,$c0,$fe,$b7,$00,$7b,$bc,$00,$eb,$f0,$00
        .byte $ab,$00,$00,$ab,$00,$00,$fc,$00,$00,$70,$00,$00,$cc,$00,$00,$89
        .byte $0e,$ab,$f0,$0e,$ad,$7c,$3a,$fd,$7c,$3b,$ff,$70,$3d,$7f,$70,$0d
        .byte $73,$70,$0d,$73,$fc,$0d,$7e,$ac

    L_3330:
        .byte $03,$73,$f0,$03,$73

    L_3335:
        ldy L_7300 + $3,x
    L_3338:
        cpx L_7f03
        ldy $ff0f
        bcs L_334e

        .byte $af,$f0,$03

    L_3343:
        .byte $f0,$00,$03,$f0,$00,$03
        .byte $b0,$00

    L_334b:
        asl.a $00b0
    L_334e:
        asl.a $00f0

        .byte $03,$c0,$00,$00,$00,$00,$8a

    L_3358:
        .fill $21, $0
        .byte $0f,$c0,$00,$3f,$f0,$3f,$ff,$fc,$ea,$da,$df,$aa,$ae,$5e,$aa,$ed
        .byte $57,$ea,$f7,$5e,$bf,$7f,$de,$bf,$ff,$df,$ba,$35,$c3,$ea,$8b
        .fill $20, $0

    L_33b8:
        .byte $f0,$00,$00,$fc,$f0,$00,$fc,$eb,$03,$f0,$ea,$c3,$b0,$ea,$ff
        .byte $ac,$ea,$bf,$af,$ea,$ab,$af,$fe,$aa,$b0,$d7,$aa,$b0,$d5,$aa,$c0
        .byte $8c,$00,$00,$00,$00,$00,$03,$00,$00,$0f,$f0,$00,$3a,$ec,$00,$3e
        .byte $ec,$00,$3f,$eb,$00,$35,$3b,$00,$0d,$ff,$00,$0d,$f5,$c0

    L_33f5:
        .byte $03
        .byte $0d,$c0,$03,$0d,$70,$3d,$0d,$73,$f7,$03,$5f,$ae,$03,$57,$ae,$00
        .byte $d7,$ef,$00,$f5,$fb,$00,$35,$ee,$00

    L_340f:
        and.a $007b,x
        ora.a $007b

        .byte $0f,$7b,$8d,$3f,$c0,$00,$fd,$c0,$00,$7f,$70,$00,$6b,$70,$00,$6f
        .byte $f0,$00

    L_3427:
        adc.a $00f0,x
        cmp $f0,x

        .byte $00,$5d,$c0,$00,$f5,$c0,$00,$57,$00,$00,$fc,$00,$00,$57,$00,$00
        .byte $df,$00,$00,$bb,$00,$00,$aa,$c0,$00,$ae,$c0,$00,$ae,$f0,$00,$b3
        .byte $af,$c0,$b0,$eb,$c0,$b0,$3f,$00,$ac,$03,$00,$8e,$f5,$ee,$c0,$ed
        .byte $ee,$b0,$ef,$ee,$ac,$ee,$fb,$bc,$ee,$bb,$ac,$ee,$bb,$ac,$ee,$ba
        .byte $ec,$ef,$ae,$eb,$3b,$ae,$fb,$3b,$ae,$bb,$3b,$ef,$bf,$3a,$fb,$ac
        .byte $0b,$ab,$eb,$0b,$af,$fc,$03,$f0,$f0,$00,$03,$a0,$00,$0e,$b0,$00
        .byte $0f,$f0,$00,$0f,$30,$00,$00,$00,$00,$00,$00,$8f,$00,$00,$00,$00
        .byte $00,$0f,$00,$00,$3d,$00,$00,$e9,$00,$00,$f9,$00,$00,$fd,$00,$00
        .byte $d7,$00,$00,$d5,$00,$00,$37,$00,$00,$3d,$00,$00,$0f,$00,$00,$35
        .byte $00,$03,$f7,$00,$03,$ae,$00,$03,$ae,$00,$03,$af,$00,$00,$eb,$00
        .byte $00,$ea,$00,$00,$3a,$00,$00,$ea,$00,$03,$ba,$90,$ff,$00,$00,$f7
        .byte $00,$00,$fd,$c0,$00,$ad,$c0,$00,$ef,$c0,$00,$f7,$c0,$00,$57,$c0
        .byte $00,$77,$00,$00,$d7,$00,$00,$5c,$00,$00,$f0,$00,$00,$5c,$00,$00
        .byte $dc,$00,$00,$bb,$00,$00,$ab,$00,$00,$ab,$00,$00,$ae,$c0,$00,$be
        .byte $c0,$00,$b3,$b0,$00,$f3

    L_3512:
        bcs L_3514
    L_3514:
        bcs L_3512

        .byte $00,$91,$3e,$ea,$cf,$3e,$eb,$c3,$37,$ba,$c0,$37,$ba,$b0,$37,$ba
        .byte $b0,$35,$ee,$ac,$35,$ee,$bc,$35,$ee,$ac,$37,$fb,$ab,$37,$bb,$ab
        .byte $37,$be,$ec,$3f,$ae,$bb,$3b,$af,$ab,$eb,$eb,$fc,$ef,$3e,$f0,$f3
        .byte $03,$a0,$f0,$0e,$b0,$00,$0f,$f0,$00,$0f,$30,$00,$00,$00,$00,$00
        .byte $00,$92,$00,$00,$0f,$00,$00

    L_355d:
        and $00,x

        .byte $00,$df,$00,$00,$df,$00,$00,$d6,$00,$00,$df,$00,$00,$3d,$00,$00

    L_356f:
        .byte $3f,$00,$00,$0f,$00,$00
        .byte $05,$00,$00,$fd,$00,$03

    L_357b:
        .byte $bf,$00,$03
        .byte $be,$00,$0e,$bb,$00,$0e,$eb,$00,$3a,$ee,$00,$3b,$eb,$00,$3a,$bf
        .byte $00,$3a,$df,$00,$0e,$df,$00,$03,$d7,$93,$ff,$00,$00,$57,$c0,$00
        .byte $7f,$c0,$00,$7f,$f0,$00,$5b,$70,$00

    L_35a7:
        sbc.a $0070,x
    L_35aa:
        adc.a $00c0,x
        sbc $c0,x

        .byte $00,$f7,$00,$00,$57,$00,$00,$7f,$00,$00,$ff,$c0,$00

    L_35bc:
        inc.a $00b0,x
        ldx.a $00ac,y

        .byte $af,$ac,$00,$fa,$ac,$00,$5e,$b0,$00

    L_35cb:
        dec.a $00b0,x

        .byte $df,$c0,$00,$fa,$c0,$00,$ab,$00,$00,$94,$00,$00,$0f,$00,$00,$35
        .byte $00,$00,$df,$00,$00,$da,$00,$00,$de,$03,$c0,$df,$0d,$70,$3d,$0d
        .byte $70,$3f,$03,$57,$0f,$00,$fc,$05,$00,$ec,$fd,$00,$ef,$3f,$00,$eb
        .byte $3e,$00,$eb,$3b,$00,$ea,$eb,$00,$3a

    L_3607:
        inc $3b00

        .byte $eb,$00,$0f,$eb,$00,$00,$ee,$00,$00,$eb,$00,$00,$eb,$95,$00,$00
        .byte $00,$00,$fc,$00,$03,$57,$00,$02,$fe,$00,$03,$ab,$00,$02,$fe,$00
        .byte $02,$aa

    L_362c:
        .byte $00,$02,$ab,$00,$02,$ff,$00,$02,$d7,$00,$03,$d7,$00,$02
        .byte $fe,$00,$02,$aa,$00,$03,$ab,$00,$00,$fc
        .fill $13, $0
        .byte $96,$00

    L_3659:
        .fill $21, $0
        .byte $c0,$00,$03,$7f,$00,$03,$57,$00,$0f,$5c,$00,$ff,$5c,$00,$ff,$f0
        .byte $00,$ff,$c0,$00,$ff,$00,$00,$f0,$00,$00,$00,$00,$00,$97
        .fill $2e, $0
        .byte $30,$00,$00,$dc,$00,$ff,$df,$c0,$ff,$d5,$c0,$ff,$d7,$00,$ff,$fc
        .byte $00,$98
        .fill $13, $0
        .byte $3f,$c3,$0c,$3f,$cf,$0f,$fa,$bf,$0f,$ff,$fc,$03,$ff,$eb,$03,$fa
        .byte $ef,$03,$fb,$fc,$0d,$5f,$57,$0d,$75,$fc,$0f,$5f,$5f,$0f,$dd,$df
        .byte $0f,$d7,$df,$03,$f5,$7f,$03,$ff,$ff,$00,$ff,$ff,$99
        .fill $1f, $0
        .byte $4c,$80,$0c,$08,$80,$02,$59,$30,$01,$8a,$40

    L_3742:
        .byte $2e,$71,$44,$12,$87,$00
        .byte $05,$99,$64,$08,$cc,$8c,$02,$6a,$d0,$08,$22,$a0,$02,$1a,$20,$9a
        .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $0c,$20,$01,$00,$00,$c0,$88,$80,$08,$2b,$8c,$0a,$19,$00,$a3,$0a
        .byte $19,$2a,$40

    L_377b:
        pha 

        .byte $c2,$86,$32,$44,$9a,$a8,$18,$32,$58,$22,$67,$13,$8b,$20,$84,$02
        .byte $1e,$e0,$0c,$82,$21,$00,$20,$00,$00,$c0,$c0,$9b,$00,$00,$00,$00
        .byte $fc,$00,$03,$57,$00,$02,$fe,$00,$03,$ab,$00,$02,$fe,$00,$02,$aa

    L_37ac:
        .byte $00,$02,$ab,$00,$02,$ff,$00,$02,$d7,$00,$03,$d7,$00,$02
        .byte $fe,$00,$02,$aa,$00,$03,$ab,$00,$00,$fc

    L_37c4:
        .fill $13, $0
        .byte $9c

    L_37d8:
        jsr L_3ad6
        nop 
    L_37dc:
        nop 
    L_37dd:
        sei 
        lda #$35
        sta L_0840 + $13
        lda #$37
        sta $01
        jsr L_3b4a
        jsr $ff81
        jsr $ff84
        lda cCia1IntControl
        lda #$1f
        sta cCia1IntControl
        jsr $ff8a
        lda vScreenControl1
        and #$7f
        sta vScreenControl1
        lda #$f0
        sta vRaster
        lda #$0b
        sta vBorderCol
        sta vBackgCol0
        lda #$93
        jsr $ffd2
        jsr L_3a12
        ldx #$03
        stx L_0840 + $17
    L_381d:
        ldx L_0840 + $17
        lda L_3cd9 + $c,x
        pha 
        lda L_3ce9,x
        tay 
        inx 
        cpx #$01
        bne L_382e
        dex 
    L_382e:
        clc 
        jsr $fff0
        pla 
        tay 
        jsr L_387d
        dec L_0840 + $17
        bpl L_381d
        clc 
        ldy #$00
        ldx #$06
        jsr $fff0
        jsr L_c092
        clc 
        ldx #$14
        ldy #$08
        jsr $fff0
        ldy #$58
        jsr L_387d
        jsr $394a
        jsr L_3956
        jsr L_3af0
        lda #$00
        sta L_0840 + $3
    L_3862:
        jsr L_39aa
        jsr L_3a48
        jsr L_39f3
        inc L_0840 + $d
        bne L_3862
        inc L_0840 + $12
        lda L_0840 + $12
        cmp #$07
        bne L_3862
        jmp L_3ab4
    L_387d:
        lda L_3889,y
        beq L_3888
        jsr $ffd2
        iny 
        bne L_387d
    L_3888:
        rts 



    L_3889:
         .byte $28,$43
        .byte $29,$20,$31,$39,$38,$33,$20,$42,$41,$4c,$4c,$59,$20,$4d,$49,$44
        .byte $57,$41,$59,$20,$00,$4f,$4e,$45,$20,$50,$4c,$41,$59,$45,$52,$00
        .byte $54,$57,$4f,$20,$50,$4c,$41,$59,$45,$52,$00,$4a,$4f,$59,$53,$54
        .byte $49,$43,$4b,$00,$4b,$45,$59,$42,$4f,$41,$52,$44,$00,$42,$45,$47
        .byte $49,$4e,$4e,$45,$52,$00,$41,$52,$43,$41,$44,$45,$20,$20,$00,$45
        .byte $58,$50,$45,$52,$54,$00,$53,$50,$41,$43,$45,$20,$4f,$52,$20,$42
        .byte $55,$54,$54,$4f,$4e,$20,$54,$4f,$20,$50,$4c,$41,$59,$00,$48,$49
        .byte $47,$48,$20,$53,$43,$4f,$52,$45,$20,$00,$20,$46,$4f,$52,$20,$00
        .byte $20,$20,$54,$41,$50,$50,$45,$52,$20,$20,$28,$54,$4d,$29,$20,$20
        .byte $00,$44,$45,$53,$49,$47,$4e,$41,$54,$45,$44,$20,$54,$52,$41,$44
        .byte $45,$4d,$41,$52,$4b,$20,$4f,$46,$00,$42,$41,$4c,$4c,$59,$20

    L_393a:
        .byte $4d,$49,$44,$57
        .byte $41,$59,$20,$4d,$46,$47,$2e,$20,$43,$4f,$2e,$00,$a9,$00,$8d,$51
        .byte $08,$8d,$4d,$08,$8d,$52,$08,$60

    L_3956:
        ldx #$06
        lda L_0840
        pha 
        pha 
        lda L_0840 + $1
        pha 
    L_3961:
        pha 
        lda L_0840 + $2
        pha 
        pha 
        pha 
        lda #$d1
        sta $fb
        lda #$06
        sta $fc
    L_3970:
        pla 
        ldy #$10
        cmp L_39a3,x
        beq L_3987
    L_3978:
        lda ($fb),y
        cmp #$20
        beq L_3982
        and #$7f
        sta ($fb),y
    L_3982:
        dey 
        bpl L_3978
        bne L_3994
    L_3987:
        lda ($fb),y
        cmp #$20
        beq L_3991
        ora #$80
        sta ($fb),y
    L_3991:
        dey 
        bpl L_3987
    L_3994:
        lda $fb
        sec 
        sbc #$50
        sta $fb
        bcs L_399f
        dec $fc
    L_399f:
        dex 
        bpl L_3970
        rts 



    L_39a3:
         .byte $00
        .byte $01,$00,$01,$00,$01,$02

    L_39aa:
        lda #$ff
        sta cCia1DDRA
        jsr $ff9f
        jsr $ffe4
        ldy #$07
    L_39b7:
        cmp L_39dd,y
        beq L_39c0
        dey 
        bpl L_39b7
        rts 


    L_39c0:
        cmp #$20
        beq L_39d5
        lda $39e5,y
        tax 
        lda L_39e9 + $3,y
        sta L_0840,x
        jsr L_3bfb + $4
        jsr L_3956
        rts 


    L_39d5:
        pla 
        pla 
        inc L_0840 + $3
        jmp L_3ab4

    L_39dd:
         .byte $31,$32,$4a,$4b,$42
        .byte $41,$45,$20,$00,$00,$01,$01

    L_39e9:
        .byte $02,$02,$02,$00
        .byte $01,$00,$01,$00,$01,$02

    L_39f3:
        lda #$00
        sta cCia1DDRA
        lda cCia1PortA
        and #$10
        beq L_39d5
    L_39ff:
        lda #$01
        bit vIRQFlags
        beq L_39ff
        sta vIRQFlags
        lda vScreenControl1
        and #$7f
        sta vScreenControl1
        rts 


    L_3a12:
        lda #$c0
        sta $fd
        lda #$00
        sta $fb
        lda #$04
        sta $fc
        lda #$07
        sta $fe
        ldy #$27
        lda #$2a
    L_3a26:
        sta ($fb),y
        sta ($fd),y
        dey 
        bpl L_3a26
        ldx #$18
    L_3a2f:
        ldy #$00
        sta ($fb),y
        ldy #$27
        sta ($fb),y
        pha 
        lda $fb
        clc 
        adc #$28
        sta $fb
        bcc L_3a43
        inc $fc
    L_3a43:
        pla 
        dex 
        bne L_3a2f
        rts 


    L_3a48:
        lda #$28
        sta $fb
        lda #$d8
        sta $fc
        ldx #$17
    L_3a52:
        ldy #$28
        lda ($fb),y
        ldy #$00
        sta ($fb),y
        lda $fb
    L_3a5c:
        clc 
        adc #$28
        sta $fb
        bcc L_3a65
        inc $fc
    L_3a65:
        dex 
        bne L_3a52
        ldx #$27
        ldy #$01
    L_3a6c:
        lda ($fb),y
        dey 
        sta ($fb),y
        iny 
        iny 
        dex 
        bne L_3a6c
        ldx #$18
    L_3a78:
        lda $fb
        sec 
        sbc #$28
        sta $fb
        bcs L_3a83
        dec $fc
    L_3a83:
        ldy #$27
        lda ($fb),y
        ldy #$4f
        sta ($fb),y
        dex 
        bne L_3a78
        ldx #$27
        ldy #$27
    L_3a92:
        dey 
        lda ($fb),y
        iny 
        sta ($fb),y
        dey 
        dex 
        bne L_3a92
        inc L_0840 + $11
        lda L_0840 + $11
        and #$07
        bne L_3ab3
        lda ($fb),y
        and #$0f
    L_3aaa:
        clc 
        adc #$01
        cmp #$0b
        beq L_3aaa
        sta ($fb),y
    L_3ab3:
        rts 


    L_3ab4:
        lda L_0840 + $13
        sta $01
        lda L_0840 + $2
    L_3abc:
        sta L_0840 + $16
        lda L_0840
        and L_0840 + $3
        sta L_0840
        lda L_0840 + $4
        bne L_3ad3
        inc L_0840 + $4
        jmp L_8012
    L_3ad3:
        jmp L_8015
    L_3ad6:
        ldx #$07
        lda #$00
    L_3ada:
        sta L_0840 + $4,x
        dex 
        bpl L_3ada
        sta L_0840 + $14
        sta L_0840 + $3
        sta L_0840
        sta L_0840 + $1
    L_3aec:
        sta L_0840 + $2
        rts 


    L_3af0:
        jsr L_3d14
        bne L_3afa
        lda L_0840 + $14
        beq L_3b34
    L_3afa:
        clc 
        ldx #$16
        ldy #$08
        jsr $fff0
        ldy #$70
        jsr L_387d
        jsr L_3ced
        ldy #$00
        sty L_0840 + $17
        jsr L_c080
        rts 



        .byte $08,$d0,$09,$ad,$57,$08,$f0,$0c,$a9,$00,$f0,$00,$09,$30,$8d,$57

    L_3b23:
        .byte $08,$ea,$ea,$ea,$c8,$ca,$e0,$01,$d0,$03,$ee,$57,$08,$e0,$00,$d0
        .byte $dd

    L_3b34:
        rts 


    L_3b35:
        ldx #$00
        sty $fb
    L_3b39:
        lda L_0840 + $5,x
        cmp L_0800,y
        bne L_3b47
        iny 
        inx 
        cpx #$07
        bne L_3b39
    L_3b47:
        ldy $fb
        rts 


    L_3b4a:
        lda #$00
        ldy #$fe
    L_3b4e:
        sta.a $0001,y
        sta $01ff,y
        dey 
        bne L_3b4e
        nop 
        nop 
        tax 
        ldy #$80
        jsr $fd8c
        rts 


    L_3b60:
        ldx #$06
    L_3b62:
        lda #$1d
        jsr $ffd2
        jsr $ffd2
        lda L_3b88,x
        jsr $ffd2
    L_3b70:
        ldy #$7c
        jsr L_387d
        lda $3b8f,x
        tay 
        jsr L_387d
    L_3b7c:
        lda #$0d
        jsr $ffd2
        jsr $ffd2
        dex 
        bpl L_3b62
        rts 



    L_3b88:
         .byte $45,$41,$42,$4b
        .byte $4a,$32,$31,$51,$48,$3f,$36,$2d,$22,$17

    L_3b96:
        lda #$80
        sta L_0840 + $15
        lda #$ff
        sta cCia1DDRA
        lda #$00
        sta cCia1DDRB
        lda #$fd
        sta cCia1PortA
        lda cCia1PortB
        and #$80
        eor L_0840 + $15
        sta L_0840 + $15
        lda L_0840 + $1
        beq L_3bdf
        ldy #$04
    L_3bbc:
        lda L_3bf0,y
        sta cCia1PortA
        lda cCia1PortB
        and L_3bf5,y
        php 
        lda $3bfa,y
        plp 
        bne L_3bd2
        eor $3bfa,y
    L_3bd2:
        eor L_0840 + $15
        sta L_0840 + $15
        dey 
        bpl L_3bbc
        lda L_0840 + $15
        rts 


    L_3bdf:
        lda #$00
        sta cCia1DDRA
        ldx #$00
        nop 
        lda cCia1PortA,x
        and #$1f
        eor L_0840 + $15
        rts 



    L_3bf0:
         .byte $fd,$fd,$df,$df,$7f

    L_3bf5:
        bpl L_3bfb

        .byte $04,$20,$10,$02

    L_3bfb:
        .byte $01,$04,$08,$10,$ad,$42
        .byte $08,$cd,$56,$08,$f0,$24,$ad,$54,$08,$f0,$1f,$a2,$06,$a9,$00,$8d
        .byte $54,$08

    L_3c13:
        sta L_0840 + $5,x
        dex 
        bpl L_3c13
        ldx #$16
        ldy #$08
        clc 
    L_3c1e:
        jsr $fff0
        ldx #$1c
        lda #$20
    L_3c25:
        nop 
        nop 
        nop 
        dex 
        bpl L_3c25
    L_3c2b:
        rts 


    L_3c2c:
        ldy #$00
        lda L_0800
        beq L_3c35
        ldy #$07
    L_3c35:
        ldx #$00
        stx L_0840 + $17
    L_3c3a:
        lda L_0800 + $1,y
        bne L_3c48
        lda L_0840 + $17
        beq L_3c75
        lda #$00
        beq L_3c4b
    L_3c48:
        sta L_0840 + $17
    L_3c4b:
        asl 
        asl 
        sty $66
        tay 
        lda L_3c82,y
        sta SCREEN_BUFFER_1 + $00,x
        iny 
        lda L_3c82,y
        sta SCREEN_BUFFER_1 + $28,x
        inx 
        iny 
        lda L_3c82,y
        sta SCREEN_BUFFER_1 + $00,x
        iny 
        lda L_3c82,y
        sta SCREEN_BUFFER_1 + $28,x
        inx 
        ldy $66
        iny 
        cpx #$0e
        bne L_3c3a
        rts 


    L_3c75:
        cpx #$0c
        beq L_3c7d
        lda #$0a
        bne L_3c4b
    L_3c7d:
        lda #$00
        jmp L_3c4b

    L_3c82:
         .byte $c0,$c1,$d0,$d1,$c2,$c3,$d2,$d3
        .byte $c4,$c5,$d4,$d5,$c6,$c7,$d6,$d7,$c8,$c9,$d8,$d9,$ca,$cb,$da,$db
        .byte $cc,$cd,$dc,$dd,$ce,$cf,$de,$df,$e0,$e1,$f0,$f1,$e2,$e3,$f2,$f3
        .byte $a0,$a0

    L_3cac:
        ldy #$a0
    L_3cae:
        ldy #$00
        lda L_0800
        bne L_3cb7
        ldy #$07
    L_3cb7:
        ldx #$00
    L_3cb9:
        stx L_0840 + $17
    L_3cbc:
        lda L_0800 + $1,y
        bne L_3cca
        lda L_0840 + $17
        beq L_3cd9
        lda #$00
        beq L_3ccd
    L_3cca:
        sta L_0840 + $17
    L_3ccd:
        ora #$b0
        sta SCREEN_BUFFER_1 + $3e1,x
        iny 
        inx 
        cpx #$07
        bne L_3cbc
        rts 



    L_3cd9:
         .byte $e0,$06,$f0,$04,$a9,$a0,$d0,$ee,$a9,$00,$f0,$e8,$82,$93,$ab,$00

    L_3ce9:
        .byte $0c
        .byte $08

    L_3ceb:
        ora #$09
    L_3ced:
        lda L_0840 + $3
        beq L_3d12
        ldy #$01
        jsr L_3b35
        bcc L_3d01
    L_3cf9:
        ldy #$08
        jsr L_3b35
        bcc L_3d01
    L_3d00:
        rts 


    L_3d01:
        ldx #$00
    L_3d03:
        lda L_0800,y
        sta L_0840 + $5,x
        iny 
        inx 
        cpx #$07
        bne L_3d03
        stx L_0840 + $14
    L_3d12:
        beq L_3cf9
    L_3d14:
        ldx #$16
        ldy #$03
        clc 
        jsr $fff0
        ldy #$05
    L_3d1e:
        lda L_3d2b,y
        nop 
        nop 
        nop 
        dey 
        bpl L_3d1e
        lda L_0840 + $3
        rts 



    L_3d2b:
         .byte $92,$4b,$53
        .byte $49,$44,$12,$20,$50,$52,$4f,$47,$52,$41,$4d,$4d,$45,$44,$20,$41
        .byte $54,$20,$42,$45,$43,$4b,$2d,$54,$45,$43,$48,$20,$31,$39,$38,$34
        .byte $20,$42,$59,$20,$53,$49,$4d,$4f,$4e,$20,$43,$41,$53,$53,$49,$44
        .byte $59,$2e,$20,$50,$4f,$52,$54,$52,$41,$49,$54,$20,$47,$52

    L_3d6c:
        .byte $41,$50,$48,$49,$43,$53
        .byte $20,$42,$59,$20,$44,$4f,$4e,$4e,$41,$20,$53,$54,$45,$49,$4e,$45
        .byte $52,$2e,$20,$42,$4f,$4e,$55,$53,$20,$42,$41,$4e,$44,$49,$54,$20
        .byte $47,$41,$4d,$45,$20,$4c,$4f,$4f,$50,$20,$41,$4e,$44,$20,$4d,$45
        .byte $4e,$55,$20,$42,$59,$20,$4d,$49,$4b,$45,$20,$4e,$4f,$4c,$4c,$2e
        .byte $20,$4d,$55,$53,$49,$43,$20,$41,$4e,$44,$20,$53,$4f,$55,$4e,$44
        .byte $20,$42,$59,$20,$48,$45,$4e,$52,$59,$20,$53,$50,$52,$41,$47,$45
        .byte $4e,$53,$2e,$35,$36,$84,$4c,$44,$59,$81,$23,$31,$00,$11,$ee,$0c
        .byte $87,$53,$54,$59,$81,$46,$50,$41,$47,$2b,$24,$33,$46,$00,$0c,$f8
        .byte $0c,$87,$4a,$4d,$50,$81,$44,$49,$53,$00,$14,$02,$0d,$2e,$97,$81
        .byte $94,$83,$88,$a0,$83,$8c,$8f,$93,$85,$8c,$99,$00,$82,$95,$94,$94
        .byte $8f,$8e,$a0,$94,$8f,$a0,$8f,$90,$85,$8e,$ae,$00,$84,$85,$8d,$8f
        .byte $8e,$93,$94,$92,$81,$94,$89,$8f,$8e,$ba,$a0,$a0,$94,$81,$90,$a0
        .byte $a2,$92,$85,$93,$94,$8f,$92,$85,$a2,$a0,$86,$8f,$92,$a0,$8d,$85
        .byte $8e,$95,$00,$90,$8c,$81,$99,$85,$92,$a0,$b1,$a0,$95,$90,$ae,$a0
        .byte $90,$8c,$99,$92

    L_3e56:
        .byte $a3,$b2
        .byte $ba,$8c,$89,$96,$85,$93

    L_3e5e:
        ldy #$b5
        tsx 

        .byte $93,$83,$8f,$92,$85,$00,$82,$95,$94,$94,$8f,$8e,$a0,$86,$8f,$92
        .byte $a0,$92,$85,$90,$8c,$81,$99,$a0,$af,$a0,$a2,$92,$85,$93,$94,$8f
        .byte $92,$85,$a2,$a0,$86,$8f,$92,$a0,$8d,$85,$8e,$95,$a0,$a0,$00,$a0
        .byte $86,$8f,$92,$a0,$8d,$85,$8e,$95,$a0,$a0,$00,$0c,$70,$0d,$86,$53
        .byte $54,$41,$81,$4c,$4f,$58,$00,$12,$7a,$0d,$86,$4c,$44,$41,$81,$28
        .byte $4c,$4f,$42

    L_3eb4:
        .byte $59,$54,$29,$2c,$59,$00,$0d,$84,$0d,$86,$41,$4e,$44,$81,$23
        .byte $24,$46,$30,$00

    L_3ec7:
        ora L_0d80 + $e
        stx $45

        .byte $4f,$52,$81,$23,$24,$44,$30,$00,$0c,$98,$0d,$86,$42,$45,$51,$81
        .byte $2e,$39,$31,$00,$0d,$a2,$0d,$86,$41,$4e,$44,$81,$23,$24,$31,$30
        .byte $00,$0c,$ac,$0d,$86,$42,$45,$51,$81,$2e,$39,$31,$00,$0c,$b6,$0d
        .byte $86,$4c,$44,$41,$ff,$07
        .fill $31, $0
        .byte $fc

    L_3f34:
        .fill $2f, $0

    L_3f63:
        rti 

    L_3f64:
         .fill $13, $0

    L_3f77:
        .byte $62,$00,$00,$00,$00,$00,$00,$00,$00

    L_3f80:
        .fill $3f, $ff

    L_3fbf:
        .byte $f7

    L_3fc0:
        .fill $30, $ff

    L_3ff0:
        .byte $00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

    L_4000:
        .fill $fb, $0
        .byte $02,$0a,$0a,$2a,$2a,$00,$00,$aa,$aa,$aa,$aa,$aa,$aa,$00,$00,$00
        .byte $80,$a0,$a0,$a8,$a8

    L_4110:
        .fill $55, $0
        .byte $03,$03,$03,$03,$3f,$ff,$ff,$ff,$ff,$ff,$ff,$54,$55,$55,$55,$55
        .byte $55,$55,$57,$00,$40,$40,$50,$50,$50,$50,$d0

    L_4180:
        .fill $b8, $0
        .byte $2a,$2a,$2a,$2a

    L_423c:
        rol 
        asl 
        asl 

        .byte $02

    L_4240:
        tax 
        tax 
        tax 

        .byte $ab,$af,$af,$bf,$bf,$a8,$a8,$54,$55,$55,$55,$57

    L_424f:
        .byte $57,$00,$00,$00,$00
        .byte $c0,$f0,$fc,$fc

    L_4258:
        .fill $48, $0
        .byte $03,$03,$03,$03,$00,$00,$00,$00,$55,$55,$55,$57

    L_42ac:
        .byte $57,$57,$17,$07,$5f,$7f,$ff,$ff,$ff,$ff,$ff,$ff,$f4
        .byte $f5,$f5,$f5,$f5,$d5,$d5,$55,$00,$00,$c0,$c0,$f0,$f0,$f0,$f0

    L_42c8:
        .fill $4d, $0

    L_4315:
        .byte $03,$03,$0f,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$00,$00,$00,$00,$00
        .byte $c0,$c0,$c0,$00

    L_4329:
        .fill $57, $0
        .byte $ea,$ea,$ff,$ff,$ff,$ff,$3f,$3f,$fa,$ea,$aa,$aa,$aa,$aa,$aa,$aa
        .byte $fc,$fc,$fc,$fc,$fc,$fc,$f0,$f0
        .fill $50, $0
        .byte $03,$01,$01,$01,$01,$00,$00,$00,$f5,$55

    L_43f2:
        eor $55,x
    L_43f4:
        eor $55,x
        eor $15,x

        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

    L_4400:
        beq L_43f2
        beq L_43f4

        .byte $f0,$c0,$c0
        .fill $49, $0
        .byte $0f,$0f,$0f,$0f,$0f,$03,$03,$00,$ab,$af,$af,$bf,$bf,$ff,$fd,$55
        .byte $c0,$f0,$d4,$d5,$d5,$55,$55,$55
        .fill $58, $0
        .byte $0f,$03,$00,$00,$00,$00,$00,$00,$ff,$ff,$fc,$00,$00,$00,$00,$00
        .byte $c0,$00

    L_44d2:
        .fill $5e, $0
        .byte $0f,$03,$00,$00,$00,$00,$00,$00,$fc,$f0

    L_453a:
        .fill $5e, $0
        .byte $ff,$3f,$3f,$0f,$00,$00,$00,$00,$fc,$fc,$f0,$c0

    L_45a4:
        .fill $1ee, $0
        .byte $0f,$0a,$08,$0a,$09,$09,$00,$00,$ff,$aa,$00

    L_479d:
        tax 
        eor $54,x

        .byte $00,$00,$ff,$aa,$00,$aa,$55,$00,$00,$00,$ff,$aa,$00,$aa,$55,$55
        .byte $00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55
        .byte $00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55
        .byte $00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55
        .byte $00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55

    L_47f0:
        .byte $00,$00,$ff
        .byte $aa,$00,$aa,$55,$55

    L_47f8:
        .byte $00,$00,$ff

    L_47fb:
        tax 

    L_47fc:
         .byte $00

    L_47fd:
        tax 
    L_47fe:
        eor $55,x

    L_4800:
         .byte $00,$00,$ff
        .byte $aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff
        .byte $aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff
        .byte $aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff
        .byte $aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff
        .byte $aa,$00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55

    L_4850:
        .byte $00,$00,$ff
        .byte $aa

    L_4854:
        .byte $00
        .byte $aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff

    L_4863:
        tax 

        .byte $00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa
        .byte $00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa
        .byte $00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$55,$55,$00,$00,$ff,$aa
        .byte $00,$aa,$55,$55,$00,$00,$ff,$aa,$00,$aa,$50,$40,$00,$00,$ff,$aa
        .byte $00,$aa,$15,$05,$00,$00,$00,$80,$80,$80,$80,$80
        .fill $20, $0
        .byte $09,$09,$09,$09,$09,$09,$09,$09,$50,$53,$53,$53

    L_48dc:
        rti 
        rti 
        rti 

        .byte $52,$54,$55,$55,$55,$c1,$00,$00,$8d,$15,$15,$15,$d5,$05,$05,$05
        .byte $15,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55
        .byte $55

    L_4900:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_4920:
        eor $55,x
    L_4922:
        eor $55,x
    L_4924:
        eor $55,x
    L_4926:
        eor $55,x
    L_4928:
        eor $55,x
    L_492a:
        eor $55,x
    L_492c:
        eor $55,x
    L_492e:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_4940:
        eor $55,x
    L_4942:
        eor $55,x
    L_4944:
        eor $55,x
    L_4946:
        eor $55,x
    L_4948:
        eor $55,x
    L_494a:
        eor $55,x
    L_494c:
        eor $55,x
    L_494e:
        eor $55,x
    L_4950:
        eor $55,x
    L_4952:
        eor $55,x
    L_4954:
        eor $55,x
    L_4956:
        eor $55,x
    L_4958:
        eor $55,x
    L_495a:
        eor $55,x
    L_495c:
        eor $55,x
    L_495e:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_4980:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_49a0:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_49b0:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_49d0:
        eor $55,x
    L_49d2:
        eor $55,x

    L_49d4:
         .byte $54,$54,$54

    L_49d7:
        eor $05,x
    L_49d9:
        ora $15,x
    L_49db:
        ora $04,x

    L_49dd:
         .byte $00,$00

    L_49df:
        plp 
    L_49e0:
        cmp ($f1,x)
        sbc $fd,x

        .byte $30,$00,$00,$f1,$80,$80,$80,$80,$80,$80,$80,$80

    L_49f0:
        .fill $20, $0
        .byte $09,$09,$09,$09,$09,$09,$09,$09,$53,$53,$50,$54,$54,$55,$54,$54
        .byte $ff,$ff,$fc,$00,$00,$55,$00,$00,$15,$15,$15,$55,$55,$55,$00,$00
        .byte $55,$55,$55,$55,$55,$55,$00,$00,$55,$55,$55,$55,$55,$55,$00,$00
        .byte $55,$55,$55,$55,$55,$55,$00,$00,$55,$55,$55,$55,$55,$55,$00,$00
        .byte $55,$55,$55,$55,$55,$55,$05,$05
        .fill $18, $55

    L_4a70:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_4a8a:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_4b00:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x

    L_4b18:
         .byte $3f,$3f,$0f
        .byte $40,$50,$55,$55,$55,$f1,$c1,$c1,$05,$15,$55,$55,$55,$80,$80,$80
        .byte $80,$80,$80,$80,$80
        .fill $20, $0

    L_4b50:
        ora #$09
        ora #$09
        ora #$09
        php 
        php 

        .byte $54,$43,$43,$4e,$4e,$4e,$0e,$3a,$00,$ff,$aa,$82,$aa,$aa,$aa,$aa
        .byte $00,$ff,$aa,$ab,$ff,$aa,$aa,$aa,$00,$ff,$aa,$ea,$fe,$bf,$af,$aa
        .byte $00,$ff,$aa,$aa,$aa,$aa,$aa,$ab,$00,$ff,$aa,$82,$aa,$aa,$aa,$ea
        .byte $00,$ff,$aa,$0a,$aa,$aa,$aa,$aa,$01,$f1,$b0,$bc,$bc,$af,$ab,$ab
        .byte $55,$55,$55,$55,$15,$15,$00,$00,$55,$55,$55,$55,$55,$55,$00,$00
        .byte $55,$55,$55,$55,$55,$55,$00,$00,$55,$55,$55,$55,$55,$55,$15,$05
        .byte $55,$55,$55,$55,$55,$55,$54,$50,$55,$55,$55,$55,$54,$50,$00,$03
        .byte $55,$55,$55,$55,$01,$f1,$f8,$fc,$55,$55,$55,$55,$55,$55,$55,$15
        .fill $14, $55
        .byte $54,$50,$50,$40,$55,$55,$55,$55,$01,$00,$78,$78,$55,$55,$55,$55
        .byte $55,$55,$15,$15

    L_4c00:
        .fill $3d, $55
        .byte $54,$50,$40,$55,$55,$55,$55,$00,$00,$00,$3f,$55,$55,$55,$55

    L_4c4c:
        eor $55,x
        ora $05,x
    L_4c50:
        eor $55,x
        eor $55,x
        eor $55,x

        .byte $50,$40,$55,$55,$55,$55,$55,$55,$05,$01,$55,$55,$55,$55,$55,$55
        .byte $55,$55,$80,$80,$80,$80,$80,$80,$80,$80

    L_4c70:
        .fill $20, $0
        .byte $08,$08,$08,$08,$08,$08,$08,$08,$3a,$3a,$ea,$ea,$ea,$ea,$3a,$3a
        .byte $aa,$aa,$af,$ac,$bc,$b0,$f0,$f0,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ea,$ea,$ea,$ea,$ea,$ea,$ab,$ab,$aa,$aa,$aa,$aa,$aa,$aa
        .byte $aa,$bf,$b0,$b0,$b0,$b0,$b0,$b0,$aa,$ea,$3a,$0e,$0f,$07,$00,$00
        .byte $ab,$a8,$a1,$87,$af,$3e,$3a,$bb,$00,$bf,$fe,$ea,$aa,$aa,$aa,$ea
        .byte $00,$ff,$aa,$aa,$aa,$aa,$aa,$aa,$00,$ff,$af,$aa,$be,$ae,$af,$ab
        .byte $01,$a0,$e8,$f8,$b8,$a8,$a8,$a8,$00,$3f,$3f,$35,$35,$35,$35,$35
        .byte $0d,$f5,$d5,$55,$7d,$f5,$55,$55,$5e,$57,$57,$d5,$55,$55,$55,$5f
        .byte $00,$00,$ff,$7f,$55,$55,$55,$f5

    L_4d18:
        asl 

        .byte $02,$f0,$fc,$57,$55,$5c,$55,$50,$50,$53,$13,$03,$83,$83,$83,$01
        .byte $07,$ff,$fd,$55,$55,$55,$55,$fd,$d5,$55,$55,$55,$55,$75,$77,$00
        .byte $00,$40,$ff,$55,$55,$55,$f5

    L_4d40:
        .byte $02,$00,$00,$fc,$7f,$57
        .byte $55,$55,$55,$55,$05,$01,$c0,$f0,$ac,$af,$55,$55,$55

    L_4d53:
        .byte $54,$50,$10,$03,$03
        .byte $a0,$80,$03,$0f,$35,$d5,$d5,$55,$00,$00,$ff,$55,$55,$55,$55,$55
        .byte $00,$00,$ff,$57,$55,$fd,$5d,$5f,$0a,$02,$c0,$f0,$7c,$5f,$57,$55
        .byte $80,$8f,$8d,$0d,$0d,$0d,$cf,$c3,$f7,$55,$55,$55,$55,$55,$55,$55
        .byte $c0,$c0,$ff,$7f,$7d,$75,$55,$55,$00,$3f,$ff,$55,$55,$55,$55,$55
        .byte $00,$f0,$ff,$5f,$55,$7d,$5d,$5f,$15,$05,$01

    L_4da3:
        cmp ($f0,x)

        .byte $b0,$ac,$ac,$80,$80,$80,$80,$80,$80,$80,$80
        .fill $20, $0
        .byte $08,$08,$08,$08,$09,$09,$09,$09

    L_4dd8:
        .byte $3f,$00,$00,$00,$00
        .byte $40

    L_4dde:
        .byte $41,$55,$c0,$01,$05,$15,$15,$55,$55,$55,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$ce,$cf,$c3,$c3,$c0,$c0,$c0,$c0,$ff,$ff,$ff,$0c,$00,$00
        .byte $50,$14,$b0,$34,$35,$35,$35,$35,$35,$35,$00,$00,$00,$40,$50,$54
        .byte $55,$55,$7a,$3a,$3a,$3a

    L_4e14:
        asl.a $000f,x

        .byte $03,$ea,$aa,$ab,$aa,$bc,$ff,$f0,$e0,$be,$ff,$e7,$0f,$0e,$fc,$00
        .byte $02,$aa,$aa,$fa,$fe,$38,$00,$00,$98,$a8,$a8,$a9,$29,$29,$29

    L_4e36:
        and #$29

        .byte $3a,$3a,$0e,$43,$43,$43,$43,$43,$55,$55,$55,$51,$5d,$4f,$02,$00
        .byte $5e,$5e,$5e,$4e,$4e,$0e

    L_4e4e:
        asl L_1d00 + $e
        ora L_0d00 + $f,x
        ora L_0c00 + $d

        .byte $0c,$55,$55,$55,$55,$55,$fd,$bf,$00,$43,$43,$43,$43

    L_4e64:
        rti 
        rti 
        jmp $5504

        .byte $55,$d5,$d5,$d4,$d5,$df,$dc,$57,$57,$57,$57,$53,$53,$43,$c3,$fd
        .byte $87,$83,$83,$83,$83,$83,$83,$55,$7d,$57,$d7,$57,$55,$d3,$c3,$57
        .byte $57,$57,$55,$55,$54,$f4,$e0,$03,$cd,$4d,$4c,$4c,$cc,$cc,$cc,$55
        .byte $55,$55,$55,$54,$44,$f4,$f4,$55,$7f,$70,$c0,$c0,$ff,$75,$3d,$55
        .byte $d5,$35,$0d,$0d,$f1,$5d,$f5,$55,$55,$55,$55,$55,$5d,$fd,$f4,$f3
        .byte $70,$30,$70,$30,$30,$30,$30,$55,$d5,$d5,$d5,$f7,$cf,$cd,$c0,$55
        .byte $55,$57,$57,$4c,$4c,$4c,$0c,$55,$55,$f5,$0d,$03,$03,$00,$00,$57
        .byte $55,$55,$55,$57,$5f,$50,$d0,$5c,$5c,$5c,$5c,$dc,$dc,$0c,$00,$80
        .byte $80,$80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$ff

    L_4ef8:
        .fill $18, $0
        .byte $09,$09,$09,$09,$09,$09

    L_4f16:
        ora #$09
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x

        .byte $00,$00,$00,$00,$00,$00,$00,$00,$c2,$ca,$ca,$ca,$eb,$ea,$eb,$ea
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$35,$35,$35,$35

    L_4f44:
        lda $b5,x
    L_4f46:
        lda $b5,x

    L_4f48:
         .byte $54,$54,$50,$50,$50,$50,$50,$50,$0f
        .byte $3e,$3a,$fa,$ea,$ea,$ea,$ea,$aa,$ff,$ff,$fe,$fa,$f0,$fa,$f8,$aa
        .byte $fa,$fe,$8e,$0e,$2e,$8e,$0e,$fc,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$29
        .byte $29,$29,$f9,$f9,$f9,$f9,$f9,$43,$43,$43,$43,$43,$43,$43,$43,$00
        .byte $0f,$0f,$0f,$0f,$3f,$3f,$3f,$0e,$3e,$fe,$fe,$fe,$fe,$fe,$ff,$0c
        .byte $0c,$0c,$0c,$0c,$0c,$0c,$f0,$00,$00,$0c,$3f,$3f,$ff,$ff,$ff,$0c
        .byte $84,$8c,$a8

    L_4fa4:
        ldy L_acac
        ldy $c0c0

        .byte $c2,$c2,$c2,$c2,$ca,$ca,$03,$03,$83,$a3,$ab,$ab,$ab,$ab,$83,$83
        .byte $83,$83,$83,$83,$83,$83,$00,$00,$00,$03,$0f,$0f,$3f,$3f,$00,$00
        .byte $00,$30,$f0,$ff,$ff,$ff,$cc,$cc,$cc,$cc,$cc,$ce,$cc,$ce,$00,$00
        .byte $30,$f0,$3c,$ff,$ff,$ff,$00,$00,$3f,$c0,$c0,$c5,$c5,$81,$00,$00
        .byte $ff,$00,$00,$50,$50,$43,$00,$00,$ff,$00,$0f,$bf,$fa,$ea,$30,$30
        .byte $f0,$00,$00,$c0,$f0

    L_4fff:
        .byte $70,$c0,$fc,$fc,$ff,$ff,$ff,$ff,$ff,$0c,$0c
        .byte $8c,$8d,$ad,$ad,$ad,$ad,$00,$10,$54,$55,$55,$55,$55,$55,$3f,$3f
        .byte $00,$00,$40,$55,$55,$55,$f0,$c1,$01,$05,$15,$55,$55,$55,$80,$83
        .byte $83,$8f,$8f,$8f,$8f,$8f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

    L_5038:
        cpy #$f0
    L_503a:
        beq L_5038

        .byte $fc,$fc,$fc,$fc,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$09,$09,$09,$09,$09,$09,$09,$09,$55,$55,$55,$55
        .byte $54,$54,$54,$54,$54,$50,$50,$40,$03,$03,$03,$03,$00,$03,$0f,$fe
        .byte $ea,$aa,$aa,$aa,$ea,$ea,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$aa,$ab,$aa
        .byte $aa,$aa,$aa,$aa,$b5,$bd,$af,$eb,$aa,$aa,$aa,$aa,$50,$50,$50,$d0
        .byte $b0,$ac,$bc,$bc,$ea,$ea,$ea,$ea,$ea,$3a,$3e,$0f,$be,$af,$aa,$aa
        .byte $be,$ab,$aa,$aa,$ae,$fe,$aa,$aa,$aa,$fe,$aa,$aa,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$b9,$b9,$bf

    L_50b3:
        .byte $af,$ab,$ab,$ab,$ab,$43,$43,$83,$83,$83,$83,$83,$83,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$ff,$ab,$a0,$aa,$aa,$aa,$aa,$aa,$af,$e2,$02,$aa
        .byte $aa

    L_50d4:
        tax 
        tax 
        tax 

        .byte $ff,$aa,$aa

    L_50da:
        tax 
        tax 

        .byte $ab,$af

    L_50de:
        ldx $acf8,y
        clv 
        bcs L_50d4
        cpy #$c0

        .byte $00,$00,$ea,$ea

    L_50ea:
        nop 
        nop 
    L_50ec:
        nop 
        nop 
        nop 
        nop 

        .byte $ab,$ab

    L_50f2:
        tay 
        tax 
        tax 
        tax 
        tax 
        ldx L_f8c0 + $c

        .byte $02,$aa,$aa,$aa

    L_50fe:
        tax 
        tax 
    L_5100:
        rol 
        tax 
        tax 
        tax 
        tax 
        tax 
        tax 

        .byte $ab,$aa,$aa,$aa,$ab,$af,$af,$bc,$f0,$ce,$ce,$ce,$ce

    L_5114:
        .byte $87,$87,$03,$00
        .byte $aa,$aa,$aa,$aa,$aa,$ab,$eb,$fa,$b0,$bc,$ab,$aa,$aa,$aa,$fa,$bf
        .byte $0b,$2f,$fe,$aa,$aa,$aa,$aa,$aa,$ea,$aa,$aa,$aa,$aa,$aa,$aa,$ab
        .byte $b0,$b0,$b0,$b0,$b0,$c0,$c0,$00,$ea,$ea,$ea,$ea,$ea,$ea,$ea,$eb
        .byte $ad,$ad,$ad,$ad,$ad,$ad,$fd,$fd,$55,$55,$55,$55,$55,$55,$55,$55
        .byte $55

    L_5159:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $83,x

        .byte $83,$80,$80,$80,$80,$80,$80,$ff,$ff,$fe,$fa,$0a,$15,$15,$15,$a0
        .byte $ac,$ac,$af

    L_517c:
        .byte $ff,$ff,$ff,$ff,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$00,$00,$09,$09,$09,$09,$09,$09,$09,$09,$54,$54,$54,$54
        .byte $54,$55,$55,$55,$03,$00,$00,$00,$00,$55,$55,$55,$ff,$00,$00,$00
        .byte $00,$55,$55,$55,$ff,$00,$00,$00,$00,$55,$55,$55,$ff,$00,$00,$00
        .byte $00,$55,$55,$55,$ff,$00,$00,$00,$00,$55,$55,$55,$fc,$00,$00,$00
        .byte $00,$55,$55,$55,$03,$00,$00,$00,$00,$55,$55,$55,$ff,$00,$00,$00
        .byte $00,$55,$55,$55,$ff,$00,$00,$00,$00,$55,$55,$55,$ff,$00,$00,$00
        .byte $00,$55,$55,$55,$ff,$00,$00,$00,$00,$55,$55,$55,$03,$03,$03,$03
        .byte $03,$43,$43,$43,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$00,$00,$00,$00,$00,$55,$55,$55,$00,$00,$00,$00
        .byte $55,$55,$55,$55,$00,$00,$00,$50,$50,$50,$50,$50,$ea,$ea

    L_522a:
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 

        .byte $ab,$ab,$ab,$ab,$ab,$ab,$ab,$ab,$ff,$c0,$c0,$c0,$c0,$c5,$d5,$d5
        .byte $ff,$00,$00,$00,$00

    L_5245:
        eor $55,x
    L_5247:
        eor $c0,x

        .byte $00,$00,$00,$00,$55,$55,$55,$00

    L_5251:
        .byte $50,$50,$54

    L_5254:
        eor $55,x
        eor $55,x

        .byte $3f,$07,$00,$00,$00,$50,$50,$55,$aa,$ff,$00,$00,$00,$00,$00,$55
        .byte $aa,$ff,$00,$00,$00,$00,$00,$55,$fe,$e8,$00,$00,$01,$05,$05,$55
        .byte $00,$00,$00,$40,$50,$50,$50,$55,$ea,$ff,$00,$00,$00,$00,$00,$55
        .byte $ad,$fd,$01,$01,$01,$01,$01,$55,$55,$55,$55,$55,$55,$55,$55,$55
        .byte $55,$55

    L_529a:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x

        .byte $80,$80,$80,$80,$80,$80,$80,$80,$3f,$0f,$0f,$03,$00,$00,$00,$00
        .byte $ff,$ff,$fc,$fc,$f0
        .fill $13, $0
        .byte $09,$09,$09,$09,$09,$09,$09,$09,$55,$55,$55,$55,$55,$55,$55,$54
        .byte $55,$55,$55,$55,$55,$55,$05,$01
        .fill $50, $55
        .byte $43,$43,$4f,$4e,$4e,$0e,$3e,$3a,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ae,$ae,$ae,$ee,$ee,$ae,$ae,$ae,$55,$55,$55,$55,$55

    L_5355:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $50,x

        .byte $50,$50,$50,$53,$53,$43,$43,$ea,$ea,$ea,$ea,$ea,$ea,$aa,$aa,$ab
        .byte $ab,$ab,$ab,$bb,$bb,$ab,$ab,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$d5,$55
        .byte $55,$55,$55,$55,$55

    L_5386:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_53b8:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x

    L_53de:
         .byte $50,$40
        .byte $55,$55,$55,$55,$55,$55,$15,$05,$80,$80,$80,$80,$80,$80,$80,$80
        .fill $20, $0
        .byte $09,$09,$09,$09,$09,$09,$09,$09,$50,$53,$53,$53,$40,$40,$40

    L_541f:
        .byte $52,$54
        .byte $55,$55,$5f,$ff,$00,$00,$5f

    L_5428:
        ora $15,x
        ora $05
        ora $05
        ora $05
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $54,x

        .byte $50,$50,$50,$50,$50,$55,$fa,$ea,$ea,$ff,$00,$00,$00,$55,$aa,$aa
        .byte $aa,$ff,$00,$00,$00,$55,$ae,$ae,$ae,$ff,$00,$00,$01
        .fill $11, $55
        .byte $0f,$0e,$0e,$0f,$00,$00,$00,$55,$aa,$aa,$aa,$ff,$00,$00,$00,$55
        .byte $aa,$aa,$aa,$ff,$00,$00,$00,$55,$d5,$d5,$d5,$d5,$15,$15,$15,$55
        .byte $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$55

    L_54cd:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
    L_5503:
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $55,x
        eor $54,x

        .byte $54,$54,$55,$05,$15,$15,$15,$37,$00,$00,$3c,$c1,$f1,$f1,$f1,$a0
        .byte $00,$00,$f1,$80,$80,$80,$80,$80,$80,$80,$80

    L_5530:
        .fill $20, $0
        .byte $09,$09,$09,$09,$09,$09,$08,$0a,$53,$53,$50,$54,$55,$55,$00,$aa
        .byte $ff,$ff,$fc,$00,$00,$55,$00,$aa,$05,$05,$05,$15,$55,$55,$00,$aa
        .byte $55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa
        .byte $55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa
        .byte $55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa
        .byte $55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55

    L_55ae:
        .byte $00

    L_55af:
        tax 
    L_55b0:
        eor $55,x
        eor $55,x
        eor $55,x

        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa

    L_55c0:
        eor $55,x
        eor $55,x
        eor $55,x

        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$55,$55,$55,$55,$55,$55,$00,$aa,$55,$55,$55,$55,$55,$55
        .byte $00,$aa,$3f,$3f,$0f,$40,$50,$55,$00,$aa,$f1,$c1,$c5,$05,$15,$55
        .byte $00,$aa,$80,$80,$80,$80,$80,$80,$80,$80

    L_5670:
        .fill $20, $0
        .byte $0a,$0a,$0f,$00,$00,$00,$00,$00,$aa,$aa

    L_569a:
        .byte $ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00

    L_56c0:
        tax 
        tax 

        .byte $ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa
        .byte $ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa
        .byte $ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa
        .byte $ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa

    L_5702:
        .byte $ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa

    L_5752:
        .byte $ff,$00,$00,$00,$00,$00
        .byte $aa,$aa

    L_575a:
        .byte $ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa

    L_5772:
        .byte $ff,$00,$00,$00,$00,$00
        .byte $aa,$aa

    L_577a:
        .byte $ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$aa,$aa,$ff,$00,$00,$00,$00,$00
        .byte $aa,$aa,$ff,$00,$00,$00,$00,$00,$80,$80,$c0,$00

    L_57ac:
        .fill $ba, $0
        .byte $03,$03,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$00,$00,$00,$00,$f0,$fc
        .byte $ff,$ff

    L_5878:
        .fill $99, $0
        .byte $03,$03,$03,$03,$03,$03,$03,$00,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$00
        .byte $00,$00,$00,$00,$00,$0f,$3c,$00,$00,$00,$00,$00,$00,$c0,$f3,$00
        .byte $00,$00,$00,$00,$00,$fc,$ff,$00,$00,$00,$00,$00,$00,$3f,$3c

    L_5940:
        .byte $00,$00,$00,$00,$00,$00
        .byte $c0,$f0

    L_5948:
        .byte $00,$00,$00,$00,$00,$00,$f3,$f3,$00,$00,$00,$00,$00,$00
        .byte $c0,$f0,$00,$00,$00,$00,$00,$00,$c3,$cf,$00,$00,$00,$00,$00,$00
        .byte $fc,$0c
        .fill $38, $0
        .byte $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fe
        .byte $ff,$ff,$ff,$ff,$fa,$ea,$aa,$aa,$80,$80,$80,$80,$80,$f0,$fc,$ff

    L_59c0:
        .fill $90, $0
        .byte $03,$03,$03,$03,$03,$03,$00,$00,$c0,$c0,$c0,$c0,$c0,$ff

    L_5a5e:
        .byte $00,$00,$3c,$3c,$3c,$3c,$3c,$0f,$00,$00,$33,$33,$33,$33,$f3,$c3
        .byte $00,$00,$c3,$c3,$c3,$ff,$c3,$c3,$00,$00,$3c,$3c,$3c,$3c,$3c,$3f
        .byte $00,$00,$3c,$0c,$0c,$3c,$f0,$c0,$00,$00,$f3,$f3,$f3,$f3,$f3,$f3
        .byte $00,$00,$fc,$cf,$c3,$c0,$c0,$c0,$00,$00,$cf,$cf,$cf,$cf,$cf,$c3
        .byte $00,$00,$00,$00,$00,$3f,$0c,$fc
        .fill $3a, $0
        .byte $0f,$03,$03,$00,$00,$00,$00,$00,$fa,$fa,$fa,$fa,$3a,$0a,$0a,$0a
        .byte $aa,$aa,$aa,$aa,$aa,$a9,$55,$55,$95,$95,$95,$55,$55,$55,$55,$55
        .byte $00,$c0,$c0,$c0,$c0,$c0,$c0,$c0,$00

    L_5b09:
        .fill $8b, $0
        .byte $03,$03,$03,$03,$00,$00,$00,$fc,$cf,$c3,$c3,$c3

    L_5ba0:
        .fill $88, $0
        .byte $0f,$0f,$03,$03,$00,$00,$00,$00,$ff,$ff,$ff,$ff,$ff,$3f,$0f,$00
        .byte $ff,$ff,$ff,$ff,$fc,$f0,$c0,$00

    L_5c40:
        cpy #$c0

    L_5c42:
         .fill $8e, $0
        .byte $03,$03,$03,$03,$03,$03,$03,$00,$c3,$c3,$c3,$c3,$c3,$c3,$cf,$fc
        .byte $3c,$3f,$3f,$3c,$3c,$3c,$3c,$3c,$04,$04,$44,$44,$54,$14,$04,$04
        .byte $ff,$f0,$f0,$ff,$f0,$f0,$f0,$ff

    L_5cf8:
        cpy #$00

        .byte $00,$00,$00,$00,$00

    L_5cff:
        cpy #$f0

        .byte $fc,$ff,$f3,$f0,$f0,$f0,$f0,$03,$0f,$3f,$f3,$c3,$03,$03,$03,$cf
        .byte $cf,$cf,$cf,$cf,$cf,$cf,$cf

    L_5d18:
        .byte $3c,$3f,$3f,$3c,$3c,$3c,$3c,$3c,$03,$03,$c3,$f3,$3f,$0f,$03,$03
        .byte $3c,$3c,$3c,$3c,$3c,$3c,$3c,$0f,$0c,$0c,$0c,$0c,$0c,$0c,$3c,$f0

    L_5d38:
        .byte $ff,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$f3,$03,$03,$03,$03,$03,$03,$03
        .byte $ff,$c0,$c0,$fc,$c0,$c0,$c0,$ff,$00,$00,$00,$00,$00,$00,$0c,$0c
        .byte $00,$00,$00,$00,$00,$00,$cc,$cc,$00

    L_5d61:
        .fill $1df, $0

    L_5f40:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol 
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $76
        ror $26,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $a6
        rol 
        rol $26
        rol $26
        rol $16
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $76
        ror $d6,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        and ($2a,x)
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $d6
        dec $26,x
    L_5fc0:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $34
        rol $26,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $2c

        .byte $fc

    L_605d:
        bit $2626
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $f6
        bit $2626
        rol $26
        rol $26

        .byte $27,$27
        .fill $1e, $26
        .byte $27,$27,$26,$26,$26,$26,$26,$26,$2c,$bc,$bc,$bc,$bc,$bc,$bc,$bc
        .byte $26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26

    L_60c0:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $bc
        ldy $bcbc,x
        ldy $bcbc,x
        ldy $bcbc,x
        ldy L_c62b + $1,x
    L_60e0:
        dec $c6
        dec $c2
        bit L_c6bd + $9
        dec $c2
        bit $c226
        dec $c6

        .byte $c2,$c2,$c6,$c6,$c6,$c6,$2c,$26,$26,$26,$26,$26,$26,$26,$26,$26
        .byte $bc,$76,$2c

    L_6101:
        rol $bc
        ldy L_7cbc,x
        bit $c72c
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        dec $c6
        rol $26
        rol $26
        rol $26
        rol $26
        rol $27
        rol $27
        rol $27
        rol $27
        rol $2c
        rol $26
        rol $26
        rol $27

        .byte $27,$27,$26,$26,$26,$27,$26,$27,$26,$27,$76,$26,$27,$26,$26

    L_6144:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $27

        .byte $27,$27,$27,$27,$27,$27,$27,$26,$27,$26,$26
        .fill $11, $27
        .byte $26,$26,$26,$26,$3c,$fc
        .fill $15, $26
        .byte $27,$27,$26,$26

    L_6189:
        rol $26
        rol $27

        .byte $27,$26,$26,$27,$27
        .fill $15, $26
        .byte $27,$26,$27,$26,$26,$26,$27,$27,$26,$26,$26,$26,$26,$26,$26,$26
        .byte $26,$26,$26,$26,$26,$26

    L_61bd:
        rol $26
        rol $26
        rol $26
        and ($fc,x)
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26

        .byte $27,$27,$27,$26,$26,$27,$27,$27,$26,$26,$26,$26,$26,$26,$26,$26
        .byte $26,$26,$26,$26,$f6,$21
        .fill $90, $26
        .byte $23,$23,$25
        .fill $1f, $26
        .byte $2f,$26,$26,$26,$26,$26,$23,$e3,$e3
        .fill $1e, $26
        .byte $3f,$23
        .fill $1c, $26
        .byte $f6,$1f,$26,$26,$26,$26,$26,$26

    L_62e4:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        sbc ($f1),y
        ora ($f1,x)
        adc ($41,x)
        eor ($01),y
        sbc ($41),y
        sta ($01),y
        eor ($51,x)
        and ($f1,x)
        sbc ($11),y
        ora ($e1,x)
        eor ($11,x)
        eor ($f1),y
    L_6340:
        sbc ($f1),y
        sbc ($fa),y
        sbc ($f1),y
        sbc ($f1),y

        .byte $fa,$f1,$d1,$5a,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f7,$a7,$f1,$f1
        .byte $f1,$f1,$f1,$f1,$d1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$c1
        .byte $41,$fa,$f1,$f1,$fa,$f1,$f1,$41,$f1,$fa,$fa,$fa,$f1,$f1,$e1,$f1
        .byte $f1,$b1,$f1,$f1,$f7,$41,$f1,$f1,$fd,$f1,$f1,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$f1,$f4,$24,$54,$f1,$f1,$f1,$f1,$fa,$fa,$fa,$fa,$f1,$01,$f1
        .byte $fa,$f1,$fa,$f1,$f1,$81,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$fd
        .byte $4d,$41,$f1,$f1,$f1,$f1,$f1,$f1,$41,$f1,$f4,$f1,$f1,$f1,$f1,$e1
        .byte $f1,$f1,$41,$f1,$f1,$f1,$41,$f1,$fa,$fa,$fa,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$f1,$f1,$f1,$61,$51,$fd,$fd,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$61
        .byte $f1,$f1,$f1,$f3,$f3,$f1,$41,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$41,$41,$f1,$f1,$f1,$f1,$f1,$f1,$41,$f1,$f1,$f1,$f1,$f1,$f1
        .byte $e1,$f1,$f1,$f1,$f1,$f1,$f1,$41,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$f1,$f1,$f1,$f1

    L_640d:
        eor ($51),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($01),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        ora ($f1,x)
        sbc ($41),y
        sbc ($21),y
        adc ($f1,x)
        sta ($e1,x)
        ora ($f1),y
        sta ($f1),y
        sbc ($01),y
        sbc ($d1),y
        eor ($01),y
        ora ($f1,x)
        sbc ($01),y
        ora ($f1,x)
        eor ($f1),y
        sbc ($f1),y
        ora ($81,x)
        lda ($f1,x)
        ora ($81,x)

        .byte $ff,$d1,$0f,$f1,$01,$e1,$d1,$41,$b1,$c1,$41,$f1,$01,$91,$81,$41
        .byte $f1,$81,$41,$81,$d1,$01,$f1,$a1,$01,$f1,$c1

    L_645e:
        lda ($d1,x)
        sbc ($61),y
        sta ($fc,x)

    L_6464:
         .byte $af
        .byte $a1,$f1,$81,$f1,$41,$01,$fc,$9c,$a1,$f1,$21,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$21,$81,$41,$41,$f1,$f1,$e1,$f1,$e1,$f1,$f1,$41,$11,$a1,$e1
        .byte $31,$81,$f1,$f1,$e1,$b1,$fc,$fc,$f1,$f1,$11,$d1,$e1,$51,$01,$01
        .byte $f1,$01,$01,$41,$f1,$51,$c1,$01,$f1,$91,$01,$61,$f1,$f1,$b1,$f1
        .byte $e1,$e1,$f1,$91,$91,$b1,$41,$e1,$81,$41,$01,$01,$f1,$f1,$41,$f1
        .byte $61,$41,$81,$d1,$e1,$f1,$b1,$f1,$f1,$f1,$01,$e1,$f1,$01,$a1,$f1
        .byte $81,$81,$f1,$81,$f1,$91,$f1,$f1,$a1,$d1,$f1,$41,$a1,$a1,$f1,$51
        .byte $f1,$f1,$c1,$a1,$81,$41,$21,$f1,$e1,$01,$e1,$f1,$f1,$81,$21,$f1
        .byte $e1,$f1,$bc,$f1,$f1,$61,$a1,$f1,$a1,$db,$f1,$d1,$a1,$41,$51,$41
        .byte $f1,$f1,$21,$b1,$61,$f1,$b1,$01,$f1,$f1,$e1,$e1,$11,$f1,$a1,$a1
        .byte $f1,$1d,$0d,$f1,$d1,$01,$a1,$41,$31,$f1,$47,$e1,$21,$01,$f7,$01
        .byte $77,$f7,$11,$f7,$07,$01,$f7,$f1,$21,$61,$01,$f7,$27,$c1,$f7,$f1
        .byte $41,$91,$a1,$f7,$c1,$91,$81,$41,$4d,$ad,$ed,$ad,$e1,$f1,$f1,$81
        .byte $c1,$f1,$a1,$11,$f1,$a1,$a1,$41,$57,$f1,$a1,$d7,$f1,$a1,$a1,$41
        .byte $51,$a1,$d1,$f1,$d1,$81,$21,$f1,$01,$81,$f1,$a1,$11,$f1,$d1,$a1
        .byte $0d,$4d,$f3,$dd,$61,$f1,$81,$81,$81,$41,$d1,$01,$41,$e1,$b1,$61
        .byte $f1,$21,$01,$f7,$27,$b1,$91,$f1,$a1,$01,$f7,$f1,$f1,$61,$21,$f1
        .byte $71,$67,$f1,$a1,$11,$f1,$31,$81,$a1,$f3,$a3,$e3,$f1,$61,$01,$e1
        .byte $41,$11,$61,$e1,$41,$c1,$21,$81,$f1,$11,$81,$f7,$91,$c1,$d1,$f1
        .byte $91,$01,$f7,$41,$91,$f1,$91,$01,$b1,$f1,$21,$c1,$f1,$f1,$21,$81
        .byte $a1,$f1,$e3,$a3,$f1,$11,$ff,$81,$41,$f1,$e1,$e1,$f1,$e1,$f1,$f1
        .byte $61,$f1,$f1,$f1,$61,$f1,$f1,$f1,$41,$01,$f7,$81,$01,$f1,$f1,$81
        .byte $a1,$51,$e1,$f1,$f1,$e1,$81,$8f,$f1,$d1

    L_65cf:
        ora ($f1,x)
        and ($01,x)

        .byte $fc,$fc,$f1,$21,$01,$f1,$01,$01,$f1,$b1,$f1,$21,$41,$01,$01,$41
        .byte $21,$b1,$41,$f1,$f1,$e1,$f1,$01,$81,$21,$f1,$f1,$f1,$e1,$f1,$41
        .byte $9c,$01,$f1,$11,$01,$f1,$e1,$61,$f1

    L_65fc:
        and ($f1,x)
        sbc ($f1),y
        sbc ($91),y
        sbc ($11),y
        lda ($61,x)
        eor ($f1,x)
        cmp ($91,x)
        sbc ($c1),y
        eor ($41),y
        eor ($c1,x)
        sta ($e1,x)
        sbc ($01),y
        sbc ($f1),y
        sbc ($01),y
        ora ($f1,x)
        eor ($11),y
        eor ($51,x)
        sbc ($f1),y
        sbc ($51),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        ora ($51,x)
        sbc ($f1),y
        sbc ($f1),y
        sbc ($a1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc $f5,x
        sbc $f1,x
        sbc ($f1),y
        eor ($f1,x)
        sbc ($41),y
        sbc ($f1),y
        lda ($f1,x)
        sbc ($f1),y
        sbc ($f1),y
        sbc ($01),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc L_f1c0 + $3d,x
        eor ($f1,x)
        sbc ($e5),y
        sbc $f5,x
    L_665f:
        inc L_f1c0 + $31,x
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($01),y
        eor ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sta ($f1,x)
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($41),y
        sbc ($f1),y
        eor L_f1c0 + $3d
        ora ($f1),y
        sbc ($f5),y
        sbc $f1,x
        sbc ($fe),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        ora ($41,x)
        sbc ($f1),y
        sbc ($f1,x)
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($fd),y
        sbc ($f1),y
        sbc ($61),y
        eor ($f1),y
        inc $fefe,x
        inc L_f180 + $11,x
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($f1),y
        sbc ($41),y
        sbc ($f1),y
        eor ($f1,x)
        sbc ($41),y
        sbc ($f1),y

        .byte $fc,$f1,$f1,$f1,$41,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$f1,$f1,$f1,$f1,$01,$41,$f1,$f1,$e1,$f1,$f1,$f1,$f1,$f1,$f1
        .byte $f1,$f1,$f1,$f1,$f1,$f1,$51,$51,$fc,$f1,$f1,$f1,$f1,$d1,$f1,$f1
        .byte $f1,$f1,$01,$11,$f1,$91,$f1,$91,$41,$81,$71

    L_6700:
        eor ($d1,x)
        and ($91,x)
        sbc ($01),y
        adc ($f1,x)
        sta ($91,x)
        cmp ($f1,x)
        sbc ($91),y
        sbc ($f1),y

        .fill $30, $0

    L_6740:
        .fill $40, $ff

    L_6780:
        .fill $40, $0

    L_67c0:
        .fill $40, $ff

    L_6800:
        .fill $40, $0
        .fill $40, $ff

    L_6880:
        .fill $40, $0

    L_68c0:
        .fill $40, $ff

    L_6900:
        .fill $40, $0
        .fill $40, $ff

    L_6980:
        .fill $40, $0

    L_69c0:
        .fill $40, $ff

    L_6a00:
        .fill $40, $0

    L_6a40:
        .fill $40, $ff
        .fill $40, $0

    L_6ac0:
        .fill $40, $ff

    L_6b00:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_6bc0:
        .fill $40, $ff

    L_6c00:
        .fill $40, $0
        .fill $40, $ff

    L_6c80:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_6dc0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_6e80:
        .fill $40, $0

    L_6ec0:
        .fill $40, $ff

    L_6f00:
        .fill $40, $0
        .fill $40, $ff

    L_6f80:
        .fill $40, $0

    L_6fc0:
        .fill $40, $ff

    L_7000:
        .fill $40, $0

    L_7040:
        .fill $40, $ff
        .fill $40, $0

    L_70c0:
        .fill $40, $ff

    L_7100:
        .fill $40, $0

    L_7140:
        .fill $40, $ff

    L_7180:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_7240:
        .fill $40, $ff

    L_7280:
        .fill $40, $0

    L_72c0:
        .fill $40, $ff

    L_7300:
        .fill $40, $0

    L_7340:
        .fill $40, $ff

    L_7380:
        .fill $40, $0

    L_73c0:
        .fill $40, $ff
        .fill $40, $0

    L_7440:
        .fill $40, $ff

    L_7480:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_7540:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_7640:
        .fill $40, $ff
        .fill $40, $0

    L_76c0:
        .fill $40, $ff
        .fill $40, $0

    L_7740:
        .fill $40, $ff

    L_7780:
        .fill $40, $0

    L_77c0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_78c0:
        .fill $40, $ff

    L_7900:
        .fill $40, $0

    L_7940:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_7a40:
        .fill $40, $ff
        .fill $40, $0

    L_7ac0:
        .fill $40, $ff

    L_7b00:
        .fill $40, $0

    L_7b40:
        .fill $40, $ff

    L_7b80:
        .fill $40, $0
        .fill $40, $ff
        .fill $22, $26
        .byte $2a,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$76,$76
        .fill $12, $26
        .byte $a6,$2a,$26,$26,$26,$26,$26,$16

    L_7c4a:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $76
        ror $d6,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        and ($2a,x)
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $d6
        dec $26,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $34
        rol $26,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
    L_7cbc:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
    L_7d00:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $2c

        .byte $fc,$2c
        .fill $1d, $26
        .byte $f6,$2c,$26,$26,$26,$26,$26,$26,$27,$27
        .fill $1e, $26
        .byte $27,$27,$26,$26,$26,$26,$26,$26,$2c,$bc,$bc,$bc,$bc,$bc,$bc,$bc
        .fill $20, $26
        .byte $bc,$bc,$bc,$bc,$bc,$bc,$bc,$bc,$bc,$bc,$bc,$2c,$c6,$c6,$c6,$c6
        .byte $c2,$2c,$c6,$c6,$c6,$c2,$2c,$26,$c2,$c6,$c6,$c2,$c2,$c6,$c6,$c6
        .byte $c6,$2c,$26,$26,$26,$26,$26,$26,$26,$26,$26,$bc,$76,$2c,$26,$bc
        .byte $bc,$bc,$7c,$2c,$2c,$c7
        .fill $14, $c6
        .byte $26,$26,$26,$26,$26,$26,$26,$26,$26,$27,$26,$27,$26,$27,$26,$27

    L_7ded:
        rol $2c
        rol $26
        rol $26
        rol $27

        .byte $27,$27,$26,$26,$26,$27,$26,$27,$26,$27,$76,$26,$27,$26,$26,$26
        .byte $26,$26,$26,$26,$26,$26,$26,$26,$27,$27,$27,$27,$27,$27,$27,$27
        .byte $26,$27,$26,$26
        .fill $11, $27
        .byte $26,$26,$26,$26,$3c,$fc
        .fill $15, $26
        .byte $27,$27,$26,$26,$26,$26,$26,$27,$27,$26,$26,$27,$27
        .fill $15, $26
        .byte $27,$26,$27,$26,$26,$26,$27,$27
        .fill $14, $26
        .byte $21,$fc,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$27,$27,$27,$26
        .byte $26,$27,$27,$27,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26,$26
        .byte $f6,$21
        .fill $5e, $26

    L_7f03:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26

        .byte $23,$23,$25
        .fill $1f, $26
        .byte $2f,$26,$26,$26,$26,$26,$23,$e3,$e3,$26,$26,$26,$26,$26,$26,$26
        .byte $26,$26,$26,$26,$26,$26,$26,$26,$26

    L_7f70:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26

        .byte $3f,$23

    L_7f80:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        inc $1f,x
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
    L_7fc0:
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26
        rol $26

        .fill $18, $ff

    L_8000:
        cld 

        .byte $37,$bc,$fe,$01,$02,$03,$04,$05,$20,$84,$ff,$20,$87,$ff,$20,$81
        .byte $ff

    L_8012:
        jsr $8e30
    L_8015:
        jsr L_2000
        jsr L_9800
        lda #$12
        sta $0318
        lda #$80
        sta $0319
        ldx #$02
        lda L_0840 + $2
        bne L_802e
        ldx #$04
    L_802e:
        stx $f0
        stx $db
        lda #$00
        sta $5f
        sta $ee
        sta $50
        ldx #$10
    L_803c:
        sta L_0800,x
        dex 
        bpl L_803c
        lda #$04
        sta $5b
        sta L_080c + $1c
        lda #$10
        sta L_080c + $23
    L_804e:
        sta L_080c + $24
        lda L_0840 + $2
        clc 
        adc #$01
        cmp #$03
        bne L_806c
        lda #$10
        sta $5f
        sta L_080c + $4
        lda #$01
        sta L_0802
        sta $0809
        lda #$02
    L_806c:
        sta $d7
        sta $d8
        jmp $8260
    L_8073:
        ldy #$00
    L_8075:
        lda L_8081,y
        sta L_4800,y
        iny 
        bne L_8075
        jmp L_8181

    L_8081:
         .byte $e7,$00
        .byte $61,$66,$00,$e1,$f8

    L_8088:
        .byte $ff,$9f,$1f,$9f,$1f,$1f,$9f,$7f,$ff,$fc
        .byte $e0,$ec,$ec,$e0,$fc,$ff,$ff,$f3,$33,$c3,$03,$33,$c3,$0f,$ff,$ff
        .byte $f8,$fb,$fb,$f8,$ff,$ff,$ff,$3c,$30,$00,$0c,$30,$00,$c3,$ff,$ff
        .byte $1f,$df,$df,$1f,$ff,$ff,$ff,$cf,$c3,$cc,$c0,$c3,$cc,$f0,$ff,$3f
        .byte $07,$37,$37,$07,$3f,$ff,$ff,$f9,$f8,$f8,$f9,$f8,$f8,$fe,$ff,$e7
        .byte $00,$66,$86,$00,$67,$ef,$ff,$ce,$aa,$ae,$ca,$a8,$ab,$c2,$02,$92
        .byte $93,$91,$d8,$03,$ea,$aa,$ab,$80,$80,$02,$22,$2a,$aa,$aa,$14,$00
        .byte $40,$a8,$aa,$aa,$ee,$a4,$a4,$00,$c0,$f3,$ff,$ff,$ff,$7f,$1c,$8d
        .byte $3c,$00,$24,$24,$24,$00,$c3,$fe,$fc,$fc,$fc,$fc,$fc,$fc,$ff,$67
        .byte $f3,$03,$e1,$e1,$e1,$01,$0f,$fb,$f3,$f0,$f3,$f3,$f3,$f0,$fc,$1f
        .byte $cf,$01,$cd,$cd,$c1,$0f,$3f,$e0,$df,$d0,$cf,$cf,$cf,$c0,$f0,$7f
        .byte $1f,$1f,$1f,$1f,$3f,$3f,$ff,$81,$24,$60,$24,$24,$3c,$00,$c3,$fe
        .byte $f8,$f8

    L_8144:
        sed 
        sed 

    L_8146:
         .byte $fc,$fc,$ff,$07,$f3,$63,$f3,$f3,$f3,$03,$0f
        .byte $f8,$f3,$80,$b3,$b3,$83,$f0,$fc,$1f,$cf,$6f,$cf,$cf,$cf,$0f,$3f
        .byte $e0,$cf,$c0,$87,$87,$87,$80,$f0,$7f,$bf,$bf,$3f,$3f,$3f,$3f,$ff
        .byte $00,$3c,$7e,$3c,$42,$3c,$42,$3c,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

    L_8181:
        ldy #$00
    L_8183:
        lda L_8196,y
        sta L_4900,y
        eor #$ff
        sta L_4980,y
        iny 
        cpy #$80
        bne L_8183
        jmp L_8216

    L_8196:
         .byte $00,$80,$80
        .byte $c0,$c0,$e0,$e0,$f0,$00

    L_819f:
        ora ($01,x)

        .byte $03,$03,$07,$07,$0f,$f0,$f8,$f8,$fc,$fc,$fe,$fe,$ff,$0f,$1f,$1f
        .byte $3f,$3f,$7f,$7f,$ff,$f0,$78,$78,$3c,$3c,$1e,$1e,$0f,$0f,$1e,$1e
        .byte $3c,$3c,$78

    L_81c4:
        sei 

        .byte $f0,$00,$80,$c0,$e0,$f0,$f8,$fc,$fe,$00,$01,$03,$07,$0f,$1f,$3f
        .byte $7f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$f0,$f0,$f0,$f0,$f0,$f0,$f0
        .byte $f0,$c0,$e0,$70,$38,$1c,$fc,$f8,$00,$03,$07,$0e,$1c,$38,$3f,$1f
        .byte $00,$00,$00,$00,$00,$00,$ff,$ff,$00,$3c,$7e,$ff,$ff,$ff,$ff,$7e
        .byte $3c,$11,$11,$1f,$10,$70,$a0,$90,$08,$ff,$ff,$ff,$ff,$ff,$ff,$ff
        .byte $ff

    L_8216:
        ldy #$00
    L_8218:
        lda L_8238,y
        cpy #$10
        bpl L_8225
        sta L_49a0,y
    L_8222:
        iny 
        bpl L_8218
    L_8225:
        cpy #$20
        bpl L_822f
        sta L_49b0,y
        iny 
        bpl L_8218
    L_822f:
        sta L_49e0,y
        iny 
        cpy #$28
        bne L_8218
        rts 



    L_8238:
         .byte $fe,$fe,$fc,$f0,$c0,$00,$00,$00,$7f,$7f,$3f,$0f,$03,$00,$00,$00

    L_8248:
        .byte $07,$1f,$3f,$7f,$7f,$ff,$ff,$ff
        .byte $e0,$f8,$fc,$fe,$fe,$ff,$ff,$ff,$ff,$c1,$be,$a2,$ae,$a2,$be,$c1
        .byte $ad,$02,$dd,$09,$03,$8d,$02,$dd,$ad,$00,$dd,$29,$fc,$09,$02,$8d
        .byte $00,$dd,$a9,$00,$8d,$24,$d0,$ad,$11,$d0,$29,$6f,$09,$40,$8d,$11
        .byte $d0,$a9,$12,$8d,$18,$d0,$a9,$e6,$8d,$00,$14,$a9,$88,$8d,$01,$14
        .byte $a9,$a9,$8d,$02,$14,$a9,$89,$8d,$03,$14,$a9,$b0,$8d,$04,$14,$a9
        .byte $84,$8d,$05,$14,$a9,$91,$8d,$06,$14,$a9,$83,$8d,$07,$14,$a9,$be
        .byte $8d,$08,$14,$a9,$86,$8d,$09,$14,$a9,$9e,$8d,$0a,$14,$a9,$87,$8d
        .byte $0b,$14,$a9,$24,$8d,$0c,$14,$a9,$8c,$8d,$0d,$14,$a9,$18,$8d,$0e
        .byte $14,$a9,$8d,$8d,$0f,$14,$a9,$e0,$8d,$18,$03,$a9,$82,$8d,$19,$03
        .byte $a5,$50,$d0,$57,$a5,$5f,$29,$0c,$85,$66,$a9,$14,$85,$67,$a0,$00
        .byte $b1,$66,$85,$4e,$c8,$b1,$66,$85,$4f,$20,$31,$86,$20,$73,$80,$a0
        .byte $02,$b1,$66,$85,$4e,$c8,$b1,$66,$85,$4f,$20,$7e,$85,$a5,$5f,$29
        .byte $0c,$c9,$0c,$d0,$23,$a9,$ff,$8d,$57,$49,$8d,$5f,$49,$a5,$5f,$29
        .byte $02,$d0,$06,$a5,$5f,$49,$01,$85,$5f

    L_8329:
        jsr L_85b8
        lda $5f
        and #$02
        bne L_8338
        lda $5f
        eor #$01
        sta $5f
    L_8338:
        jmp L_9bf6 + $a
    L_833b:
        lda #$99
        sta $4e
        lda #$8a
        sta $4f
        jsr L_8631
        jsr L_8073
        lda #$65
        sta $4e
        lda #$8b
        sta $4f
        jsr L_857e
        lda #$00
        sta vSprEnable
        lda #$4b
        sta vScreenControl1
        lda #$0b
        sta vBackgCol3
        ldx #$00
        stx $50
    L_8367:
        lda L_8efb,x
        sta L_4800,x
        inx 
        bne L_8367
        ldy #$80
    L_8372:
        tya 
        sta SCREEN_BUFFER_1 + $60,x
        iny 
        inx 
        cpx #$08
        bne L_837e
        ldx #$28
    L_837e:
        cpx #$30
        bne L_8384
        ldx #$50
    L_8384:
        cpx #$58
        bne L_838a
        ldx #$78
    L_838a:
        cpx #$80
        bne L_8372
        jmp $9000

        .byte $2f,$1f,$01,$20,$24,$32,$20,$24,$32,$20,$24,$1f,$20,$24,$32,$20
        .byte $24,$32,$20,$24,$32,$03,$27,$b7,$a6,$b6,$17,$20,$24,$32,$20,$24
        .byte $32,$20,$24,$32,$20,$02,$21,$b1,$02,$a0,$b0,$15,$20,$24,$32,$f0
        .byte $02,$20,$24,$32,$20,$24,$04,$68,$17,$20,$24,$32,$20,$f2,$02,$22
        .byte $32,$20,$24,$32,$03,$61,$02,$21,$15,$22,$32,$20,$24,$04,$20,$24
        .byte $32,$20,$01,$67,$b7,$a6,$b6,$01,$23,$16,$20,$24,$32,$03,$20,$24
        .byte $32,$20,$24,$61

    L_83f5:
        .byte $b1,$02,$a0,$b0,$71,$16,$22,$32,$03,$f0,$02
        .byte $20,$24,$32,$02,$68,$03,$33,$17,$20,$01,$30,$20,$f2,$02,$22,$32
        .byte $20,$01,$61,$02,$21,$68,$68,$05,$63,$14,$22,$04,$20,$24,$b7,$a6
        .byte $b6,$01,$23,$68,$68,$1e,$20,$24,$32,$02,$a0,$b0,$71,$68,$06,$29
        .byte $63,$03,$29,$06,$28,$05,$29,$22,$32,$03,$f0,$02,$20,$68,$03,$33
        .byte $68,$1a,$20,$01,$30,$20,$f2,$02,$22,$02,$21,$68,$68,$05,$63,$18
        .byte $22,$04,$b6,$01,$23,$68,$68,$1f,$03,$20,$a0,$b0,$71,$68,$06,$29
        .byte $63,$04,$29,$07,$28,$06,$29,$01,$22,$32,$03,$f0,$01,$02,$33,$68
        .byte $1e,$20,$01,$30,$20,$f2,$01,$21,$68,$68,$05,$63,$1c,$22,$02,$23
        .byte $68,$68,$1f,$06,$71,$68,$06,$29,$63,$05,$29,$08,$28,$07,$29,$02
        .byte $22,$32,$03,$33,$68,$1f,$03,$20,$01,$30,$20,$68,$05,$63,$1f,$01
        .byte $22,$68,$1f,$0e,$29,$63,$06,$29,$09,$28,$08,$29,$03,$22,$32,$00
        .byte $0e,$0f,$0d,$02,$ef,$ef,$c7,$ef,$ee,$c8,$f2,$12,$f7,$ef,$c9,$f1
        .byte $11,$20,$11,$f6,$ee,$c2,$13,$c3,$d3,$00,$df,$d7,$c2,$13,$c3,$d2
        .byte $c0,$f1,$60,$df,$d5,$c2,$00,$72,$c3,$d0,$12,$91,$60,$df,$d6,$c1
        .byte $00,$71,$c4,$11,$20,$11,$e0,$60,$df,$d6,$c0,$b0,$00

    L_84ed:
        bvs L_8502
        cmp ($d1,x)

        .byte $00,$e2,$60,$df,$d7,$f0,$00

    L_84f8:
        cpy #$13
        cmp ($d0,x)
        cpy #$f1
        rts 



        .byte $f1,$d4,$2f

    L_8502:
        and $00

        .byte $72,$c1,$11,$91,$60,$f1,$d4,$9f,$95,$00,$71,$c2,$20,$11,$e0

    L_8513:
        rts 



        .byte $f0,$d6,$5e,$53,$c0,$b0,$00

    L_851b:
        .byte $70,$13,$00,$e2
        .byte $60,$f0,$df,$da,$f0,$00

    L_8525:
        cpy #$13
    L_8527:
        sbc ($60),y
        sbc ($d4),y

        .byte $2f,$29,$00,$72,$91,$60,$f1,$d4,$9f,$99,$00,$71,$c0,$10,$e0,$60
        .byte $f0,$d6,$5e,$57,$c0,$b0,$00

    L_8542:
        bvs L_8555
        sbc ($60,x)
    L_8546:
        beq L_8527
        dec.a $00f0,x
        cpy #$11
        rts 



        .byte $f1,$d4,$2f,$2d,$00,$70,$60

    L_8555:
        .byte $f1,$d4,$9f
        .byte $9d,$00,$70,$60,$f0,$d6,$5e,$5b,$c0,$b0,$00,$70,$60,$f0,$df,$df
        .byte $d2,$f0,$00

    L_856b:
        cpy #$f0

        .byte $d4,$2f,$2f,$21,$f0,$d4,$9f,$9f,$91,$d6,$5e,$5f,$c0,$b0,$ef,$ef
        .byte $e7

    L_857e:
        lda #$44
    L_8580:
        sta $69
        ldy #$00
        sty $68
        ldx #$04
        lda #$2f
    L_858a:
        sta ($68),y
        iny 
        bne L_858a
        inc $69
        dex 
        bne L_858a
        lda ($4e),y
    L_8596:
        sta SCREEN_BUFFER_1 + $1c5,y
        iny 
        cpy #$0e
        bcc L_8596
    L_859e:
        sta SCREEN_BUFFER_1 + $255,y
        iny 
        cpy #$20
    L_85a4:
        bcc L_859e
    L_85a6:
        sta SCREEN_BUFFER_1 + $2e1,y
        iny 
        cpy #$36
        bcc L_85a6
    L_85ae:
        sta SCREEN_BUFFER_1 + $369,y
        iny 
        cpy #$50
        bcc L_85ae
        ldy #$01
    L_85b8:
        lda #$43
        sta $69
        lda #$d9
        sta $68
        lda #$4e
        sta $6c
    L_85c4:
        lda ($4e),y
        sty $20
        beq L_862f
        cmp #$20
        bcc L_8613
        ldy #$27
        pha 
        lda $5f
        and #$08
        beq L_8600
        lda $5f
        and #$05
        beq L_85e4
        eor #$05
        beq L_85e4
        jmp L_8600
    L_85e4:
        ldy $6c
        dec $6c
        dec $6c
        bpl L_85f2
        ldy #$4e
        sty $6c
        ldy #$00
    L_85f2:
        pla 
        pha 
        and #$0f
        cmp #$0c
        bcs L_8600
        pla 
        eor #$01
        jmp L_8601
    L_8600:
        pla 
    L_8601:
        sta ($68),y
        inc $68
        bne L_8609
        inc $69
    L_8609:
        ldy $20
        iny 
        bne L_85c4
        inc $4f
        jmp L_85c4
    L_8613:
        tax 
    L_8614:
        dec $6c
        dec $6c
        bpl L_8620
        pha 
        lda #$4e
        sta $6c
        pla 
    L_8620:
        dex 
        bne L_8614
        clc 
        adc $68
        sta $68
        bcc L_862c
        inc $69
    L_862c:
        jmp L_8609
    L_862f:
        iny 
        rts 


    L_8631:
        ldy #$00
        lda #$4e
        sta $6c
        lda #$d9
        sta $68
        lda #$d7
        sta $69
    L_863f:
        lda ($4e),y
        cpy #$04
        bcs L_864c
        sta vBorderCol,y
        iny 
        jmp L_863f
    L_864c:
        sty $20
        pha 
        and #$0f
        tax 
        pla 
        lsr 
        lsr 
        lsr 
        lsr 
        ldy #$27
    L_8659:
        pha 
        lda $50
        bne L_867f
        lda $5f
        and #$08
        beq L_867f
        lda $5f
        and #$05
        beq L_8671
        eor #$05
        beq L_8671
        jmp L_867f
    L_8671:
        ldy $6c
        dec $6c
        dec $6c
        bpl L_867f
        ldy #$4e
        sty $6c
        ldy #$00
    L_867f:
        pla 
        sta ($68),y
        inc $68
        bne L_8688
        inc $69
    L_8688:
        pha 
        lda $50
        bne L_86ad
        lda $5f
        and #$0e
        eor #$0c
        bne L_86ad
        lda #$d9
        cmp $69
        bne L_86ad
        lda #$e1
        cmp $68
    L_869f:
        bne L_86ad
        lda #$8c
        sta $4f
        lda #$c3
        sta $4e
        ldy #$03
        sty $20
    L_86ad:
        lda #$dc
        cmp $69
        beq L_86bc
        pla 
        dex 
        bpl L_8659
        ldy $20
        iny 
        bne L_863f
    L_86bc:
        pla 
        rts 



        .byte $0c,$0b,$0c,$02,$c7,$f5,$b0

    L_86c5:
        eor L_f580 + $30,y

        .byte $c7,$c7,$f5,$b0,$59,$b0,$f5,$c7,$c3,$20,$b2,$f5,$b0,$59,$b0,$f5
        .byte $b0,$31,$b0,$c3,$c1,$22,$b2,$f5,$8b,$f5,$b0,$10,$e0,$b2,$c1,$c0
        .byte $21,$c0,$20,$b1,$c0,$f5,$8b,$f5,$b1,$e0,$b3,$c0,$21,$c1,$20,$b1
        .byte $c0,$ff,$f7,$b0,$70,$b5,$20,$c2,$20,$c0,$b0,$c0,$ff,$f7,$b7,$20
        .byte $c2,$20,$c0,$b0,$c0,$ff,$f7,$b7,$20,$c1,$21,$20,$b0,$cf,$c8,$b0
        .byte $90,$b3,$31,$20,$c1,$20,$b0,$2f,$26,$c3,$61,$b0,$80,$b1,$10,$e0
        .byte $20,$c0,$21,$b0,$20,$9f,$95,$c3,$f1,$b1,$c0,$b1,$e0,$20,$c0,$20
        .byte $b1,$c0,$90,$8d,$85,$c4,$f1,$b1,$c0,$b2,$22,$b1,$cf,$cc,$b0,$90
        .byte $c0,$b2,$21,$90,$b0,$2f,$29,$c3,$61,$c0,$b2,$21,$b1,$9f,$99,$c3
        .byte $00,$f0,$c0,$b0,$c0,$b0,$b3,$90,$8d,$89,$c4,$f1,$c0,$b0,$c0,$b0
        .byte $b1,$90,$cf,$cf,$c1,$b0,$20,$b0,$a0,$b0,$61,$c3,$2f,$2d,$20,$b0
        .byte $b1,$f1,$c3,$9f,$9d,$20,$b0,$b1,$f1,$c4,$8f,$8b,$90,$c0,$b0,$90
        .byte $cf,$cf,$c5,$b0,$61,$c3,$2f,$2f,$21,$f1,$c3,$9f,$9f,$91,$f1,$c4
        .byte $8f,$8f,$90,$cf,$cf,$c7,$2d,$0a,$28,$01,$29,$0e,$29,$02,$28,$09
        .byte $0a,$28,$01,$29,$0e,$29,$02,$28,$09,$03,$b7,$29,$05,$28,$01,$29
        .byte $0e,$29,$bb,$be,$28,$02,$f6,$26,$01,$36,$03,$02,$67,$77,$29,$02
        .byte $77,$02,$28,$01,$29,$01,$21,$0a,$20,$01,$29,$02,$28,$02,$ed,$fe
        .byte $02,$66,$02,$01,$67,$77,$01,$29,$05,$28,$01,$29,$01,$23,$0a,$22
        .byte $01,$29,$02,$28,$02,$e6,$04,$66,$01,$67,$77,$02,$29,$01,$3f,$01
        .byte $f1,$f6,$28,$01,$29,$be,$ba,$28,$01,$29,$02,$28,$01,$29,$02,$28
        .byte $01,$29,$02,$28,$02,$2d,$05,$66,$02,$3e,$01,$29,$21,$02,$f3,$e1
        .byte $28,$01,$29,$02,$28,$01,$29,$02,$28,$01,$29,$02,$28,$01,$29,$02
        .byte $28,$09,$02,$3d,$3e,$29,$23,$01,$a1,$e6,$e3,$28,$01,$29,$02,$28
        .byte $01,$29,$02,$28,$01,$29,$02,$28,$01,$29,$02,$28,$09,$02,$3e,$61
        .byte $33,$61,$01,$a3,$18,$70,$29,$04,$f6,$26,$02,$3e,$63,$3f,$63,$23
        .byte $14,$62,$04,$63,$22,$01,$2d,$02,$ed,$01,$02,$61,$33,$1c,$bc,$bc
        .byte $02,$20,$01,$e6,$01,$02,$63,$02,$a1,$01,$2d,$2d,$2d,$2d,$2d,$2d
        .byte $17,$22,$03,$01,$61,$33,$02,$a3,$1c,$70,$29,$04,$01,$63,$2d,$01
        .byte $23,$18,$62,$03,$f7,$f6,$22,$01,$3f,$02,$01,$33,$1f,$e6,$01,$f6
        .byte $02,$20,$01,$05

    L_889c:
        .byte $2d,$2d,$2d,$2d,$2d,$2d,$14,$03
        .byte $e6,$e7,$a0,$01,$22,$01,$02,$28

    L_88ac:
        and ($1f,x)
        ora ($a2,x)
        ora ($60,x)
        ora ($2d,x)
        ora ($23,x)

        .byte $62,$04,$63,$1c,$22,$62,$3f,$02,$bc,$bc,$1f,$05,$1f,$2d,$2d,$2d
        .byte $2d,$2d,$2d,$01,$a0,$01,$28,$21,$1f,$05,$a2,$01,$23,$62,$04,$63
        .byte $1f,$01,$22,$bc,$bc,$1f,$07,$1f,$02,$2d,$2d,$2d,$2d,$2d,$2d,$00
        .byte $0f,$0e,$0f,$08,$ff,$ff,$f7,$fd,$f0,$69,$f0,$fd,$f7,$35,$e0,$69
        .byte $e0,$35,$f7,$f7,$35,$cb,$35,$e0,$f1,$21,$f2,$f5,$e0,$80,$35,$cb
        .byte $35,$e2,$22,$f1,$f4,$e1,$80,$3f,$37,$e2,$20,$50,$21,$f0,$f3,$e0
        .byte $f0,$e0,$80,$3f,$37,$e0,$90,$e0,$20,$51,$21,$f2,$e1,$f0,$e0,$f0
        .byte $3f,$37,$e0,$90,$e0,$20,$52,$20,$f1,$e2,$80,$e0,$ff

    L_8933:
        sbc $21e1,y
        eor ($20),y
        cpx $8f
        stx $f4

        .byte $e2,$23,$e2,$f0,$e0,$80,$9f,$95,$f5,$e0,$90,$23,$e2,$f0,$e0,$f0
        .byte $90,$7f,$74,$f5,$e0,$90,$e0,$20,$f0,$20,$e2,$80,$e0,$ff,$fd,$e1
        .byte $22,$e2,$8f,$8a,$f4,$e2

    L_8962:
        and ($e0,x)

        .byte $f0,$e0,$80,$9f,$99,$f5,$e0,$90,$21,$e0,$f0,$e0,$f0,$90,$7f,$78

    L_8974:
        sbc $e0,x

        .byte $90,$e1,$e0,$80,$e0,$ff,$ff,$f1,$e2,$e0,$8f,$8e,$f4,$e2,$e0,$80
        .byte $9f,$9d,$f5,$e0,$90,$e0,$f0,$90,$7f,$7c,$f5,$e0,$90,$e0,$ff,$ff
        .byte $f5,$e0,$8f,$8f,$81,$f4,$e0,$9f,$9f,$91,$f5,$90,$7f,$7f,$70,$f5
        .byte $ff,$ff,$f7,$ac,$1f,$09,$0e,$37,$0a,$36,$0e,$07,$37,$18,$36,$02
        .byte $36,$04,$06,$37,$27,$06,$21,$0a,$20,$07,$36,$01,$28,$66,$03,$05
        .byte $37,$01,$61,$06,$23,$0a,$22,$08,$66,$28,$76,$66,$02,$04,$37,$02
        .byte $63,$1b,$28,$68,$76,$66,$01,$03,$37,$01,$21,$1d,$28,$68,$69,$76
        .byte $66,$02,$37,$02,$23,$01,$a1,$1b,$28,$68,$01,$69

    L_89f2:
        ora ($01,x)

        .byte $37,$03,$61,$01,$a3,$18,$20,$02,$32,$60,$a9,$69,$01,$67,$04,$63
        .byte $23,$14,$62,$04,$22,$03,$64,$68,$69,$01,$03,$21,$17,$77,$05,$20
        .byte $02,$32,$60,$69,$01,$03,$23,$01,$a1,$01,$ac,$ac,$ac,$ac

    L_8a22:
        ldy L_0e80 + $2c
        ror 
        ora $22

        .byte $03,$64,$02,$03,$61,$01,$a3,$1c,$20,$02,$32,$60,$01,$03,$63,$23
        .byte $18,$62,$04,$22,$03,$64,$01,$01,$21,$1b,$77

    L_8a43:
        ora $20

        .byte $02,$32,$01,$01,$23,$01,$a1,$01,$ac,$ac,$ac,$ac,$ac,$ac,$12,$6a
        .byte $05,$22,$04,$01,$61,$01,$a3,$1f,$01,$20,$03,$01,$63,$23,$1c,$62
        .byte $04,$22,$03,$1f,$77,$05,$20,$02,$01,$a1,$01,$ac,$ac,$ac,$ac,$ac
        .byte $ac,$16,$6a,$05,$22,$02,$01,$a3,$1f,$05,$20,$01,$23,$1f,$01,$62
        .byte $04,$22,$01,$1f,$02,$77,$05,$20,$01,$ac,$ac,$ac,$ac,$ac,$ac,$1a
        .byte $6a,$05,$22,$00,$bb,$b6,$b8,$b1,$bd,$5b,$bd,$bd,$50,$19,$50,$bd
        .byte $68,$e4,$50,$10,$57,$10,$50,$e4,$68

    L_8aae:
        pla 
        cpx $50
        bpl L_8b0a

        .byte $10,$50,$e4,$68,$68,$e4,$50,$10,$53,$23,$10,$50,$e4,$68,$68,$e4
        .byte $50,$10,$52,$24,$10,$50,$e4,$68,$68,$e4,$50,$19,$50,$e4,$68,$68
        .byte $e4,$5b,$e4,$68,$68,$ef,$e5,$68,$68,$ef,$e5,$68,$67,$bf,$b7,$67
        .byte $61,$8f,$8f,$83,$61,$60,$8f,$8f,$85,$60,$60,$2f,$2f,$25,$60,$61
        .byte $80,$91,$80,$91,$80,$91,$80,$91,$80

    L_8afc:
        sta ($80),y

        .byte $93,$80,$91,$80,$91,$80,$91,$80,$91,$80

    L_8b08:
        sta ($80),y
    L_8b0a:
        adc ($61,x)

        .byte $80

    L_8b0d:
        sta ($80),y
    L_8b0f:
        sta ($80),y
        sta ($80),y
        sta ($80),y
        sta ($80),y

    L_8b17:
         .byte $93,$80
        .byte $91,$80,$91,$80,$91,$80,$91,$80,$91,$80,$61,$61,$80,$91,$80,$91
        .byte $80,$91,$80,$91,$80,$91,$80,$93,$80,$91,$80,$91,$80,$91,$80,$91
        .byte $80,$91,$80,$61,$80,$7f,$7f,$75,$80,$80,$bf,$bf,$b5,$80,$90,$bf
        .byte $bf,$b5,$20,$90,$bf,$bf,$b5,$20,$90,$20,$bf,$bf,$b3,$90,$20,$90
        .byte $20,$bf,$bf,$b3,$90,$20,$bf,$bf,$b7,$bf,$bf,$b7,$2f,$1f,$09,$1f
        .byte $09,$1f,$09,$1f,$09,$1f,$09,$1f,$09,$1f

    L_8b73:
        ora #$1f
        ora #$1f
        ora #$1f
        ora #$08

        .byte $27,$16,$26,$08,$02,$27,$1f,$03,$26,$02,$01,$27,$1f,$05,$26,$01
        .byte $01,$30,$1f,$05,$31,$01,$03,$67,$66,$01,$67,$66,$01,$67,$66,$01
        .byte $67,$66,$01,$67,$66,$01,$67,$02,$66,$01,$67,$66,$01,$67,$66,$01
        .byte $67,$66,$01,$67,$66,$01,$67,$66,$03,$1f,$09,$03,$76,$77,$01,$76
        .byte $77,$01,$76,$77,$01,$76,$77,$01,$76,$77,$01,$76,$02,$77,$01,$76
        .byte $77,$01,$76,$77,$01,$76,$77,$01,$76,$77,$01,$76,$77,$03,$20,$2b
        .fill $24, $6c
        .byte $2a,$21,$22,$27,$1f,$05,$26,$23,$60,$70,$1f

    L_8c0a:
        ora $71
        adc ($62,x)

        .byte $72,$1f,$05,$73,$63,$01,$60,$70,$1f,$03,$71,$61,$01,$01,$62,$72
        .byte $1f,$03,$73,$63,$01,$00,$04,$03,$0f,$06,$6f,$6f,$67,$6f,$6f,$67
        .byte $6f,$6f,$67,$6d,$cb,$6d,$6d,$cb,$6d,$6d,$cb,$65,$a0,$f6,$6f,$62
        .byte $01,$6a,$a1,$05,$6f,$62,$01,$6a,$a1,$f5,$6f,$62,$01,$6a,$a1,$f0
        .byte $04,$f4,$a0,$65,$3f,$34,$a0,$f0,$04,$03,$a1,$65,$ef,$e5,$f0,$04
        .byte $f3,$a1,$60,$cf,$c9,$a0,$f0,$04,$02,$f0,$a1,$60

    L_8c6a:
        .byte $c5,$65,$01,$6f,$62,$02,$f0,$a0,$ff
        .byte $f8,$65,$a0,$f2,$02,$f0,$bf,$b9,$65,$a1,$01,$02,$f0,$a0,$cf,$cd
        .byte $60,$a1,$f1,$67,$00,$69,$01,$67,$c5,$60,$a1,$f0,$00,$f0,$a0

    L_8c92:
        adc $3f

        .byte $3c,$a0,$f0,$00,$a1,$65,$ef,$ed,$f0,$00,$a1,$60,$cf,$cf,$c1,$a0
        .byte $f0,$00

    L_8ca6:
        lda ($60,x)
        cmp $69
        ora ($69,x)

        .byte $00,$67,$a0,$ff,$ff,$f0,$65,$bf,$bf,$b1,$65,$a0,$cf,$cf,$c5,$60
        .byte $63,$00,$62,$00,$69,$01,$69,$00,$60,$c5,$60,$f2,$a1,$ff,$f8,$69
        .byte $01,$a1,$bf,$b9,$69,$f1,$a1,$a0,$cf,$cd,$64,$00,$f0,$a1,$63,$00
        .byte $69,$01,$67,$c5,$64,$00,$f0,$a0,$3c,$3f,$65,$a0,$f0,$00

    L_8cea:
        .byte $f0,$ed,$ef
        .byte $65,$a1,$00,$f0,$a0,$c1,$cf,$cf,$60,$a1,$67,$00,$69,$01,$69,$c5
        .byte $60,$a1,$65,$f0,$ff,$ff,$a0,$65,$b1,$bf,$bf,$60,$c5,$cf,$cf,$a0
        .byte $60,$c5,$60,$00,$69,$01,$69,$00,$62,$00,$63

    L_8d18:
        ldy L_0900 + $1f

        .byte $1f,$09,$1f,$09,$0e,$b8,$0a,$b9,$0e,$1f,$09,$0e,$b5,$bc,$bc,$bc
        .byte $bc,$fc,$fc,$bc,$bc,$bc,$bc,$b4,$06,$62,$ea,$e4,$e4,$e4,$e4,$e4
        .byte $e4,$07,$1a,$60,$7a,$64,$64,$64,$64,$64,$1f,$02,$62

    L_8d48:
        nop 
        cpx $e4
        cpx $e4
        cpx $07
        ora $02b0,y
        adc #$69
        adc #$69
        adc #$e5
        sbc $e5
        sbc $eb

        .byte $63,$06,$a3,$14,$32,$01,$69,$69,$69,$69,$69,$65,$65,$65,$7b,$61
        .byte $07,$b6,$16,$69,$69,$69,$69,$69,$e5,$e5,$e5,$eb,$63,$02,$b8,$04
        .byte $b9,$06,$ec,$ec,$06,$ac,$ac,$ac,$ac,$ac,$ac,$b2,$01,$69,$69,$69
        .byte $69,$69,$68,$68,$68,$02,$b1,$01,$b5,$fc,$bc,$bc,$bc,$b4,$1b,$68
        .byte $68,$68,$01,$73,$18,$a2,$0a,$68,$68,$68,$1a,$b7,$0a,$68,$68,$68
        .byte $01,$b3,$ac,$ac,$ac,$ec,$ac,$ac,$08,$ec,$ec,$08,$b8,$04,$b9,$05
        .byte $1d,$b5,$bc,$fc,$bc,$bc,$b4

    L_8dc3:
        .byte $00,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f
        .byte $1f,$18,$1f,$05,$62,$ea,$e4,$e4,$06,$1f,$60,$7a,$64,$1f,$06,$62
        .byte $ea,$e4,$05,$1f,$b0,$02,$69,$eb,$63,$06,$e3,$1c,$32,$01,$69,$61
        .byte $07,$f6,$1e,$69,$63,$02,$b8,$04,$f9,$ac,$09,$ec,$ec,$0a,$ec,$ac
        .byte $ac,$ac,$ac,$ac,$b2,$01,$69,$01,$b1,$01,$b5,$fc,$bc,$bc,$bc,$f4
        .byte $1f,$73,$1f,$01,$a2

    L_8e18:
        asl $1f

        .byte $02,$b7,$06,$b3,$ac,$ac,$ac,$ec,$ac,$ac,$01,$ec,$0a,$ec,$ec,$0a
        .byte $ec,$01,$b8,$04,$b9,$00,$ad,$0e,$dc,$29,$fe,$8d,$0e,$dc,$a5,$01
        .byte $29,$fb,$85,$01,$a9,$47,$85,$67

    L_8e42:
        lda #$00
        sta $66
        sta $6a
        ldx #$00
    L_8e4a:
        lda $6a
        beq L_8e54
        lda $d500,x
        jmp L_8e57
    L_8e54:
        lda sVoc1FreqLo,x
    L_8e57:
        jsr L_8eb0
        txa 
        and #$3f
        bne L_8e61
        inc $67
    L_8e61:
        asl 
        tay 
        lda $69
        sta ($66),y
        iny 
        sta ($66),y
        tya 
        clc 
        adc #$7f
        tay 
        lda $68
        sta ($66),y
        iny 
        sta ($66),y
        inx 
        bne L_8e4a
        inc $6a
        lda $6a
        cmp #$02
        beq L_8e84
        jmp L_8e4a
    L_8e84:
        ldx #$00
    L_8e86:
        lda $d1ff,x
        sta L_49f0 + $10,x
        lda $d2ff,x
    L_8e8f:
        sta L_4b00,x
        lda $d3ff,x
        sta L_4c00,x
        lda L_d4ff,x
        sta $4d00,x
        inx 
        bne L_8e86
        lda $01
        ora #$04
        sta $01
        lda cCia1TimerAControl
        ora #$01
        sta cCia1TimerAControl
        rts 


    L_8eb0:
        sta $64
        lda #$00
        sta $68
        sta $69
        lda #$03
        sta $63
        ldy #$04
    L_8ebe:
        clc 
        lda $64
        lsr 
        sta $64
        bcc L_8ecd
        clc 
        lda $68
        adc $63
        sta $68
    L_8ecd:
        dey 
        beq L_8ed9
        lda $63
        asl 
        asl 
        sta $63
        jmp L_8ebe
    L_8ed9:
        lda #$03
        sta $63
        ldy #$04
    L_8edf:
        clc 
        lda $64
        lsr 
        sta $64
        bcc L_8eee
        clc 
        lda $69
        adc $63
        sta $69
    L_8eee:
        dey 
        beq L_8efa
        lda $63
        asl 
        asl 
        sta $63
    L_8ef7:
        jmp L_8edf
    L_8efa:
        rts 



    L_8efb:
         .byte $f8,$f8,$f8,$f8,$f8,$fc,$fc,$fc,$7c,$7c,$7c,$7c,$7c
        .byte $7d,$7d,$f9,$00,$30,$f9,$f9,$dd,$cd,$8d,$8d,$01,$01,$90,$99,$99
        .byte $99,$99,$99,$ff,$ff,$01,$88

    L_8f1f:
        sty L_ccc2 + $a
        cpx $ffff
        sed 
        sbc ($f3),y

        .byte $f3,$f3,$f0,$f3,$f1,$00,$e3,$f3,$3b,$1b,$3b,$b3,$33,$3b,$bb,$bf
        .byte $bf,$b7,$b7,$fc,$fc,$fe,$fe,$fe,$fe,$ff,$ff,$f9,$f9,$f9,$f9,$fd
        .byte $fc,$fc,$fe,$8d,$8d,$8d,$8d,$cd,$cd,$ed,$7d,$99,$99,$99

    L_8f56:
        sta $9999,y
        sbc L_ecc0 + $39,y
        ldy L_9cbc,x

        .byte $9c,$8c,$8c,$80,$f0,$f1,$f3,$f3,$f3,$f1,$c0,$00,$fb,$db,$9b,$fb
        .byte $db,$80,$00,$00,$b3,$b3,$b0,$80,$00,$00,$00,$00,$ff,$ff,$ff,$f7
        .byte $f7,$f7,$f3,$f3,$fe,$fe,$df,$df,$df,$cf,$cf,$e7,$78,$30,$00,$00
        .byte $00,$80,$80,$80,$f0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
        .byte $00,$00,$07,$1f,$00,$00,$00,$00,$01,$07,$87,$e3,$00,$00,$03,$0f
        .byte $8f,$8f,$cf,$df,$03,$0f,$0f,$0f,$8f,$8f,$cf,$cf,$f3,$f3,$f9,$f9
        .byte $f9,$f8,$f8

    L_8fc2:
        sed 

        .byte $e7,$e7,$e3,$f3,$f3,$f1,$f1,$f1,$c0,$c0,$c0,$e0,$e0,$f0,$f0,$f8
        .byte $fc,$fe,$c7,$c3,$c3,$c7,$fe,$fc,$3c,$3c,$3f,$3f,$38,$3c,$1f,$0f
        .byte $f3,$73,$f1,$f1,$01,$73,$f3,$e3,$df,$fe,$fc,$fc,$f8,$f8,$f0,$f0
        .byte $ef,$ef,$ff,$7f,$3f,$3f,$1f,$1f,$29,$20,$f0,$03,$4c,$78,$a9

    L_9002:
        .byte $65,$8d,$fe,$ff,$a9,$90,$8d,$ff,$ff
        .byte $a9,$00,$8d,$1a,$d0,$8d,$10,$d0,$8d,$21,$08,$8d,$2b,$08,$8d,$2c
        .byte $08,$ad,$0d,$dc,$a9,$7f,$8d,$0d,$dc,$a9,$42,$8d,$20,$08,$8d,$12
        .byte $d0,$ad,$11,$d0,$29,$7f,$8d,$11,$d0,$a9,$01,$8d,$19,$d0,$8d,$1a
        .byte $d0,$58,$a2,$06,$a9,$01

    L_9041:
        sta $09,x
        dex 
        bne L_9041
    L_9046:
        ldx #$02
        ldy #$08
        jsr L_9844
        ldx #$01
        ldy #$09
        jsr L_9844
        jsr L_9718
        jmp L_90bc
    L_905a:
        ldx #$80
        lda #$00
    L_905e:
        sta $667f,x
        dex 
        bne L_905e
        rts 


        pha 
        lda #$01
        sta vIRQFlags
        lda L_080c + $14
        bpl L_908e
        lda #$42
        sta L_080c + $14
        sta vRaster
        lda vScreenControl1
        and #$7f
        sta vScreenControl1
        inc L_080c + $15
        and #$bf
        nop 
        nop 
        nop 
        sta vScreenControl1
        jmp L_90a0
    L_908e:
        lda #$ea
        sta L_080c + $14
        sta vRaster
        lda vScreenControl1
        ora #$40
        and #$7f
        sta vScreenControl1
    L_90a0:
        pla 
        rti 
    L_90a2:
        lda L_080c + $15
        beq L_90a2
        dec L_080c + $15
        txa 
        pha 
        inc L_080c + $25
        lda L_080c + $25
        and #$07
        bne L_90b9
        jsr L_bf98
    L_90b9:
        pla 
        tax 
        rts 


    L_90bc:
        jsr L_3c2c
        lda L_0840
        beq L_90c7
        jsr L_3cae
    L_90c7:
        ldy #$00
        jsr L_9220
        jsr L_9232
        jsr L_bf80
        jsr L_90a2
        lda vScreenControl1
        ora #$10
        and #$7f
        sta vScreenControl1
        lda #$00
        sta L_080c + $17
        sta L_080c + $19
        sta L_080c + $1b
    L_90ea:
        jsr L_90a2
        jsr L_926a
        jsr L_9877
        ldy L_080c + $17
        lda L_90ff,y
        pha 
        lda L_9104,y
        pha 
        rts 



    L_90ff:
         .byte $92
        .byte $91,$94,$95,$96

    L_9104:
        .byte $82,$1a
        .byte $24,$23,$8b

    L_9109:
        ldy #$ff
    L_910b:
        iny 
        lda.a $000a,y
        beq L_910b
        sty $06
        lda #$0d
        sta L_080c + $1b
        jmp L_96cc
        lda L_080c + $19
        beq L_9109
        cmp #$01
        beq L_913c
        cmp #$02
        beq L_917f
        cmp #$03
        beq L_9161
        dec L_080c + $1b
        beq L_9139
        lda #$01
        sta L_080c + $19
        jmp L_90ea
    L_9139:
        jmp L_92eb
    L_913c:
        jsr L_93b7
        tay 
        sty $02
        iny 
        sty $04
    L_9145:
        jsr L_93b7
        tay 
        cpy $02
        beq L_9145
        iny 
        cpy $02
        beq L_9145
        cmp $04
        beq L_9145
        sta $03
    L_9158:
        sty $05
        lda #$10
        sta $0a
        jmp L_96cc
    L_9161:
        lda $06
        cmp $02
        beq L_916b
        cmp $03
        bne L_916f
    L_916b:
        inc $06
        bne L_9179
    L_916f:
        cmp $04
        beq L_9177
        cmp $05
        bne L_9179
    L_9177:
        dec $06
    L_9179:
        jsr L_9232
        jmp L_96cc
    L_917f:
        lda $0a
        beq L_91b8
        cmp #$10
        bne L_918e
        ldx #$00
        ldy #$18
        jsr L_9844
    L_918e:
        lda L_080c + $18
        cmp #$04
        bne L_919c
        jsr L_91c0
        lda $0a
        beq L_91aa
    L_919c:
        jsr L_91c0
        lda $0a
        beq L_91aa
        jsr L_91c0
        lda $0a
        bne L_91b5
    L_91aa:
        jsr L_91e6
        lda L_080c + $18
        lsr 
        lsr 
        sta L_080c + $1a
    L_91b5:
        jmp L_90ea
    L_91b8:
        dec L_080c + $1a
        bne L_91b5
        jmp L_96cc
    L_91c0:
        jsr L_91e6
        jsr L_91e6
        ldx $0a
        lda L_920f,x
        sta $0c
        lda $02
        jsr L_9203
        lda $03
        jsr L_9203
        dec $0a
        rts 


    L_91da:
        asl 
        tay 
        lda vSprite0X,y
        clc 
        adc $0c
        sta vSprite0X,y
        rts 


    L_91e6:
        lda $04
        ldy #$01
        sty $0c
        jsr L_91da
        lda $05
        jsr L_91da
        ldy #$ff
        sty $0c
        lda $02
        jsr L_91da
        lda $03
        jsr L_91da
        rts 


    L_9203:
        asl 
        tay 
        lda vSprite0Y,y
        clc 
        adc $0c
        sta vSprite0Y,y
        rts 



    L_920f:
         .byte $00
        .byte $fe,$fe,$ff,$00,$00,$ff,$00,$00,$00,$00,$01,$00,$00,$01,$02,$02

    L_9220:
        ldx #$28
        jsr L_9755
    L_9225:
        lda $3e00,y
        beq L_9231
        sta SCREEN_BUFFER_1 + $3c0,x
        inx 
        iny 
        bne L_9225
    L_9231:
        rts 


    L_9232:
        ldx #$06
    L_9234:
        lda #$05
        sta vSprMCMCol1,x
        lda #$96
        sta $47f7,x
        dex 
        bne L_9234
        lda #$84
        pha 
        lda #$59
        ldy #$0c
    L_9248:
        sta L_cffe,y
        tax 
        pla 
        pha 
        sta $cfff,y
        txa 
    L_9252:
        clc 
        adc #$21
        dey 
        dey 
        bne L_9248
        pla 
        lda #$3f
        sta vSprEnable
        rts 



    L_9260:
         .byte $dc,$bb
        .byte $9a,$79,$58,$37,$00,$00,$00,$00

    L_926a:
        lda L_080c + $1c
        and #$d8
        ldx #$05
        ldy #$00
    L_9273:
        rol 
        bcc L_9277
        iny 
    L_9277:
        dex 
        bne L_9273
        tya 
        ror 
        rol L_080c + $1c
        lda L_080c + $1c
        rts 


        lda L_080c + $19
        bne L_92d3
    L_9288:
        jsr L_926a
        and #$07
        cmp #$06
        bcs L_9288
        tax 
        lda $0a,x
        beq L_9288
        dec $0a,x
        stx L_080c + $1d
        inc L_080c + $1b
        lda #$8a
        sta vSprite7Y
        sta vSprite6Y
        lda L_9260,x
        sta vSprite6X
        clc 
        adc #$18
        sta vSprite7X
        lda #$01
        sta vSpr6Col
        sta vSpr7Col
        ldy #$9b
        sty L_47fe
        dey 
        sty $47ff
        jsr L_905a
        lda #$ff
        sta vSprEnable
        lda #$c0
        sta vSprExpandY
        inc L_080c + $19
    L_92d3:
        cmp #$16
        bcc L_92f6
        cmp #$47
        bcc L_9331
        cmp #$5c
        bcc L_9334
        dec L_080c + $1a
        bne L_92f3
        lda L_080c + $1b
        cmp #$05
        bne L_92ee
    L_92eb:
        inc L_080c + $17
    L_92ee:
        lda #$00
        sta L_080c + $19
    L_92f3:
        jmp L_90ea
    L_92f6:
        dec vSprite6Y
        dec vSprite7Y
        dec vSprite6Y
        dec vSprite7Y
        ldy L_080c + $19
        dey 
        tya 
        sta $02
        asl 
        clc 
        adc $02
        ldy #$00
        ldx #$66
    L_9311:
        sta.a $0002,y
        adc #$40
        stx $03,y
        iny 
        iny 
        cpy #$08
        bne L_9311
        ldx #$03
        ldy #$00
    L_9322:
        lda ($02),y
        sta ($06),y
        lda ($04),y
        sta ($08),y
        iny 
        dex 
        bne L_9322
        jmp L_96cc
    L_9331:
        jmp L_9374
    L_9334:
        lda L_080c + $19
        inc vSprite6Y
        inc vSprite6Y
        inc vSprite7Y
        inc vSprite7Y
        sec 
        sbc #$46
        sta $02
        asl 
        clc 
        adc $02
        eor #$ff
        sec 
        adc #$bf
        sta $02
        clc 
        adc #$40
        sta $04
        lda #$66
        sta $03
        sta $05
        ldy #$00
        ldx #$03
        tya 
    L_9363:
        sta ($02),y
        sta ($04),y
        iny 
        dex 
        bne L_9363
        lda L_080c + $18
        sta L_080c + $1a
        jmp L_96cc
    L_9374:
        lda L_080c + $1d
        asl 
        tay 
        lda L_080c + $19
        cmp #$46
        beq L_93ab
        and #$03
        bne L_93a8
        lda L_080c + $19
        and #$04
        beq L_9397
        lda #$70
        sta vSprite0Y,y
        lda #$97
        sta $47ff
        bne L_93a1
    L_9397:
        lda #$7c
        sta vSprite0Y,y
        lda #$9a
        sta $47ff
    L_93a1:
        ldx #$00
        ldy #$18
        jsr L_9844
    L_93a8:
        jmp L_96cc
    L_93ab:
        lda #$84
        sta vSprite0Y,y
        lda #$9a
        sta $47ff
        bne L_93a8
    L_93b7:
        jsr L_926a
        jsr L_926a
        jsr L_926a
        lda L_080c + $1c
        and #$07
        cmp #$05
        bcs L_93b7
        rts 


    L_93ca:
        sta L_080c + $1e
        lda #$10
        sta L_080c + $1b
        lda #$3c
        sta L_080c + $1a
        ldy #$0e
        jsr L_9220
        ldy #$00
        jsr L_9743
        lda #$01
        sta vSpr6Col
        sta vSpr7Col
        lda #$f3
        sta vSprite6X
        clc 
        adc #$18
        sta vSprite7X
        lda #$60
        sta vSprite6Y
        sta vSprite7Y
        lda #$c0
        sta vSprExpandY
        lda #$80
        sta vSpriteXMSB
        ldy #$4c
        sty L_47fe
        iny 
        sty $47ff
        lda #$ff
        sta vSprEnable
        ldy #$00
        ldx #$02
        jsr L_9844
        ldy #$00
        ldx #$01
        jsr L_9844
        jmp L_96cc
        lda L_080c + $19
        beq L_93ca
        cmp #$01
        beq L_9443
        dec L_080c + $1a
        bne L_9440
        lda L_080c + $1e
        clc 
        adc L_080c + $17
        sta L_080c + $17
        jmp L_92eb
    L_9440:
        jmp L_90ea
    L_9443:
        jsr L_9500
        cmp #$02
        beq L_948e
        cmp #$01
        beq L_94c8
        cmp #$04
        beq L_9468
    L_9452:
        dec L_080c + $1a
        bne L_9440
        lda #$3c
        sta L_080c + $1a
        ldx #$00
        ldy #$17
        jsr L_9844
        dec L_080c + $1b
        bne L_9440
    L_9468:
        lda #$32
        sta L_080c + $1a
        ldx #$28
        jsr L_9755
        jsr L_9755
        ldy #$93
        sty L_47fe
        iny 
        sty $47ff
        lda L_080c + $1e
        ldx #$00
        cmp $06
    L_9485:
        bne L_9488
        inx 
    L_9488:
        stx L_080c + $1e
        jmp L_96cc
    L_948e:
        lda L_080c + $1e
    L_9491:
        cmp #$00
    L_9493:
        beq L_94b0
        lda vSprite6X
        clc 
        adc #$21
        sta vSprite6X
        clc 
        adc #$18
        sta vSprite7X
        ror 
        and #$80
        sta vSpriteXMSB
        dec L_080c + $1e
        jmp L_9452
    L_94b0:
        lda #$05
        sta L_080c + $1e
        lda #$4e
        sta vSprite6X
        clc 
        adc #$18
        sta vSprite7X
        lda #$00
        sta vSpriteXMSB
        jmp L_9452
    L_94c8:
        lda L_080c + $1e
        cmp #$05
        beq L_94ea
        lda vSprite6X
        sec 
        sbc #$21
        sta vSprite6X
        clc 
        adc #$18
        sta vSprite7X
        ror 
        and #$80
        sta vSpriteXMSB
        inc L_080c + $1e
        jmp L_9452
    L_94ea:
        lda #$00
        sta L_080c + $1e
        lda #$f3
        sta vSprite6X
        clc 
        adc #$18
        sta vSprite7X
        ror vSpriteXMSB
        jmp L_9452
    L_9500:
        jsr L_3b96
        eor #$ff
        and #$1c
        cmp L_080c + $1f
        sta L_080c + $1f
        bne L_9521
        cmp #$00
        beq L_951e
        ldy L_080c + $20
        bne L_9521
        inc L_080c + $20
        lsr 
        lsr 
        rts 


    L_951e:
        sta L_080c + $20
    L_9521:
        lda #$00
        rts 


        lda L_080c + $19
        cmp #$13
        bcc L_9553
        cmp #$17
        bcc L_956a
        cmp #$2a
        bcc L_956d
        cmp #$5d
        bcc L_9575
        dec L_080c + $1a
        bne L_9550
        lda #$00
        sta vSprEnable
    L_9541:
        lda vScreenControl1
        bpl L_9541
        nop 
        sei 
        and #$6f
        sta vScreenControl1
        jmp ($0318)
    L_9550:
        jmp L_90ea
    L_9553:
        lda L_080c + $19
        bne L_9567
        jsr L_95db
        ldy #$16
        jsr L_9844
        ldy #$2f
        jsr L_9743
        lda #$00
    L_9567:
        jsr L_962f
    L_956a:
        jmp L_96cc
    L_956d:
        sec 
        sbc #$17
        jsr L_95fb
        beq L_956a
    L_9575:
        lda L_080c + $19
        and #$04
        ror 
        ror 
        ror 
        lda $06
        tay 
        bcs L_9599
        clc 
        adc #$06
        tay 
        lda L_95a7,y
        and vSprEnable
        sta vSprEnable
        ldx #$00
        ldy #$19
        jsr L_9844
        jmp L_956a
    L_9599:
        lda L_95a7,y
        ora vSprEnable
        sta vSprEnable
        lda #$28
        jmp L_96fc

    L_95a7:
         .byte $01,$02,$04
        .byte $08,$10,$20,$fe,$fd,$fb

    L_95b0:
        .byte $f7,$ef,$df,$00,$00,$00,$00,$00,$00,$00,$00,$03,$03,$00,$00,$03

    L_95c0:
        .byte $0f,$0f,$03,$0f,$3f,$3f,$0f,$03,$03,$0f,$3f,$3f,$3f,$ff,$ff,$ff
        .byte $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$f0,$00

    L_95db:
        ldx #$80
    L_95dd:
        lda $52ff,x
        sta $667f,x
        dex 
        bne L_95dd
        ldy #$9a
        sty L_47fe
        iny 
        sty $47ff
        rts 


    L_95f0:
        ldx #$08
    L_95f2:
        ror 
        rol $11
        dex 
        bne L_95f2
        lda $11
        rts 


    L_95fb:
        sta $0a
        asl 
        clc 
        adc $0a
        adc #$81
        sta $0a
        adc #$3f
        sta $0c
        adc #$41
        sta $02
        clc 
        adc #$3f
        sta $04
        lda #$66
        sta $0b
        sta $0d
        lda #$53
        sta $03
        sta $05
        ldy #$00
        ldx #$02
    L_9622:
        lda ($02),y
        sta ($0a),y
        lda ($04),y
        sta ($0c),y
        iny 
        dex 
        bne L_9622
        rts 


    L_962f:
        sta $0f
        asl 
        clc 
        adc $0f
        sta $0a
        lda #$ba
        sec 
        sbc $0a
        sta $0a
        sbc #$03
        sta $0c
        lda #$66
        sta $0b
        sta $0d
        ldx $0f
        lda L_95b0 + $3,x
        sta $02
        lda L_95c0 + $7,x
        sta $03
        jsr L_967a
        lda $0c
        clc 
        adc #$3f
        sta $0c
        adc #$03
        sta $0a
        ldx $0f
        lda L_95c0 + $7,x
        jsr L_95f0
        sta $02
        ldx $0f
        lda L_95b0 + $3,x
        jsr L_95f0
        sta $03
        jsr L_967a
        rts 


    L_967a:
        ldy #$00
        ldx #$02
    L_967e:
        lda ($0a),y
        and.a $0002,y
        eor ($0c),y
        sta ($0c),y
        iny 
        dex 
    L_9689:
        bne L_967e
        rts 


        lda L_080c + $19
        beq L_9702
        cmp #$1f
        bcc L_96b0
        beq L_96d2
        dec L_080c + $1a
        bne L_96cf
        lda #$00
        sta vSprEnable
    L_96a1:
        lda vScreenControl1
        bpl L_96a1
        nop 
        sei 
        and #$6f
        sta vScreenControl1
        jmp ($0318)
    L_96b0:
        lda $06
        asl 
        tax 
        lda vSprite6X
        sec 
        sbc #$05
        sta vSprite0X,x
        lda #$64
        sta vSprite0Y,x
        lda #$95
        sta L_47fe
        lda #$4d
        sta $47ff
    L_96cc:
        inc L_080c + $19
    L_96cf:
        jmp L_90ea
    L_96d2:
        ldy #$04
        lda L_0800
        beq L_96db
        ldy #$0b
    L_96db:
        lda L_0800,y
        clc 
        adc #$03
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_96f4
        sta L_0800,y
        dey 
        ldx #$03
        bcc L_96f4
        jsr L_972d
    L_96f4:
        jsr L_3c2c
        jsr L_bfc3
        lda #$3c
    L_96fc:
        sta L_080c + $1a
        jmp L_96cc
    L_9702:
        ldx #$01
        ldy #$06
        jsr L_9844
        ldx #$02
        ldy #$07
        jsr L_9844
        ldy #$1c
        jsr L_9743
        jmp L_96cc
    L_9718:
        ldx L_0800
        lda $5f
        cmp #$0c
        bcc L_9726
        lda #$04
        sta L_080c + $23,x
    L_9726:
        lda L_080c + $23,x
        sta L_080c + $18
        rts 


    L_972d:
        lda L_0800,y
        clc 
        adc #$01
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_9742
        sta L_0800,y
        dey 
        dex 
        bne L_972d
    L_9742:
        rts 


    L_9743:
        ldx #$00
        jsr L_9755
    L_9748:
        lda L_9767,y
        beq L_9754
        sta SCREEN_BUFFER_1 + $398,x
        inx 
        iny 
        bne L_9748
    L_9754:
        rts 


    L_9755:
        sty $66
        lda #$a0
        ldy #$21
    L_975b:
        sta SCREEN_BUFFER_1 + $398,x
        inx 
        dey 
    L_9760:
        bne L_975b
        ldx #$00
        ldy $66
        rts 



    L_9767:
         .byte $95,$93,$85,$a0,$8a,$8f
        .byte $99,$93,$94,$89,$83,$8b,$a0,$94,$8f,$a0,$93,$85,$8c,$85,$83,$94
        .byte $a0,$83,$81,$8e,$ac,$00,$94,$88,$89,$93,$a0,$8f,$8e,$85,$a7,$93
        .byte $a0,$86,$8f,$92,$a0,$99,$8f,$95,$00,$8f,$8f,$90,$93,$00,$96,$91
        .byte $66,$a9,$09,$a6,$67,$e0,$d8,$d0,$02,$a9,$03

    L_97a8:
        ldy #$97
        sta ($66),y
        ldy #$be
        sta ($66),y
        lda $67
        sec 
        sbc #$94
        sta $67
        lda #$26
        ldy #$46
        sta ($66),y
        ldx $67
        cpx #$44
        beq L_97c9
        lda #$a3
        ldy #$47
        sta ($66),y
    L_97c9:
        lda #$67
        ldy #$6d
        sta ($66),y
        lda #$e6
    L_97d1:
        ldy #$be
        sta ($66),y
        lda #$a7
        ldy #$e5
        sta ($66),y
        jmp L_a6c1
        lda #$67
        ldy #$45
        sta ($66),y
        lda #$2f
        ldy #$6d
        sta ($66),y
        ldy #$e5
        sta ($66),y
        lda #$a7
        ldy #$bd
        sta ($66),y
        jmp L_a6c1
        ldx #$67
        jmp L_b7fe
        ldx #$2f
        lda $67
    L_9800:
        cld 
        ldx #$18
        lda #$00
    L_9805:
        sta sVoc1FreqLo,x
        dex 
        bpl L_9805
        stx L_1800 + $6
        stx L_1800 + $7
        stx L_1800 + $8
        lda #$0f
        sta sFiltMode
        ldx #$0b
    L_981b:
        lda L_9919,x
        sta L_1880 + $2,x
        lda $990d,x
        sta L_1840 + $2,x
        dex 
        bpl L_981b
        ldx #$32
    L_982c:
        lda L_1840 + $1b,x
        lsr 
        sta L_1840 + $f,x
        lda L_1800 + $1b,x
        ror 
        sta L_1800 + $f,x
        dex 
        bne L_982c
        stx L_1840 + $f
        stx L_1800 + $f
        rts 


    L_9844:
        lda $9925,y
        sta L_1800,x
        sta $fc
        lda $993f,y
        sta L_1800 + $3,x
        sta $fd
        lda #$01
        sta L_1800 + $9,x
        ldy #$00
        lda ($fc),y
        sta L_1800 + $c,x
        iny 
        lda ($fc),y
        pha 
        iny 
        lda ($fc),y
        ldy L_9904 + $5,x
        sta sVoc1SusRel,y
        pla 
        sta sVoc1AttDec,y
        lda #$03
        sta L_1800 + $6,x
        rts 


    L_9877:
        ldx #$02
    L_9879:
        dec L_1800 + $9,x
        beq L_9894
        lda L_1800 + $9,x
        cmp #$02
        bne L_9890
        lda L_1800 + $c,x
        and #$fe
        ldy L_9904 + $5,x
        sta sVoc1Control,y
    L_9890:
        dex 
        bpl L_9879
        rts 



    L_9894:
         .byte $bc,$06,$18,$c0,$ff,$f0,$f5,$fe,$06,$18,$bd,$00,$18,$85,$fc,$bd
        .byte $03,$18,$85,$fd,$b1,$fc,$c9,$fe,$f0,$4b,$48,$2a,$2a,$2a,$29,$03
        .byte $a8,$b9,$05,$99,$9d,$09,$18,$a9,$d4,$85,$fd,$bd,$09,$99,$85,$fc
        .byte $68,$c9,$ff,$f0,$22,$29,$3f,$c9,$01,$f0,$c1,$a8,$b9,$4f,$18,$48
        .byte $b9,$0f,$18,$a0,$00,$91,$fc,$c8,$68,$91,$fc,$c8,$c8,$c8,$bd,$0c
        .byte $18,$09,$01,$91,$fc,$d0,$a5,$9d,$06,$18,$bd,$0c,$18,$29,$fe,$a0
        .byte $04,$91,$fc,$d0,$97,$a9,$01,$9d,$09,$18,$a9,$03,$9d,$06,$18,$d0

    L_9904:
        .byte $8b,$08,$10,$20,$02,$00,$07
        .byte $0e,$15,$bf,$7d,$83,$d6,$79,$73,$c7,$7c,$97,$1e,$18,$8b

    L_9919:
        .byte $4f,$54
        .byte $59,$5e,$64,$6a,$70,$77,$7e,$86,$8e,$96,$59,$5d,$62,$89,$ac,$d7
        .byte $fb,$05,$0d,$3f,$62,$80,$94,$c8,$05,$41,$79,$80,$85,$8c,$98,$9e
        .byte $a3,$a8,$ad,$b2,$99,$99,$99,$99,$99,$99,$99,$9a,$9a,$9a,$9a,$9a
        .byte $9a,$9a,$9b,$9b,$9b,$9b,$9b,$9b,$9b,$9b,$9b,$9b,$9b,$9b,$10,$00
        .byte $00,$ff,$10,$00,$0f,$40,$ff,$10,$00,$83,$19,$1b,$5d,$60,$60,$00
        .byte $22,$60,$5d,$59,$00,$1b,$5d,$5d,$5b,$59,$9b,$40,$59,$5d,$60,$60
        .byte $00,$22,$60

    L_997e:
        .byte $5d,$59,$00,$1b
        .byte $5d,$5d,$5b,$5b,$99,$40,$fe,$10,$13,$74,$4d,$54,$48,$54,$4d,$54
        .byte $48,$54,$4d,$54,$48,$54

    L_9998:
        eor L_4000 + $94
        eor L_4854

        .byte $54,$4d,$54,$48,$54,$4d,$54,$48,$54,$4d,$54,$48,$4d,$fe,$20,$10
        .byte $44,$59,$00,$25

    L_99b2:
        .byte $22
        .byte $20,$5d,$60

    L_99b6:
        .byte $1e,$5b,$1d,$5e,$62,$20,$5d,$1e,$60,$62
        .byte $20,$9d,$00,$59,$25,$5d,$1e,$60,$62,$20,$5d,$1e,$60,$62,$1b,$5e
        .byte $1d,$5b,$59,$25,$99,$00,$fe,$20,$10,$44,$4d,$59,$51,$54,$4f,$54
        .byte $52,$54,$4f,$54,$4f,$54,$4d,$59,$51,$54,$4d,$59,$51,$54,$4f,$51
        .byte $52,$54,$4f,$54,$52,$4f,$54,$08,$94,$00,$fe,$20,$12,$24,$20,$1b
        .byte $1e,$1d,$1b,$59,$ff,$20,$13,$34,$46,$45,$4d,$40,$ff,$10,$13,$44
        .byte $19,$1b,$5d,$19,$1b,$1d,$1e,$00,$1d,$9b,$00,$19,$18,$19,$5b,$00
        .byte $19,$1b,$1d,$a0,$80,$22,$20,$5e,$00,$22,$20,$1e,$20,$00,$1e,$5d
        .byte $20,$1e,$1d,$1b,$1d,$1e,$20,$22,$40,$18,$59,$40,$40,$40,$fe,$10
        .byte $03,$64,$4d,$51,$48,$51,$4c,$4f,$48,$4f,$4c,$4f,$48,$4f,$4d,$51
        .byte $48,$51,$4a,$56,$52,$56,$48,$54,$51,$54,$4c,$52,$4f,$52,$4d,$48
        .byte $8d,$fe,$20,$13,$44,$59,$40,$1b,$1d,$1e,$1b,$60,$60,$20,$22,$1d
        .byte $1e,$5b,$5b,$1b,$1e,$1d,$1b,$19,$25,$24,$22,$20,$1e,$1d,$1b,$fe
        .byte $20,$13,$44,$41,$45,$43,$46,$45,$48,$45,$46,$43,$46,$43,$45,$41
        .byte $45,$43,$48,$fe,$20,$23,$24,$41,$40,$0d,$01,$01,$0d,$41,$01,$0d
        .byte $01,$01,$4d,$46,$40,$12,$06,$06,$12,$46,$06,$12,$06,$06,$52,$48
        .byte $40,$14,$08,$08,$14,$48,$08,$14,$08,$14,$48,$46,$40,$12,$06,$06
        .byte $12,$46,$06,$12,$06,$06,$52,$fe,$10,$05,$68,$59,$00,$25,$20,$22
        .byte $25,$00,$59,$20,$25,$20,$22,$25,$25,$5b,$00,$2a,$1e,$25,$27,$2a
        .byte $5e,$00,$2a,$25,$27,$2a,$1e,$60,$00,$2c,$27,$29,$2c,$00,$2c,$20
        .byte $00,$2c,$27,$29,$2c,$27,$5e,$00,$2a

    L_9af9:
        rol 
        and $27
        rol 
        lsr L_2a00,x
        and $27
        rol 

        .byte $00,$fe,$10,$31,$44,$1d,$1b,$1d,$5e,$1d,$19,$1b,$1d,$1b,$1d,$5e
        .byte $1d,$19,$1b,$1d,$1b,$1d,$5e,$1d,$19,$1b,$5d,$14,$16,$18,$16,$14
        .byte $00,$1b,$19,$1b,$5d,$1b,$18,$19,$1b,$19,$1b,$5d,$1b,$18,$19,$1b
        .byte $19,$1b,$5d,$1b,$16,$18,$59,$20,$22,$24,$22,$20,$00,$fe,$10,$22
        .byte $44,$0d,$00,$11,$00,$12,$00,$11,$00,$0d,$00,$11,$00,$12,$00

    L_9b52:
        ora ($00),y
        ora L_1100

        .byte $00,$12,$00,$11,$00,$8d,$80,$0c,$00,$0f,$00,$11,$00,$0f,$00,$0c
        .byte $00,$0f,$00,$11,$00,$0f,$00,$0c,$00,$0f,$00

    L_9b72:
        ora ($00),y

        .byte $0f,$00,$8d,$80,$fe,$10,$27,$e4,$dd,$df,$e1,$ff,$80,$64,$04,$e0
        .byte $ff,$20,$36,$00,$f0,$e8,$f2,$ff,$10,$06,$00,$f0,$c1,$f4,$c1,$f0

    L_9b94:
        cmp ($f4,x)
        cmp ($ff,x)

        .byte $80,$0a,$04,$c0,$70,$ff,$80,$02,$88,$60,$ff,$80,$8a,$08,$aa,$ff
        .byte $10,$02,$12,$31,$ff,$80,$a6,$00,$ea,$ff,$10,$00

    L_9bb4:
        sed 
        sbc L_adff,x

        .byte $00,$08,$f0,$02,$a0,$0b

    L_9bbe:
        lda L_0800,y
        clc 
        adc #$01
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_9bd5
        sta L_0800,y
        dey 
        ldx #$03
        jsr L_972d
    L_9bd5:
        rts 



    L_9bd6:
         .byte $ad,$11,$d0,$29,$80,$f0,$f9,$78,$ad,$11,$d0,$29,$6f,$8d,$11,$d0
        .byte $a5,$5f,$29,$0f,$c9,$06,$f0,$06,$29,$09,$d0,$02,$e6,$5f,$e6,$5f

    L_9bf6:
        .byte $ad,$43,$08,$d0,$06,$a5,$5f,$29,$f7,$85,$a9,$01,$8d,$19,$d0,$a9
        .byte $00

    L_9c07:
        sta vIRQMasks
        sei 
        lda #$a3
        sta $03
        lda #$e0
        sta $05
        ldy #$00
        sty $02
        sty $04
        ldx #$1d
    L_9c1b:
        lda ($04),y
        sta ($02),y
        iny 
        bne L_9c1b
        inc $05
        inc $03
        dex 
        bne L_9c1b
    L_9c29:
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        nop 
        lda #$57
        sta $fffe
        lda #$a1
        sta $ffff
        lda #$8b
        sta $fffa
        lda #$9f
        sta $fffb
        lda #$42
        sta vRaster
        lda vScreenControl1
        and #$7f
        sta vScreenControl1
        lda #$01
        sta vIRQFlags
        sta vIRQMasks
        lda cCia1IntControl
        lda #$7f
        sta cCia1IntControl
        jsr L_2000
        lda $5f
        and #$0c
        cmp #$0c
        beq L_9c9f
        jmp L_9d63
    L_9c9f:
        ldx #$48
        ldy #$a8
        lda $5f
        eor #$02
        lsr 
        ror $68
        lsr 
        ror $68
        bit $68
        bvc L_9cc2
        stx $a304
        sty $a324
        bpl L_9cca
    L_9cb9:
        sty L_a344
    L_9cbc:
        stx L_a364
        jmp L_9cd0
    L_9cc2:
        sty $a304
        stx $a324
        bpl L_9cb9
    L_9cca:
        stx L_a344
        sty L_a364
    L_9cd0:
        ldy #$0e
        sty $f6
        ldx #$01
        jsr L_9844
        ldy #$0f
        sty $f7
        ldx #$02
        jsr L_9844
        lda #$80
        sta L_49f0 + $c
        ldx #$2b
    L_9ce9:
        lda L_9cf4,x
        sta $22,x
        dex 
        bpl L_9ce9
        jmp L_9d20

    L_9cf4:
         .byte $a1,$d8,$ad,$d8,$e1,$d8,$15,$d9,$3f
        .byte $d9,$91,$d9,$bb,$d9,$bd,$d9,$f1,$d9,$1a,$da,$1b,$da,$45,$da,$51
        .byte $da,$85,$da,$b9,$da,$e3,$da,$35,$db,$5f,$db,$61,$db,$93,$db,$be
        .byte $db,$bf,$db

    L_9d20:
        lda #$d8
        sta $67
        lda #$78
        sta $66
        sta $68
        lda #$44
        sta $69
        ldx #$15
    L_9d30:
        ldy #$27
    L_9d32:
        lda ($68),y
        cmp #$2f
        bne L_9d44
        lda ($66),y
        and #$0f
        cmp #$06
        bne L_9d44
        lda #$bf
        sta ($68),y
    L_9d44:
        dey 
        bpl L_9d32
        lda $68
        clc 
        adc #$28
        sta $68
        bcc L_9d53
        inc $69
        clc 
    L_9d53:
        lda $66
        adc #$28
        sta $66
        bcc L_9d5d
        inc $67
    L_9d5d:
        dex 
        bne L_9d30
        jsr L_9ffc + $4
    L_9d63:
        lda #$00
        sta $18
        lda $5f
        and #$0c
        bne L_9dc5
        ldy #$00
    L_9d6f:
        lda L_57ac + $94,y
        sta L_4fff + $1,y
        lda L_7040,y
        sta L_6800,y
        lda L_6340,y
        sta L_56c0,y
        lda L_7b40,y
        sta L_6ec0,y
        lda L_5940,y
        sta L_5100,y
        lda L_7140,y
        sta L_6900,y
        iny 
        bne L_9d6f
    L_9d96:
        lda L_5d61 + $df,y
        sta $5240,y
        lda L_7640,y
        sta L_6a40,y
        lda $6440,y
        sta L_57ac + $14,y
        lda $7c40,y
        sta L_6fc0,y
        iny 
        cpy #$80
        bne L_9d96
        ldy #$02
        sty $f6
        ldx #$01
        jsr L_9844
        ldy #$03
        sty $f7
        ldx #$02
        jsr L_9844
    L_9dc5:
        lda $5f
        and #$0c
        cmp #$04
        bne L_9e35
        ldy #$00
    L_9dcf:
        lda L_7240,y
        sta L_6800,y
        lda L_59c0 + $80,y
        sta L_4fff + $1,y
        lda L_7340,y
        sta L_6900,y
        lda L_5b09 + $37,y
        sta L_5100,y
        lda L_5fc0,y
        sta L_56c0,y
        lda L_77c0,y
        sta L_6ec0,y
        iny 
        bne L_9dcf
        ldy #$a8
        sty $a304
        sty $a324
        sty L_a344
        sty L_a364
        ldy #$00
    L_9e06:
        lda L_60c0,y
        sta L_57ac + $14,y
        lda L_78c0,y
        sta L_6fc0,y
        lda L_5d61 + $15f,y
        sta $5240,y
        lda L_76c0,y
        sta L_6a40,y
        iny 
        cpy #$80
        bne L_9e06
        ldy #$04
        sty $f6
        ldx #$01
        jsr L_9844
        ldy #$05
        sty $f7
        ldx #$02
        jsr L_9844
    L_9e35:
        lda $5f
        and #$0c
        cmp #$08
        bne L_9eb4
        ldy #$00
    L_9e3f:
        lda L_7440,y
        sta L_6800,y
        lda L_5c40,y
        sta L_4fff + $1,y
        lda L_7540,y
        sta L_6900,y
        lda L_5d38 + $8,y
        sta L_5100,y
        lda $6140,y
        sta L_56c0,y
        lda L_7940,y
        sta L_6ec0,y
        iny 
        bne L_9e3f
        lda #$01
        bit $5f
        bne L_9e73
        ldx #$48
        ldy #$a8
        jmp L_9e77
    L_9e73:
        ldy #$48
        ldx #$a8
    L_9e77:
        sty $a304
        sty $a324
        stx L_a344
        stx L_a364
        ldy #$00
    L_9e85:
        lda $6240,y
        sta L_57ac + $14,y
        lda L_7a40,y
        sta L_6fc0,y
        lda L_5f40,y
        sta $5240,y
        lda L_7740,y
    L_9e9a:
        sta L_6a40,y
        iny 
        cpy #$80
        bne L_9e85
        ldy #$0c
        sty $f6
        ldx #$01
        jsr L_9844
        ldy #$0d
        sty $f7
        ldx #$02
        jsr L_9844
    L_9eb4:
        ldy #$3f
    L_9eb6:
        lda L_5100,y
        sta L_6780,y
        lda L_517c + $4,y
        sta L_67c0,y
        lda #$00
        sta L_6740,y
        sta L_6700,y
        lda L_6900,y
        sta L_7f80,y
        lda L_6980,y
        sta L_7fc0,y
        lda #$00
        sta $7f40,y
        sta $7f00,y
        dey 
        bpl L_9eb6
        sta $66
        lda #$80
        sta $68
        ldx #$04
        lda #$40
        sta $67
    L_9eed:
        sec 
        lda L_a2ff + $1,x
        sbc #$48
        lsr 
        lsr 
        adc #$50
        sta $69
    L_9ef9:
        lda ($68),y
        sta ($66),y
        dey 
        cpy #$bf
        bne L_9f0b
        lda #$40
        sta $68
        inc $69
        jmp L_9ef9
    L_9f0b:
        cpy #$7f
        bne L_9f16
        lda #$00
        sta $68
        jmp L_9ef9
    L_9f16:
        cpy #$3f
        bne L_9f21
        lda #$c0
        sta $68
        jmp L_9ef9
    L_9f21:
        cpy #$ff
        bne L_9ef9
        lda #$80
        sta $68
        inc $67
        txa 
        clc 
        adc #$20
        tax 
        cmp #$84
        bne L_9eed
        lda #$00
        sta vSprExpandY
        lda #$7f
        sta $69
        lda #$1c
        sta $68
        sta $66
        lda #$67
        ldy #$18
        sta $67
    L_9f49:
        lda L_9f59,y
        sta ($68),y
        lda L_9f72,y
        sta ($66),y
        dey 
        bpl L_9f49
        jmp L_a400

    L_9f59:
         .byte $73,$00
        .byte $01,$df,$80,$03,$3c,$c0,$06,$ed,$c0,$03,$87,$00,$01,$83,$80,$00
        .byte $cf,$00,$00,$7e,$00,$00,$18

    L_9f72:
        dec $0100

        .byte $fb,$80,$03,$3c,$c0,$03,$b7,$60,$00,$e1,$c0,$01,$c1,$80,$00,$f3
        .byte $00,$00,$7e,$00,$00,$18,$a9,$c1,$8d,$18,$03,$a9,$fe,$8d,$19,$03
        .byte $4c,$dd,$37,$00,$d0,$fb,$78,$ad,$11,$d0,$29,$6f,$8d,$11,$d0,$4c
        .byte $dd,$37,$a9,$eb,$20,$b8,$b8,$a9,$ff,$20,$b8,$b8,$bd,$8e,$c0,$bd
        .byte $8c,$c0,$60,$18,$48,$68,$9d,$8d,$c0,$1d,$8c,$c0,$60,$a0,$00

    L_9fc4:
        ldx #$56
    L_9fc6:
        dex 
        bmi L_9fc4
        lda L_bb00,y
        lsr $bc00,x
        rol 
        lsr $bc00,x
        rol 
        sta ($3e),y
        iny 
        cpy $26
        bne L_9fc6
        rts 



        .byte $a0,$20,$88,$f0,$61,$bd,$8c,$c0,$10,$fb,$49,$d5,$d0,$f4,$ea,$bd
        .byte $8c,$c0,$10,$fb,$c9,$aa,$d0,$f2,$a0,$56,$bd,$8c,$c0,$10,$fb,$c9

    L_9ffc:
        .byte $ad,$d0,$e7,$a9,$a5,$62

    L_a002:
        and #$01
        bne L_a009
        jmp L_a110
    L_a009:
        lda L_4920
        tax 
        asl 
        txa 
        rol 
        sta L_4920
        sta L_49d0
        sta L_4948
        sta $4949
        sta L_494a
        sta $494b
        sta L_494c
        sta $494d
        sta L_494e
        sta $494f
        tax 
        ora #$f0
        sta L_4950
        txa 
        ror 
        sta $4921
        sta L_4922
        tax 
        and #$7f
        sta $49d1
        sta L_49d2
        ora #$f8
        sta $4951
        sta L_4952
        ror 
        txa 
        ror 
        sta $4923
        sta L_4924
        tax 
        and #$3f
        sta $49d3
        sta L_49d4
        ora #$fc
        sta $4953
        sta L_4954
        ror 
        txa 
        ror 
        sta $4925
        sta L_4926
        tax 
        and #$1f
        sta L_49d4 + $1
        sta L_49d4 + $2
        ora #$fe
        sta $4955
        sta L_4956
        ror 
        txa 
        ror 
        sta $4927
        and #$0f
        sta L_49d7
        lda L_4928
        tax 
        lsr 
        txa 
        ror 
        sta L_4928
        sta $49d8
        sta L_4940
        sta $4941
        sta L_4942
        sta $4943
        sta L_4944
        sta $4945
        sta L_4946
        sta $4947
        tax 
        ora #$0f
        sta L_4958
        txa 
        rol 
        sta $4929
        sta L_492a
        tax 
        and #$fe
        sta L_49d9
        sta $49da
        ora #$1f
        sta $4959
        sta L_495a
        rol 
        txa 
        rol 
        sta $492b
        sta L_492c
        tax 
        and #$fc
        sta L_49db
        sta $49dc
        ora #$3f
        sta $495b
        sta L_495c
        rol 
        txa 
        rol 
        sta $492d
        sta L_492e
        tax 
        and #$f8
        sta L_49dd
        sta L_49dd + $1
        ora #$7f
        sta $495d
        sta L_495e
        rol 
        txa 
        rol 
        sta $492f
        and #$f0
        sta L_49df
        rts 


    L_a110:
        asl L_49f0 + $c
        bcc L_a156
        ldx #$02
        rol L_49f0 + $c
    L_a11a:
        lda ($20,x)
        and #$0f
        cmp #$01
        bne L_a126
        lda #$06
        sta ($20,x)
    L_a126:
        dec $20,x
        ldy $20,x
        cpy #$ff
        bne L_a130
        dec $21,x
    L_a130:
        lda #$77
        cmp $20,x
        bne L_a144
        lda #$d8
        cmp $21,x
        bne L_a144
        lda #$bf
        sta $20,x
        lda #$db
        sta $21,x
    L_a144:
        lda ($20,x)
        and #$0f
        cmp #$06
        bne L_a150
        lda #$01
        sta ($20,x)
    L_a150:
        inx 
        inx 
        cpx #$2e
        bne L_a11a
    L_a156:
        rts 


        pha 
        txa 
        pha 
        tya 
        pha 
        ldx $21
        bne L_a163
    L_a160:
        jmp L_a23d
    L_a163:
        lda #$01
    L_a165:
        sta vIRQFlags
        ldy #$00
        sty $21
        lda L_1200,x
        inx 
        sta vRaster
        lda L_1200 + $1d,x
        sta vScreenControl1
        cli 
    L_a17a:
        lda L_1200,x
        inx 
        sta vSprEnable
        lda L_1200,x
        inx 
        sta vSpriteXMSB
        lda L_1200,x
        inx 
    L_a18c:
        sta $47ff
        lda L_1200,x
        inx 
        sta vSprite7Y
        lda L_1200,x
        inx 
        sta vSprite7X
        lda L_1200,x
        inx 
        sta vSpr7Col
        lda L_1200,x
        inx 
        sta L_47fe
        lda L_1200,x
        inx 
        sta vSprite6Y
        lda L_1200,x
        inx 
        sta vSprite6X
        lda L_1200,x
        inx 
        sta vSpr6Col
        lda L_1200,x
        inx 
        sta L_47fd
        lda L_1200,x
        inx 
        sta vSprite5Y
        lda L_1200,x
        inx 
        sta vSprite5X
        lda L_1200,x
        inx 
        sta vSpr5Col
        lda L_1200,x
        inx 
        sta L_47fc
        lda L_1200,x
        inx 
        sta vSprite4Y
        lda L_1200,x
        inx 
        sta vSprite4X
        lda L_1200,x
        inx 
        sta vSpr4Col
        lda L_1200,x
        inx 
        sta L_47fb
        lda L_1200,x
        inx 
        sta vSprite3Y
        lda L_1200,x
        inx 
        sta vSprite3X
        lda L_1200,x
        inx 
        sta vSpr3Col
        lda L_1200,x
        inx 
        sta L_47f8 + $2
        lda L_1200,x
        inx 
        sta vSprite2Y
        lda L_1200,x
        inx 
        sta vSprite2X
        lda L_1200,x
        inx 
        sta vSpr2Col
        inx 
        inx 
        inx 
        inx 
        inx 
        stx $21
        pla 
        tay 
        pla 
        tax 
        pla 
        rti 
    L_a23d:
        ldx $58
        lda L_a287,x
        sta vRaster
        lda #$5b
        sta vScreenControl1
        lda #$01
        sta vIRQFlags
        lda vSprite7Y
        clc 
        adc #$02
        sta vSprite0Y
        lsr 
        adc #$34
        sta $59
        lda $a28a,x
        and #$80
        beq L_a284
        lda vSpriteXMSB
        and #$fe
        sta vSpriteXMSB
        lda #$a8
        sta L_47f8
        lda #$ac
        sec 
        sbc $59
        sta vSprite0X
        lda #$09
        sta vSpr0Col
        pla 
        tay 
        pla 
        tax 
    L_a282:
        pla 
        rti 
    L_a284:
        lda vSpriteXMSB
    L_a287:
        ora #$01
    L_a289:
        sta vSpriteXMSB
    L_a28c:
        lda #$48
        sta L_47f8
        lda #$ac
        adc $59
        sta vSprite0X
        lda #$09
        sta vSpr0Col
        pla 
        tay 
        pla 
        tax 
        pla 
    L_a2a2:
        rti 

        .byte $14,$a9,$91,$8d,$06,$14,$a9,$83,$8d,$07,$14,$a9,$be,$8d,$08,$14
        .byte $a9,$86,$8d,$09,$14,$a9,$9e,$8d,$0a,$14

    L_a2bd:
        lda #$87
        sta L_1400 + $b
        lda #$24
        sta L_1400 + $c
        lda #$8c
        sta L_1400 + $d
        lda #$18
        sta L_1400 + $e
        lda #$8d
        sta L_1400 + $f
    L_a2d6:
        lda #$e0
        sta $0318
        lda #$82
        sta $0319
        lda $50
        bne L_a33b
        lda $5f
        and #$0c
        sta $66
        lda #$14
        sta $67
        ldy #$00
        lda ($66),y
        sta $4e
        iny 
        lda ($66),y
        sta $4f
        jsr L_8631
        jsr L_8073

    L_a2ff:
         .byte $a0,$00,$7a,$fb

    L_a303:
        sta ($48,x)

    L_a305:
         .byte $5f,$10,$09

    L_a308:
        rti 

    L_a309:
         .byte $65,$58,$01,$42,$65,$70,$27
        .byte $41,$65

    L_a312:
        dey 

        .byte $04,$43,$65,$a0,$29,$49,$65,$48,$0e,$00,$00

    L_a31e:
        .byte $00,$00,$00
        .byte $9a,$fb,$81,$48,$7f,$20,$09,$43,$85,$48,$28,$40,$85,$60,$03,$42
        .byte $85,$78,$25,$41,$85,$90,$02,$49,$85,$38

    L_a33b:
        asl.a $004e
    L_a33e:
        inc $00,x

        .byte $00,$ba,$fb,$83

    L_a344:
        pha 

        .byte $9f,$30,$09,$40,$a5,$38,$07,$43,$a5,$50,$24,$41

    L_a351:
        lda $68
        asl $a542

        .byte $80,$21,$49,$a5,$28,$0e,$4e,$80

    L_a35e:
        asl $00

        .byte $00,$da,$fb,$83

    L_a364:
        pha 

        .byte $bf,$40,$09,$42,$c5,$28,$22,$40,$c5,$40,$05,$43,$c5,$58,$2b,$41
        .byte $c5,$70,$08,$49,$c5,$18,$0e,$4e,$80,$16,$00,$00,$f2,$80,$03,$00
        .byte $df
        .fill $15, $0
        .byte $0e,$4e,$80,$26,$5b,$00,$ff,$00,$00,$5b,$32,$88,$0d,$5c,$32,$a0
        .byte $0d,$5d,$47,$94,$0d,$5e,$32,$b8,$07,$5f,$32,$d0,$07,$60,$47,$c4
        .byte $07,$00,$00,$00,$1b,$00,$42,$00,$00,$5b,$32,$88,$0d,$5c,$32,$a0
        .byte $0d,$5d,$47,$94,$0d,$5e,$32,$b8,$07,$5f,$32,$d0,$07,$60,$47,$c4
        .byte $07,$00,$00,$00,$1b,$00,$5a,$00,$00,$5b,$32,$88,$0d,$5c,$32,$a0
        .byte $0d,$5d,$47,$94,$0d,$5e,$32,$b8,$07,$5f,$32,$d0,$07,$60,$47,$c4
        .byte $07

    L_a3fc:
        .byte $00,$00,$00,$5b

    L_a400:
        ldx #$00
        ldy #$62
    L_a404:
        lda $a304,x
        bpl L_a46a
        lda #$74
        cpx #$40
        bne L_a411
        lda #$64
    L_a411:
        bcs L_a415
        lda #$44
    L_a415:
        sta L_a303,x
        lda L_a305 + $1,x
        sta $68
        lda $a31a,x
        sta L_a305 + $1,x
        lda $68
        sta $a31a,x
        sec 
        sbc #$10
        sta L_a309 + $1,x
        sbc #$18
        sta L_a309 + $5,x
        sbc #$18
        sta L_a312,x
        sbc #$18
        sta $a316,x
        sty $69
        ldy #$05
    L_a441:
        lda L_a308,x
        clc 
        adc #$60
        sta L_a308,x
        inx 
        inx 
        inx 
        inx 
        dey 
        bne L_a441
        txa 
        sec 
        sbc #$14
        tax 
        ldy $69
        lda #$00
        sta $a33d,x
        tya 
        sta L_a33e,x
        lda $a33c,x
        clc 
        adc #$60
        sta $a33c,x
    L_a46a:
        txa 
        clc 
        adc #$20
        tax 
        tya 
        sec 
        sbc #$10
        tay 
        cmp #$22
        bne L_a404
        ldy #$00
    L_a47a:
        lda L_a2ff + $1,y
        sta L_1100,y
        iny 
        bne L_a47a
        ldx #$00
    L_a485:
        lda $a304,x
        bpl L_a490
        lda L_a4b5,y
        jmp L_a493
    L_a490:
        lda L_a4b1,y
    L_a493:
        sta L_1100 + $1c,x
        sta L_1100 + $1d,x
        sta L_1100 + $1e,x
        lda #$5b
        sta L_1100 + $1f,x
        iny 
        txa 
        clc 
        adc #$20
        tax 
        cmp #$80
        beq L_a4ae
        jmp L_a485
    L_a4ae:
        jmp $a4b9

    L_a4b1:
         .byte $6f
        .byte $0d,$ab,$49

    L_a4b5:
        dey 
        rol 
        cpy $a96e

        .byte $00,$85,$d1,$85,$d0,$a9,$01,$8d,$28,$d0,$8d,$27,$d0,$a9,$88,$8d
        .byte $01,$d0,$8d,$03,$d0,$2c,$24,$a3,$10,$0f,$a9,$5e,$8d,$02,$d0,$a9
        .byte $46,$8d,$00,$d0,$a2,$ac,$4c,$ef,$a4

    L_a4e3:
        lda #$fa
        sta vSprite1X
        lda #$12
        sta vSprite0X
        ldx #$4c
    L_a4ef:
        stx L_47f8 + $1
        inx 
        stx L_47f8
        lda L_a35e
        sta L_1140 + $6
        lda #$9d
        sta L_1140 + $5
        sta L_1140 + $1
        lda L_1100 + $24
        eor #$06
        sta L_1140 + $4
        lda #$02
        sta L_1140 + $7
        lda L_1100 + $23
        and #$83
        sta $68
        lda L_1140 + $3
        and #$7c
        ora $68
        sta L_1140 + $3
        lda #$ba
        sta $63
        sta $58
        lda #$01
        sta $21
        ldy #$bf
    L_a52e:
        lda L_4000,y
        sta L_4000 + $40,y
        lda L_4180 + $80,y
        sta L_4240,y
        dey 
        cpy #$ff
        bne L_a52e
        ldy #$3f
    L_a541:
        lda L_4000 + $80,y
        sta L_4000,y
        lda L_4258 + $28,y
        sta L_4180 + $80,y
        dey 
        bpl L_a541
        lda #$9f
        sta $eb
        sta $ec
        lda cCia1TimerbControl
        and #$fd
        sta cCia1TimerbControl
        lda #$00
        sta $61
        sta vBackgCol3
        sta $f4
        sta $f5
        sta $f8
        sta $f9
        lda #$10
        sta $57
        lda #$ff
        sta $62
        lda #$00
        sta $17
        sta $6a
        sta $51
        lda $5f
        and #$7f
        sta $5f
        cmp #$08
        bcc L_a593
        and #$0f
        cmp #$0c
        bcc L_a599
    L_a58d:
        lda #$70
        sta $52
        bne L_a5a1
    L_a593:
        lda #$a0
        sta $52
        bne L_a5a1
    L_a599:
        cmp #$08
        bcc L_a58d
        lda #$90
        sta $52
    L_a5a1:
        ldx #$0f
    L_a5a3:
        lda L_a5ae,x
        sta $c0,x
        dex 
        bpl L_a5a3
        jmp L_a5be

    L_a5ae:
         .byte $2c,$38,$40,$48,$3c
        .byte $48,$50,$54,$40,$44,$4c,$50,$40,$50,$54,$5c

    L_a5be:
        ldx $5f
        lda #$00
        cpx #$0b
        bcs L_a5f2
        sta $c3
        cpx #$0a
        bcs L_a5f2
        sta $c7
        cpx #$07
        bcs L_a5f2
        sta $c2
        sta $cb
        cpx #$06
        bcs L_a5f2
        sta $cf
        cpx #$04
        bcs L_a5f2
        sta $c6
        sta $ca
        sta $ce
        cpx #$02
        bcs L_a5f2
        sta $c1
        sta $c5
        sta $c9
        sta $cd
    L_a5f2:
        cpx #$08
        bne L_a5fa
        sta $c2
        sta $cb
    L_a5fa:
        ldx #$00
        ldy #$00
    L_a5fe:
        lda.a $00c0,y
        bne L_a608
        lda #$9d
        sta L_1100 + $8,x
    L_a608:
        iny 
        cpy #$10
        beq L_a61e
        inx 
        inx 
        inx 
        inx 
        txa 
        and #$0f
        bne L_a5fe
        txa 
        clc 
        adc #$10
        tax 
        jmp L_a5fe
    L_a61e:
        ldx #$00
    L_a620:
        lda L_1100,x
        sta L_1200 + $20,x
        inx 
        cpx #$e0
        bne L_a620
        ldx #$1f
    L_a62d:
        lda L_11c0 + $20,x
        sta L_1200,x
        dex 
        bpl L_a62d
        lda #$00
        sta $ed
        sta $e7
        sta $dc
        jsr L_bf80
        ldx L_0840 + $2
        beq L_a648
        ldx #$05
    L_a648:
        inx 
        stx $e9
        lda #$02
        sta $e2
        lda #$20
        ldy #$0f
    L_a653:
        sta L_16c0 + $30,y
        dey 
        bpl L_a653
        ldy #$1e
        ldx L_0840 + $3
        beq L_a6a6
        ldy #$45
        lda L_0800
        beq L_a697
        lda #$b2
        sta $3e4c
        lda #$b1
        sta L_3e56 + $1
        ldx $da
    L_a673:
        lda L_0840
        bne L_a67f
        lda #$00
        sta $3e52
        beq L_a6a6
    L_a67f:
        lda #$90
        sta $3e52
        inx 
        txa 
        adc #$b0
        sta $3e5f
        lda #$a0
        sta L_3e5e
        jsr L_3cae
        ldy #$45
        bpl L_a6a6
    L_a697:
        lda #$b1
        sta $3e4c
        lda #$b2
        sta L_3e56 + $1
        ldx $db
        jmp L_a673
    L_a6a6:
        jsr L_9220
        lda #$40
        sta $de
        lda vScreenControl1
        and #$7f
        ora #$10
        sta vScreenControl1
        cli 
        bne L_a6c1
    L_a6ba:
        lda $de
        bne L_a6c1
        inc vBorderCol
    L_a6c1:
        ldy $21
        lda $ed
        bne L_a6cd
        cpy #$01
        bne L_a6c1
        beq L_a701
    L_a6cd:
        cpy #$e1
        beq L_a6f3
    L_a6d1:
        jsr L_3b96
        and #$80
        bne L_a6ba
        lda $de
        bne L_a6c1
        lda L_16c0 + $2f
        sta vBorderCol
        lda #$01
        sta vIRQFlags
        cli 
        lda #$40
        sta $de
        lda #$0f
        sta sFiltMode
        bne L_a6c1
    L_a6f3:
        lda $de
        beq L_a6d1
        lda $e7
        beq L_a6fe
        jmp L_a717
    L_a6fe:
        jmp L_ac56
    L_a701:
        lda $e8
        and #$1f
        cmp $d9
        bne L_a711
        cmp $ec
        bne L_a711
        sta $eb
        beq L_a717
    L_a711:
        ldx $ec
        stx $d9
        sta $ec
    L_a717:
        lda $eb
        and #$0f
        eor #$0f
        cmp #$09
        bcc L_a726
    L_a721:
        sta $55
        jmp L_a9a0
    L_a726:
        cmp #$06
        beq L_a721
        cmp #$05
        beq L_a721
        sta $55
        tax 
        and #$03
        eor $61
        bmi L_a746
        beq L_a74d
        eor $61
        sta $61
        beq L_a74d
        ora #$80
        sta $61
        jmp L_a87d
    L_a746:
        eor $61
        sta $61
        jmp L_a8bc
    L_a74d:
        txa 
        bne L_a753
        jmp L_a75a
    L_a753:
        and #$0c
        beq L_a75a
        jmp L_a9a0
    L_a75a:
        lda $eb
        and #$10
        tax 
        beq L_a774
        eor $57
        bne L_a768
    L_a765:
        jmp L_a87d
    L_a768:
        txa 
        sta $57
        ldx $17
        cpx #$09
        bcc L_a765
        jmp L_a7ff
    L_a774:
        eor $57
        beq L_a77e
        txa 
        sta $57
        jmp L_a7d8
    L_a77e:
        ldx $17
        cpx #$09
        bcs L_a795
        lda L_a7bd + $6,x
        ldy L_a7b4,x
        sta L_6e80,y
        sta L_5670 + $12,y
        inc $17
        jmp L_a7d8
    L_a795:
        ldx $16
        ldy #$2d
    L_a799:
        lda L_a7ad,x
        sta L_6e80,y
        sta L_5670 + $12,y
        inx 
        iny 
        iny 
        iny 
        cpy #$3c
        bne L_a799
        jmp L_a7d8

    L_a7ad:
         .byte $df,$ff,$f7,$df,$ff,$f7,$df

    L_a7b4:
        and $3336,y

        .byte $30,$2d,$2a,$39,$36,$33

    L_a7bd:
        .byte $30,$27,$27,$27,$27,$27,$ff,$ff,$ff,$ff,$ff,$c3,$f3,$ff,$cf,$f3

    L_a7cd:
        .byte $00,$00,$00,$00,$00,$c3,$c3,$c3,$c3,$c3,$ff

    L_a7d8:
        ldx $63
        lda L_a2a2,x
        eor #$e0
        sta L_1080 + $a,x
        lda $a26a,x
        eor #$19
        sta L_1040 + $2a,x
        and #$80
        bne L_a7f3
        ldx #$59
        jmp L_a7f5
    L_a7f3:
        ldx #$b9
    L_a7f5:
        stx L_47f8 + $1
        inx 
        stx L_47f8
        jmp L_a961
    L_a7ff:
        ldx #$07
    L_a801:
        lda L_a7cd + $5,x
        ldy L_a7b4,x
        sta L_6e80,y
        sta L_5670 + $12,y
        dex 
        bpl L_a801
        inx 
        stx $17
        inc $d0
        inc $d0
        ldx $d0
        lda L_47f8 + $1
        asl 
        lda #$20
        bit vSprite1Y
        bvc L_a838
        bpl L_a82f
        lda #$4f
        bcs L_a82c
        eor #$27
    L_a82c:
        jmp L_a849
    L_a82f:
        lda #$75
        bcs L_a835
        eor #$f7
    L_a835:
        jmp L_a849
    L_a838:
        beq L_a843
        lda #$b1
        bcs L_a849
        eor #$77
        jmp L_a849
    L_a843:
        lda #$13
        bcs L_a849
        eor #$37
    L_a849:
        sta $6f,x
        lda #$c0
        bcs L_a851
        lda #$ea
    L_a851:
        sta $70,x
        ldx #$00
        ldy #$11
        jsr L_9844
    L_a85a:
        ldx $63
        lda L_a2a2,x
        sta L_1080 + $a,x
        lda $a26a,x
        sta L_1040 + $2a,x
        and #$80
        beq L_a871
        ldx #$b2
        jmp L_a873
    L_a871:
        ldx #$52
    L_a873:
        stx L_47f8 + $1
        inx 
        stx L_47f8
        jmp L_aae1
    L_a87d:
        lda L_47f8 + $1
        and #$1f
        cmp #$18
        bcc L_a889
        jmp L_aae1
    L_a889:
        cmp #$12
        beq L_a85a
        ldx $63
        lda L_a2a2,x
        sta L_1080 + $a,x
        lda $a26a,x
        sta L_1040 + $2a,x
        and #$80
        beq L_a8a4
        ldx #$ac
        jmp L_a8a6
    L_a8a4:
        ldx #$4c
    L_a8a6:
        lda $62
        and #$40
        bne L_a8b2
        txa 
        eor #$5f
        ora #$80
        tax 
    L_a8b2:
        stx L_47f8 + $1
        inx 
        stx L_47f8
        jmp L_aae1
    L_a8bc:
        txa 
        lsr 
        bcs L_a8d7
        ldx $63
        lda $a26a,x
        sta L_1040 + $2a,x
        lda vSprite1Y
        clc 
        adc #$20
        cmp #$e8
        bne L_a8e9
        eor #$80
        jmp L_a8e9
    L_a8d7:
        lda vSprite1Y
        sec 
        sbc #$20
        cmp #$48
        bne L_a8e9
        ldy $a304
        sty L_1100 + $4
        eor #$80
    L_a8e9:
        sta vSprite1Y
        tax 
        lda #$00
        sta $17
        lda $a29c,x
        bpl L_a905
        lda L_47f8 + $1
        cmp #$a0
        bcs L_a911
        adc #$60
        sta L_47f8 + $1
        jmp L_a911
    L_a905:
        lda L_47f8 + $1
    L_a908:
        cmp #$a0
        bcc L_a911
        sbc #$60
        sta L_47f8 + $1
    L_a911:
        lda L_a2bd,x
        sec 
        sbc #$02
        sta L_1080 + $39,x
        sta L_1080 + $3d,x
        lda $a2d4,x
        sta L_1080 + $3c,x
        lda #$02
        sta L_1080 + $3f,x
        ldx $63
        lda L_a287,x
        sta L_1080 + $7,x
        lda L_1080 + $9,x
        and #$7f
        sta $68
        lda L_a289,x
        and #$80
        ora $68
        sta L_1080 + $9,x
        lda $a28a,x
        sta L_1080 + $a,x
        lda $a28b,x
        sta L_1080 + $b,x
        lda L_a28c,x
        sta L_1080 + $c,x
        lda $a28d,x
        sta L_1080 + $d,x
        lda vSprite1Y
        clc 
        adc #$32
        sta $63
    L_a961:
        ldx vSprite1Y
        clc 
        lda $a29b,x
        and #$03
        sta $68
        lda L_1080 + $1b,x
        and #$fc
        ora $68
        sta L_1080 + $1b,x
        lda L_1080 + $3b,x
        and #$fc
        ora $68
        and #$7f
        ora $a2d5,x
        sta L_1080 + $3b,x
        lda L_a2d6,x
        sta L_1080 + $3e,x
        ldy $a2d4,x
        bpl L_a998
        sbc #$f3
        sta vSprite1X
        jmp L_a99d
    L_a998:
        sbc #$0c
        sta vSprite1X
    L_a99d:
        jmp L_aae1
    L_a9a0:
        lda $55
        and #$08
        bne L_a9a9
        jmp L_aa2a
    L_a9a9:
        ldx $63
        inc vSprite1X
        lda $e7
        bne L_a9c2
        txa 
        lsr 
        clc 
        adc #$ac
        cmp vSprite1X
        bne L_a9c2
        dec vSprite1X
        jmp L_a9e4
    L_a9c2:
        lda vSprite1X
        bne L_a9d7
        lda L_1040 + $29,x
        ora #$02
        sta L_1040 + $29,x
        lda L_1080 + $9,x
        ora #$02
        sta L_1080 + $9,x
    L_a9d7:
        inc L_1080 + $c,x
        bne L_a9e4
        lda L_1080 + $9,x
        ora #$80
        sta L_1080 + $9,x
    L_a9e4:
        lda $e7
        beq L_a9ed
        dec $e7
        jmp L_a9a0
    L_a9ed:
        lda $ed
        beq L_a9f3
        inc $e7
    L_a9f3:
        lda $a26a,x
        eor #$80
        asl 
        lda #$b4
        adc #$00
        cmp L_47f8 + $1
        sta L_47f8 + $1
    L_aa03:
        beq L_aa1b
        ldy $62
        dey 
        tya 
        ldy #$b7
        and #$18
        beq L_aa17
        ldy #$b8
        and #$08
        bne L_aa17
        ldy #$b6
    L_aa17:
        tya 
        sta L_1080 + $a,x
    L_aa1b:
        lda $e7
        bne L_aa22
        jmp L_aaaf
    L_aa22:
        lda #$eb
        sta L_47f8 + $1
        jmp L_aae1
    L_aa2a:
        ldx $63
        dec vSprite1X
        lda $e7
        bne L_aa45
        txa 
        lsr 
        sec 
        sbc #$ac
        eor #$ff
    L_aa3a:
        cmp vSprite1X
        bne L_aa45
        inc vSprite1X
        jmp L_aa6e
    L_aa45:
        lda vSprite1X
        cmp #$ff
        bne L_aa5c
        lda L_1040 + $29,x
        and #$fd
        sta L_1040 + $29,x
        lda L_1080 + $9,x
        and #$fd
        sta L_1080 + $9,x
    L_aa5c:
        dec L_1080 + $c,x
        lda L_1080 + $c,x
        cmp #$ff
        bne L_aa6e
        lda L_1080 + $9,x
        and #$7f
        sta L_1080 + $9,x
    L_aa6e:
        lda $e7
        beq L_aa77
        dec $e7
        jmp L_a9a0
    L_aa77:
        lda $ed
        beq L_aa7d
        inc $e7
    L_aa7d:
        lda $a26a,x
        asl 
        lda #$54
        adc #$00
        cmp L_47f8 + $1
        sta L_47f8 + $1
        beq L_aaa3
        ldy $62
        dey 
        tya 
        ldy #$57
        and #$18
        beq L_aa9f
        ldy #$58
        and #$08
        bne L_aa9f
        ldy #$56
    L_aa9f:
        tya 
        sta L_1080 + $a,x
    L_aaa3:
        lda $e7
        beq L_aaaf
        lda #$8b
        sta L_47f8 + $1
        jmp L_aae1
    L_aaaf:
        lda $62
        and #$07
        bne L_aadb
        lda $62
        and #$10
        bne L_aac6
        lda L_1080 + $a,x
        eor #$0f
        sta L_1080 + $a,x
        jmp L_aace
    L_aac6:
        lda L_1080 + $a,x
        eor #$0e
        sta L_1080 + $a,x
    L_aace:
        lda $62
        and #$08
        bne L_aadb
        ldx #$00
        ldy #$12
        jsr L_9844
    L_aadb:
        lda $57
        ora #$10
        sta $57
    L_aae1:
        ldx $63
        lda #$20
        bit vSprite1Y
        beq L_aaef
    L_aaea:
        lda vSprite1Y
        bne L_aaf4
    L_aaef:
        lda vSprite1Y
        and #$7f
    L_aaf4:
        sta $54
        lda #$04
        bit L_47f8 + $1
    L_aafb:
        bne L_ab01
    L_aafd:
        bpl L_ab27
        bmi L_ab16
    L_ab01:
        lda #$01
        bit L_47f8 + $1
        beq L_aafd
        bpl L_ab10
        lda #$05
        ldy #$01
        bne L_ab2b
    L_ab10:
        lda #$0c
        ldy #$ff
        bne L_ab2b
    L_ab16:
        lda L_47f8 + $1
        cmp #$93
        beq L_ab27
        cmp #$8b
        beq L_ab27
        lda #$02
        ldy #$01
        bne L_ab2b
    L_ab27:
        lda #$0f
        ldy #$ff
    L_ab2b:
        sty $5e
        eor $54
        sta $54
        lda L_1080 + $9,x
        lsr 
        lsr 
        lda vSprite1X
        ror 
        lsr 
        lsr 
        sec 
        sbc #$02
        clc 
        adc $54
        sta $54
        lda $5e
        eor #$ff
        adc $54
        tay 
        lda $54
        clc 
        adc $5e
        sta $5e
        lda $54
        cpy $18
        beq L_ab60
        dey 
        cpy $18
        beq L_ab60
        jmp L_ac56
    L_ab60:
        ldy #$00
        lda #$2f
        sta ($18),y
        iny 
        sta ($18),y
        lda $19
        clc 
        adc #$94
        sta $19
        iny 
        lda ($18),y
        dey 
        sta ($18),y
        dey 
        sta ($18),y
        lda #$00
        sta $18
        lda #$ff
        sta L_1180 + $22
        sta L_11c0 + $2
        sta L_11c0 + $22
        ldy #$0a
        ldx #$01
        stx $f5
        inc $f9
        jsr L_9844
        ldy #$0b
        ldx #$02
        jsr L_9844
        ldy #$17
        ldx #$00
        jsr L_9844
        lda #$7f
        sta $f4
        lda $f3
        sta $68
        ldx #$00
    L_abab:
        lda L_1100 + $8,x
    L_abae:
        beq L_abe0
        cmp #$40
        bcc L_abd1
        cmp #$44
        bcs L_abd1
        ror $68
        bcs L_abd1
    L_abbc:
        ora #$01
        tay 
    L_abbf:
        and #$02
        bne L_abc4
        sec 
    L_abc4:
        txa 
        and #$1f
        eor #$14
        beq L_abe0
        tya 
        adc #$07
        sta L_1100 + $8,x
    L_abd1:
        cmp #$a0
        bcc L_abe0
        cmp #$a4
        bcs L_abe0
        ror $68
        bcs L_abe0
        jmp L_abbc
    L_abe0:
        inx 
        inx 
        inx 
        inx 
        txa 
        and #$0f
        bne L_abab
        txa 
    L_abea:
        clc 
    L_abeb:
        adc #$10
        tax 
        cmp #$80
        bne L_abab
        lda L_1100 + $1e
        sta L_1100 + $1c
        sta L_1100 + $1d
    L_abfb:
        lda L_1100 + $3e
        sta L_1100 + $3c
        sta L_1100 + $3d
        lda L_1140 + $1e
        sta L_1140 + $1c
        sta L_1140 + $1d
        lda L_1140 + $3e
        sta L_1140 + $3c
        sta L_1140 + $3d
        ldy #$04
        lda L_0800
        beq L_ac1f
        ldy #$0b
    L_ac1f:
        lda L_0800,y
        clc 
        adc #$01
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_ac36
        sta L_0800,y
        dey 
        ldx #$03
        jsr L_972d
    L_ac36:
        ldy #$05
        lda L_0800
        beq L_ac3f
        ldy #$0c
    L_ac3f:
        lda L_0800,y
        clc 
    L_ac43:
        adc #$05
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_ac56
        sta L_0800,y
        dey 
        ldx #$04
        jsr L_972d
    L_ac56:
        ldx #$01
        lda $e7
        beq L_ac67
        lda L_47f8 + $1
        and #$0f
        cmp #$0b
        bne L_ac67
        ldx $e2
    L_ac67:
        stx vSpr0Col
        lda L_47f8 + $1
        tax 
        and #$01
        beq L_ac84
        txa 
        and #$08
        bne L_ac84
        txa 
        and #$60
        beq L_ac84
        cmp #$60
    L_ac7e:
        beq L_ac84
        dex 
        jmp L_ac85
    L_ac84:
        inx 
    L_ac85:
        stx L_47f8
        ldx vSprite1Y
        stx vSprite0Y
        lda $a29c,x
        bpl L_acb7
        lda vSprite1X
        sec 
        sbc #$18
        sta vSprite0X
        bcc L_acc2
    L_ac9e:
        lda L_1080 + $1b,x
        lsr 
        tay 
        lsr 
        tya 
        rol 
        sta L_1080 + $1b,x
        lda L_1080 + $3b,x
    L_acac:
        lsr 
        tay 
        lsr 
        tya 
        rol 
        sta L_1080 + $3b,x
        jmp L_acdc
    L_acb7:
        lda vSprite1X
        clc 
        adc #$18
        sta vSprite0X
        bcc L_ac9e
    L_acc2:
        lda L_1080 + $1b,x
        lsr 
        tay 
        eor #$01
        lsr 
        tya 
        rol 
        sta L_1080 + $1b,x
        lda L_1080 + $3b,x
        lsr 
        tay 
        eor #$01
        lsr 
        tya 
        rol 
        sta L_1080 + $3b,x
    L_acdc:
        lda $5f
        and #$0c
        cmp #$0c
        bne L_ace7
        jsr L_9ffc + $4
    L_ace7:
        ldx #$e0
    L_ace9:
        lda L_1100,x
        sta L_1200 + $20,x
        dex 
        bne L_ace9
        ldx #$20
    L_acf4:
        lda L_11c0 + $20,x
        sta L_1200,x
        dex 
        bne L_acf4
        lda $63
        sta $58
        jsr L_9877
        lda $ed
        beq L_ad0d
        inc $62
        jmp L_ad86
    L_ad0d:
        inc $62
        bne L_ad50
        inc $51
        lda $52
        cmp #$a0
        beq L_ad50
        lda $5f
        and #$0f
        cmp #$0c
        bcs L_ad3a
        cmp #$08
        bcc L_ad3a
        lda $51
        and #$03
        bne L_ad50
        lda $52
        sec 
        sbc #$30
        sta $52
        bne L_ad50
        lda #$c0
        sta $52
        bne L_ad50
    L_ad3a:
        lda $51
        and #$0f
        cmp #$09
        bne L_ad4a
    L_ad42:
        lda $52
        eor #$90
        sta $52
        bne L_ad50
    L_ad4a:
        cmp #$0f
        bne L_ad50
        beq L_ad42
    L_ad50:
        lda $62
        and #$03
        bne L_ad86
        inc $6a
        lda $6a
        and #$01
        bne L_ad61
        jsr L_bf98
    L_ad61:
        dec $f4
        beq L_ad6b
        bpl L_ad86
        inc $f4
        beq L_ad86
    L_ad6b:
        lda #$00
        sta $f5
        sta L_1180 + $22
        sta L_11c0 + $2
        sta L_11c0 + $22
        ldy $f6
        ldx #$01
        jsr L_9844
        ldy $f7
        ldx #$02
        jsr L_9844
    L_ad86:
        inc $16
        ldx #$03
        cpx $16
        bne L_ad92
        ldx #$00
        stx $16
    L_ad92:
        lda $ed
        beq L_ada2
        bpl L_ad9f
        cmp #$80
    L_ad9a:
        beq L_ad9f
        jmp L_b1e9 + $d
    L_ad9f:
        jmp L_b48c
    L_ada2:
        ldx $d0
        bne L_ada9
        jmp L_afbb
    L_ada9:
        lda $6f,x
        cmp #$30
    L_adad:
        bcc L_adb7
        cmp #$6f
        bcc L_adc1
        cmp #$90
        bcc L_adbc
    L_adb7:
        ldy #$46
        jmp L_adc3
    L_adbc:
        ldy #$45
        jmp L_adc3
    L_adc1:
        ldy #$47
    L_adc3:
        sty $69
        sta $68
        lda $70,x
        ldy #$00
        and #$20
        beq L_add2
        jmp L_aee7
    L_add2:
        ldy #$00
        lda ($68),y
        and #$f0
        eor #$d0
        sta $66
        lda $70,x
        cmp #$c4
        beq L_adfd
        clc 
        adc #$02
        sta $70,x
        tay 
        lda $66
        beq L_adf7
        and #$10
        beq L_adf7
        tya 
        ldy #$00
        sta ($68),y
        beq L_adf8
    L_adf7:
        tya 
    L_adf8:
        adc #$01
        jmp L_ae72
    L_adfd:
        lda $66
    L_adff:
        beq L_ae0b
        and #$10
        beq L_ae0b
        lda #$2f
        ldy #$00
        sta ($68),y
    L_ae0b:
        lda #$c0
        sta $70,x
        ldy $6f,x
        iny 
        cpy #$2a
        beq L_ae22
        cpy #$6e
        beq L_ae22
        cpy #$88
        beq L_ae22
        cpy #$cc
    L_ae20:
        bne L_ae25
    L_ae22:
        jmp L_aea2
    L_ae25:
        cpy L_1140 + $1c
        beq L_ae31
        cpy L_1140 + $1d
        beq L_ae31
        bne L_ae39
    L_ae31:
        ldy #$01
        sty $a35f
        jmp L_aea2
    L_ae39:
        cpy L_1140 + $3c
        beq L_ae45
        cpy L_1140 + $3d
        beq L_ae45
        bne L_ae4c
    L_ae45:
        ldy #$01
        sty $a37f
        bpl L_aea2
    L_ae4c:
        cpy L_1100 + $3c
        beq L_ae58
        cpy L_1100 + $3d
        beq L_ae58
        bne L_ae5f
    L_ae58:
        ldy #$01
        sty $a33f
        bpl L_aea2
    L_ae5f:
        cpy L_1100 + $1c
        beq L_ae6b
        cpy L_1100 + $1d
        beq L_ae6b
        bne L_ae72
    L_ae6b:
        ldy #$01
        sty L_a31e + $1
        bpl L_aea2
    L_ae72:
        inc $6f,x
        inc $68
        sta $66
        ldy #$00
        lda ($68),y
        and #$f0
        eor #$d0
        beq L_ae8c
        and #$10
        beq L_ae8c
        lda $66
        ldy #$00
        sta ($68),y
    L_ae8c:
        lda $66
        cmp #$c0
        bne L_ae96
        lda #$c1
        bmi L_ae72
    L_ae96:
        dec $6f,x
    L_ae98:
        dex 
        dex 
        beq L_ae9f
        jmp L_ada9
    L_ae9f:
        jmp L_afbb
    L_aea2:
        sty $20
        lsr 
        lsr 
        bcc L_aeaf
        dec $6f,x
    L_aeaa:
        dec $68
        jmp L_aeb3
    L_aeaf:
        inc $68
        inc $6f,x
    L_aeb3:
        ldy #$00
        lda ($68),y
        and #$f0
        eor #$d0
        beq L_aecd
        and #$10
        beq L_aecd
        lda #$2f
        sta ($68),y
        ldy $20
        dey 
        beq L_aecd
        jmp L_b1e9 + $d
    L_aecd:
        cpx $d0
        beq L_aee0
        txa 
    L_aed2:
        inx 
        inx 
        ldy $6f,x
        dex 
    L_aed7:
        dex 
        sty $6f,x
        inx 
        cpx $d0
        bne L_aed2
        tax 
    L_aee0:
        dec $d0
        dec $d0
        jmp L_ae98
    L_aee7:
        lda ($68),y
        and #$f0
        eor #$d0
        sta $66
    L_aeef:
        lda $70,x
        and #$cf
        cmp #$c6
        beq L_af12
        sec 
        sbc #$02
        tay 
        lda $66
        beq L_af0a
        and #$10
        beq L_af0a
        tya 
        ldy #$00
        sta ($68),y
        beq L_af0b
    L_af0a:
        tya 
    L_af0b:
        sta $70,x
        sbc #$01
        jmp L_af8a
    L_af12:
        lda $66
        beq L_af20
        and #$10
        beq L_af20
        lda #$2f
        ldy #$00
        sta ($68),y
    L_af20:
        lda #$ca
        sta $70,x
        ldy $6f,x
        dey 
        cpy #$6f
        beq L_af37
        cpy #$0d
        beq L_af37
        cpy #$ab
        beq L_af37
        cpy #$49
        bne L_af3a
    L_af37:
        jmp L_aea2
    L_af3a:
        cpy L_1140 + $1c
        beq L_af46
        cpy L_1140 + $1d
        beq L_af46
        bne L_af4e
    L_af46:
        ldy #$01
        sty $a35f
        jmp L_aea2
    L_af4e:
        cpy L_1140 + $3c
        beq L_af5a
        cpy L_1140 + $3d
        beq L_af5a
        bne L_af62
    L_af5a:
        ldy #$01
        sty $a37f
        jmp L_aea2
    L_af62:
        cpy L_1100 + $3c
        beq L_af6e
        cpy L_1100 + $3d
        beq L_af6e
        bne L_af76
    L_af6e:
        ldy #$01
        sty $a33f
        jmp L_aea2
    L_af76:
        cpy L_1100 + $1c
        beq L_af82
        cpy L_1100 + $1d
        beq L_af82
        bne L_af8a
    L_af82:
        ldy #$01
        sty L_a31e + $1
        jmp L_aea2
    L_af8a:
        dec $6f,x
        dec $68
        ldy #$00
        sta $66
        lda ($68),y
        and #$f0
        eor #$d0
        beq L_afa2
        and #$10
        beq L_afa2
        lda $66
        sta ($68),y
    L_afa2:
        lda $66
        cmp #$ca
        bne L_afac
        lda #$c9
        bmi L_af8a
    L_afac:
        inc $6f,x
    L_afae:
        lda $70,x
        ora #$20
        sta $70,x
        dex 
        dex 
        beq L_afbb
        jmp L_ada9
    L_afbb:
        lda $51
        cmp #$20
    L_afbf:
        bcs L_afd8
        lda $51
        cmp #$10
        bcc L_afcf
        lda $62
        and #$01
        beq L_afd8
        bne L_afd5
    L_afcf:
        lda $62
        and #$03
        beq L_afd8
    L_afd5:
        jmp L_b1c3
    L_afd8:
        ldx $d1
    L_afda:
        beq L_afd5
        lda $83,x
        cmp #$30
        bcc L_afea
        cmp #$6f
        bcc L_aff2
        cmp #$90
        bcc L_afee
    L_afea:
        ldy #$46
        bpl L_aff4
    L_afee:
        ldy #$45
        bpl L_aff4
    L_aff2:
        ldy #$47
    L_aff4:
        sty $69
        sta $68
        lda $84,x
        tay 
        and #$20
        beq L_b002
        jmp L_b0b3
    L_b002:
        iny 
        iny 
        cpy #$d8
        beq L_b040
        cpy #$df
        beq L_b040
        sty $84,x
        tay 
    L_b00f:
        lda ($68),y
        and #$2c
        eor #$20
        bne L_b01c
        lda ($68),y
        sta L_1700,x
    L_b01c:
        lda ($68),y
        and #$0f
    L_b020:
        eor #$0e
        beq L_b039
        lda $84,x
        eor #$ff
        adc #$00
        eor #$ff
        sta ($68),y
        dec $68
        cmp $84,x
        bcs L_b00f
    L_b034:
        dex 
        dex 
        jmp L_afda
    L_b039:
        bcs L_b034
        sec 
        dec $68
        bcs L_b00f
    L_b040:
        tya 
        eor #$0f
        sta $84,x
        ldy #$00
        lda ($68),y
        and #$0f
        eor #$0e
        beq L_b053
        lda #$2f
        sta ($68),y
    L_b053:
        ldy $68
        clv 
        cpy #$75
        beq L_b066
        cpy #$13
        beq L_b066
        cpy #$b1
        beq L_b066
        cpy #$4f
        bne L_b069
    L_b066:
        bit L_a3fc + $3
    L_b069:
        cpy $54
        bne L_b07a
        dec $68
    L_b06f:
        bvs L_b074
        jmp L_b16f
    L_b074:
        lda L_1700,x
        jmp L_b17b
    L_b07a:
        cpy $5e
        bne L_b082
        dec $68
        bne L_b06f
    L_b082:
        dec $68
        iny 
        cpy $54
        beq L_b06f
        cpy $5e
        beq L_b06f
        ldy $68
        cpy $54
        beq L_b06f
        cpy $5e
        beq L_b06f
        sty $83,x
        ldy #$00
        lda ($68),y
        and #$0f
        eor #$0e
        bvs L_b0a5
        beq L_b0ae
    L_b0a5:
        lda $84,x
        sta ($68),y
        bvc L_b0ae
        jmp L_b1e9 + $d
    L_b0ae:
        dex 
        dex 
        jmp L_afda
    L_b0b3:
        dey 
        dey 
        cpy #$f6
        beq L_b0f9
        cpy #$ef
        beq L_b0fd
        cpy #$ee
    L_b0bf:
        bne L_b0c3
        ldy #$fc
    L_b0c3:
        sty $84,x
        ldy #$00
        clc 
    L_b0c8:
        lda ($68),y
        and #$2c
        eor #$20
        bne L_b0d5
        lda ($68),y
        sta L_1700,x
    L_b0d5:
        lda ($68),y
        and #$0f
        eor #$0e
        beq L_b0f2
        lda $84,x
        and #$df
        adc #$00
        sta ($68),y
        inc $68
        ora #$20
        cmp $84,x
        beq L_b0c8
    L_b0ed:
        dex 
        dex 
        jmp L_afda
    L_b0f2:
        bcs L_b0ed
        sec 
        inc $68
        bcs L_b0c8
    L_b0f9:
        lda #$f7
        bne L_b0ff
    L_b0fd:
        lda #$f0
    L_b0ff:
        sta $84,x
        ldy #$00
        lda ($68),y
        and #$0f
        eor #$0e
        beq L_b10f
        lda #$2f
        sta ($68),y
    L_b10f:
        ldy $68
        clv 
        cpy #$82
        beq L_b122
        cpy #$24
        beq L_b122
        cpy #$c6
        beq L_b122
        cpy #$68
        bne L_b125
    L_b122:
        bit L_a3fc + $3
    L_b125:
        cpy $54
        bne L_b134
        inc $68
    L_b12b:
        bvs L_b12f
        bvc L_b16f
    L_b12f:
        lda L_1700,x
        bvs L_b17b
    L_b134:
        cpy $5e
        bne L_b13c
        inc $68
        bne L_b12b
    L_b13c:
        inc $68
        dey 
        cpy $54
        beq L_b12b
        cpy $5e
        beq L_b12b
        ldy $68
        cpy $54
        beq L_b12b
        cpy $5e
        beq L_b12b
        sty $83,x
        ldy #$00
        bvs L_b15f
        lda ($68),y
        and #$0f
        eor #$0e
        beq L_b16a
    L_b15f:
        lda $84,x
        and #$df
        sta ($68),y
        bvc L_b16a
        jmp L_b1e9 + $d
    L_b16a:
        dex 
        dex 
        jmp L_afda
    L_b16f:
        ldy #$00
        lda ($68),y
        and #$0f
        eor #$0e
        beq L_b17f
        lda #$2f
    L_b17b:
        ldy #$00
        sta ($68),y
    L_b17f:
        cpx $d1
        stx $20
        beq L_b198
    L_b185:
        inx 
        inx 
        ldy $83,x
        lda L_1700,x
        dex 
        dex 
        sty $83,x
        sta L_1700,x
        inx 
        cpx $d1
        bne L_b185
    L_b198:
        ldy #$05
        lda L_0800
        beq L_b1a1
        ldy #$0c
    L_b1a1:
        lda L_0800,y
        clc 
        adc #$01
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_b1b8
        sta L_0800,y
        dey 
        ldx #$04
        jsr L_972d
    L_b1b8:
        ldx $20
        dec $d1
        dec $d1
        dex 
        dex 
        jmp L_afda
    L_b1c3:
        lda $18
        beq L_b1e6
        ldy #$01
        lda ($18),y
        cmp #$2f
        bne L_b1e6
        ldx #$8f
        lda $5f
        and #$0c
        cmp #$0c
        bne L_b1e3
        ldx #$0f
        lda $18
        cmp #$6f
        bcs L_b1e3
        ldx #$4f
    L_b1e3:
        txa 
        sta ($18),y
    L_b1e6:
        jmp L_b48c

    L_b1e9:
         .byte $90,$8c,$81,$99,$85,$92,$a0,$b1,$a0,$8f,$95,$94,$a0,$86,$e6,$a5
        .byte $f0,$d0,$17,$a2,$0c

    L_b1fe:
        lda L_b1e9,x
        cpx #$07
        bne L_b20d
        lda L_0840 + $3
        bne L_b210
        lda L_b1e9,x
    L_b20d:
        sta SCREEN_BUFFER_1 + $3c0,x
    L_b210:
        dex 
        bpl L_b1fe
        dec $ed
        lda $ed
        cmp #$82
        bne L_b225
        dec $f0
        bmi L_b222
        jmp L_b3e6
    L_b222:
        jmp L_c19e
    L_b225:
        bcc L_b222
        cmp #$ff
        beq L_b22e
        jmp L_b394
    L_b22e:
        ldx $f0
        cpx #$0a
        bcs L_b239
        lda #$2f
        sta SCREEN_BUFFER_1 + $19,x
    L_b239:
        tya 
        ldx #$88
        ldy $68
        cpy #$aa
        bcc L_b246
        ldx #$a8
        bmi L_b254
    L_b246:
        cpy #$6f
        bcc L_b24e
        ldx #$68
        bpl L_b254
    L_b24e:
        cpy #$48
        bcc L_b254
        ldx #$c8
    L_b254:
        stx $dd
        tay 
        beq L_b28e
        lda #$9a
        sta L_1080 + $30,x
        sta L_10c0 + $10,x
        lda L_1080 + $1a,x
        ora #$04
        sta L_1080 + $1a,x
        lda L_1080 + $1b,x
        and #$04
        sta $68
        lda L_1080 + $3b,x
        and #$fb
        ora $68
        sta L_1080 + $3b,x
        lda $a2b1,x
        ora #$08
        sta L_1080 + $31,x
        sta L_10c0 + $11,x
        lda L_1080 + $32,x
        sta L_10c0 + $12,x
        jmp L_b349
    L_b28e:
        ldy $e6
        lda L_1700,y
        ldy #$00
        sta ($68),y
        lda $a29c,x
        clc 
        adc #$54
        sta L_1080 + $30,x
        sta L_10c0 + $10,x
        txa 
        lsr 
        bvs L_b2cb
        eor #$ff
        sec 
        sbc #$64
    L_b2ac:
        sta L_1080 + $32,x
        sta L_10c0 + $12,x
        lda L_1080 + $1b,x
        eor #$04
        sta L_1080 + $1b,x
        and #$04
        sta $f1
        lda L_1080 + $3b,x
    L_b2c1:
        and #$fb
        ora $f1
        sta L_1080 + $3b,x
        jmp L_b2ec
    L_b2cb:
        clc 
        adc #$bc
        sta L_1080 + $32,x
        sta L_10c0 + $12,x
        lda L_1080 + $1b,x
        bcc L_b2de
        eor #$04
        sta L_1080 + $1b,x
    L_b2de:
        and #$04
        sta $f1
        lda L_1080 + $3b,x
        and #$fb
        ora $f1
        sta L_1080 + $3b,x
    L_b2ec:
        lda L_1080 + $1a,x
        ora #$04
        sta L_1080 + $1a,x
        lda L_1080 + $3a,x
        ora #$04
        sta L_1080 + $3a,x
        lda L_1080 + $31,x
        clc 
        adc #$0c
        sta L_1080 + $31,x
        sta L_10c0 + $11,x
        lda #$fb
        sta vSprMCM
        lda #$00
        sta vSprPriority
        sta L_10c0 + $13,x
        sta L_1080 + $33,x
        lda #$e0
        sta $dc
    L_b31c:
        lda L_10c0,x
        and #$8d
        cmp #$8d
        beq L_b33e
        lda L_10c0 + $3,x
        ldy #$49
        and #$20
        beq L_b330
        ldy #$4a
    L_b330:
        tya 
        sta L_10c0,x
        lda L_10c0 + $2,x
        ora #$80
        and #$bf
        sta L_10c0 + $2,x
    L_b33e:
        inx 
        inx 
        inx 
        inx 
        txa 
        and #$0f
        cmp #$08
        bne L_b31c
    L_b349:
        ldx vSprite1Y
        lda $a2d4,x
        sta L_1080 + $3c,x
        ora #$0f
        sta L_47f8 + $1
        lda $dc
        bne L_b377
        ldx #$00
        ldy #$00
        jsr L_9844
        ldx #$01
        ldy #$00
        jsr L_9844
        ldx #$02
        ldy #$00
        jsr L_9844
        ldx #$00
        ldy #$14
        jsr L_9844
    L_b377:
        jmp L_b48c
    L_b37a:
        lda vScreenControl1
        and #$80
        beq L_b37a
        sei 
        lda vScreenControl1
        and #$6f
        sta vScreenControl1
        lda $51
        beq L_b391
        jmp ($0318)
    L_b391:
        jmp ($fffa)
    L_b394:
        ldx $dd
        ldy $ed
        cpy #$f8
        bne L_b3a4
        sty $51
        inc L_10c0 + $10,x
        inc L_1080 + $30,x
    L_b3a4:
        cpy #$f0
        bne L_b3ae
        dec L_10c0 + $10,x
        dec L_1080 + $30,x
    L_b3ae:
        cpy #$e1
        bne L_b3ba
        lda #$9d
        sta L_10c0 + $10,x
        sta L_1080 + $30,x
    L_b3ba:
        lda $dc
        bne L_b3c1
        jmp L_b48c
    L_b3c1:
        and #$01
        bne L_b3cb
        inc L_1080 + $31,x
        inc L_10c0 + $11,x
    L_b3cb:
        ldy #$fe
        sty $ed
        inc $dc
        beq L_b3d6
        jmp L_b48c
    L_b3d6:
        tya 
        sta L_10c0 + $13,x
        iny 
        sty vSprMCM
        lda #$9a
        sta L_10c0 + $10,x
        jmp L_b349
    L_b3e6:
        lda L_0840
        bne L_b3ee
    L_b3eb:
        jmp L_b37a
    L_b3ee:
        lda L_0800
        eor #$01
        sta L_0800
        beq L_b40e
        lda $f0
        sta $da
        lda $5f
        sta L_080c + $3
        lda L_080c + $4
        sta $5f
        lda $db
        sta $f0
        bmi L_b424
        bpl L_b3eb
    L_b40e:
        lda $f0
        sta $db
        lda $5f
        sta L_080c + $4
        lda L_080c + $3
        sta $5f
        lda $da
        sta $f0
        bmi L_b424
        bpl L_b3eb
    L_b424:
        lda $ed
        cmp #$82
        bne L_b42f
        lda L_0840
        bne L_b45e
    L_b42f:
        lda #$81
        sta $ed
        ldy #$67
        jsr L_9220
        jsr L_3b96
        and #$10
        bne L_b453
    L_b43f:
        lda vScreenControl1
        bpl L_b43f
        sei 
        lda vScreenControl1
        and #$6f
        sta vScreenControl1
        jsr L_3ced
        jmp L_8015
    L_b453:
        lda $62
        bne L_b459
        inc $51
    L_b459:
        bne L_b48c
        jmp L_b37a
    L_b45e:
        lda L_0800
        eor #$01
        sta L_0800
        beq L_b47a
        lda $f0
        sta $da
        lda $db
        bmi L_b42f
        sta $f0
        lda L_080c + $4
        sta $5f
        jmp L_b37a
    L_b47a:
        lda $f0
        sta $db
        lda $da
        bmi L_b42f
        sta $f0
        lda L_080c + $3
        sta $5f
        jmp L_b37a
    L_b48c:
        ldx $16
        ldy #$2d
    L_b490:
        lda L_a7ad,x
        sta L_6780 + $2,y
        sta L_67c0 + $2,y
        sta L_7f80,y
        sta L_7fc0,y
        inx 
        iny 
        iny 
        iny 
        cpy #$3c
        bne L_b490
        lda $ed
        bne L_b4b5
        lda $f4
        beq L_b4b5
        lda $62
        and #$0f
        beq L_b4b8
    L_b4b5:
        jmp L_b50c

    L_b4b8:
         .byte $a5,$f4,$a2,$34,$a5,$56,$29,$07,$a8,$e6,$56,$bd,$c4,$11,$f0,$21
        .byte $d9,$f1,$b4,$d0,$06,$b9,$f2,$b4,$9d,$c4,$11,$d9,$fa,$b4,$d0,$06
        .byte $b9,$fb,$b4,$9d,$c4,$11,$d9,$03,$b5,$d0,$06,$b9,$04,$b5,$9d,$c4
        .byte $11,$ca,$ca,$ca,$ca,$10,$d4,$30,$1b,$5e,$5b,$5b,$5e,$bf,$bc,$bc
        .byte $bf,$5e,$5f,$5c,$5c,$5f,$be,$bb,$bb,$be,$5f,$60

    L_b504:
        eor L_605d,x
        cpy #$bd
        lda L_60c0,x
    L_b50c:
        lda $ed
        cmp #$80
        beq L_b51d
        lda $ed
        bmi L_b54b
        jsr L_b81c
        lda $ed
        bne L_b54b
    L_b51d:
        jsr L_3b96
        sta $e8
        and #$80
        sta $ed
        beq L_b54b
        lda $62
        bne L_b54b
        inc $de
        bne L_b54b
    L_b530:
        lda vScreenControl1
        and #$80
        beq L_b530
        sei 
        lda vScreenControl1
        and #$6f
        sta vScreenControl1
        lda vBorderCol
        sta L_16c0 + $2f
        lda #$00
        sta sFiltMode
    L_b54b:
        jsr L_926a

        .byte $85,$f3,$a5,$62,$29,$0f,$d0,$3a,$a5,$5f,$29,$0c,$c9,$08,$d0,$32
        .byte $a2,$0f,$a0,$00,$bd,$80,$b5,$85,$69,$ca,$bd,$80,$b5,$85,$68,$b1
        .byte $68,$18,$69,$02,$29,$03,$09,$08,$38,$e9,$01,$91,$68,$ca,$10,$e4
        .byte $30,$10,$e9,$d8,$8b,$d9,$2d,$da,$cf,$da,$a8,$da,$0a,$da,$6c,$d9
        .byte $ce,$d8,$a5,$5f,$29,$0c,$f0,$07,$c9,$08,$f0,$03,$4c,$c1,$a6

    L_b59d:
        lda #$01
        bit $6a
        beq L_b5a9
        bmi L_b5c3
        bvc L_b5e7
        bvs L_b5ad
    L_b5a9:
        bpl L_b5c3
        bvc L_b5e7
    L_b5ad:
        lda #$da
        sta $67
        lda #$3c
        sta $66
        lda $5f
        and #$0f
        cmp #$09
        beq L_b5ef
        cmp #$0b
        beq L_b5ef
        bne L_b5fa
    L_b5c3:
        bvc L_b5c7
        bvs L_b5d1
    L_b5c7:
        lda #$d8
        sta $67
        lda #$62
        sta $66
        bne L_b5ef
    L_b5d1:
        lda #$d9
        sta $67
        lda #$00
        sta $66
        lda $5f
        and #$0f
        cmp #$08
        beq L_b5ef
        cmp #$0a
        beq L_b5ef
        bne L_b5fa
    L_b5e7:
        lda #$d9
        sta $67
        lda #$9e
        sta $66
    L_b5ef:
        lda $5f
        and #$0c
        cmp #$08
        bne L_b5fa
        jmp L_a6c1
    L_b5fa:
        lda $6a
        and #$3f
        cmp #$02
        beq L_b654
        cmp #$08
        beq L_b634
        cmp #$12
        beq L_b631
        cmp #$18
        beq L_b651
        cmp #$1e
        beq L_b641
        cmp #$24
        beq L_b637
        cmp #$1d
        beq L_b641
        cmp #$23
        beq L_b64b
        cmp #$2d
        beq L_b64e
        cmp #$33
        beq L_b637
        cmp #$39
        beq L_b654
        cmp #$3f
        beq L_b6a4
        jmp L_a6c1
    L_b631:
        jmp L_b762
    L_b634:
        jmp L_b71a
    L_b637:
        lda $67
        sec 
        sbc #$94
        sta $67
        jmp L_b6ff
    L_b641:
        lda $67
        sec 
        sbc #$94
        sta $67
        jmp L_b7de
    L_b64b:
        jmp L_b7fc
    L_b64e:
        jmp L_b7f7
    L_b651:
        jmp L_b6a4
    L_b654:
        lda vBackgCol1
        ldy #$45
        sta ($66),y
        ldy #$e5
        sta ($66),y
        lda vBackgCol2
        ldy #$bd
        sta ($66),y
        lda #$00
        ldy #$46
        sta ($66),y
        ldy #$6e
        sta ($66),y
        ldy #$96
        sta ($66),y
        lda $67
        sec 
        sbc #$94
        sta $67
        lda #$2f
        ldy #$45
        sta ($66),y
        ldy #$6e
        sta ($66),y
        ldy #$bd
        sta ($66),y
        lda #$26
        ldy #$46
        sta ($66),y
        lda #$67
        ldy #$6d
        sta ($66),y
        lda #$e6
        ldy #$be
        sta ($66),y
        lda #$a7
        ldy #$e5
        sta ($66),y
        jmp L_a6c1
    L_b6a4:
        lda vBackgCol2
        ldy #$45
        sta ($66),y
        lda vBackgCol1
        ldy #$bd
        sta ($66),y
        ldy #$e5
        sta ($66),y
        lda vBackgCol0
        ldx $67
        cpx #$d8
        bne L_b6c1
        lda #$03
    L_b6c1:
        ldy #$46
        sta ($66),y
        lda #$09
        ldx $67
        cpx #$d8
        bne L_b6cf
        lda #$03
    L_b6cf:
        ldy #$96
        sta ($66),y
        lda vBackgCol2
        ldx $67
        cpx #$d8
        bne L_b6de
        lda #$03
    L_b6de:
        ldy #$6e
        sta ($66),y
        lda $67
        sec 
        sbc #$94
        sta $67
        lda #$2f
        ldy #$46
        sta ($66),y
        ldy #$be
        sta ($66),y
        ldx $67
        cpx #$44
        beq L_b6fb
        lda #$23
    L_b6fb:
        ldy #$6e
        sta ($66),y
    L_b6ff:
        lda #$61
        ldy #$45
        sta ($66),y
        lda #$a1
        ldy #$bd
        sta ($66),y
        lda #$a3
        ldy #$e5
        sta ($66),y
        lda #$63
        ldy #$6d
        sta ($66),y
        jmp L_a6c1
    L_b71a:
        lda #$00
        ldy #$47
        sta ($66),y
        ldy #$6f
        sta ($66),y
    L_b724:
        ldy #$97
        sta ($66),y
        lda vBackgCol1
        ldy #$6d
        sta ($66),y
        lda vBackgCol2
        ldy #$96
        sta ($66),y
        ldy #$be
        sta ($66),y
        ldy #$e6
        sta ($66),y
        ldy #$e5
        sta ($66),y
        lda $67
        sec 
        sbc #$94
        sta $67
        lda #$2f
        ldy #$46
        sta ($66),y
        ldy #$47
        sta ($66),y
        ldy #$6d
        sta ($66),y
        ldy #$e5
        sta ($66),y
        ldy #$be
        sta ($66),y
        jmp L_a6c1
    L_b762:
        lda vBackgCol1
        ldy #$e5
        sta ($66),y
        ldy #$e6
        sta ($66),y
        lda vBackgCol2
        ldx $67
        cpx #$d8
        beq L_b77c
        lda vBackgCol1
        jmp L_b77e
    L_b77c:
        lda #$03
    L_b77e:
        ldy #$47
        sta ($66),y
        lda vBackgCol2
        ldy #$6d
        sta ($66),y
        lda vBackgCol2
        ldx $67
        cpx #$d8
        bne L_b794
        lda #$03
    L_b794:
        ldy #$6f
        sta ($66),y
        lda #$00
        ldy #$96
        sta ($66),y
        lda #$09
        ldx $67
        cpx #$d8
        bne L_b7a8
        lda #$03
    L_b7a8:
        ldy #$97
        sta ($66),y
        ldy #$be
        sta ($66),y
        lda $67
        sec 
        sbc #$94
        sta $67
        lda #$26
        ldy #$46
        sta ($66),y
        ldx $67
        cpx #$44
        beq L_b7c9
        lda #$a3
        ldy #$47
        sta ($66),y
    L_b7c9:
        lda #$67
        ldy #$6d
        sta ($66),y
        lda #$e6
        ldy #$be
        sta ($66),y
        lda #$a7
        ldy #$e5
        sta ($66),y
        jmp L_a6c1
    L_b7de:
        lda #$67
        ldy #$45
        sta ($66),y
        lda #$2f
        ldy #$6d
        sta ($66),y
        ldy #$e5
        sta ($66),y
        lda #$a7
        ldy #$bd
        sta ($66),y
        jmp L_a6c1
    L_b7f7:
        ldx #$67
        jmp L_b7fe
    L_b7fc:
        ldx #$2f
    L_b7fe:
        lda $67
        sec 
    L_b801:
        sbc #$94
        sta $67
        txa 
        ldy #$45
        sta ($66),y
        ldy #$bd
        cpx #$2f
        bne L_b815
        lda #$65
        jmp L_b817
    L_b815:
        lda #$a7
    L_b817:
        sta ($66),y
        jmp L_a6c1
    L_b81c:
        lda $ed
        beq L_b827
        lda #$10
        sta $ea
        jmp L_bc0c
    L_b827:
        lda #$40
        sta $e3
        ldx #$00
        stx $e4
        stx $ea
    L_b831:
        lda #$00
        sta $69
        txa 
        and #$f0
        tay 
        sty $20
        lda L_1100 + $8,x
        and #$f0
        bne L_b845
        jmp L_b9fe
    L_b845:
        lda L_1100 + $8,x
        and #$1f
        cmp #$1d
        bne L_b854
        jsr L_bdc9
        jmp L_bb41
    L_b854:
        bcc L_b859
        jmp L_bc2c
    L_b859:
        lda L_1100 + $8,x
        and #$0f
        cmp #$04
        bcc L_b869
        cmp #$09
        bcs L_b869
        jmp L_ba3a
    L_b869:
        bcc L_b88f
        lda $62
        and #$0f
        bne L_b88c
        lda $f5
        bne L_b884
        lda $6a
        ldy $e4
        sta.a $00c0,y
        dec $ea
        jsr L_bdc9
        jmp L_bb41
    L_b884:
        lda L_1100 + $8,x
        eor #$e0
        sta L_1100 + $8,x
    L_b88c:
        jmp L_bb41
    L_b88f:
        lda $62
        and #$0f
        bne L_b89d
        lda L_1100 + $8,x
        eor #$01
        sta L_1100 + $8,x
    L_b89d:
        lda $51
        cmp #$20
        bcc L_b8aa
        lda $62
        asl 
        sta $68
        bcs L_b8bb
    L_b8aa:
        cmp #$18
        bcc L_b8b4
        lda $62
        sta $68
        bne L_b8bb
    L_b8b4:
        lda $62
        lsr 
        bcc L_b8cf
        sta $68
    L_b8bb:
        lda $e4
        cmp #$04
        bcc L_b8d2
        cmp #$08
        bcc L_b8de
        cmp #$0c
        bcc L_b8e6
        lda $68
        and #$01
        beq L_b8ea
    L_b8cf:
        jmp L_b90d
    L_b8d2:
        lda $68
        and #$01
        bne L_b8cf
        lda $16
        bne L_b8cf
        beq L_b8ea
    L_b8de:
        lda $68
        and #$03
        bne L_b8cf
        beq L_b8ea
    L_b8e6:
        lda $16
        bne L_b8cf
    L_b8ea:
        lda L_1100 + $8,x
        asl 
        bcs L_b8f7
        inc L_1100 + $a,x
        beq L_b905
        bne L_b90d
    L_b8f7:
        lda L_1100 + $a,x
        beq L_b902
        dec L_1100 + $a,x
        jmp L_b90d
    L_b902:
        dec L_1100 + $a,x
    L_b905:
        lda L_1100 + $3,y
        eor $e3
        sta L_1100 + $3,y
    L_b90d:
        jsr L_b913
        jmp L_b95c
    L_b913:
        lda L_1100 + $9,x
        and #$20
        beq L_b91f
        lda L_1100 + $9,x
        bne L_b924
    L_b91f:
        lda L_1100 + $9,x
        and #$7f
    L_b924:
        clc 
        adc #$03
        sta $68
        lda L_1100 + $8,x
        cmp #$a0
        bcs L_b936
        lda #$02
        dec $69
        bne L_b93a
    L_b936:
        lda #$00
        inc $69
    L_b93a:
        eor $68
        sta $68
        lda L_1100 + $3,y
        and $e3
        cmp $e3
        lda L_1100 + $a,x
        ror 
        lsr 
        lsr 
        sec 
        sbc #$03
        clc 
        adc $68
        sta $68
        clc 
        adc $69
        sta $69
        bit L_a3fc + $3
        rts 


    L_b95c:
        cmp $68
        bcc L_b9d2
        lda $e7
        beq L_b966
        bne L_b98a
    L_b966:
        lda $68
        cmp #$74
        beq L_b978
        cmp #$12
        beq L_b978
        cmp #$b0
        beq L_b978
        cmp #$4e
        bne L_b983
    L_b978:
        lda L_0840 + $3
        bne L_b980
        jmp L_bb65
    L_b980:
        jmp L_beb6
    L_b983:
        cmp L_1100 + $1c,y
        beq L_b98a
        bcs L_b9cf
    L_b98a:
        sta L_1100 + $1c,y
        lda $69
        sta L_1100 + $1d,y
        lda L_a31e + $1,y
        bne L_b99c
        lda $e7
        beq L_b9cf
        rts 


    L_b99c:
        lda #$00
        sta L_a31e + $1,y
        lda L_1100 + $1e,y
        sta L_1100 + $1c,y
        sta L_1100 + $1d,y
        ldy $e4
        lda L_a5ae,y
        sta.a $00c0,y
        lda L_1100 + $8,x
        clc 
        adc #$5c
        ora #$01
        lsr 
        lsr 
        bcs L_b9c4
        sec 
        rol 
        clc 
        rol 
        bne L_b9c7
    L_b9c4:
        rol 
        sec 
        rol 
    L_b9c7:
        sta L_1100 + $8,x
        lda $e7
        beq L_b9cf
        rts 


    L_b9cf:
        jmp L_bb41
    L_b9d2:
        lda $e7
        beq L_b9d9
        jmp L_b98a
    L_b9d9:
        lda $68
        cmp #$82
        beq L_b9eb
        cmp #$24
        beq L_b9eb
        cmp #$c6
        beq L_b9eb
        cmp #$68
        bne L_b9f6
    L_b9eb:
        lda L_0840 + $3
        bne L_b9f3
        jmp L_bb65
    L_b9f3:
        jmp L_beb6
    L_b9f6:
        cmp L_1100 + $1c,y
        bcc L_b9cf
        jmp L_b98a
    L_b9fe:
        ldy $e4
        lda L_1100 + $b,x
        and #$20
        bne L_ba0f
        lda $62
        and #$0f
        bne L_ba34
        beq L_ba19
    L_ba0f:
        lda $62
        and #$01
        bne L_ba34
        lda $16
        bne L_ba34
    L_ba19:
        lda.a $00c0,y
        clc 
        adc #$01
        sta.a $00c0,y
        cmp #$2c
        bne L_ba34
        lda L_a308,x
        clc 
        adc #$04
        and #$fe
    L_ba2e:
        sta L_1100 + $8,x
        jmp L_bb41
    L_ba34:
        jsr L_be49
        jmp L_bb41
    L_ba3a:
        ldy $e4
        lda $6a
        sta.a $00c0,y
    L_ba41:
        dec $ea
        jsr L_bdc9
        lda L_1100 + $8,x
        and #$04
        beq L_ba50
        jmp L_bb41
    L_ba50:
        inc $f8
        lda $5f
        lsr 
        cmp $f9
        bcs L_ba5c
        jmp L_baf8
    L_ba5c:
        ora #$01
        and #$07
        cmp $f8
        bcc L_ba67
        jmp L_baf8
    L_ba67:
        lda #$00
        sta $f8
        lda $f5
        beq L_ba72
        jmp L_baf8
    L_ba72:
        stx $68
        ldx #$00
        ldy #$13
        jsr L_9844
        ldx $68
    L_ba7d:
        lda $18
        beq L_ba9a
        ldy #$00
        lda #$2f
        sta ($18),y
        iny 
        sta ($18),y
        lda $19
        clc 
        adc #$94
        sta $19
        iny 
        lda ($18),y
        dey 
        sta ($18),y
        dey 
        sta ($18),y
    L_ba9a:
        ldy $e4
        lda L_bc80,y
        cmp #$30
        bcc L_baab
        cmp #$6f
        bcc L_bab3
        cmp #$90
        bcc L_baaf
    L_baab:
        ldy #$da
        bmi L_bab5
    L_baaf:
        ldy #$d9
        bmi L_bab5
    L_bab3:
        ldy #$db
    L_bab5:
        sty $19
        sta $18
        ldy #$00
        lda #$07
        sta ($18),y
        iny 
        lda #$05
        sta ($18),y
        lda $19
        sec 
        sbc #$94
        sta $19
        lda $5f
        and #$0c
        cmp #$0c
        bne L_baef
        lda $18
        cmp #$6f
        bcs L_bae4
        lda #$4f
        sta ($18),y
        dey 
        lda #$5e
        sta ($18),y
        bne L_baf8
    L_bae4:
        lda #$0f
        sta ($18),y
        dey 
        lda #$1e
        sta ($18),y
        bne L_baf8
    L_baef:
        lda #$8f
        sta ($18),y
        dey 
        lda #$9e
        sta ($18),y
    L_baf8:
        ldy $e4
    L_bafa:
        lda L_bc80,y
        tay 
        sty $df
    L_bb00:
        dey 
        sty $e1
        iny 
        iny 
        sty $e0
        ldy $d1
        beq L_bb1e
    L_bb0b:
        lda.a $0083,y
    L_bb0e:
        cmp $df
        beq L_bb41
        cmp $e0
        beq L_bb41
        cmp $e1
    L_bb18:
        beq L_bb41
        dey 
        dey 
        bne L_bb0b
    L_bb1e:
        inc $d1
        lda $df
        inc $d1
        ldy $d1
        sta.a $0083,y
    L_bb29:
        iny 
        lda L_1100 + $8,x
        and #$80
        bne L_bb35
        lda #$fc
        bmi L_bb37
    L_bb35:
        lda #$d2
    L_bb37:
        sta.a $0083,y
    L_bb3a:
        lda #$00
        ldy $e4
        sta L_bc80,y
    L_bb41:
        lsr $e3
        inc $e4
        inx 
        inx 
        inx 
        inx 
        txa 
        and #$0f
        bne L_bb5e
        txa 
        clc 
        adc #$10
        cmp #$80
        bne L_bb59
        jmp L_bc0c
    L_bb59:
        tax 
        lda #$40
        sta $e3
    L_bb5e:
        lda #$00
        sta $69
        jmp L_b831
    L_bb65:
        inc $ed
        lda $ed
        tay 
        dey 
        beq L_bb90
        and #$0f
        bne L_bb8b
        lda $ed
        cmp #$40
        bcs L_bb8b
        ldx vSprite1Y
        lda L_1080 + $3c,x
        eor #$e0
        sta L_1080 + $3c,x
        lda L_47f8
        eor #$e0
        sta L_47f8 + $1
        rts 


    L_bb8b:
        cpy #$7e
        beq L_bbd6
        rts 


    L_bb90:
        ldx #$00
        ldy #$00
        jsr L_9844
        ldx #$01
        ldy #$06
        jsr L_9844
        ldx #$02
        ldy #$07
        jsr L_9844
    L_bba5:
        ldx vSprite1Y
        lda $a29c,x
        ora #$03
        sta L_1080 + $3c,x
        eor #$19
        sta L_47f8 + $1
        ldy #$04
        lda L_0800
        beq L_bbbe
        ldy #$0b
    L_bbbe:
        lda L_0800,y
        clc 
        adc #$01
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_bbd5
        sta L_0800,y
        dey 
        ldx #$03
        jsr L_972d
    L_bbd5:
        rts 


    L_bbd6:
        lda vScreenControl1
        and #$80
        beq L_bbd6
        sei 
        lda vScreenControl1
        and #$6f
        sta vScreenControl1
        lda $5f
        and #$0f
    L_bbea:
        cmp #$06
        beq L_bbf4
    L_bbee:
        and #$09
        bne L_bbf4
        inc $5f
    L_bbf4:
        inc $5f
        lda L_0840 + $3
        bne L_bc01
        lda $5f
        and #$f7
        sta $5f
    L_bc01:
        lda $5f
        and #$03
        bne L_bc09
        inc $50
    L_bc09:
        jmp ($0318)
    L_bc0c:
        lda $62
        and #$01
        bne L_bc18
        jsr L_3c2c
        jmp L_bc1b
    L_bc18:
        jsr L_bfc3
    L_bc1b:
        lda $e7
        beq L_bc22
        jmp L_beb6
    L_bc22:
        lda $ea
        cmp #$10
        bne L_bc2b
        jmp L_bb65
    L_bc2b:
        rts 


    L_bc2c:
        clv 
    L_bc2d:
        lda L_1100 + $a,x
        cmp L_a309 + $1,y
        bne L_bc38
        jmp L_bcf3
    L_bc38:
        lda L_1100 + $8,x
        and #$60
        bne L_bc52
        lda L_1100 + $a,x
        bne L_bc4c
    L_bc44:
        lda L_1100 + $3,y
        eor $e3
        sta L_1100 + $3,y
    L_bc4c:
        dec L_1100 + $a,x
        jmp L_bc5d
    L_bc52:
        inc L_1100 + $a,x
        bne L_bc5d
        inc L_1100 + $a,x
        jmp L_bc44
    L_bc5d:
        sty $20
        ldy $e4
        lda.a $00c0,y
        tay 
        dey 
        beq L_bc90
        tya 
        ldy $e4
        sta.a $00c0,y
    L_bc6e:
        ldy $20
        bvs L_bc78
        bit L_a3fc + $3
        jmp L_bc2d
    L_bc78:
        lda $e7
        beq L_bc7d
        rts 


    L_bc7d:
        jmp L_bb41

    L_bc80:
         .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

    L_bc90:
        lda $e7
        beq L_bca2
        lda L_1100 + $8,x
        sec 
        sbc #$5d
        and #$fe
        eor #$e0
        sta L_1100 + $8,x
        rts 


    L_bca2:
        ldy $20
        lda #$00
        sta $69
        jsr L_b913
        lda $e4
        and #$0c
        tay 
    L_bcb0:
        lda L_bc80,y
        cmp $68
        beq L_bc6e
        cmp $69
        beq L_bc6e
        sty $f1
        ldy $68
        iny 
        cpy $69
        bne L_bcc6
        dey 
        dey 
    L_bcc6:
        tya 
        ldy $f1
        cmp L_bc80,y
        beq L_bc6e
        iny 
        tya 
        and #$03
        bne L_bcb0
        ldy $e4
        lda $68
        sta L_bc80,y
        lda #$19
        sta.a $00c0,y
        tya 
        sta L_1100 + $8,x
        jsr L_be49
        stx $20
        jsr L_926a
        sta $f3
        ldx $20
        jmp L_bb41
    L_bcf3:
        lda L_1100 + $8,x
        and #$fd
        ora #$01
        sta L_1100 + $8,x
        lda L_a309 + $1,x
        sta L_1100 + $a,x
        lda L_a303,y
        and $e3
        sta $68
        lda $e3
        eor #$ff
        and L_1100 + $3,y
        ora $68
        sta L_1100 + $3,y
        lda $52
        cmp #$e0
        bne L_bd29
        lda $f3
        and #$07
        bne L_bd29
        lda #$70
        adc $6a
        jmp L_bd2e
    L_bd29:
        lda $6a
        clc 
        adc $52
    L_bd2e:
        bne L_bd32
        adc #$01
    L_bd32:
        ldy $e4
        sta.a $00c0,y
        lda L_a5ae,y
        adc L_16c0 + $30,y
        bmi L_bd47
        sta L_a5ae,y
        lda #$03
        sta L_16c0 + $30,y
    L_bd47:
        stx $20
        lda $5f
        and #$0f
        lsr 
        lsr 
        lsr 
    L_bd50:
        sta $f1
        bcs L_bd7d
    L_bd54:
        ldy #$06
        lda L_0800
        beq L_bd5d
        ldy #$0d
    L_bd5d:
        lda L_0800,y
        clc 
        adc #$05
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_bd74
        sta L_0800,y
        ldx #$05
        dey 
        jsr L_972d
    L_bd74:
        lsr $f1
        bcs L_bd54
        ldx $20
        jmp L_bb41
    L_bd7d:
        ldy #$07
        lda L_0800
        beq L_bd86
        ldy #$0e
    L_bd86:
        lda L_0800,y
        beq L_bd99
        lda #$00
        sta L_0800,y
        dey 
        ldx #$06
        jsr L_972d
        jmp L_bd9e
    L_bd99:
        lda #$05
        sta L_0800,y
    L_bd9e:
        ldy #$06
    L_bda0:
        lda L_0800
        beq L_bda7
        ldy #$0d
    L_bda7:
        lda L_0800,y
        clc 
        adc #$07
        sta L_0800,y
        sec 
        sbc #$0a
        bcc L_bdbe
        sta L_0800,y
        ldx #$05
        dey 
        jsr L_972d
    L_bdbe:
        lsr $f1
        bcs L_bd7d
        ldx $20
        inc $ea
        jmp L_bb41
    L_bdc9:
        ldy $e4
        lda.a $00c0,y
        bne L_bde4
        lda L_1100 + $b,x
        and #$10
        beq L_bde1
        lda L_1100 + $b,x
        and #$ef
        sta L_1100 + $b,x
        bne L_bde8
    L_bde1:
        inc $ea
        rts 


    L_bde4:
        cmp $6a
        bne L_bde1
    L_bde8:
        lda $d0
        beq L_be1a
        ldy $20
    L_bdee:
        lda L_1100 + $8,y
        and #$f0
        beq L_bdfe
        lda L_1100 + $8,y
        and #$0c
        bne L_bdfe
        beq L_be09
    L_bdfe:
        iny 
        iny 
    L_be00:
        iny 
        iny 
        tya 
        and #$0f
        bne L_bdee
        beq L_be1a
    L_be09:
        lda #$10
        ora L_1100 + $b,x
        sta L_1100 + $b,x
        lda #$00
        ldy $e4
        sta.a $00c0,y
        bpl L_bde1
    L_be1a:
        lda L_1100 + $8,x
        and #$0f
        cmp #$0d
        bne L_be2e
        stx $68
        ldx #$00
        ldy #$10
        jsr L_9844
        ldx $68
    L_be2e:
        ldy $20
        lda $a304,y
        and #$f0
        sta L_1100 + $8,x
        lda L_1100 + $b,x
        and #$20
        beq L_be41
        lda #$02
    L_be41:
        clc 
        adc L_1100 + $8,x
        sta L_1100 + $8,x
        rts 


    L_be49:
        lda $e4
        and #$03
        lsr 
        ror 
        ror 
        sta $f1
        lda #$40
        sta $f2
        lda $e4
        lsr 
        lsr 
        clc 
        adc $f2
        sta $f2
        ldy $20
        stx $69
        lda $a304,y
        and #$80
        bne L_be90
        ldy $e4
        lda.a $00c0,y
        sta $68
        ldy #$1d
    L_be73:
        tya 
        clc 
        adc $16
        tax 
        cpy $68
        bcc L_be81
        lda L_bf00,x
        bne L_be84
    L_be81:
        lda L_bf1d + $1,x
    L_be84:
        sta ($f1),y
        iny 
        iny 
        iny 
        cpy #$2c
        bcc L_be73
        ldx $69
        rts 


    L_be90:
        ldy $e4
        lda.a $00c0,y
        sta $68
        ldy #$1b
    L_be99:
        tya 
        clc 
        adc $16
        tax 
        cpy $68
        bcc L_bea7
        lda L_bf11,x
        bne L_beaa
    L_bea7:
        lda L_bf2f,x
    L_beaa:
        sta ($f1),y
        iny 
        iny 
        iny 
        cpy #$2a
        bcc L_be99
        ldx $69
        rts 


    L_beb6:
        lda $ed
        beq L_becd
        lda $e5
        clc 
        adc #$68
        cmp vSprite1Y
        beq L_bedf
        lda $eb
        ora #$fe
        eor #$01
        sta $eb
        rts 


    L_becd:
        sty $e5
        stx $e6
        sta $18
        lda #$01
        sta $ed
        sta $e7
        sta L_a31e + $1,y
        jmp L_beb6
    L_bedf:
        ldy $e5
        lda L_1100 + $22,y
        and #$7f
        sta L_1100 + $22,y
        lda L_1100 + $1e,y
    L_beec:
        cmp $54
        beq L_bf07
        ldx $e6
        lda L_a303,y
        and #$80
        bne L_bf00
        lda #$f7
        sta $eb
        jmp L_b831
    L_bf00:
        lda #$fb
        sta $eb
        jmp L_b831
    L_bf07:
        sta $68
        lda L_1100 + $22,y
        ora #$80
        sta L_1100 + $22,y
    L_bf11:
        lda #$00
        sta $ed
    L_bf15:
        sta $e7
        iny 
        pla 
        pla 
        jmp L_b1e9 + $d

    L_bf1d:
         .byte $dc,$fc,$fc,$77,$ff,$df,$ff,$df,$77,$df,$77,$ff,$fc,$fc,$dc,$37
        .byte $3f,$3f

    L_bf2f:
        cmp L_f7c0 + $3f,x

        .byte $ff,$f7,$dd,$f7,$dd,$ff,$3f,$3f,$37,$dc,$dc,$dc,$57,$57,$57,$57
        .byte $57,$57,$57,$57,$57,$dc,$dc,$dc,$37,$37,$37,$d5,$d5,$d5,$d5,$d5
        .byte $d5,$d5,$d5,$d5,$37,$37,$37,$73,$00,$01,$df,$80,$03,$3c,$c0,$06
        .byte $ed,$c0,$03,$87,$00,$01,$83,$80,$00,$cf,$00,$00,$7e,$00,$00,$18
        .byte $ce,$00,$01,$fb,$80,$03,$3c,$c0,$03,$b7,$60,$00,$e1,$c0

    L_bf80:
        nop 
        nop 
        nop 
        nop 
        nop 
        clc 
        ldx $f0
        beq L_bf97
    L_bf8a:
        lda #$53
        sta SCREEN_BUFFER_1 + $19,x
        lda #$08
        sta vColorRam + $19,x
        dex 
        bne L_bf8a
    L_bf97:
        rts 


    L_bf98:
        ldx $f0
        beq L_bfc2
        cpx #$0a
        bcc L_bfa2
        ldx #$09
    L_bfa2:
        lda vColorRam + $19,x
        and #$0f
        cmp #$0a
        bne L_bfb0
        eor #$08
        jmp L_bfb6
    L_bfb0:
        cmp #$02
        bne L_bfbc
        eor #$0a
    L_bfb6:
        sta vColorRam + $19,x
    L_bfb9:
        jmp L_bfbf
    L_bfbc:
        inc vColorRam + $19,x
    L_bfbf:
        dex 
        bne L_bfa2
    L_bfc2:
        rts 


    L_bfc3:
        ldy #$03
        ldx L_0800
        beq L_bfcc
        ldy #$0a
    L_bfcc:
        lda L_0800,y
        cmp $ee
        beq L_bfff
        sta $ee
        cmp $d7,x
        bne L_bfff
        ldy $f0
    L_bfdb:
        cpy #$09
        bcs L_bff1
        inc $f0
        lda #$53
        sta SCREEN_BUFFER_1 + $1a,y
        lda vColorRam + $19,y
        and #$08
        sec 
        sbc #$06
        sta vColorRam + $1a,y
    L_bff1:
        lda $d7,x
        clc 
        adc $e9
        sta $d7,x
        sec 
        sbc #$0a
        bcc L_bfff
        sta $d7,x
    L_bfff:
        rts 


        lda #$93
        jsr $ffd2
        lda #$00
        jsr $ff90
        ldy #$00
    L_c00c:
        lda L_c07c,y
        beq L_c017
        jsr $ffd2
        iny 
        bne L_c00c
    L_c017:
        nop 
        nop 
        nop 
        jsr $c0a9
        lda #$02
        ldx #$08
        ldy #$00
        jsr $ffba
        ldx #$97
        ldy #$c0
        lda #$06
        jsr $ffbd
        lda #$00
        ldx #$00
        ldy #$20
        jsr $ffd5
        lda #$02
        ldx #$08
        ldy #$00
        jsr $ffba
        ldx #$9d
        ldy #$c0
        lda #$06
        jsr $ffbd
        lda #$00
        ldx #$00
        ldy #$80
        jsr $ffd5
    L_c053:
        lda #$37
    L_c055:
        sta $01
    L_c057:
        jsr L_c450
        jsr L_c0b4
    L_c05d:
        jmp L_37d8
        sta $fe
        ldy #$00
        sty $fd
        lda #$00
        sta $fb
    L_c06a:
        lda ($fb),y
        sta ($fd),y
        iny 
        bne L_c06a
        inc $fc
        inc $fe
    L_c075:
        dex 
        bne L_c06a
        sei 
        jmp L_37d8

    L_c07c:
         .byte $00,$00,$00,$00

    L_c080:
        ldx #$23
    L_c082:
        lda L_c63f,x
        sta SCREEN_BUFFER_0 + $372,x
        lda $c663,x
        sta SCREEN_BUFFER_0 + $39a,x
    L_c08e:
        dex 
        bpl L_c082
        rts 


    L_c092:
        ldx #$19
    L_c094:
        lda L_c687,x
        sta SCREEN_BUFFER_0 + $3c7,x
        dex 
        bpl L_c094
        jsr L_c080
        jsr L_3b60
        lda #$30
        sta $0316
        sta $0318
    L_c0ab:
        lda #$c4
        sta $0317
        sta $0319
        rts 


    L_c0b4:
        sei 
    L_c0b5:
        lda $0201
        sta L_c777 + $2
        lda #$35
        sta $01
        ldx #$1d
        lda #$a3
        sta $fc
        lda #$e0
        sta $fe
        ldy #$00
        sty $fd
        lda #$00
        sta $fb
    L_c0d1:
        lda ($fb),y
        sta ($fd),y
        iny 
        bne L_c0d1
        inc $fc
        inc $fe
        dex 
        bne L_c0d1
        sei 
        lda #$01
        bit L_c777 + $2
        bne L_c0ec
        lda #$a5
        sta L_ef00 + $1b
    L_c0ec:
        lda #$02
        bit L_c777 + $2
        bne L_c101
        lda #$ea
    L_c0f5:
        sta L_f640 + $3b
        sta L_f640 + $3c
        sta L_f6c0 + $2e
        sta L_f6c0 + $2f
    L_c101:
        lda #$04
        bit L_c777 + $2
        bne L_c113
        lda #$ea
        sta L_ebc0 + $a
        sta L_ebc0 + $b
        sta L_ebc0 + $c
    L_c113:
        lda #$08
        bit L_c777 + $2
        bne L_c11f
        lda #$60
        sta L_f7c0 + $38
    L_c11f:
        lda #$10
        bit L_c777 + $2
        bne L_c12e
        lda #$ea
        sta L_9485
        sta $9486
    L_c12e:
        lda #$20
        bit L_c777 + $2
        bne L_c141
        lda #$ea
        lda #$44
        sta L_ea00 + $2
        lda #$c1
        sta L_ea00 + $3
    L_c141:
        jmp L_37d8
        sta L_c777 + $7
        lda $f0
        cmp #$ff
        beq L_c197
        lda cCia1PortA
        sta L_c777 + $3
        lda cCia1PortB
        sta L_c777 + $4
        lda cCia1DDRA
        sta L_c777 + $5
        lda cCia1DDRB
        sta L_c777 + $6
        lda #$ff
        sta cCia1DDRA
        lda #$00
        sta cCia1DDRB
        lda #$7f
        sta cCia1PortA
        lda #$20
        bit cCia1PortB
        bne L_c17f
        lda #$7e
        sta $ed
    L_c17f:
        lda L_c777 + $3
        sta cCia1PortA
        lda L_c777 + $4
        sta cCia1PortB
        lda L_c777 + $5
        sta cCia1DDRA
        lda L_c777 + $6
        sta cCia1DDRB
    L_c197:
        lda L_c777 + $7
        jsr L_9877
        rts 


    L_c19e:
        sta L_c448 + $1
        stx L_c448 + $2
        sty L_c448 + $3
        jsr L_c432
    L_c1aa:
        lda L_0840 + $3
        cmp #$00
        beq L_c1d4
    L_c1b1:
        lda L_0840
        cmp #$01
        bne L_c1c7
        inc L_c448 + $6
        lda L_c448 + $6
        cmp #$02
        bne L_c1e3
        lda #$00
        sta L_c448 + $6
    L_c1c7:
        lda L_c448 + $5
        cmp #$00
        bne L_c1d1
        inc L_c448 + $5
    L_c1d1:
        jsr L_c1e6
    L_c1d4:
        jsr L_c43d
        lda L_c448 + $1
        ldx L_c448 + $2
        ldy L_c448 + $3
        jmp L_37dd
    L_c1e3:
        jmp L_b424
    L_c1e6:
        ldx #$06
        clc 
    L_c1e9:
        lda L_0800 + $1,x
        adc #$30
        sta $c769,x
        dex 
        bpl L_c1e9
        lda #$01
        sta L_c448 + $4
        lda L_0840
        cmp #$01
        bne L_c22d
        clc 
        ldx #$06
    L_c203:
        lda $0808,x
        adc #$30
        sta L_c76b + $5,x
        dex 
        bpl L_c203
        lda #$01
        sta L_c448 + $4
        jsr L_c267
        lda L_c777
        cmp #$01
        beq L_c22d
        lda #$02
        sta L_c448 + $4
        ldx #$06
    L_c224:
        lda L_c76b + $5,x
        sta $c769,x
        dex 
        bpl L_c224
    L_c22d:
        ldx #$06
    L_c22f:
        lda L_0840 + $2
        cmp #$00
        bne L_c23c
        lda L_c647 + $1,x
        sta L_c76b + $5,x
    L_c23c:
        cmp #$01
        bne L_c246
        lda L_c652,x
        sta L_c76b + $5,x
    L_c246:
        cmp #$02
        bne L_c250
        lda L_c65c,x
        sta L_c76b + $5,x
    L_c250:
        dex 
        bpl L_c22f
        jsr L_c267
        lda L_c777
        cmp #$01
        bne L_c263
        jsr L_c2a0
        jmp L_37dd
    L_c263:
        jmp L_b424
        rts 


    L_c267:
        lda $c769
        sec 
        lda L_c76b + $a
        sbc L_c76b + $3
        lda L_c76b + $9
        sbc L_c76b + $2
        lda L_c76b + $8
        sbc L_c76b + $1
        lda L_c76b + $7
        sbc L_c76b
        lda L_c76b + $6
        sbc $c76a
        lda L_c76b + $5
        sbc $c769
        bpl L_c297
        lda #$01
        sta L_c777
        rts 


    L_c297:
        lda #$00
        sta L_c777 + $1
        sta L_c777
        rts 


    L_c2a0:
        sei 
        lda #$ea
        sta $0315
        lda #$31
        sta $0314
        lda #$7f
        sta cCia1IntControl
        sta cCia2IntControl
        lda #$00
        sta vIRQMasks
        lda vIRQFlags
        sta vIRQFlags
        lda #$37
        sta $01
        jsr $ff81
        jsr $ff84
        lda #$30
        sta $0318
        lda #$c4
        sta $0319
        jsr L_e540 + $4
        lda #$a0
        ldx #$ff
    L_c2d9:
        sta SCREEN_BUFFER_0 + $00,x
        sta SCREEN_BUFFER_0 + $ff,x
        sta SCREEN_BUFFER_0 + $1fe,x
        sta SCREEN_BUFFER_0 + $2e8,x
        dex 
        cpx #$00
        bne L_c2d9
        lda #$ff
        sta vBorderCol
        lda #$07
        sta vBackgCol0
        sta vBackgCol1
        sta vBackgCol2
        lda #$00
        sta vSprEnable
        clc 
    L_c300:
        ldx #$27
    L_c302:
        lda L_c6a1,x
        adc #$80
        sta SCREEN_BUFFER_0 + $00,x
        lda L_c6bd + $c,x
        adc #$80
        sta SCREEN_BUFFER_0 + $50,x
        lda L_c6ef + $2,x
        adc #$80
        sta SCREEN_BUFFER_0 + $c8,x
        lda L_c70b + $e,x
        adc #$80
        sta SCREEN_BUFFER_0 + $118,x
        dex 
        bpl L_c302
        lda #$c5
        sta SCREEN_BUFFER_0 + $160
        lda L_c448 + $4
        adc #$b0
        sta SCREEN_BUFFER_0 + $74
        ldx #$06
        lda L_0840 + $2
        cmp #$00
        bne L_c34d
    L_c33b:
        clc 
        lda $c769,x
        sta L_c647 + $1,x
        adc #$80
        sta SCREEN_BUFFER_0 + $e0,x
        dex 
        bpl L_c33b
        jmp L_c372
    L_c34d:
        cmp #$01
        bne L_c363
    L_c351:
        clc 
        lda $c769,x
        sta L_c652,x
        adc #$80
        sta SCREEN_BUFFER_0 + $e0,x
        dex 
        bne L_c351
        jmp L_c372
    L_c363:
        clc 
        lda $c769,x
        sta L_c65c,x
        adc #$80
        sta SCREEN_BUFFER_0 + $e0,x
        dex 
        bpl L_c363
    L_c372:
        jsr L_c46c
        ldx #$02
    L_c377:
        lda SCREEN_BUFFER_0 + $138,x
        ldy L_0840 + $2
        cpy #$00
        bne L_c384
        sta L_c670,x
    L_c384:
        cpy #$01
        bne L_c38b
        sta $c67a,x
    L_c38b:
        cpy #$02
        bne L_c392
        sta L_c684,x
    L_c392:
        dex 
        bpl L_c377
        lda L_c777 + $2
        cmp #$ff
        beq L_c39f
        jmp L_c40d
    L_c39f:
        clc 
        ldx #$27
    L_c3a2:
        lda L_c73a + $7,x
        adc #$80
        sta SCREEN_BUFFER_0 + $3c0,x
        dex 
        bpl L_c3a2
        ldx #$27
        lda #$06
    L_c3b1:
        sta vColorRam + $3c0,x
        dex 
        bpl L_c3b1
        lda #$00
        sta $9d
        lda sFiltMode
        sta L_c448
        lda #$00
        sta sFiltMode
        lda #$0f
        tay 
        ldx $ba
        cpx #$08
        bpl L_c3d1
    L_c3cf:
        ldx #$08
    L_c3d1:
        jsr $ffba
        lda #$0b
        ldx #$c0
        ldy #$c5
        jsr $ffbd
        jsr $ffc0
        lda #$0f
        jsr $ffc3
        ldy #$00
        tya 
        ldx $ba
        cpx #$08
        bpl L_c3f0
        ldx #$08
    L_c3f0:
        jsr $ffba
        lda #$09
        ldx #$c2
        ldy #$c5
        jsr $ffbd
        ldx #$3f
        ldy #$c6
        stx $c1
        sty $c2
        lda #$c1
        ldx #$87
        ldy #$c6
        jsr $ffd8
    L_c40d:
        lda #$01
        sta L_c431
        lda L_c431
    L_c415:
        ldy #$ff
    L_c417:
        jsr L_c592
        dey 
        bne L_c417
        dec L_c431
        lda L_c431
        bne L_c415
        lda #$35
        sta $01
        lda L_c448 + $7
        sta sFiltMode
        rts 


        rti 

    L_c431:
         .byte $00

    L_c432:
        ldx #$ff
    L_c434:
        lda $00,x
        sta L_c777 + $8,x
        dex 
        bpl L_c434
        rts 


    L_c43d:
        ldx #$ff
    L_c43f:
        lda L_c777 + $8,x
        sta $00,x
        dex 
        bpl L_c43f
        rts 



    L_c448:
         .byte $00,$00,$00,$00,$00,$00,$00,$00

    L_c450:
        lda #$09
        ldx #$c2
        ldy #$c5
        jsr $ffbd
        lda #$15
        ldx $ba
        ldy #$01
        jsr $ffba
        lda #$00
        ldx #$c2
        ldy #$c5
        jsr $ffd5
        rts 


    L_c46c:
        lda #$00
        sta $c5f2
        sta L_c5f4
        sta $c5f3
        ldx #$01
    L_c479:
        lda #$ae
        sta SCREEN_BUFFER_0 + $138,x
        dex 
        bpl L_c479
        lda #$81
        sta SCREEN_BUFFER_0 + $138
    L_c486:
        jsr L_c592
        jsr L_c59a
        dec L_c5f4 + $2
        lda L_c5f4 + $2
        bpl L_c486
        lda #$07
        sta L_c5f4 + $2
        lda L_c5f4 + $1
        cmp #$6f
        beq L_c4d9
        lda cCia1PortA
        and #$08
        bne L_c4aa
        jsr L_c4ed
    L_c4aa:
        lda cCia1PortA
        and #$01
        bne L_c4b4
        jsr L_c4ed
    L_c4b4:
        lda cCia1PortA
        and #$04
        bne L_c4be
        jsr L_c50b
    L_c4be:
        lda cCia1PortA
        and #$02
        bne L_c4c8
        jsr L_c50b
    L_c4c8:
        lda cCia1PortA
        and #$10
        bne L_c4df
    L_c4cf:
        jsr L_c52d
        ldx $c5f3
        cpx #$03
        beq L_c4e2
    L_c4d9:
        lda cCia1PortA
        sta L_c5f4 + $1
    L_c4df:
        jmp L_c486
    L_c4e2:
        ldx #$27
        lda #$06
    L_c4e6:
        sta vColorRam + $00,x
        dex 
        bpl L_c4e6
        rts 


    L_c4ed:
        lda $c5f2
        cmp #$24
        beq L_c507
        inc $c5f2
        ldx $c5f2
        lda L_c5cd,x
        clc 
        adc #$80
        ldx $c5f3
        sta SCREEN_BUFFER_0 + $138,x
        rts 


    L_c507:
        jsr L_c576
        rts 


    L_c50b:
        lda $c5f2
        cmp #$00
        beq L_c529
        cmp #$ff
        beq L_c529
        dec $c5f2
        ldx $c5f2
        lda L_c5cd,x
        clc 
        adc #$80
        ldx $c5f3
        sta SCREEN_BUFFER_0 + $138,x
        rts 


    L_c529:
        jsr L_c584
        rts 


    L_c52d:
        ldx $c5f3
        lda #$a0
        sta SCREEN_BUFFER_0 + $160,x
        lda SCREEN_BUFFER_0 + $138,x
        cmp #$9e
        beq L_c548
        cmp #$a0
        bne L_c542
        lda #$ae
    L_c542:
        inc $c5f3
        jmp L_c566
    L_c548:
        ldy $c5f3
        cpy #$00
        beq L_c566
        lda #$ae
        sta SCREEN_BUFFER_0 + $138,x
        lda #$a0
        sta SCREEN_BUFFER_0 + $160,x
        dec $c5f3
        lda #$ff
        sta $c5f2
        sta L_c5f4
        lda #$9e
    L_c566:
        ldx $c5f3
        cpx #$03
        beq L_c575
        sta SCREEN_BUFFER_0 + $138,x
        lda #$c5
        sta SCREEN_BUFFER_0 + $160,x
    L_c575:
        rts 


    L_c576:
        lda #$81
        ldx $c5f3
        sta SCREEN_BUFFER_0 + $138,x
        lda #$00
        sta $c5f2
        rts 


    L_c584:
        lda #$b9
        ldx $c5f3
        sta SCREEN_BUFFER_0 + $138,x
        lda #$24
        sta $c5f2
        rts 


    L_c592:
        lda #$ff
        cmp vRaster
        bne L_c592
        rts 


    L_c59a:
        ldx #$27
    L_c59c:
        ldy $c5cb
        lda L_c5f7,y
        sta vColorRam + $00,x
        ldy L_c5cc
        dex 
        bpl L_c59c
        dec $c5cb
        bpl L_c5b5
        ldy #$48
        sty $c5cb
    L_c5b5:
        dec L_c5cc
        bpl L_c5bf
        ldy #$30
        sty L_c5cc
    L_c5bf:
        rts 



        .byte $53,$3a,$48,$49,$47,$48,$53,$43,$4f,$52,$45,$00

    L_c5cc:
        .byte $00

    L_c5cd:
        ora ($02,x)

        .byte $03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12
        .byte $13,$14,$15,$16,$17,$18,$19,$1a,$1e,$30,$31,$32,$33,$34,$35,$36
        .byte $37,$38,$39,$00,$00

    L_c5f4:
        .byte $00,$00,$00

    L_c5f7:
        asl $06
        asl $06

        .byte $0b,$0b,$0b,$0b,$04,$04,$04,$04,$0e,$0e,$0e,$0e,$03,$03,$03,$03
        .byte $0d,$0d,$0d,$0d,$01,$0d,$01,$0d,$07,$01,$07,$01,$01,$07,$01,$01

    L_c61b:
        ora ($01,x)

        .byte $07,$01,$01,$07,$01,$07,$0d,$01,$0d,$01,$0d,$0d,$0d,$0d

    L_c62b:
        .byte $03,$03,$03,$03
        .byte $0e,$0e,$0e,$0e,$04,$04,$04,$04,$0b,$0b,$0b,$0b,$06,$06,$06,$06

    L_c63f:
        php 
        ora #$07
        php 

        .byte $13,$20,$20,$02

    L_c647:
        .byte $3a,$30,$30
        .byte $30,$30,$30,$30,$30,$20,$01,$3a

    L_c652:
        bmi L_c684

        .byte $30,$30,$30,$30,$30,$20,$05,$3a

    L_c65c:
        .byte $30,$30,$30,$30,$30,$30
        .byte $30,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20

    L_c670:
        asl SCREEN_BUFFER_0 + $10d

        .byte $20,$20,$20,$20,$20,$20,$20,$0e,$0d

    L_c67c:
        .byte $05,$20,$20,$20,$20,$20,$20,$20

    L_c684:
        asl SCREEN_BUFFER_0 + $10d
    L_c687:
        jsr L_1400 + $20

        .byte $0f,$10,$20,$13,$03,$0f,$12,$05,$20,$05,$04,$09,$14,$09,$0f,$0e
        .byte $20,$1b,$05,$18,$1d,$20,$20

    L_c6a1:
        .byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$03,$0f
        .byte $0e,$07,$12,$01,$14,$15,$0c,$01,$14,$09,$0f,$0e,$13,$21

    L_c6bd:
        .byte $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
        .byte $19,$0f,$15,$20,$08,$01,$16,$05,$20,$01,$20,$0e,$05,$17,$20,$08
        .byte $09,$07,$08,$20,$13,$03,$0f,$12,$05,$20,$10,$0c,$01,$19,$05,$12
        .byte $20,$31,$20

    L_c6ef:
        .byte $20,$20,$20,$20,$20,$20,$20,$20,$20
        .byte $20,$20,$19,$0f,$15,$12,$20,$13,$03,$0f,$12,$05,$20,$17,$01,$13
        .byte $20,$30,$30

    L_c70b:
        .byte $30,$30,$30,$30,$30,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20
        .byte $20,$20,$20,$10,$0c,$05,$01,$13,$05,$20,$05,$0e,$14,$05,$12,$20
        .byte $19,$0f,$15,$12,$20,$09,$0e,$14,$09,$01,$0c,$13,$20,$20,$01

    L_c73a:
        .byte $2e,$2e,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$13
        .byte $01,$16,$09,$0e,$07,$20,$08,$09,$07,$08,$20,$13,$03,$0f,$12,$05
        .byte $20,$10,$0c,$05,$01,$13,$05,$20,$17,$01,$09,$14,$21,$20,$20,$20
        .byte $20,$20,$30,$30

    L_c76b:
        .byte $30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30,$30

    L_c777:
        .fill $6c, $0
        .byte $bd,$41,$ba,$c1,$c1,$a4,$e6,$63,$b9,$17,$ab,$ee,$c9,$07,$ce,$31
        .byte $70,$c3,$54,$21,$66,$14,$cc,$8a,$4a,$70,$24,$7d,$ff,$ea,$7b,$64
        .byte $c8,$d5,$01,$6b,$c0,$4c,$ec,$63,$48,$bc,$ca,$b2,$b2,$d2,$33,$5a
        .byte $05,$90,$2f,$49,$b9,$9b,$a4,$04,$29,$85,$ad,$39,$6f,$fb,$19,$05
        .byte $f1,$f6,$bb,$c5,$29,$14,$9a,$8c,$52,$09,$04,$93,$ba,$1d,$b1,$99
        .byte $2a,$5e,$0c,$b1,$55,$b5,$d1,$36,$fb,$a4,$66,$f6,$7b,$ac,$1b,$d0
        .byte $7b,$8c,$9d,$b3,$6b,$63,$5b,$dc,$88,$e4,$d1,$74,$c9,$8d,$b1,$19
        .byte $d7,$c3,$d1,$36,$49,$78,$d5,$a0,$a1,$4a,$e9,$c0,$b2,$bd,$aa,$c1
        .byte $80,$d3,$bf,$9d,$3b,$c2,$10,$ef,$73,$c1,$a6,$d3,$b1,$27

    L_c871:
        cmp L_09c0 + $14
        inc $7c
        ora #$0f

        .byte $e3,$97,$ce,$26,$e8,$1c,$eb,$e6,$c0,$93,$02

    L_c883:
        ora L_68c0 + $1e
        rol $1f,x

        .byte $14,$2b,$a9,$c5,$da,$12,$05,$d8,$51,$0a,$a6,$46,$0b,$6c,$fa,$ff
        .byte $a6,$8f,$dd,$a4,$ed,$fb,$f8,$b9,$84,$51,$a6,$a5

    L_c8a4:
        .byte $8f
        .byte $a0,$c8,$f0,$a7,$45,$4a,$de,$99,$c0,$e1,$53,$54,$b7,$02,$43,$9d
        .byte $b0,$47,$a5,$dc,$7b,$5b,$12,$18,$02,$d0,$b1,$55,$5a,$d1,$be,$a0
        .byte $fe,$84,$ed,$e6,$dc,$fc,$64,$c2,$b4,$98,$d8,$d3,$e8,$c8,$8c,$1c
        .byte $ef,$a9,$9a,$9d,$af,$42,$cd,$8f,$6c,$b6,$03,$42,$cf,$08,$16,$0b
        .byte $3d,$86,$68,$da,$73

    L_c8ea:
        cld 
        pla 

        .byte $b0,$94,$18,$47,$dd,$51,$ec,$36,$8d,$9e,$56,$3d,$87,$0b,$3b,$30
        .byte $02,$33,$10,$c7,$de,$4c,$82,$46,$05,$de,$5b,$8f,$2f,$a9,$81,$dc
        .byte $61,$a0,$67,$cc,$52,$92,$ec,$98,$3d,$36,$14,$a2,$10,$fb,$47,$2a
        .byte $68,$20,$ed,$3c,$1d,$15,$80,$77,$02,$c8,$ac,$51,$d0,$e3,$31,$a5
        .byte $ad,$46,$90,$eb,$8d,$f2,$a1,$9c,$12,$41,$da,$46,$f7,$30,$bf,$ec
        .byte $14,$10,$41,$20,$d6,$d3,$db,$a5,$da,$30,$7a,$86,$f0,$9e,$0f,$08
        .byte $85,$5f,$4c,$7a,$b3,$a6,$ff,$16,$a0,$2d,$bd,$ad,$a7,$fd,$82,$58
        .byte $c2,$67,$9a,$80,$aa,$99,$7f,$cd,$e8,$9c,$cb,$3c,$43,$e9,$a8,$bd
        .byte $0a,$15,$52,$61,$ce,$85,$0d,$93,$0c,$b5,$1e,$f4,$a2,$34,$a5,$bc
        .byte $29,$07,$a8,$e6,$6f,$56,$bd,$d5,$4c,$e7,$17,$f1,$66,$f2,$21,$99
        .byte $fa,$84,$69,$fb,$91,$b4,$cc,$d9,$03,$8c,$60,$97,$b9,$04,$b5,$9d
        .byte $cf,$c4,$11,$c2,$0b,$d4,$59,$30,$1b,$d4,$5b,$28,$ca,$bc,$bf,$5e
        .byte $17,$50,$5c,$a3,$28,$bb,$be,$5f,$5d,$42,$5d,$8c,$a1,$bd,$c0,$60
        .byte $7c,$c9,$95,$0b,$e9,$0a,$30,$35,$6b,$1c,$b8,$6f,$97,$3e,$2e,$20
        .byte $96,$3b,$fd,$e8,$5d,$85,$ed,$4d,$23,$f6,$fa,$1f,$e6,$6b,$de,$1b
        .byte $ea,$74,$99,$80,$ad,$8b,$fe,$ef,$0d,$16,$c6,$3b,$c0,$ab,$3c,$22
        .byte $db,$3a,$87,$c1,$32,$c1,$a2,$0f,$a0,$00,$f1,$10,$ca

    L_c9f9:
        sta $80bd,x
    L_c9fc:
        lda $85,x
        sbc L_7780 + $31,y
        and $02be

        .byte $72,$5f,$09,$3c,$09,$01,$91,$68,$c7,$ca,$e4,$30,$ab,$10,$e9,$ef
        .byte $8b,$67,$2d,$cf,$65,$a8,$96,$0a,$da,$6c,$d9,$ce,$5f,$d8,$d5,$c8
        .byte $07,$6b,$76,$8c,$b9,$0f,$01,$24,$6a,$dc,$7d,$30,$1e,$ce,$40,$70
        .byte $04,$10,$6f,$18,$50,$3a,$fa,$da,$85,$3c,$45,$6b,$09,$07,$32,$c9
        .byte $0b,$5d,$53,$2f,$37,$50,$02,$70,$0a,$7f,$d8,$51,$62,$91,$ca,$d0
        .byte $1e,$64,$b0,$00,$92,$0f,$c3,$b5,$0e,$c9,$1c,$bc,$bf,$3f,$13,$d9
        .byte $75,$60,$9e,$85,$63,$66,$a4,$87,$81,$e7,$50,$1b,$58,$6a,$29,$3f
        .byte $fa,$02,$52,$eb,$08,$ae,$2e,$ba,$12,$bc,$18,$8e,$43,$ba,$1e,$2f
        .byte $eb,$83,$d8,$21,$1d,$eb,$27

    L_ca8b:
        ldx $ba23
        stx $2d,y
        tsx 
        bit L_eb00 + $33
        ora ($ae),y
        and $2aba,y
        cmp #$3f

        .byte $f0,$76,$fc,$bd,$0a,$62,$96,$1a,$b7,$98,$c2,$ff,$b6,$07,$26,$c0
        .byte $de,$ac,$fc,$4c,$f7,$b7,$4c,$a4,$4f

    L_cab4:
        .byte $b6,$d9,$d0,$75
        .byte $e5,$85,$5e,$c2,$6b,$00,$08,$f4,$c5,$96,$82,$4f,$08,$00,$34,$65
        .byte $c8,$0f,$d8,$13,$98,$0f,$39,$00,$80,$50,$45,$e7,$c8,$bd,$28,$0a
        .byte $ad,$21,$0f,$29,$46,$81,$f1,$32,$96,$02,$68,$a8,$6e,$0b,$5c,$60
        .byte $be,$20,$27,$03,$eb,$23,$33,$6e,$44,$61,$8d,$49,$a1,$c3,$f2,$50
        .byte $bb,$66,$49,$63,$c2,$ca,$17,$1c,$00,$32,$6c,$15,$e8,$5f,$90,$0b
        .byte $40,$5d,$81,$ee,$8d,$ac,$28,$d1,$ca,$09,$e6,$2f,$04,$9e,$42,$8c
        .byte $84,$82,$40,$6c,$c4,$fb,$04,$50,$2f,$a0,$21,$e6,$a5,$50,$13,$33
        .byte $22,$77,$4c,$7e,$b7

    L_cb2d:
        .byte $77
        .byte $25,$47,$19,$30,$3b,$ad,$21,$23,$8c,$8a,$6f,$81,$12,$00,$37,$96
        .byte $b0,$68,$09,$e5,$d8,$44,$2a,$dc,$03,$97,$75,$24,$da,$40,$8e,$c1
        .byte $26,$bb

    L_cb50:
        lsr $bb
        rol 
        ldx $77
        cpx #$44

        .byte $6f,$4e,$a3,$4d,$47,$9b,$93,$14,$45,$44,$e6,$d9,$be,$bc,$b0,$e5
        .byte $f2,$c2,$67,$69,$d2,$04,$6f,$6d,$35,$6a,$e5,$8e,$43,$e9,$da,$6d
        .byte $60,$32,$ce,$b7,$99,$a2,$fe,$a5,$8c,$7c,$d4,$67,$8a,$3d,$45,$4d
        .byte $a0,$bd,$e0,$2f,$4f,$b1,$17,$65,$15,$17,$b8,$b5,$a7,$91,$66,$dd
        .byte $c1,$a6,$76,$14,$9c,$07,$56,$10,$ac,$78,$5d,$b1,$2e,$d4,$a2,$33
        .byte $e4,$86,$4b,$ea,$e3,$b5,$8a,$0c,$51,$5d,$20,$e4,$62,$f0,$18,$f3
        .byte $fe,$b9,$1a,$24,$1f,$23,$1d,$57,$bb,$0c,$6c,$08,$d6

    L_cbc4:
        .byte $2c,$bc,$3e,$e8,$d0,$04,$59,$c9,$09,$33
        .byte $95,$58,$3a,$ba,$90,$24,$f5,$ac,$1b,$3a,$f5,$d0,$0f,$e6,$ee,$0d
        .byte $39,$bc,$a4,$09,$91,$f1,$e0,$0e,$d2,$a0,$74,$5c,$25,$a7,$49,$01
        .byte $47,$8e,$50,$51,$ae,$20,$ae,$f9,$0a,$1c

    L_cbf8:
        .byte $b0,$a4
        .byte $b4,$18,$ae,$06,$e4,$4a,$64,$fe,$0f,$4a,$39,$16,$db,$40,$1c,$e4
        .byte $04,$75,$d0,$4b,$08,$3a,$19,$fa,$3c,$90,$1d,$f4,$41,$1b,$f5,$8d
        .byte $0b,$01,$23,$f7,$a9,$c8,$f3,$e6,$b2,$d5,$93,$6d,$eb,$8e,$6b,$29
        .byte $cc,$e5,$6a,$d1,$b0,$07,$fe,$af,$24,$35,$3e,$16,$48,$e8,$e8,$7c
        .byte $60,$ea,$0d,$1d,$00,$76,$2b,$da,$40,$8a,$ec,$4c,$5c,$b9,$79,$23
        .byte $6c,$38,$e1,$0b,$96,$4e,$09,$8f,$47,$0d,$ac,$03,$a6,$9f,$f4,$c9
        .byte $a0

    L_cc5b:
        adc $02ac,y
        dec $9b
        txs 
        and $00,x
        inc $63
        adc #$45
        sbc ($41),y

        .byte $eb,$25,$63,$c5,$e3,$2d,$e5,$6a,$b1,$69,$60,$2b,$03,$9a,$49,$0c
        .byte $ba,$fd,$f2,$5e,$8f,$02,$db,$16,$bf,$93,$90,$72,$bb,$34,$02,$d0
        .byte $24,$79,$7a,$74,$32,$f4,$12,$65,$e8,$b0,$cb,$4e,$d1,$97,$8c,$04
        .byte $d3,$b0,$45,$cc,$2a,$27,$69,$59,$43,$e9,$d0,$05,$53,$93,$34,$46
        .byte $34,$5c,$47,$87,$0f

    L_ccae:
        sbc ($c2,x)

        .byte $bb,$33,$1d,$6a,$e9,$cc,$82,$ec,$33,$d0,$a0,$c1,$8b,$5c,$32,$6c
        .byte $4a,$b0

    L_ccc2:
        .byte $06,$17,$0a,$18,$55,$03,$38,$25,$2a,$dd,$d0,$4c,$d2,$07,$fa
        .byte $e0,$bd,$a5,$37,$82,$b5,$d5,$bb,$24,$3a,$5d,$c6,$f0,$04,$c9,$af

    L_cce1:
        pla 

        .byte $0b,$8d,$83,$58,$77,$5c,$11,$d6,$d9,$1c,$39,$90,$d4,$4c,$8a,$b9
        .byte $df,$84,$c7,$7e,$e0,$8c,$f1,$48,$66,$27,$73,$6e,$f9,$9a,$b8,$1f
        .byte $a5,$16,$73,$1b,$b9,$de,$4d,$a5,$8a,$a8,$c9,$2c,$d0,$e4,$8d,$a3
        .byte $88,$8b,$04,$39,$2f,$19,$1b,$02,$43,$33,$62,$8b,$b8,$24,$3e,$63
        .byte $ac,$c6,$ea,$20,$c9,$78,$96,$4a,$04,$11,$a8,$aa,$e6,$79,$6d,$5f
        .byte $4a,$35,$f9,$b0,$dc,$c4,$20,$de,$53,$bc,$c5,$90,$eb,$31,$0b,$53
        .byte $13,$a5,$f5,$6c,$cb,$f8,$ba,$1f,$37,$70,$13,$f3,$77,$0d,$cc,$f0
        .byte $ae,$73,$2f,$45,$cd,$01,$64,$05,$d8,$16,$c8,$b1,$8e,$21,$da,$0a
        .byte $ec,$1a,$3d,$08,$af,$0c,$55,$f4,$90,$04,$17,$da,$ae,$06,$ba,$d9
        .byte $f2,$b2,$db,$84,$6d,$85,$f6,$67,$f6,$07,$0d,$a4,$c8

    L_cd7f:
        .byte $bf
        .byte $bc,$6d,$16,$19,$91,$94,$85,$19,$cf,$16,$62,$53,$39,$3e,$1c,$a5
        .byte $7b,$c9,$6f,$b0,$0b,$78,$4f,$d9,$88,$5e,$66,$14,$44,$0f,$6c,$c4
        .byte $1e,$39,$d0,$09,$31,$8f,$b4,$87,$a9,$9e,$91,$18,$be,$e1,$62,$53
        .byte $a8,$2a,$88,$fd,$e1,$d4,$c8,$84,$59,$e4,$e8

    L_cdbb:
        lda ($1b),y
        sta ($d3,x)

        .byte $df,$5d,$2f,$e0,$75,$2b,$c5,$e1,$d7,$f0,$27,$fc,$dc,$d0,$ed,$c9
        .byte $a5,$df,$e6,$3c,$a4,$d1,$bf,$c8,$91,$23,$28,$2f,$04,$4e,$fc,$30
        .byte $02,$b8,$d2,$d5,$83,$b2,$b1,$6e,$1d,$2e,$46,$e3,$e6,$e4,$78,$e8
        .byte $44,$69,$a8,$8a,$d7,$a5,$10,$c9,$80,$9c,$44,$0c

    L_cdfb:
        ldy L_c777 + $33,x
        adc $6c,x

        .byte $e3,$4f,$ca,$11,$5d,$e6,$8c,$b2,$91,$a6,$23,$26,$4d,$1a,$8a,$b3
        .byte $c9,$40,$b0,$e7,$14,$91,$90,$a4,$8a,$11,$ad,$f8,$a3,$18,$f1,$c8
        .byte $34,$c0,$0d,$7e,$f0,$47,$60,$fd,$26,$00,$c6,$44,$01,$20,$ee,$49
        .byte $1b,$a3,$07,$a6,$f1,$ae,$b1,$c1,$bd,$9c,$67,$b1,$03,$f9,$9d,$bc
        .byte $10,$49,$19,$8d,$f9,$47,$ff,$04,$5b,$54,$a8,$0b,$35,$4b,$01,$86
        .byte $a9,$78,$0c,$ee,$03,$6a,$96,$60,$2a,$80,$21,$f0,$f9,$cf,$ff,$29
        .byte $16,$6f,$8d,$d0,$59,$8a,$16,$9e,$f0,$4a,$79,$09,$f7,$14,$e6,$4a
        .byte $b2,$b4,$70,$5a,$09,$10,$8f,$92,$7f,$30,$b2,$3b,$e6,$50,$6c,$39
        .byte $1f,$e3,$62,$29,$ee,$01,$34,$2c,$3c,$39,$1b

    L_ce8b:
        ldy $c320,x

        .byte $bf,$df,$cb,$a1,$28,$8e,$a5,$ea,$f3,$c9,$10,$f6,$65,$bb,$60,$47
        .byte $b8,$82,$d9,$8a,$7b,$23,$9e,$4c,$f3,$bc,$78,$c5,$60,$08,$13,$bd
        .byte $dc,$28,$08,$b9,$e9,$45,$e3,$30,$13,$de,$19,$5d

    L_ceba:
        sta ($5d),y
        cpy $d0
        asl $fe

        .byte $77,$36,$4c,$44,$bc,$84,$20,$7c,$11,$70

    L_ceca:
        tay 
        dey 
    L_cecc:
        beq L_cef6
    L_cece:
        tya 

        .byte $ff,$e3,$84,$8c,$70,$06,$2c,$ff,$a3,$fe,$2d,$bc,$db,$28,$01,$60
        .byte $e5,$e8,$0d,$00,$01,$a5,$e7,$ce,$1c,$ab,$a0,$bd,$5d,$29,$9c,$53
        .byte $e0,$cd,$d2,$a1,$ec,$e6,$23

    L_cef6:
        adc #$20

        .byte $63,$13

    L_cefa:
        cpy L_0c40 + $14
        lda ($a8),y
        lda L_4dd8 + $3,y
        lsr $c5b7
        dec $f0,x

        .byte $b3,$3b,$84,$ee,$68,$9d,$c4,$7d,$69,$c4,$b0,$88,$51,$c7,$f1,$d9
        .byte $b3,$f0,$a0,$53,$97,$30,$50,$dc,$f3,$82,$a5,$c8,$26,$80,$bc,$a9
        .byte $19,$7d,$9d,$98,$1e,$51,$49,$be,$ae,$85,$93,$6a,$92,$85,$f3,$78
        .byte $03,$85,$d9,$fd,$09,$43,$01,$c7,$94,$15,$9d,$0a,$37,$7a,$95,$25
        .byte $63,$a3,$17,$37,$e3,$49,$ff,$39,$7d,$05,$68,$99,$27,$03,$11,$e6
        .byte $52,$c9,$e0,$f3,$0d,$4f,$f3,$29,$72,$b1,$58,$70,$ec,$4c,$2e,$bd
        .byte $37,$6a,$fd,$2a,$52,$73,$1e,$69,$01,$cf,$a4,$b9,$e1,$8a,$79,$72
        .byte $30,$08,$98,$ae,$dd,$a9,$03,$99,$f0,$16,$86,$bf,$20,$a5,$5f,$f7
        .byte $6c,$04,$4a,$85,$e7,$29,$a4,$0e,$50,$07,$80,$e0,$80,$dc,$7d,$31
        .byte $0e,$85,$07,$bd,$48,$06,$b9,$85,$0e,$46,$f4,$8e,$88,$a2,$46,$79
        .byte $ea,$4c,$9e,$bd

    L_cfab:
        .byte $a9,$05,$3e,$0a,$16,$2d,$fc,$db,$5c
        .byte $0d,$b9,$3c,$9d,$8e,$07,$54,$87,$f5,$09,$99,$43,$ac,$a2,$79,$05
        .byte $88,$f6,$2d,$97,$46,$f1,$b0,$fa,$a6,$20

    L_cfce:
        .byte $da,$74
        .byte $4c,$41,$bb,$fd,$0e,$d0,$14,$1c,$88,$10,$f0,$0a,$7e,$b9,$ef,$08
        .byte $9a,$2f,$1c,$e6,$ea,$60,$c5,$6a,$fa,$f9,$a5,$bb,$f6,$2e,$46,$d1
        .byte $24,$08,$09,$b9,$77,$b5,$0c,$15,$02,$d5,$cf,$82,$c8,$98

    L_cffe:
        rol L_e7c0 + $10,x

        .byte $d3,$f0,$c5,$2f,$1d,$62,$9d,$0b,$6d,$a6,$0f,$99,$32,$79,$9f,$c7
        .byte $bd,$b0,$e8,$f8,$0d,$b1,$50,$7c,$86,$8e,$43,$58,$10,$44,$cd,$98
        .byte $a6,$68,$ec,$32,$4c,$80,$e7,$bd,$91,$0b,$b9,$20,$f0,$b3,$96,$03
        .byte $18,$7d,$ce,$9d,$08,$11,$27,$60,$aa,$29,$03,$9a,$e1,$6a,$f1,$75
        .byte $a9,$40,$d2,$a5,$e4,$98,$4a,$bd,$a4,$85,$f2,$b5,$20,$86,$69

    L_d050:
        .byte $dc,$04
        .byte $76,$81,$26,$42,$74,$40,$1d,$9d,$30,$00,$27,$48,$1e,$4e,$b0,$2c
        .byte $4e,$b0,$a4,$e4,$b9,$c0,$fc,$56,$0e,$a0,$1b

    L_d06d:
        tya 

        .byte $ef,$ce,$16,$aa,$c4,$68,$90,$05,$7e,$11,$34,$63,$27

    L_d07b:
        lda L_bf2f,x
        sta ($cf),y
        sbc ($82),y
        iny 
        cpy #$2a
        bcc L_d06d
        ldx $7e
        rts 



        .byte $3b,$ed,$ac,$13,$ec,$e5,$18,$69,$68,$ef,$cd,$03,$d0,$f0,$1b,$a5
        .byte $fe,$09,$fe,$49,$6e,$b9,$86,$60,$84,$e5,$86,$e6,$7f,$18,$54,$c7
        .byte $85,$64,$0f,$1f,$a3,$6d,$ec,$be,$a4,$e5,$ef,$29,$51,$7f,$bd,$40
        .byte $1e,$11,$c5,$54,$ef,$f0,$17,$a6,$e6,$b9,$03,$a3,$29,$ff,$80,$d0
        .byte $07,$eb,$f7,$64,$a9,$fb,$c3,$eb

    L_d0d2:
        jmp L_3119 + $2

        .byte $b8,$f7,$7e,$b9,$d2,$09,$80,$99,$22,$11,$7f,$41,$ed,$85,$63,$e7
        .byte $c8,$68,$c5,$4c,$f6,$b1,$f7,$85,$40,$a4,$86,$84,$df,$77,$f6,$fc
        .byte $17,$3a,$0a,$81,$49,$0d,$f7,$09,$dd,$ff,$3f,$c5,$fc,$b2,$00,$57
        .byte $81,$04,$dc,$ac,$80,$20,$d5,$41,$37,$73,$39,$df,$53,$c9,$06,$ed
        .byte $0f,$34,$87,$aa,$83,$93,$d2,$cf,$c4,$7e,$89,$18,$ce,$5c,$01,$fb
        .byte $80,$ee,$3c,$ac,$03,$b7,$d8,$7f,$e1,$c0,$e6,$08,$ea,$18,$60,$0d
        .byte $a2,$79,$94,$44,$99,$57,$36,$a0,$06,$f3,$60

    L_d140:
        .byte $a6,$71,$f0,$26,$e0,$7c,$ba,$a2,$09,$bd,$3a,$da,$0f,$23,$8f,$43
        .byte $38,$39,$6d,$b6,$d5,$c4,$6b,$08,$49,$0a,$9d,$1f,$4c,$92,$bf,$fe
        .byte $2f,$fa,$6d,$e0,$60,$b3,$03,$ae,$5b,$0a,$0e,$02,$a0,$0a,$b9,$00
        .byte $08,$c5,$ff,$a1,$2c,$85,$ee,$d5,$d7,$df,$d0,$26,$a4,$f3,$c0,$09
        .byte $b0,$12,$e6,$7e,$5b,$53,$f2,$2a,$44,$b9,$19,$7d,$be,$ff,$15,$06
        .byte $99,$1a,$d8,$4f

    L_d194:
        lda $18,x
        sta L_e840 + $25
        sec 
        and #$e9
        asl 

        .byte $cf,$02,$95,$d7,$60

    L_d1a2:
        .byte $78,$93,$db
        .byte $91,$fd,$27,$90,$62,$7b,$b9,$7c,$1d,$f0,$e8,$74,$d2,$ff,$ff,$f5
        .byte $32,$ea,$09,$1d,$23,$d1,$4c,$97,$0c,$50,$80,$14,$52,$1a,$5d,$8d
        .byte $e9,$25,$d8,$9d,$5d,$c0,$5d,$06,$1b,$47,$d4

    L_d1d0:
        bit $00
        ldy #$80

        .byte $67,$73,$ec,$42,$37,$50,$0a,$73,$b4,$c0,$9a,$54,$5d,$d5,$00,$7c
        .byte $60,$23,$ad,$23,$f3,$3f,$37,$72,$26,$6d,$63,$d9,$9a,$52,$b2,$f1
        .byte $21,$6f,$19,$bd,$87,$9f,$8d,$c7,$07,$cd,$89,$61,$80,$c0,$20,$60
        .byte $3b,$5f,$db,$58,$16,$a8,$6d,$50,$17,$55,$56,$b1,$10,$f3,$0d,$86
        .byte $2e,$7f,$40,$4e,$a2,$a1,$1d,$a3,$eb,$fc,$ae,$e0,$dd,$fe,$a0,$bd
        .byte $84,$76,$05,$6c,$b1,$fb,$4b,$91,$fd,$c8,$eb,$f9,$fc,$65,$e6,$fe
        .byte $ca,$fb,$f2,$78,$73,$8e,$49,$90,$a5,$77,$1b,$ef,$6d,$4e,$62,$0e
        .byte $43,$8a,$7b,$31,$7c,$31,$ee,$2a,$ef,$dd,$f6,$04,$ad,$04,$0b,$84
        .byte $aa,$ca,$31,$cb,$2a,$cc,$dd,$eb,$08,$ad,$58,$05

    L_d260:
        sty $6e
        lsr $f8,x

        .byte $f7,$6b,$10,$6e,$08

    L_d269:
        and ($35,x)
        sta $15
        eor $86,x
        sty $ec,x
        sbc L_2f0a

        .byte $d0,$0c,$39,$52,$44,$70,$60,$d6,$ef,$30,$ea,$4c,$d8,$67,$37,$ee
        .byte $1c,$a5,$ca,$a8,$1b,$4a,$14,$2e,$7a,$a1,$01,$c9,$7b,$c9,$c9,$7b
        .byte $21,$0c,$ad,$aa,$83,$10,$c5,$57,$2e,$a2,$f3,$1e,$a1,$3c,$c3,$a8
        .byte $20,$2c,$b7,$ea,$d0,$04,$a9,$7e,$85,$ed,$7f,$7a,$37,$00,$27,$7b
        .byte $27,$01,$27

    L_d2b7:
        .byte $7c,$27,$02,$27
        .byte $7d,$26,$69,$03,$dc,$ad,$7e,$c7,$df,$77,$3d,$98,$60,$8d,$ee,$8e
        .byte $32,$e3,$8c,$4b,$3f,$32,$e9,$75,$43,$3b,$f4

    L_d2d6:
        beq L_d2fb

        .byte $6f,$64,$0f

    L_d2db:
        inc $c81a
        lsr 

        .byte $3f,$21,$d1,$d1,$4e,$31,$b5,$02,$8f,$74,$03,$ee,$4d,$79,$e6,$95
        .byte $c1,$20,$3d,$fd,$49,$d2,$ae,$4a,$ad,$ac,$4b,$c4

    L_d2fb:
        eor L_4000 + $be,x
        ora L_9c07,x

        .byte $5c,$14,$69,$84,$2a,$ad,$81,$40,$8e,$6b,$2d,$18,$47,$d5,$02,$08
        .byte $69,$30,$fb,$6c,$f5,$33,$f4,$1a,$8d,$62,$f0,$05,$a9,$02,$8d,$f7
        .byte $0c,$71,$77,$a8,$9a,$9d,$69,$67,$f7,$51,$dd,$24,$0c,$48,$a4,$66
        .byte $19,$51,$52,$3a,$32,$03,$02,$48,$bd,$69,$42,$72,$69,$cf,$95,$dc
        .byte $8c,$67,$ec,$ad,$ea,$26,$2a,$98,$06,$20,$a0,$c2,$f5,$dd,$37,$4c
        .byte $24,$b4,$60,$7f,$a5,$38,$e9,$75,$9b,$6e,$93,$74,$93,$6d,$93,$73
        .byte $93,$6c,$93,$72,$93,$6b,$93,$71,$93,$6a,$92,$ad,$70,$ad,$ed,$5a
        .byte $b6,$10,$06,$69,$8b,$1a,$42,$54,$4c,$a5,$77,$c7,$60

    L_d37e:
        .byte $78,$bc,$ea,$6b,$e6,$52,$31,$46,$14,$f7,$7f
        .byte $4c,$dc,$48,$0d,$dd,$dd,$da,$1a,$2a,$ad,$c4,$8d,$18,$37,$64,$c5
        .byte $c5,$81,$55,$22,$f2,$31,$30,$cb,$c3,$83,$6c,$82,$19,$e5,$7d,$44
        .byte $e5,$cc,$05,$e0,$0b,$84,$68,$55,$04,$ea,$fe,$05,$9d,$e8,$06,$ca
        .byte $bf,$e0,$b6,$ef,$64,$51,$20,$b1,$1b,$69,$21,$63,$22,$12,$a1,$23
        .byte $a3,$5e,$15,$31,$d0,$b4,$28,$a1,$54,$00,$43,$14,$c9,$a8,$50,$86
        .byte $f1,$29,$c3,$c8,$21,$04,$bd,$19,$ef,$f2,$18,$14,$85,$dd,$88,$73
        .byte $cd,$83,$1e,$4e,$4c,$c4,$ff,$b0,$8d,$74,$04,$a2,$06,$ad,$7f,$d4
        .byte $c3,$f7,$09,$60,$48,$bd,$50,$09,$c9,$44,$c6,$12,$41,$52,$61,$05
        .byte $d0,$f1,$83,$4c,$72,$c3,$18,$bd,$f8,$c7,$d1,$5c,$c6,$b8,$b4,$e0
        .byte $04,$7e,$eb,$20,$6c,$1a,$4b,$02,$92,$e5,$ac,$42,$08,$8f,$9e,$e4
        .byte $70,$91,$0a,$01,$64,$7a,$8a,$c0,$d3,$73,$9d,$84,$c6,$1e,$b4,$e2
        .byte $ad,$79,$e7,$83,$16,$03,$4c,$0d,$c4,$18,$3e,$aa,$bd,$41,$c7,$77
        .byte $e7,$32,$07,$9c,$f5,$a7,$5c,$c0,$e1,$db,$eb,$98,$ca,$85,$9d,$ad
        .byte $78,$a0,$48,$c4,$dc,$23,$0e,$2c,$ed,$a8,$35,$42,$0b,$a2,$03,$5a
        .byte $ab,$01,$c0,$a1,$0f,$a6,$c3,$f6,$a0,$00,$98,$f7,$19,$e0,$67,$10
        .byte $02,$5a,$08,$da,$7a,$32

    L_d47f:
        nop 

        .byte $04,$3f,$ee,$86,$53,$84,$c2,$ac,$c1,$a2,$87,$77,$c6,$3d,$d8,$3d
        .byte $8c,$01,$8d,$cc,$e6,$a0,$ff,$1d,$3d,$88,$1d,$fa,$ce,$b8,$83,$31
        .byte $a3,$d0,$f0,$a9,$35,$85,$01,$bf,$ad,$4f,$c4,$8d,$18,$d4,$fc,$40
        .byte $f7,$42,$b5,$a6,$9d,$f5,$29,$31,$a2,$ff,$bd,$7f,$0f,$c7,$95,$c6
        .byte $0b,$60,$44,$30,$00,$47,$09,$41,$bd,$61,$4a,$15,$a6,$7a,$1c,$72
        .byte $ba,$f2,$3b,$a2,$29,$c2,$a0,$db,$d5,$ff,$60,$a7,$13,$38,$32,$98
        .byte $7d,$82,$a2,$01,$cc,$c4,$e0,$12,$f8,$ca,$c3,$8d,$9a,$56,$92,$2a
        .byte $20,$9a,$ad,$c9,$c1,$90,$14,$10,$f2,$a9,$07,$8d,$f6,$fd,$7a

    L_d4ff:
        sbc $67,x

        .byte $6f,$f0,$33,$39,$8c,$08,$42,$32,$01,$81,$19,$ed,$c4,$18,$c4,$04
        .byte $23,$28,$02,$19,$03,$d9,$0b,$d9,$df,$29,$23,$d0,$2a,$3b,$2d,$95
        .byte $28,$28,$09,$ad,$33,$dc,$8d,$f5,$df,$45,$86,$c4,$9d,$db,$a9,$06
        .byte $34,$c6,$09,$fa,$d9,$2a,$24,$c3,$dd,$ee,$23

    L_d53c:
        lsr $0376,x
        cmp $22ad,x
        ldx $b2
        cmp #$d1

        .byte $ff,$f0,$13,$ce,$f8,$83,$95,$bd,$cd,$33,$18,$69,$9b,$80,$99,$c8
        .byte $20

    L_d557:
        and $84,x
        sbc #$6f

        .byte $34

    L_d55c:
        and L_61bd
        stx L_9e9a

        .byte $f0,$0c,$c9,$a0,$d0,$02,$fe,$6a,$ee,$72,$4c,$66,$6a

    L_d56f:
        .byte $ac,$ba,$c0,$00
        .byte $f0,$17,$9e,$ae,$35,$29,$a0,$0a,$54,$ce,$55,$4d,$18,$35,$8d,$f4
        .byte $18,$db,$9e,$a0,$e0,$03,$a3,$f0,$08

    L_d58c:
        dec $9420

        .byte $90,$ed,$81,$52,$73,$00,$04,$e6,$b9,$ae,$f3,$1d,$b4,$38,$05,$e6
        .byte $24,$8d,$f2,$f8,$a9,$ff,$33,$cd,$12,$d0,$c5,$f9,$60

    L_d5ac:
        .byte $a2,$27,$f1,$c6,$b9,$f7,$a7,$9d,$00,$d8,$37
        .byte $ac,$da,$ca,$91,$f1

    L_d5bc:
        .byte $b3
        .byte $96,$18,$48,$86,$cb,$75,$ce,$50,$10,$05,$a0,$a7,$30,$8c,$cc,$c5
        .byte $60,$fc,$3a,$d5,$49,$47,$48,$53,$43,$4f,$52,$7f,$45,$9f,$01,$02
        .byte $03,$04,$4f,$05,$06,$07,$e1,$2c,$0a,$0b,$0c,$0d,$0e,$f9,$5b,$11
        .byte $12,$13,$38,$fb,$16,$17,$18

    L_d5f4:
        ora L_1e00 + $1a,y

        .byte $3f,$30,$31,$32,$33,$34,$35,$36,$37,$ff,$38,$39,$f7,$17,$05,$b2
        .byte $09,$64,$14,$c8,$21,$90,$5a,$40,$23,$16,$1b,$23,$8c,$28,$42,$11
        .byte $07,$52,$01,$22,$0d,$11,$08,$03,$84,$0e,$42,$04,$21,$0b,$10,$06
        .byte $8a,$42,$84,$a9,$02,$88

    L_d62d:
        dex 
        ora ($04,x)
        adc $05

        .byte $3a,$03,$c4,$7c,$00,$c3,$00,$08,$0e,$0d,$64,$54,$d1,$e1,$10,$b2
        .byte $76,$01,$04,$d9,$75,$20,$1b,$05,$18,$37,$1d,$95,$28,$09,$18,$06
        .byte $12,$c9,$15,$27,$86,$02,$0f,$0e,$b3,$13,$dc,$38,$11,$94,$00,$a9
        .byte $b2,$c7,$01,$53,$0e,$ae,$17,$e8,$bc,$a0,$01,$19,$32,$b4,$31,$43
        .byte $81,$c6,$c2,$4e,$17,$c1,$0e,$8d,$71,$00,$24,$00,$58,$80,$a1,$05
        .byte $53

    L_d683:
        ora L_0f40 + $9,y
        ora $12,x

        .byte $fb,$36,$14,$09,$98,$0c,$df,$d4,$97,$2e,$85,$0a,$04,$01,$a9,$16
        .byte $0e,$8d,$d0,$ca,$09,$07,$08,$f3,$4e,$03,$0f,$12,$e1,$10,$0c,$4d
        .byte $43,$13,$05,$73,$17,$01,$09,$14,$21,$7c,$10,$20,$84,$80,$30,$87
        .byte $10,$00,$03,$89,$11,$23,$dc,$cd,$44,$59,$88,$10,$11,$e7,$ab,$23
        .byte $cc,$d4,$59,$88,$80,$c6,$2d,$3c,$cc,$58,$91,$00

    L_d6d4:
        lda L_5878 + $5d,y
        sta $07fc,y
        dey 
        bne L_d6d4
    L_d6dd:
        inx 
        tya 
        and #$0f
        beq L_d6f7
        txa 
        lsr 
        ldx $0333,y
    L_d6e8:
        rol 
        rol $9f
        dex 
        bpl L_d6e8
        adc $0367,y
        tax 
        lda $9f
        adc $039b,y
    L_d6f7:
        sta $039c,y
        txa 
        sta $0368,y
        ldx #$04
    L_d700:
        jsr $0100
        sta $0334,y
        iny 
        cpy #$34
        bne L_d6dd
        ldy #$00
        jmp $014b

        .byte $80,$e3,$c7,$a9,$00,$85,$9f,$e0,$01,$90,$33

    L_d71b:
        lsr $fd
        bne L_d748
        pha 
    L_d720:
        dec $01
        lda #$85
        sta SCREEN_BUFFER_0 + $3e6
        lda #$98
        sta SCREEN_BUFFER_0 + $3e7
        inc vColorRam + $3e6
        inc vColorRam + $3e7
        inc $01
        lda $012d
        bne L_d73c
        dec $012e
    L_d73c:
        dec $012d
        lda L_57ac + $17
        bcc L_d759
        ror 
        sta $fd
        pla 
    L_d748:
        rol 
        rol $9f
        dex 
        bne L_d71b
    L_d74e:
        rts 


    L_d74f:
        dex 
        dec $ff
        dec $af
    L_d754:
        dey 
        bcc L_d720
    L_d757:
        lda ($ae),y
    L_d759:
        sta ($fe),y
        tya 
        bne L_d754
        txa 
    L_d75f:
        bne L_d74f
        inx 
        jsr $0100
        tay 
        bne L_d77b
    L_d768:
        inx 
        jsr $0108
        lsr 
        iny 
        bcc L_d768
        cpy #$11
        bcc L_d783
        beq L_d7db
        ldx #$10
        jsr $0100
    L_d77b:
        sta $a7
        ldx $9f
    L_d77f:
        ldy #$00
        bcc L_d7aa
    L_d783:
        ldx $0333,y
        jsr $0100
        adc $0367,y
        sta $a7
        lda $9f
        adc $039b,y
        pha 
        bne L_d79c
        ldy $a7
        cpy #$04
        bcc L_d79e
    L_d79c:
        ldy #$03
    L_d79e:
        ldx $01cd,y
        jsr $0100
        adc $01d0,y
        tay 
        lda $a7
    L_d7aa:
        sbc $fe
        bcc L_d7b0
        dec $ff
    L_d7b0:
        eor #$ff
        sta $fe
        cpy #$01
        bcc L_d7d6
        ldx $0334,y
        jsr $0100
        adc $0368,y
        bcc L_d7c6
        inc $9f
        clc 
    L_d7c6:
        adc $fe
        sta $ae
        lda $9f
        adc $039c,y
        adc $ff
        sta $af
        pla 
        tax 
        sec 
    L_d7d6:
        ldy $a7
        jmp $0148
    L_d7db:
        dec $01
        cli 
        jmp L_c053

        .byte $02,$04,$04,$30,$20,$10,$80,$00,$1e,$4a,$7c

    L_d7ec:
        .byte $e2,$07,$9e,$34
        .byte $39,$32,$33,$7f,$35,$b7,$df,$c0,$00,$1b,$15,$7b,$b0,$00

    L_d7fe:
        sbc L_5a5e + $d,x
        lda #$65

        .byte $1f,$84,$66,$43,$98,$d7,$02,$3f,$09,$d8,$6f,$f5,$de,$7b,$97,$ca
        .byte $33,$7b,$39,$ec,$14,$29,$48,$fa,$67,$c5,$2b,$4b,$a9,$ff,$d8,$8d
        .byte $57,$07,$1a,$95,$ee,$25,$ff,$2e,$e6,$ed,$49,$f7,$2e,$4d,$2e,$2a
        .byte $f7,$ce,$2d,$cb,$a8,$bd,$5f,$66,$d6,$09,$ff,$0b,$47,$f2,$cd,$7d
        .byte $ba,$77,$ea,$c6,$d9,$bc,$c1,$c9,$4c,$c1,$ff,$98,$f6,$a5,$cf,$8a
        .byte $ee,$cd,$14,$bd,$fa,$c1,$3e,$08,$f6,$cf,$9d,$f7,$ea,$c1,$97,$0f
        .byte $bd,$4f,$30,$f6,$40,$73,$a6,$e9,$a0,$fd,$fa,$ef,$7a,$5b,$c9,$d8
        .byte $67,$77,$66,$85,$8e,$d7,$9b,$46,$48,$77,$ff,$06,$f7,$96,$f3,$de
        .byte $73,$c2,$14,$cd,$b5,$28,$9d,$86,$dc,$42,$f7,$e5,$ac,$9c,$fb,$3b
        .byte $49,$8a,$c3,$de,$7d,$35,$a7,$ef,$10,$71,$a4,$d6,$b9,$68,$ec,$90
        .byte $4f,$55,$e6,$d9,$18,$bb,$fe,$76,$ff,$88,$6c,$48,$18,$80,$58,$bd
        .byte $4c,$0d,$c1,$0b,$0b,$08,$e2,$07,$3c,$57,$4f,$88,$78,$2f,$28,$53
        .byte $17,$80,$b6,$91,$02,$b1,$d5,$13,$0d,$91,$69,$1e,$62,$5c,$eb,$5d
        .byte $08,$a9,$7c,$00,$80,$00,$18,$80,$93,$5c,$cc,$44,$58,$89,$01,$01
        .byte $0e,$a3,$5c,$d4,$54,$44,$11,$88,$0d,$c1,$b2,$2c,$59,$91,$10,$00

    L_d8f3:
        lda L_7440 + $3e,y
        sta $07fe,y
        dey 
        bne L_d8f3
        inx 
        tya 
        and #$01
        jsr.a $0008

        .byte $00,$f5,$14,$8a,$4a,$dc,$36,$44,$d6,$10,$fa

    L_d90e:
        ror $b2,x
        tax 
        eor L_6464,x
        ora ($8a,x)
        sbc L_7780 + $27
        ldx #$04
        adc $a4
        sta L_c883,y
        cpy #$bb

        .byte $34,$d0,$d2,$ff,$4c,$9d,$47,$ba,$08,$c5,$93,$a9,$00,$85,$9f,$e0
        .byte $ff,$13,$2f,$46,$fd,$77,$d0,$25,$48

    L_d93b:
        sbc $85
        lsr 
        ldy $a9,x
        tya 
        sta SCREEN_BUFFER_0 + $357
        tax 
        inc $95
        inc vColorRam + $3e7
        lda $a62f

        .byte $d0,$03,$d2,$2a,$ce,$a5,$29,$01,$ad,$e1,$73,$90,$15,$6a,$85,$fd
        .byte $68,$7f

    L_d95f:
        rol 
        rol $9f
        sbc L_d1d0,y
        rts 



        .byte $ca,$7d,$a7,$c6,$af,$88,$90,$cd,$b1,$ae,$7f,$91,$fe,$98

    L_d974:
        sbc #$f6
        txa 
        ror $ee
        ldy $d6
        tay 

        .byte $d0,$13,$b7,$e8,$20,$08,$01,$4a,$c8,$ff,$f8,$c0,$11,$90,$2f,$0f
        .byte $f0,$65,$a2,$10,$f9,$22,$0a,$a6,$9f,$a0,$dc,$90,$27,$be,$d7,$33
        .byte $e8,$67,$91,$85,$35,$f4,$92,$9b,$03,$48,$d0,$4f,$06,$f8,$c0,$04
        .byte $77,$2b,$a0,$03,$be,$c6,$7a,$41,$c9,$99,$01,$a8,$a5,$a7

    L_d9ba:
        sbc $fd

        .byte $af,$02,$c6,$5c

    L_d9c0:
        eor #$56
        inc $01c0,x
        bcc L_d9e5
        ldx $0334,y
        jsr $0100
        adc $0368,y
        bcc L_d9d5
        inc $9f
        clc 
    L_d9d5:
        adc $fe
        sta $ae
        lda $9f
        adc $039c,y
        adc $ff
        sta $af
        pla 
        tax 
        sec 
    L_d9e5:
        ldy $a7
        jmp $0144
    L_d9ea:
        jmp L_080c + $12

        .byte $02,$04,$04,$30,$20,$10,$80,$00,$1c,$08

    L_d9f7:
        asl 

        .byte $3c,$8d,$3e,$84,$38,$20,$28,$54,$ef,$41,$50,$85,$52,$2b,$5b,$37
        .byte $48,$44,$29,$5b,$f9,$8b,$5d,$90,$d9,$c8,$02,$00,$00,$24,$44,$08
        .byte $b3,$35,$55,$16,$62,$24,$42,$3e,$ea,$c8,$8f,$73,$55,$11,$60,$02
        .byte $ca,$55,$51,$11,$56,$24,$44

    L_da2f:
        lda L_8e42,y
        sta $07fe,y
        dey 
        bne L_da2f
    L_da38:
        inx 
        tya 
        and #$0f
        beq L_da52
        txa 
        lsr 
        ldx $0333,y
    L_da43:
        rol 
        rol $9f
        dex 
        bpl L_da43
        adc $0367,y
        tax 
        lda $9f
        adc $039b,y
    L_da52:
        sta $039c,y
        txa 
        sta $0368,y
        ldx #$04
        jsr $0100
        sta $0334,y
        iny 
        cpy #$34
        bne L_da38
        ldy #$00
        jmp $014b

        .byte $02,$94,$b8,$a9,$00,$85,$9f,$e0,$01,$90,$33

    L_da76:
        lsr $fd
        bne L_daa3
        pha 
    L_da7b:
        dec $01
        lda #$85
        sta SCREEN_BUFFER_0 + $3e6
        lda #$98
        sta SCREEN_BUFFER_0 + $3e7
        inc vColorRam + $3e6
        inc vColorRam + $3e7
        inc $01
        lda $012d
        bne L_da97
        dec $012e
    L_da97:
        dec $012d
        lda $8d30
        bcc L_dab4
        ror 
        sta $fd
        pla 
    L_daa3:
        rol 
        rol $9f
        dex 
        bne L_da76
    L_daa9:
        rts 


    L_daaa:
        dex 
        dec $ff
        dec $af
    L_daaf:
        dey 
        bcc L_da7b
        lda ($ae),y
    L_dab4:
        sta ($fe),y
        tya 
        bne L_daaf
        txa 
        bne L_daaa
        inx 
        jsr $0100
        tay 
        bne L_dad6
    L_dac3:
        inx 
        jsr $0108
        lsr 
        iny 
        bcc L_dac3
        cpy #$11
        bcc L_dade
        beq L_db36
        ldx #$10
        jsr $0100
    L_dad6:
        sta $a7
        ldx $9f
        ldy #$00
        bcc L_db05
    L_dade:
        ldx $0333,y
        jsr $0100
        adc $0367,y
        sta $a7
        lda $9f
        adc $039b,y
        pha 
        bne L_daf7
        ldy $a7
        cpy #$04
        bcc L_daf9
    L_daf7:
        ldy #$03
    L_daf9:
        ldx $01cd,y
        jsr $0100
        adc $01d0,y
        tay 
        lda $a7
    L_db05:
        sbc $fe
        bcc L_db0b
        dec $ff
    L_db0b:
        eor #$ff
        sta $fe
        cpy #$01
        bcc L_db31
        ldx $0334,y
        jsr $0100
        adc $0368,y
        bcc L_db21
        inc $9f
        clc 
    L_db21:
        adc $fe
        sta $ae
        lda $9f
        adc $039c,y
        adc $ff
        sta $af
        pla 
        tax 
        sec 
    L_db31:
        ldy $a7
        jmp $0148
    L_db36:
        dec $01
        cli 
        jmp L_080c + $1

        .byte $02,$04,$04,$30,$20,$10,$80,$00,$0b,$08,$0a,$3b,$92,$be,$c0,$f7
        .byte $a9,$fa,$58,$96,$fb,$78,$f3,$09,$27,$c9,$7b,$05,$80,$4a,$91,$02
        .byte $e4,$27,$3f,$8e,$15,$51
        .fill $1e, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_dc40:
        .fill $40, $ff

    L_dc80:
        .fill $40, $0

    L_dcc0:
        .fill $40, $ff

    L_dd00:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_ddc0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_de80:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_dfc0:
        .fill $40, $ff

    L_e000:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_e0c0:
        .fill $40, $ff

    L_e100:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_e280:
        .fill $40, $0

    L_e2c0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_e3c0:
        .fill $40, $ff

    L_e400:
        .fill $40, $0

    L_e440:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_e540:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff

    L_e600:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_e6c0:
        .fill $40, $ff
        .fill $40, $0

    L_e740:
        .fill $40, $ff
        .fill $40, $0

    L_e7c0:
        .fill $40, $ff

    L_e800:
        .fill $40, $0

    L_e840:
        .fill $40, $ff

    L_e880:
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_e940:
        .fill $40, $ff

    L_e980:
        .fill $40, $0
        .fill $40, $ff

    L_ea00:
        .fill $40, $0

    L_ea40:
        .fill $40, $ff

    L_ea80:
        .fill $40, $0

    L_eac0:
        .fill $40, $ff

    L_eb00:
        .fill $40, $0

    L_eb40:
        .fill $40, $ff

    L_eb80:
        .fill $40, $0

    L_ebc0:
        .fill $40, $ff

    L_ec00:
        .fill $40, $0

    L_ec40:
        .fill $40, $ff

    L_ec80:
        .fill $40, $0

    L_ecc0:
        .fill $40, $ff

    L_ed00:
        .fill $40, $0
        .fill $40, $ff

    L_ed80:
        .fill $40, $0

    L_edc0:
        .fill $40, $ff

    L_ee00:
        .fill $40, $0

    L_ee40:
        .fill $40, $ff

    L_ee80:
        .fill $40, $0

    L_eec0:
        .fill $40, $ff

    L_ef00:
        .fill $40, $0
        .fill $40, $ff

    L_ef80:
        .fill $40, $0
        .fill $40, $ff

    L_f000:
        .fill $40, $0

    L_f040:
        .fill $40, $ff

    L_f080:
        .fill $40, $0

    L_f0c0:
        .fill $40, $ff

    L_f100:
        .fill $40, $0

    L_f140:
        .fill $40, $ff

    L_f180:
        .fill $40, $0

    L_f1c0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_f2c0:
        .fill $40, $ff

    L_f300:
        .fill $40, $0

    L_f340:
        .fill $40, $ff

    L_f380:
        .fill $40, $0

    L_f3c0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_f4c0:
        .fill $40, $ff

    L_f500:
        .fill $40, $0
        .fill $40, $ff

    L_f580:
        .fill $40, $0

    L_f5c0:
        .fill $40, $ff

    L_f600:
        .fill $40, $0

    L_f640:
        .fill $40, $ff
        .fill $40, $0

    L_f6c0:
        .fill $40, $ff

    L_f700:
        .fill $40, $0

    L_f740:
        .fill $40, $ff

    L_f780:
        .fill $40, $0

    L_f7c0:
        .fill $40, $ff
        .fill $40, $0
        .fill $40, $ff
        .fill $40, $0

    L_f8c0:
        .fill $40, $ff

    L_f900:
        .fill $40, $0

    L_f940:
        .fill $40, $ff

    L_f980:
        .fill $40, $0

    L_f9c0:
        .fill $40, $ff

    L_fa00:
        .fill $40, $0
        .fill $40, $ff

    L_fa80:
        .fill $40, $0

    L_fac0:
        .fill $40, $ff

    L_fb00:
        .fill $40, $0
        .fill $40, $ff

    L_fb80:
        .fill $40, $0

    L_fbc0:
        .fill $40, $ff
        .fill $40, $0

    L_fc40:
        .fill $40, $ff

    L_fc80:
        .fill $40, $0

    L_fcc0:
        .fill $40, $ff

    L_fd00:
        .fill $30, $0
        .byte $31,$ea,$66,$fe,$47,$fe,$4a,$f3,$91,$f2,$0e,$f2,$50,$f2,$33,$f3
        .byte $57,$f1,$ca,$f1,$ed,$f6,$3e,$f1,$2f,$f3,$66,$fe,$a5,$f4,$ed,$f5
        .byte $ff
