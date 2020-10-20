// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// PSEUDO CODE
// n=8192
// addr=SCREEN
// do {
//     RAM[addr]=-1
//     addr = addr + 1
//     n = n - 1
// } while n > 0

(CHECKKBD)
    @KBD
    D=M
    @FILL
    D;JNE   // jump to FILL if a key is pressed
    @CLEAN
    D;JEQ   // jump to CLEAN if no key is pressed

(FILL)      // fill SCREEN
    @LINE
    M=-1
(FILL_LOOP)
    @LINE
    M=M+1  // base address incremented
    D=M
    @SCREEN
    A=A+D
    M=-1    // fill a line with ones (black line)
    @8191
    D=D-A

    @FILL_LOOP
    D;JNE
    @CHECKKBD
    0;JMP

(CLEAN)      // fill SCREEN
    @CLEANLINE
    M=-1
(CLEAN_LOOP)
    @CLEANLINE
    M=M+1  // base address incremented
    D=M
    @SCREEN
    A=A+D
    M=0     // fill a line with ones (black line)
    @8191
    D=D-A

    @CLEAN_LOOP
    D;JNE
    @CHECKKBD
    0;JMP

(END)
    @CHECKKBD
    0;JMP
