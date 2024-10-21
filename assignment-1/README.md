# **Sales Calculator in ARM32 Assembly**

## **CSCI-6461 - Assignment #1 (10%)**

### **Author**: Kamran Hajili  
### **Due Date**: October 21st, 2024

---

## **Project Overview**

This project implements a **Sales Calculator** in **ARM32 assembly**. The program processes sales data collected over 5 days, with each day containing a variable number of sales ending with a `0` to mark the end. The program performs the following calculations:

1. **Total Sales**: Sum of all sales across the 5 days.
2. **Maximum Sale**: The highest sale value from all the days.
3. **Minimum Sale**: The lowest sale value from all the days.
4. **Average Sales**: The total sales divided by 5, to represent the average sales per day.

---

## **Techniques Used**

### **1. Data Representation**

Sales data is represented in arrays, with each day’s sales data ending with a `0` to mark the end of the array. This is a simple way to handle variable-length arrays in assembly, where there’s no native support for higher-level data structures.

- **Reasoning**: Using `0` as a sentinel value allowed for easy detection of the end of each day's sales data. This technique is simple but effective in environments with limited data handling capabilities, such as ARM32 assembly.

### **2. Looping and Processing Data**

The program processes each day's sales data using a loop. Each sale is loaded and processed, and the loop continues until a `0` is encountered, signaling the end of the day's data.

- **Reasoning**: Looping allows us to process each sale individually, adding it to the total sales and comparing it against the current maximum and minimum sales. This approach ensures that the program handles variable-length data while maintaining flexibility in the number of sales per day.

### **3. Use of Conditional Execution**

ARM assembly supports **conditional execution** of instructions based on the results of comparisons. For this project, we used conditions like:

- **`BLE`** (branch if less or equal) to update the maximum sale if the current sale is larger.
- **`BHS`** (branch if higher or same) to update the minimum sale if the current sale is smaller.
- **`BEQ`** (branch if equal) to detect the end of the data (when the value `0` is encountered).

- **Reasoning**: Conditional execution optimizes the program by reducing unnecessary operations. It ensures that we only update the maximum and minimum sales when necessary, which makes the program more efficient.

### **4. Storing Results in Memory**

The program uses the **`STR`** instruction to store results in memory, instead of keeping them in registers. This includes the `total_sales`, `max_sales`, `min_sales`, and `avg_sales` values.

- **Reasoning**: ARM assembly encourages the use of memory for storing persistent results, especially when dealing with larger data sets that might exceed the number of available registers. Using `STR` ensures that results are available in memory and can be accessed later, even after the registers have been repurposed.

### **5. Handling Division Without `UDIV` Instruction**

ARM Cortex-A9 processors do not support the `UDIV` (unsigned division) instruction. To calculate the average sales, I initially tried fixed-point multiplication, which caused precision issues. I then implemented a **loop-based division** where the total sales are repeatedly subtracted by 5, counting the number of subtractions to determine the quotient.

- **Reasoning**: This manual division method ensures accurate results without relying on processor-specific features that may not be supported, such as `UDIV`. It allows the program to work on a wide range of ARM architectures.

### **6. Managing Signed and Unsigned Comparisons**

Initially, signed comparisons (`BGE`) were causing issues when calculating the minimum sales because the `min_sales` was initialized to `0xFFFFFFFF`. This value is `-1` when interpreted as a signed integer, causing incorrect results.

To resolve this, I used **unsigned comparisons** with **`BHS`** (branch if higher or same), ensuring that the program treats the sales data as unsigned integers.

- **Reasoning**: ARM assembly differentiates between signed and unsigned comparisons, so switching to unsigned comparisons ensured that the `min_sales` value was correctly updated.

---

## **Challenges and Solutions**

### **1. Division Without UDIV**

- **Challenge**: The ARM Cortex-A9 processor does not support the `UDIV` instruction for division.
- **Solution**: I used a loop-based division method, where total sales are repeatedly subtracted by 5, and the number of subtractions is counted to calculate the average sales.

  **GPT-4** was used to suggest and refine the loop-based division method as an alternative to fixed-point arithmetic.

### **2. Handling Signed vs. Unsigned Values**

- **Challenge**: The `min_sales` value was incorrectly calculated due to the signed comparison used initially.
- **Solution**: I switched to unsigned comparisons using `BHS`, which treats the values as unsigned and corrected the `min_sales` calculation.

  **GPT-4** helped identify the issue with signed vs. unsigned comparisons and provided the solution using unsigned branch instructions.

### **3. Optimizing Performance with Conditional Execution**

- **Challenge**: The program needed to efficiently update the max and min sales without unnecessary instructions.
- **Solution**: Conditional execution (`BLE`, `BHS`) was used to ensure that the program only updates values when needed, making the program more efficient.

  This solution was derived from studying **ARM Conditional Execution Documentation**.

---

## **References**

- [ARM32 Instruction Set Documentation](https://developer.arm.com/documentation/ddi0337/e)
- [ARM Conditional Execution Guide](https://community.arm.com/arm-community-blogs/b/tools-software-ides-blog/posts/conditional-execution-in-armv7-m)
- **GPT-4o**: Assisted with debugging, loop-based division logic, and signed/unsigned comparison issues.

---

## **Conclusion**

This project demonstrates the fundamentals of ARM32 assembly programming, including handling memory, conditional execution, and overcoming the limitations of division without hardware support. The challenges encountered, such as working around the lack of division support and handling signed vs. unsigned values, were resolved using a combination of ARM documentation and GPT-4 suggestions.

The final program meets the project requirements, calculates the required sales values, and optimizes performance using conditional execution and memory storage techniques.
