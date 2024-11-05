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
