    .data
a:  .word 0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777  # Array a
b:  .word 0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777  # Array b
c:  .word 0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777  # Array c
i:  .word 0  # Loop counter

    .text
    .globl _start

_start:
    li      t0, 0           # Initialize i to 0 (t0 = i)
    la      t1, a           # Load address of array a into t1
    la      t2, b           # Load address of array b into t2
    la      t3, c           # Load address of array c into t3

loop:
        addi x10,x0,10
    bge     t0, x10, done   

    # Load a[i], b[i], and c[i-1] into registers
    lw      t4, 0(t1)       # Load a[i] into t4
    lw      t5, 0(t2)       # Load b[i] into t5
    lw      t6, -4(t3)      # Load c[i-1] into t6 (previous c value)

    # Calculate a[i] * b[i]
    mul x20, t4, t5      

    # Add c[i-1] to the result
    add     x21, x20, t6     
    # Store the result back into c[i]
    sw      x21, 0(t3)       

    # Increment pointers for arrays and loop counter
    addi    t0, t0, 1       # Increment i (t0 = t0 + 1)
    addi    t1, t1, 4       # Move to the next element in array a
    addi    t2, t2, 4       # Move to the next element in array b
    addi    t3, t3, 4       # Move to the next element in array c

    j       loop            # Repeat the loop

done:
    li      a7, 10          # Syscall for exit
    ecall                   # Exit program