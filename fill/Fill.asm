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

(START)

@pressed
M = 0

@24576
D = M

@WHITE
D; JEQ

(BLACK)
@pressed
M = 1

@PROJ
0;JMP

(WHITE)
@pressed
M = 0

@PROJ
0;JMP


(PROJ)
@pressed
D = M

@16384      // A = 16384, the screen's top-left pixel
D = M
@i          // i = 16384
M = D

(LOOP)

@pressed    // D = is key pressed?
D = M

@i          // insert pressed to the pixel
A = M
M = D

@i
A = M
M = M + 1
D = M

@24384
D = A - D
@LOOP
D, JNE


@START
0;JMP