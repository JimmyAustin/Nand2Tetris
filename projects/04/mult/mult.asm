// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//// Replace this comment with your code.

// r[2] == 0
@2
M=0
@0
D=M
@END
D;JEQ // Jump to @DEST if ram[0] > 0
(DEST)
@1 
D=M // D = ram[1]
@2
M=M+D // ram[2] = ram[2] + D
@0
M=M-1 // ram[0] = ram[0] - 1
D=M // D = ram[0]
@DEST
D;JGT // Jump to @DEST if ram[0] > 0
(END)
@END
0;JMP // Infinite loop

// r[2] += r[1]
// r[0] -= 1
// IF R[0] > 0; JUMP TO DEST
// @END
// 0;JMP

// for (int i = 0; i < R0; i++) {
//   R2 = R2 + R1   
// }
// LOOPFOREVER