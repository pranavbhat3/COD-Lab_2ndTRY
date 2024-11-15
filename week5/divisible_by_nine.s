    .data
arr:    .word 5, 8, 12, 18, 22, 27, 30  # Array of integers
msg1:   .asciz "Number Divisible by 9\n" # Message for number divisible by 9
msg2:   .asciz "Number Not Divisible by 9\n" # Message for number not divisible by 9

    .text
    .globl _start

_start:
    la      t0, arr        # Load address of the array into t0
    li      t1, 0       
    addi t5,t5,9   # Initialize index counter (i = 0)

check_divisibility:
    lw      t2, 0(t0)      # Load current element of the array into t2
    rem     t3, t2, t5      
    beq     t3, zero, divisible # If remainder is zero, the number is divisible by 9
    la      a0, msg2       # Load message for not divisible by 9
    j       print_result

divisible:
    la      a0, msg1       # Load message for divisible by 9

print_result:
    li      a7, 4          # Syscall for print string
    ecall                 # Print result message

    addi    t0, t0, 4      # Move to the next element in the array
    addi    t1, t1, 1      # Increment the index counter
    li      t4, 7          # Set the length of the array (7 elements)
    blt     t1, t4, check_divisibility # If index < array length, continue checking

    li      a7, 10         # Syscall for exit
    ecall                 # Exit program