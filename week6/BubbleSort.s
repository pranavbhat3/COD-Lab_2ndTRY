    .data
arr:    .word 29, 10, 14, 37, 13, 55, 32, 27, 8, 42   # Array to be sorted
n:      .word 10                                       # Number of elements in the array
msg:    .asciz "Sorted Array: \n"                       # Message to indicate sorted array

    .text
    .globl _start

_start:
    la      t0, arr            # Load address of array into t0
    la      t1, n              # Load address of the number of elements into t1
    lw      t1, 0(t1)          # Load the value of n into t1 (n = 10)
    li      t2, 0              # Initialize i to 0 (outer loop counter)
    li      t3, 0              # Initialize swapped flag to 0 (no swaps)

bubble_sort_outer:
    li      t3, 0              # Reset swapped flag to 0
    li      t2, 0              # Reset outer loop counter to 0

bubble_sort_inner:
    # Load arr[i] and arr[i+1] into registers
    lw      t4, 0(t0)          # Load arr[i] into t4
    lw      t5, 4(t0)          # Load arr[i+1] into t5

    # Compare arr[i] and arr[i+1]
    blt     t4, t5, no_swap    # If arr[i] < arr[i+1], no swap needed

    # Swap arr[i] and arr[i+1]
    sw      t5, 0(t0)          # Store arr[i+1] in arr[i]
    sw      t4, 4(t0)          # Store arr[i] in arr[i+1]
    li      t3, 1              # Set swapped flag to 1 (swap occurred)

no_swap:
    addi    t0, t0, 4          # Move to the next pair of elements
    addi    t2, t2, 1          # Increment outer loop counter
    blt     t2, t1, bubble_sort_inner # Continue inner loop if i < n-1

    # Check if no swaps were made (if the array is already sorted)
    beq     t3, zero, sorted   # If no swap occurred, array is sorted

    # Reset the array pointer for the next outer loop iteration
    la      t0, arr            # Reset t0 to point to the start of the array
    addi    t2, t2, 1          # Increment outer loop counter
    blt     t2, t1, bubble_sort_outer # Continue outer loop if i < n-1

sorted:
    # Print the sorted array
    la      a0, msg            # Load address of sorted message
    li      a7, 4              # Syscall to print string
    ecall

    la      t0, arr            # Load address of array into t0
    li      t2, 0              # Initialize counter for printing array

print_array:
    lw      a0, 0(t0)          # Load current array element
    li      a7, 1              # Syscall to print integer
    ecall

    addi    t0, t0, 4          # Move to the next element
    addi    t2, t2, 1          # Increment counter
    blt     t2, t1, print_array # Continue printing if i < n

    li      a7, 10             # Syscall to exit
    ecall