//input: R14 - the address of the start of the array
         R15 - the length of the array
//output: sort the array in descending order.
// (R14, R15 refer to RAM[14], and RAM[15], respectively.)

//pseudo code:
  //check if the R15 input if less or equal to 1 then end the program
  // set n as the length current unsorted array
  //begin the outer loop(n>0)
  //set k as n-1
  //set cur_address as R14 and next_address as R14+1
  //begin the inner loop (k>0)
  // check if the next_address is bigger than cur_address than switch the value in the addresses
  // decrease k by 1
  // advance cur_address and next_address
  //end the inner loop
  //decrease n by 1
  //end the outer loop

@R15 // check if the input of the array length is less or equal to one if so end the program
D=M-1
@END
D;JLE

@R15 //set n as R15
D=M
@n
M=D

(OUTER_LOOP) //begin the outer loop if n>0
@n
D=M
@END_OUTER_LOOP
D;JLE // if n<=0 jump to END_OUTER_LOOP


@n //set k as the current n
D=M
@k
M=D


@R14 //set cur_address
D=M
@cur_address
M=D
D=D+1 // set next_address
@next_address
M=D


(INNER_LOOP) //begin the inner loop if k>0
@k
D=M-1
@END_INNER_LOOP
D;JLE // if k<=0 jump to END_INNER_LOOP


@cur_address //an if condition that checks if next_address is bigger than cur_address
A=M
D=M
@temp_arr
M=D //save the value that cur_address point at
@next_address
A=M
D=M // D register now contain the value that next_address point at
@temp_arr
D=D-M // if the result is less or equal to zero than jump to END_IF
@END_IF
D;JLE

// switch the values
@next_address
A=M
D=M
@temp
M=D //temp contains next
@cur_address
A=M
D=M
@next_address
A=M
M=D  //cur_address->next_address
@temp
D=M
@cur_address
A=M
M=D //next_address->cur_address
(END_IF)

@k
M=M-1

@cur_address
M=M+1

@next_address
M=M+1


@INNER_LOOP
0;JMP

(END_INNER_LOOP)

@n
M=M-1

@OUTER_LOOP
0;JMP

(END_OUTER_LOOP)








