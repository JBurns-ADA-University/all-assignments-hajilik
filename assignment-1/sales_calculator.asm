    .data
    // Sales data for 5 days, each ending with a 0
    day1:   .word  10, 20, 30, 0     // Sales for Day 1
    day2:   .word  15, 25, 35, 0     // Sales for Day 2
    day3:   .word  20, 30, 40, 0     // Sales for Day 3
    day4:   .word  5, 10, 15, 0      // Sales for Day 4
    day5:   .word  25, 50, 0         // Sales for Day 5

    // Memory locations to store results
    total_sales: .word 0             // Total sales for all days
    max_sales:   .word 0             // Max sale value
    min_sales:   .word 0xFFFFFFFF    // Min sale value (set to large value initially)
    avg_sales:   .word 0             // Average sales

    .text
    .global _start

_start:
    // Load the addresses of each day's sales data into registers R0-R4
    LDR R0, =day1                    // Load address of Day 1 sales into R0
    LDR R1, =day2                    // Load address of Day 2 sales into R1
    LDR R2, =day3                    // Load address of Day 3 sales into R2
    LDR R3, =day4                    // Load address of Day 4 sales into R3
    LDR R4, =day5                    // Load address of Day 5 sales into R4

    // Initialize total sales (R5) and load the memory locations of max and min sales
    MOV R5, #0                       // R5 will store the total sales
    LDR R6, =max_sales               // Load the address of max sales into R6
    LDR R7, =min_sales               // Load the address of min sales into R7

    // --------------------
    // Process Day 1 Sales
    // --------------------
day1_loop:
    LDR R8, [R0], #4                 // Load the next sale from Day 1, increment pointer
    CMP R8, #0                       // Check if we reached the end of Day 1
    BEQ day2_start                   // If end of Day 1 (value is 0), move to Day 2

    ADD R5, R5, R8                   // Add current sale to total sales

    // Max Sales Calculation
    LDR R9, [R6]                     // Load current max sales
    CMP R8, R9                       // Compare current sale to max sales
    BLE skip_max                     // If current sale <= max sales, skip updating max
    STR R8, [R6]                     // Update max sales if current sale > max sales
skip_max:

    // Min Sales Calculation
    LDR R9, [R7]                     // Load current min sales
    CMP R8, R9                       // Compare current sale to min sales
    BHS skip_min                     // If current sale >= min sales, skip updating min
    STR R8, [R7]                     // Update min sales if current sale < min sales
skip_min:

    B day1_loop                      // Repeat for next sale in Day 1

    // --------------------
    // Process Day 2 Sales
    // --------------------
day2_start:
    LDR R8, [R1], #4                 // Load the next sale from Day 2
    CMP R8, #0                       // Check if we reached the end of Day 2
    BEQ day3_start                   // If end of Day 2, move to Day 3

    ADD R5, R5, R8                   // Add current sale to total sales

    // Max Sales Calculation
    LDR R9, [R6]                     // Load current max sales
    CMP R8, R9
    BLE skip_max2
    STR R8, [R6]                     // Update max sales if current sale > max sales
skip_max2:

    // Min Sales Calculation
    LDR R9, [R7]                     // Load current min sales
    CMP R8, R9
    BHS skip_min2
    STR R8, [R7]                     // Update min sales if current sale < min sales
skip_min2:

    B day2_start                     // Repeat for next sale in Day 2

    // --------------------
    // Process Day 3 Sales
    // --------------------
day3_start:
    LDR R8, [R2], #4                 // Load the next sale from Day 3
    CMP R8, #0                       // Check if we reached the end of Day 3
    BEQ day4_start                   // If end of Day 3, move to Day 4

    ADD R5, R5, R8                   // Add current sale to total sales

    // Max Sales Calculation
    LDR R9, [R6]                     // Load current max sales
    CMP R8, R9
    BLE skip_max3
    STR R8, [R6]                     // Update max sales if current sale > max sales
skip_max3:

    // Min Sales Calculation
    LDR R9, [R7]                     // Load current min sales
    CMP R8, R9
    BHS skip_min3
    STR R8, [R7]                     // Update min sales if current sale < min sales
skip_min3:

    B day3_start                     // Repeat for next sale in Day 3

    // --------------------
    // Process Day 4 Sales
    // --------------------
day4_start:
    LDR R8, [R3], #4                 // Load the next sale from Day 4
    CMP R8, #0                       // Check if we reached the end of Day 4
    BEQ day5_start                   // If end of Day 4, move to Day 5

    ADD R5, R5, R8                   // Add current sale to total sales

    // Max Sales Calculation
    LDR R9, [R6]                     // Load current max sales
    CMP R8, R9
    BLE skip_max4
    STR R8, [R6]                     // Update max sales if current sale > max sales
skip_max4:

    // Min Sales Calculation
    LDR R9, [R7]                     // Load current min sales
    CMP R8, R9
    BHS skip_min4
    STR R8, [R7]                     // Update min sales if current sale < min sales
skip_min4:

    B day4_start                     // Repeat for next sale in Day 4

    // --------------------
    // Process Day 5 Sales
    // --------------------
day5_start:
    LDR R8, [R4], #4                 // Load the next sale from Day 5
    CMP R8, #0                       // Check if we reached the end of Day 5
    BEQ done                         // If end of Day 5, move to done

    ADD R5, R5, R8                   // Add current sale to total sales

    // Max Sales Calculation
    LDR R9, [R6]                     // Load current max sales
    CMP R8, R9
    BLE skip_max5
    STR R8, [R6]                     // Update max sales if current sale > max sales
skip_max5:

    // Min Sales Calculation
    LDR R9, [R7]                     // Load current min sales
    CMP R8, R9
    BHS skip_min5
    STR R8, [R7]                     // Update min sales if current sale < min sales
skip_min5:

    B day5_start                     // Repeat for next sale in Day 5

    // --------------------
    // Final Processing
    // --------------------
done:
    // Store total sales in memory
    LDR R8, =total_sales             // Load the address of total_sales
    STR R5, [R8]                     // Store total sales in memory

    // Calculate average sales by dividing total sales by 5 using loop-based division
    MOV R9, #5                       // Set divisor (5) into R9
    MOV R10, #0                      // Initialize quotient (average sales) in R10
avg_div_loop:
    CMP R5, R9                       // Compare total sales with 5
    BLT avg_done                     // If total sales < 5, exit loop
    SUB R5, R5, R9                   // Subtract 5 from total sales
    ADD R10, R10, #1                 // Increment quotient (average sales)
    B avg_div_loop                   // Repeat division until total sales < 5
avg_done:
    LDR R8, =avg_sales               // Load the address of avg_sales
    STR R10, [R8]                    // Store average sales in memory

    // Exit the program using system call
    MOV R7, #1                       // System call number for exit
    SVC #0                           // Trigger system call to exit
