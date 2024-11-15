    .data
arr:    .word 5, 8, 12, 14, 22, 25, 30  # Array of integers
target: .word 22                       # Number to search
msg1:   .asciz "Number Found\n"          # Message for number found
msg2:   .asciz "Number Not Found\n"      # Message for number not found

    .text
    .globl _start

_start:
    la      t0, arr        # Load address of the array into t0
    la      t1, target     # Load address of the target number into t1
    lw      t2, 0(t1)      # Load the target value into t2
    li      t3, 0          # Initialize index counter (i = 0)

search_loop:
    lw      t4, 0(t0)      # Load current element of the array into t4
    beq     t4, t2, number_found # If element matches target, jump to number_found
    addi    t0, t0, 4      # Move to the next element in the array
    addi    t3, t3, 1      # Increment the index counter
    li      t5, 7          # Set the length of the array (7 elements)
    blt     t3, t5, search_loop # If index < array length, continue searching

    la      a0, msg2       # Load message for not found
    j       print_result

number_found:
    la      a0, msg1       # Load message for found

print_result:
    li      a7, 4          # Syscall for print string
    ecall                 # Print result message

    li      a7, 10         # Syscall for exit
    ecall                 # Exit program