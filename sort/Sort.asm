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

(OUTER_LOOP)
@END_OUTER_LOOP//outer loop
D;JEQ // A for loop over the array


@n //set k as the current n
D=M
@k
M=D


@R14 //set switch
D=M
@switch
M=D
D=D+1 // set next
@next
M=D


(INNER_LOOP)
@k
D=M
@END_INNER_LOOP
D;JLE


@switch //if condition that continue if the switch is bigger than next
A=M
D=M
@temp_arr
M=D
@next
A=M
D=M
@temp_arr
D=M-D
@END_IF
D;JLE

// switch the values
@next
A=M
D=M
@temp
M=D //temp contains next
@switch
A=M
D=M
@next
A=M
M=D  //switch->next
@temp
D=M
@switch
A=M
M=D //next->switch
(END_IF)

@k
M=M-1

@switch
M=M+1

@next
M=M+1


@INNER_LOOP
0;JMP

(END_INNER_LOOP)

@n
M=M-1

@R14 //reset switch as  R14 (the start of the array)
D=M
@switch
M=D
@OUTER_LOOP
0;JMP

(END_OUTER_LOOP)
@END
0;JMP








