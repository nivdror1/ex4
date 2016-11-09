// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//pseudo code:
     // n=R1
     // R2=0
     // if(R0=0 OR R1=0) jump to end
     // set sum as R0
     // (loop) for i-R1>=0 jump to end
     // R2= sum + R1
     //(end loop)
     //(INFINITE LOOP)

@R1 //initialise n
D=M
@n
M= D

@R2 //initialise R2 as zero
M=0

@R0 //check if R0 is zero
D=M
@END
D;JEQ

@R1 //check if R1 is zero
D=M
@END
D;JEQ

@R0 //set sum as R0
D=M
@sum
M=D

(LOOP) // the for condition (i>=0)
@n
M=M-1 // subtract 1 from n
D=M
@END_LOOP
D;JLE //jump to the end

@R0 // sum=sum+R1
D=M
@sum
M=D+M

@LOOP
0;JMP //go to the  beginning loop

(END_LOOP)

@sum //set R2 as sum
D=M
@R2
M=D

(END)
@END
0;JMP //infinite loop

