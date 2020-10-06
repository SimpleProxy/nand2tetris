// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// compara os 2 numeros e
// usa o menor como multiplicador do maior
// depois, em um loop, faz a multiplicacao

(SETR2)
    @R2
    M=0

(COMPARE)   // compare R0 and R1
    @R0
    D=M
    @R1
    D=D-M   // R0 - R1
    @SWAP
    D;JGT   // swap if R0 - R1 > 0
    @LOOP
    0;JMP   // otherwise multiply

(SWAP)      // in case R0 > R1
    @R0
    D=M     // retrieve R0 value
    @swapmen
    M=D     // store R0 in a temp mem

    @R1
    D=M     // retrive R1 value
    @R0
    M=D     // store R1 value in R0

    @swapmen
    D=M     // retrieve R0 inital valeu
    @R1
    M=D     // store R0 value in R1

(LOOP)      // multiplication loop
    @R0
    D=M
    @END
    D;JEQ   // jump to END if R0 = 0

    @R2
    D=M
    @R1
    D=D+M
    @R2
    M=D
    @R0
    M=M-1
    @LOOP
    0;JMP   // goto the to of the loop

(END)
    @END
    0;JMP
