.global _start
_start:
	LDR R0, =15        @ Load R0 with the valuue 15 (a)
    LDR R1, =4         @ Load R1 with the value 4 (b)
    
    MOV R2, #0         @ Initialize R2 to 0 (used as a counter)
    MOV R3, R1         @ Copy the value of R1 into R3 (backup of the original value of R1)

Loop:
    CMP R1, R0         @ Compare R1 with R0
    BHI Exit           @ If R1 is greater than R0, branch to Exit
    ADD R2, R2, #1     @ Increment R2 by 1
    ADD R1, R1, R3     @ Add the original value of R1 (stored in R3) to R1
    B Loop             @ Unconditionally branch back to Loop

Exit:
    MOV R0, R2         @ Move the final count from R2 into R0 (output the result)

	
