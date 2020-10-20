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

(INIT)
    @8192   // SCREEN memory map size
    D=A
    @n      // negative iterator
    M=D

    @SCREEN
    D=A     // store base address in D
    @baseaddr
    M=D     // store SCREEN base address in M


(CHECKKBD)
    @KBD
    D=M
    @FILL
    D;JNE   // jump to FILL if a key is pressed
    @BLANK
    0;JEQ   // jump to BLANK if no key is pressed

(FILL)      // fill SCREEN
    @n
    D=M
    @baseaddr
    A=M     // select the memory location
    M=-1    // fill a line with ones (black line)

    @baseaddr
    M=M+1   // base address incremented

    // decreasing iterator
    @n
    MD=M-1

    @FILL
    D;JGT
    @INIT
    0;JMP

(BLANK)     // make SCREEN blank again
    @n
    D=M
    @baseaddr
    A=M     // select the memory location
    M=0     // fill a line with zero(es) (white line)

    @baseaddr
    M=M+1   // base address incremented

    // decreasing iterator
    @n
    MD=M-1

    @BLANK
    D;JGT
    @INIT
    0;JMP

//(END)
//    @INIT
//    0;JMP
