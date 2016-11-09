// Divide.asm



@13
D = M
@divident
M = D

@14
D = M
@divisor
M = D

@currentDivisor
M = D

// check if divident > current divisor

@divident
D = M - D


@divIndex
M = 1

@sol
M = 0

@DIVIDE
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
@currentDivisor
M = M>>

@divIndex
M = M>>

////-----------------------------------------------------

    // while divident > 0
    // {
    // (STEPA) = (DIVIDE)
    //      if divident >= currentDivisor       (0)
    //          divident -= currentDivisor      (1)
    //          sol += index                    (2)
    // (STEPB)
    //      if divident < currentDivisor
    //          currentDivisor /= 2             (3)
    //          index /= 2                      (3.5)
    // (STEPC)
    //      if divident - divisor < 0
    //          finish                          (4)
    // }

(DIVIDE)

@divident
D = M
@currentDivisor
D = D - M
@STEPB
D; JLT

@divident
M = D                   // (1)
@divIndex
D = M
@sol
M = M + D               //  (2)

(STEPB)

@divident
D = M
@currentDivisor
D = D - M

@STEPC
D; JGE

@currentDivisor
M = M>>                 //  (3)

@divIndex
M = M>>                 //  (3.5)

@divident
D = M
@divisor
D = D - M
@END
D, JLE                  //  (4)

@DIVIDE
0, JMP



(END)
@sol
D = M
@15
M = D
