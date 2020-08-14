.const MAX_PARTICLES = 64//More = Increased flickering
.const PARTICLE_CHAR_COUNT = 32 //8, 16 or 32 More = more raster time
.const ZP_CLEAR_PARTICLES = $100 - [PARTICLE_CHAR_COUNT * 2] - 2

* = $02  "Zeropage" virtual
ParticleFetch: .byte $00
ParticleUpdateFetch: .byte $00
NextParticleChar: .byte $00
ParticleCount:	.byte $00
ParticleZPCount: .byte $00
ScreenFetch: .word $0000 
ParticleTemp: .byte $00


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
		lda #$f2
		cmp $d012
		bne *-3

		inc $d020
			jsr ClearParticles
		inc $d020
			jsr DrawParticles
		inc $d020
			
		ldx #$00
		stx $d020
			jsr UpdateParticles
			

		jmp Loop


	InitParticles:
			lda #$00
			sta ParticleFetch
			sta ParticleUpdateFetch
			lda #[256 - PARTICLE_CHAR_COUNT]
			sta NextParticleChar
			rts


	DrawParticles:
			lda #[MAX_PARTICLES/2]
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
			bcs !CharSelected+

			//Particle is in a wall here
			lda #$00
			sta Particles.MSB, x
			
			jmp !skip+

		!CharSelected:
			//At this point char has been selected and drawn to the screen if necessary
			sec
			sbc #[256 - PARTICLE_CHAR_COUNT]
			// and #[PARTICLE_CHAR_COUNT -1]
			asl
			asl
			asl
			adc Particles.FineY, x
			sta FetchOffsetMod + 1
			ldy Particles.FineX, x
			lda RevPOT, y

		
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

			//BUG FIX - Still need to work out why!!
			lda #$00
			sta $3800
			sta $3801
			sta $3802
			sta $3803
			sta $3804
			sta $3805
			sta $3806
			sta $3807

			rts


	ClearParticles:
			ldx ParticleZPCount
			beq !skip+
			lda #$00
		!:
			sta ([ZP_CLEAR_PARTICLES -2] ,x)
			dex
			dex
			bne !-
		!skip:

			lda #$00
			.for(var i=0; i<PARTICLE_CHAR_COUNT * 8 ; i++) {
				sta $3800 + [[256 - PARTICLE_CHAR_COUNT] * 8] + i
			}

			lda #[256 - PARTICLE_CHAR_COUNT]
			sta NextParticleChar
			rts



	UpdateParticles: {
			lda #[MAX_PARTICLES/2]
			sta ParticleCount

			ldy #$00
			clc
			ldx ParticleUpdateFetch
		!Loop:
			lda Particles.MSB, x
			bne !+
			jmp !skip+
		!:
			sta ScreenFetch + 1
			lda Particles.LSB, x
			sta ScreenFetch + 0

		
		//X Movement
			clc
			lda Particles.FineX, x
			adc Particles.DeltaX, x
			sta ParticleTemp	
			cmp #$08
			bcc !posnegdone+
			bmi !neg+
		!pos:

			lda ScreenFetch + 0
			clc
			adc #$01
			sta ScreenFetch + 0
			bcc !+
			lda ScreenFetch + 1
			adc #$00
			sta ScreenFetch + 1
		!:
			jmp !posnegdone+

		!neg:
			lda ScreenFetch + 0
			sec
			sbc #$01
			sta ScreenFetch + 0
			bcs !+
			lda ScreenFetch + 1
			sbc #$00
			sta ScreenFetch + 1
		!:
		!posnegdone:
			lda (ScreenFetch), y
			beq !+
			cmp #[256 - PARTICLE_CHAR_COUNT]
			bcs !+
				lda Particles.DeltaX, x
				eor #$ff
				adc #$01
				cmp #$80
				ror
				sta Particles.DeltaX, x
			lda Particles.FineX, x
			and #$07
			sta Particles.FineX, x
			jmp !skip+

		!:
			lda ParticleTemp
			and #$07
			sta Particles.FineX, x
			lda ScreenFetch + 0
			sta Particles.LSB, x
			lda ScreenFetch + 1
			sta Particles.MSB, x
		!SetDone:


		//Y Movement
			//gravity
			clc
			lda Particles.DeltaYFrac, x
			adc #$48
			sta Particles.DeltaYFrac, x
			lda Particles.DeltaY, x
			adc #$00
			cmp #$08
			bcc !+
			cmp #$f9
			bcs !+
			jmp !skipgrav+
		!:
			sta Particles.DeltaY, x


		!skipgrav:
			//Deltas
			// clc
			lda Particles.FineY, x
			adc Particles.DeltaY, x
			sta ParticleTemp	
			cmp #$08
			bcc !posnegdone+
			bmi !neg+
		!pos:

			lda ScreenFetch + 0
			clc
			adc #$28
			sta ScreenFetch + 0
			bcc !+
			lda ScreenFetch + 1
			adc #$00
			sta ScreenFetch + 1
		!:
			jmp !posnegdone+

		!neg:
			lda ScreenFetch + 0
			sec
			sbc #$28
			sta ScreenFetch + 0
			bcs !+
			lda ScreenFetch + 1
			sbc #$00
			sta ScreenFetch + 1
		!:
		!posnegdone:
			lda (ScreenFetch), y
			beq !+
			cmp #[256 - PARTICLE_CHAR_COUNT]
			bcs !+
				lda Particles.DeltaYFrac, x
				eor #$ff
				adc #$01
				cmp #$80
				ror
				sta Particles.DeltaYFrac, x
				lda Particles.DeltaY, x
				eor #$ff
				cmp #$80
				ror
				sta Particles.DeltaY, x
			lda Particles.FineY, x
			and #$07
			sta Particles.FineY, x
			jmp !SetDone+

		!:
			lda ParticleTemp
			and #$07
			sta Particles.FineY, x
			lda ScreenFetch + 0
			sta Particles.LSB, x
			lda ScreenFetch + 1
			sta Particles.MSB, x
		!SetDone:




		!skip:
			inx
			cpx #MAX_PARTICLES
			bne !FetchLoopDone+
			ldx #$00

		!FetchLoopDone:	
			dec ParticleCount
			beq !End+
			jmp !Loop-

		!End:
			stx ParticleUpdateFetch


			rts

	}	

	POT:
		.byte 1,2,4,8,16,32,64,128
	RevPOT:
		.byte 128,64,32,16,8,4,2,1



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
		.fill MAX_PARTICLES, random() < 0.99 ? floor(random() * $1 + $34) : $00
	FineX:
		.fill MAX_PARTICLES, floor(random() * $8)
	FineY:
		.fill MAX_PARTICLES, floor(random() * $8)

	DeltaX:
		.fill MAX_PARTICLES, floor(random() * $9) - $4
	DeltaYFrac:
		.fill MAX_PARTICLES, 0
	DeltaY:
		.fill MAX_PARTICLES, floor(random() * $9) - $4

}


