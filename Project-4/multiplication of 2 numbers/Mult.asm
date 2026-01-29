// R2 = R1 * R0
/*
 notice that : the ALU is very simple
 so it does not know what's "multiplication"actually is.
*/
// the solution is using "loop".

// initializing the result of our program.
@R2
M=0

// copying R1 to a variable 'i'
// we do this to avoid destroying the original R1 value.
@R2
D=M
@i
M=D

(loop)
    // checking the condition that if "i == 0", go to END.
    @i
    D=M
    @END
    D;JEQ

    // performing Addition R2 = R2 + R0
    @R0
    D=M
    @R2
    M=D+M

    // Decrement the counter by 1.
    @i
    M=M-1

    // loop back to start of loop.
    @loop
    0;JMP
(END)
    // safely terminate the program.
    @END
    0;JMP
