.data
array: .half 1, 2, 3, 4, 5    # Example array of half-words (2 bytes each)
n:     .word 5               # Number of elements in the array

.text
.globl _start
_start:
    la t0, array             # Load address of the array into t0
    lw t1, n                 # Load the number of elements into t1
    li t2, 0                 # Initialize sum to 0

add_half_words:
    beq t1, x0, end_addition # Exit loop when count (t1) reaches 0
    lh t3, 0(t0)             # Load the current half-word into t3
    add t2, t2, t3           # Add t3 to sum (t2)
    addi t0, t0, 2           # Increment the address pointer (half-word size)
    addi t1, t1, -1          # Decrement the counter
    j add_half_words         # Jump back to loop

end_addition:
    # Result is in t2
    li a7, 10                # Exit the program
    ecall