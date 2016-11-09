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

@OUTER_LOOP//outer loop
M;JEQ // A for loop over the array


@n //set k as the current n
D=M
@k
M=D

@2048
D=M //the location on the heap
@switch
M=D

(INNER_LOOP)
M;JLE


@2048
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
D;JGE

@next // switch the values
D=M
@temp
M=D
@switch
D=M
@next
M=D
@temp
D=M
@switch
M=D
(END_IF)

@K
M=M-1

@switch
A=A+1
@next
A=A+1


(INNER_LOOP)
0;JMP

@n
M=M-1

@R14 //reset switch as  R14 (the start of the array)
D=M
@switch
M=D
(OUTER_LOOP)
0;JMP

@END
0;JMP








