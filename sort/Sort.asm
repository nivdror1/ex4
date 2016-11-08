// sort the array which starts at R14 and the length of the array is located in R15.
// (R14, R15 refer to RAM[14], and RAM[15], respectively.)

//pseudo code:
  //set switch as R14
  // set n as the length current unsorted array
  //for loop as long as the length of the array
  // set i as zero
  //set k as n
  //for loop until it reaches n
  // switch if necessary
  // advance i
  //end loop
  //decrease n by 1
  //set switch as R14
  //end loop

@R14 //set switch as R14
D=M
@switch
M=D

@R15 //set n as R15
D=M
@n
M=D

@OUTER_LOOP
M;JEQ // A for loop over the array

//@i //set i
//M=0

@n //set k as the current n
D=M
@k
M=D

@INNER_LOOP
M;JLE

@switch
A=2048-16383 //the location on the heap
A=A+1
D=M
@address //assign address
M=A
@next //assign next
M=D

@switch //if condition that continue if the switch is bigger than next
D=M
@next
D=M-D
@END_IF
D;JLE

@next // switch the values
D=M
@address
A=M
M=D
(END_IF)

@K
M=M-1

(INNER_LOOP)

@n
M=M-1
//TODO reset the R14 or switch
(OUTER_LOOP)








