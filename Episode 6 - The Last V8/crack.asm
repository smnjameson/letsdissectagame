// Setup
.file [name="crack.prg", segments="Base,Patch", allowOverlap]
.segmentdef Base [prgFiles="lastv8-original.prg"]
.segmentdef Patch []

// Patch Code 
.segment Patch

BasicUpstart2(Entry)

Entry: {
	jmp $0d00
}


//KEEP THESE CONSTANTS AS POWERS OF TWO
.label FRAMES_PER_ACCEL = 8;
.label FRAMES_PER_DECCEL = 4;
.label FRAMES_PER_STEER = 2;



* = $1191
	.byte $01	//Frames per joy update
//Intercept joystick code
* = $1198
jmp NewJoystickCode

//Read rotation from here instead of original code
* = $1588
	jsr GetRotation

//Reset the vars at the start of the game
* = $0d5d
	jsr ResetValues

//Inject new bitmap data
* = $5800
.import binary "signing.bin"



//NEW CODE!
* = $0590

GetRotation:
	pha 
	lda #$38
	sec
	sbc Rotation
	and #$1f
	tax 
	pla 
	rts

Rotation:
	.byte $00  //Default 00 = Pointing West   00 - 1f
Speed:
	.byte $02	//Top speed $33
AccelerateTimer:
	.byte $00

.label CONST_SPEED = 4

SOUTH:
	.fill 32, max(0, sin((i/32) * PI * 2)) * CONST_SPEED 
NORTH:
	.fill 32, min(0, sin((i/32) * PI * 2)) * -CONST_SPEED
EAST:
	.fill 32, min(0, cos((i/32) * PI * 2)) * -CONST_SPEED
WEST:
	.fill 32, max(0, cos((i/32) * PI * 2)) * CONST_SPEED

NewJoystickCode:
	//0350 - 0353   E W S N
	//X = Horizontal joystick
	// Y = Vertical Joystick
	//Carry = clear if fire button pressed

	bcc !Accel+
!Deccel:
	ldy #$ff
	jmp !+
!Accel:
	ldy #$01
!:

//ALWAYS RUNS
	//Set car colors
	lda #$07
	sta $0376
	lda #$0c
	sta $0377
	lda #$02
	sta $0378

	//Increment our internal timer
	inc AccelerateTimer
//////

!DoSpeed:
	lda AccelerateTimer
	and #[FRAMES_PER_STEER - 1]
	bne !NoTurnThisTime+
	txa
	clc
	adc Rotation
	and #$1f        
	sta Rotation	
!NoTurnThisTime:

	
	cpy #$00
	bmi !DoBrake+
	lda #[FRAMES_PER_ACCEL - 1]
	sta INTERVAL + 1
	jmp !DoSpeed+
!DoBrake:
	lda #[FRAMES_PER_DECCEL - 1]
	sta INTERVAL + 1

!DoSpeed:
	lda AccelerateTimer
INTERVAL:
	and #$03
	bne !NoSpeedThisTime+
	tya
	clc
	adc Speed
	bmi !Stopped+
!Pos:
	cmp #$34
	bcs !TopSpeed+
	jmp !StoreSpeed+
!Stopped:
	lda #$00
	jmp !StoreSpeed+
!TopSpeed:
	lda #$33
!StoreSpeed:
	sta Speed
!NoSpeedThisTime:


	ldx Rotation


	lda EAST, x
	jsr MultiplyBySpeed
	sta $0350
	lda WEST, x
	jsr MultiplyBySpeed
	sta $0351
	lda SOUTH, x
	jsr MultiplyBySpeed
	sta $0352
	lda NORTH, x
	jsr MultiplyBySpeed
	sta $0353

	rts

MultiplyBySpeed:
	tay 
	lda #$00
!:
	cpy #$00
	beq !+
	clc
	adc Speed
	dey
	jmp !-
!:
	rts


ResetValues:
	sta $039b
	sta Rotation
	sta $0351
	sta $0352
	sta $0353
	lda #$02
	sta Speed
	sta $0350
	lda #$00
	rts


