// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

// SCREEN = 16384
// KBD = 24576
// Screen Resolution is 256x512 (HxW)
// Whenever a key is pressed on the physical keyboard, its 16-bit ASCII code appears in RAM[24576].

// 8192 ADDRESSES

// GAME PLAN

// i = 16384
// (START)
// RAM[I] = 0
// JMP TO INCREMENT IF RAM[KBD] == 0
// RAM[I] = -1
// (INCREMENT)
// i += 1
// JMP TO START if i < 24576
// i = 16384
// JMP to START

@SCREEN
D=A
@i
M=D
@i
M=D // i = 16384
(START)

// Jump if keyboard off
@KBD
D=M
@PIXELOFF
D;JEQ

// Turn pixels ON
@i
A=M
M=-1
@INCREMENT
0;JMP

(PIXELOFF)
// Turn pixels OFF
@i
A=M
M=0

(INCREMENT)


// Increment to the next pixel
@i
M=M+1

// if i < 24576, JUMP TO 16384
@i
D=M
@24576
D=D-A
@START
D;JLT

// Restart i to start of screen
@SCREEN
D=A
@i
M=D

// Jump to start
@START
0;JMP
