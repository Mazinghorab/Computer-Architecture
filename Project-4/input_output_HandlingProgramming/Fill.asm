/*
 Runs an infinite loop that listens to the keyboard input. 
 When a key is pressed (any key), the program blackens the screen,
 i.e. writes "black" in every pixel. When no key is pressed, 
 the screen should be cleared.
*/

(RESTART)
    @SCREEN
    D=A
    @addr
    M=D  // addr = 16384 (Screen base address)

    @8192
    D=A
    @n
    M=D  // n = 8192 (Number of registers to fill)

    // KBD: specific memory address
    @KBD 
    D=M
    @BLACK
    D;JGT  // If KBD > 0 (Key pressed), goto BLACK

    @WHITE
    0;JMP  // Else, goto WHITE

(BLACK)
    @val
    M=-1  // val = 1111111111111111 (Black)
    @DRAW
    0;JMP

(WHITE)
    @val
    M=0  // val = 0000000000000000 (White)
    @DRAW
    0;JMP

(DRAW)
    // Check if we are done (n == 0)
    @n
    D=M
    @RESTART
    D;JEQ  // If n == 0, go back to start to check KBD again

    // Write 'val' to RAM[addr]
    @val
    D=M  // Load the color (-1 or 0)
    @addr
    A=M  // select the address stored in 'addr'
    M=D  // color the pixel

    // Increment address, Decrement counter
    @addr
    M=M+1  // Next screen register
    @n
    M=M-1  // One less register to do

    @DRAW
    0;JMP  // Repeat loop