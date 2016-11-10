@13
D = M
@divident
M = D
    // initiate variable divisor (ram[14])
@14
D = M
@divisor
M = D
    // initiate variable currentDivisor
@currentDivisor
M = D

// check if divident > current divisor

@divident
D = M - D

// initiate divide index
@divIndex
M = 1
// initiate variable sol for the result
@sol
M = 0

// if divider > divisor (= current divisor)
// skip the current divisor multiplying stage

@DIVIDE_STEP_1
D; JLE


(INITIAL_DIVISOR_LOOP)

@divIndex
M = M<<

@currentDivisor
M = M<<
D = M

@divident
// D = divident - divisor
D = M - D

@INITIAL_DIVISOR_LOOP
D; JGE

// after the loop, divisor > divident. so, take a step back.
// divisor /= 2
@currentDivisor
M = M>>

// divindex /= 2
@divIndex
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