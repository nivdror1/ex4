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


// define var named black, containing the value 0b1111111111111111
@1
D = A
@black
M =-D


// define var named state, for the current state of the screen ( 0 = white, 1 = black )
@state
M = 0

(START)

// read the keyboard from ram[24576] and insert it's input into D
@24576
D = M


// if the keyboard is not pressed (D = input = 0), jump to WHITE label - where the program will clear the screen
@WHITE
D; JEQ

// the BLACK lable - where the program set the screen to black
(BLACK)

// check if the screen is black already. if it is - jump to start and check keyboard again
@state
D = M
@START
D, JNE

// initiate loop index i to 16384 - the screen first pixel
@16384
D = A
@i
M = D

// the blacking loop label
(LOOP_BLACK)

// read the black color to D
@black
D = M

// read i index to A - the address of the current 16 pixels
@i
A = M

// set all the current pixels to black
M = D

// i =  index ++
D = A + 1
@i
M = D

//read the current index to D
@i      // a = i
A = M
D = A   // D = i

@24384  // A = last pixel index

// check loop condition
D = D - A
@LOOP_BLACK
D; JNE

// update the screen state to black
@state
M = 1

// jump to start
@START
0;JMP

// the WHITE lable - where the program set the screen to white
(WHITE)

// check if the screen is white already. if it is - jump to start and check keyboard again
@state
D = M
@START
D, JEQ

// initiate loop index i to 16384 - the screen first pixel
@state
M = 0

@16384
D = A
@i
M = D

// the clearing loop label
(LOOP)

// read i index to A - the address of the current 16 pixels
@i
A = M
// set all the current pixels to White
M = 0

// i =  index ++
D = A + 1
@i
M = D

// read the current index to D
@i      // a = i
A = M
D = A   // D = i

@24384  // A = last pixel index

// check loop condition
D = D - A
@LOOP
D; JNE

@START
0;JMP