.data
number:    .word 5          # Input number for factorial
result:    .word 1          # Result initialized to 1

.text
.global _start
_start:
    # Load the input number
    la t0, number           # Load address of 'number'
    lw t1, 0(t0)            # Load value of 'number' into t1

    # Initialize result
    la t2, result           # Load address of 'result'
    li t3, 1                # Initialize t3 (result = 1)

factorial_loop:
    beqz t1, done           # If t1 == 0, exit loop
    mul t3, t3, t1          # result *= t1
    addi t1, t1, -1         # t1 = t1 - 1
    j factorial_loop        # Repeat loop

done:
    sw t3, 0(t2)            # Store result in memory
    j done                  # Infinite loop to end program