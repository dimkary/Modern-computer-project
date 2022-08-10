// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Store last pixel address
@8192
D=A

@maxpix
M = D //(8191 total pixels)

(INFINITELOOP)
	
	// Read the keyboard input. Store it in register R0
	@KBD
	D=M
	
	@pressed
	M=D
	D=M
	
	@i
	M = 0
	
	@LIGHT
	D;JGT
	
	@DARK
	D;JEQ

(LIGHT)
	
	@i
	D = M
	
	@maxpix
	D = M - D
	@INFINITELOOP
	D; JEQ
	
	@SCREEN
	D = A
	
	@i
	D = D + M
	A = D
	M = -1
	
	@i
	D = M + 1
	M = D
	
	@LIGHT
	0;JMP
	
(DARK)
	
	@i
	D = M
	
	@maxpix
	D = M - D
	@INFINITELOOP
	D; JEQ
	
	@SCREEN
	D = A
	
	@i
	D = D + M
	A = D
	M = 0
	
	@i
	D = M + 1
	M = D
	
	@DARK
	0;JMP