// Divide.asm
// this program get 2 numbers via registers 13, 14, compute r13/r14 and put it in r15.
// for doing that we use the algorithem below:
//      current divisor = divisor                   (a)
//      divideIndex = 1                             (b)
//      result = 0
//      while(current divisor <= divident)          (c)
//      {
//          divide index *=2                        (d)
//          current divisor *= 2                    (e)
//      }
//      current divisor/= 2                         (f)
//      divide index /= 2                           (g)
//

////-----------------------------------------------------

// while divident > 0
// {
// (DIVIDE_STEP_1)
//      if divident >= currentDivisor
//          divident -= currentDivisor
//          sol += index
// (DIVIDE_STEP_2)
//      if divident < currentDivisor
//          currentDivisor /= 2
//          index /= 2
// (DIVIDE_STEP_3)
//      if divident - divisor < 0
//          finish
// }



    // ------------------ initiate variables ------------------------

    // initiate variable divident (ram[13])
@13
D = M
@divident
M = D
    // initiate variable divisor (ram[14])
@14
D = M
@divisor
M = D
    // initiate variable currentDivisor             //(a)
@currentDivisor
M = D

// check if divident > current divisor              //(c1)

@divident
D = M - D

// initiate divide index
@divIndex
M = 1                                               //(b)
// initiate variable sol for the result
@sol
M = 0

// if divider > divisor (= current divisor)
// skip the current divisor multiplying stage

@DIVIDE_STEP_1                                      //(c2)
D; JLE


(INITIAL_DIVISOR_LOOP)

@divIndex                                           //(d)
M = M<<

@currentDivisor                                     //(e)
M = M<<
D = M

@divident
// D = divident - divisor
D = M - D

@INITIAL_DIVISOR_LOOP
D; JGE

// after the loop, divisor > divident. so, take a step back.
// divisor /= 2
@currentDivisor                                     //(f)
M = M>>

// divindex /= 2
@divIndex                                           //(g)
M = M>>

////-----------------------------------------------------


(DIVIDE_STEP_1)
// if divident >= current divisor
// (else - skip)

@divident
D = M
@currentDivisor
D = D - M
@DIVIDE_STEP_2
D; JLT

//  divident = divident - divisor
@currentDivisor
D = M
@divident
M = M - D

//  sol = sol + divIndex
@divIndex
D = M
@sol
M = M + D

(DIVIDE_STEP_2)

//  if divident < divisor
//  jump to end

@divident
D = M
@divisor
D = D - M
@END
D; JLT

(DIVIDE_STEP_3)

//  if divident < currentDivisor
//      currentDivisor /= 2
//      divIndex /= 2

@divident
D = M
@currentDivisor
D = D - M
@DIVIDE_STEP_1
D; JGE

@currentDivisor
M = M>>
@divIndex
M = M>>

@DIVIDE_STEP_1
0; JMP

(END)

@sol
D = M
@15
M = D