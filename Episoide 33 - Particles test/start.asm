.const MAX_PARTICLES = 80 //More = Increased flickering
.const PARTICLE_CHAR_COUNT = 16 //8, 16 or 32 More = more raster time
.const ZP_CLEAR_PARTICLES = $100 - [PARTICLE_CHAR_COUNT * 2] - 2

* = $02  "Zeropage" virtual
ParticleFetch: .byte $00
NextParticleChar: .byte $00
ParticleCount:	.byte $00
ParticleZPCount: .byte $00
ScreenFetch: .word $0000



BasicUpstart2(Entry)

Entry:
		sei

		lda #$7f
		sta $dc0d
		sta $dd0d

		lda #$35
		sta $01

		lda #$00
		sta $d020
		sta $d021

		lda #$01
		ldx #$00
	!:
		sta $d800, x
		sta $d900, x
		sta $da00, x
		sta $db00, x
		dex
		bne !-

		lda #%11011110
		sta $d018

		cli

		jsr InitParticles
		jsr DrawParticles
		

	Loop:
		lda #$ff
		cmp $d012
		bne *-3

		inc $d020
			jsr ClearParticles
			// jsr UpdateParticles
			jsr DrawParticles
		dec $d020

		jmp Loop


	InitParticles:
			lda #$00
			sta ParticleFetch
			lda #[256 - PARTICLE_CHAR_COUNT]
			sta NextParticleChar
			rts


	DrawParticles:
			lda #[MAX_PARTICLES/3]
			sta ParticleCount
			
			lda #$00
			sta ParticleZPCount

			ldx ParticleFetch
		!Loop:
			lda Particles.MSB, x
			beq !skip+
			sta ScreenFetch + 1
			ldy ParticleZPCount
			sta ZP_CLEAR_PARTICLES + 1, y
			lda Particles.LSB, x
			sta ScreenFetch + 0
			sta ZP_CLEAR_PARTICLES + 0, y

			ldy #$00
			lda (ScreenFetch), y
			bne !NonZero+

			lda NextParticleChar
			beq !End+
			inc NextParticleChar  
			sta (ScreenFetch), y

			inc ParticleZPCount
			inc ParticleZPCount
			jmp !CharSelected+

		!NonZero:
			cmp #[256 - PARTICLE_CHAR_COUNT]
			bcc !skip+

		!CharSelected:
			//At this point char has been selected and drawn to the screen if necessary
			// sbc #[256 - PARTICLE_CHAR_COUNT]
			and #[PARTICLE_CHAR_COUNT -1]
			asl
			asl
			asl
			adc Particles.FineY, x
			sta FetchOffsetMod + 1
			ldy Particles.FineX, x
			lda POT, y
		
		FetchOffsetMod:
			ldy #$BE//EF
			ora [$4000 - PARTICLE_CHAR_COUNT * 8], y 
			sta [$4000 - PARTICLE_CHAR_COUNT * 8], y

		!skip:
			inx
			cpx #MAX_PARTICLES
			bne !FetchLoopDone+
			ldx #$00

		!FetchLoopDone:	
			dec ParticleCount
			bne !Loop-

		!End:
			stx ParticleFetch
			rts


	ClearParticles:
			ldx ParticleZPCount
			lda #$00
		!:
			sta ([ZP_CLEAR_PARTICLES -2] ,x)
			dex
			dex
			bne !-


			lda #$00
			.for(var i=0; i<PARTICLE_CHAR_COUNT * 8 ; i++) {
				sta $3800 + [[256 - PARTICLE_CHAR_COUNT] * 8] + i
			}

			lda #[256 - PARTICLE_CHAR_COUNT]
			sta NextParticleChar
			rts

	UpdateParticles: {
			rts
	}		



.align $100
	POT:
		.byte 1,2,4,8,16,32,64,128



* = $3400
	// .fill 1000, 0
	.import binary "./map.bin"

* = $3800
	.import binary "./chars.bin"



* = $4000
Particles: {
	LSB:
		.fill MAX_PARTICLES, floor(random() * $100)
	MSB:
		.fill MAX_PARTICLES, random() < 0.999 ? floor(random() * $4 + $34) : $00
	FineX:
		.fill MAX_PARTICLES, floor(random() * $8)
	FineY:
		.fill MAX_PARTICLES, floor(random() * $8)
	Char:
		.fill MAX_PARTICLES, 0
}


