# Assignment 2: High-Level C Code

## Overview
This part of the assignment focuses on reverse engineering the ARM assembly code into a high-level C program. The goal is to create a C program that replicates the logic of the assembly code as closely as possible, ensuring that the compiled output behaves similarly.

## Approach
1. I carefully analyzed the ARM assembly instructions to understand the logic and flow of the program.
2. Using this understanding, I wrote a C function that mirrors the behavior of the assembly code, using loops and arithmetic operations as needed.
3. The main program uses this function to process input values and output the result.

## C Code
The C code is structured to use functions for clarity and modularity. Here’s the general outline, you can also check it in high_level_code.c:
```c
#include <stdio.h>

int calculateIterations(int a, int b) {
    int count = 0;  // Initialize counter
    int originalB = b;  // Store the original value of b

    while (b <= a) {  // Loop until b is greater than a
        count++;  // Increment the counter
        b += originalB;  // Add the original value of b to b
    }

    return count;  // Return the final count
}

int main() {
    int a = 15;  // Example input for a
    int b = 4;   // Example input for b

    int result = calculateIterations(a, b);
    printf("Result: %d\n", result);  // Output the result

    return 0;
}
