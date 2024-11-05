# Assignment 2: ARM Assembly Code

## Introduction
The file `assembly_code.s` contains the ARM assembly translation (and commennts) of the provided machine code. 

## Goal of the Code
The program is designed to take two positive integers, `a` and `b`, from registers `R0` and `R1`, respectively. It counts how many times `b` can be added to itself until the result exceeds `a`. The final count is then stored in `R0` as the output.

## Conversion Process
To convert the given machine code to assembly, I followed these steps:
## Conversion Process
- First, I broke down each 32-bit piece of machine code to figure out what the opcode and operands were.
- Then, I grabbed an ARM assembly guide to find the matching assembly instructions for those opcodes.
- Finally, I went back and checked to make sure the assembly code matched the original machine code’s logic perfectly.

## Examples of Instruction Breakdown
### 1. Simple Instruction
- **Machine Code**: `0xE3A02000`
- **Assembly Instruction**: `MOV R2, #0`
- **Explanation**: This instruction moves the immediate value `0` into register `R2`. The `E3A` part specifies the `MOV` operation, `2` indicates the destination register `R2`, and `0000` is the immediate value `0`. This is used to initialize `R2` as a counter.

### 2. Branch Instruction
- **Machine Code**: `0x8A000002`
- **Assembly Instruction**: `BHI 0x00008020`
- **Explanation**: This is a conditional branch instruction. `8A` indicates a branch if higher (`BHI`), meaning the program will jump to address `0x00008020` if `R1` is greater than `R0`. The `0002` part specifies the offset for the branch.

## Sources and References
- **ARM Architecture Reference Manual for ARMv7-A and ARMv7-R**:
  - **Pages ~325-350**: Covers data processing instructions like `MOV`, `ADD`, and `CMP`.
  - **Pages ~400-420**: Explains branch and control instructions, including conditional branches like `BHI`.
- **Chapter A7: Thumb Instructions**:
  - This chapter describes the syntax and usage of every Thumb instruction.
  - **Alphabetical list of Thumb instructions**: See page A7-2
  - **Thumb instructions and architecture versions**: See page A7-104
- ARM assembly guides for understanding opcodes and instruction formats.

For more details, check the comments within `assembly_code.s`.

---

Feel free to explore the code and let me know if you have any questions or feedback!
