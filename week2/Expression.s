.data
y: .word 10
m: .word 5
L: .word 20
D: .word 7
Z: .word 15
C: .word 8
x: .word 0

.text

    lw t0, y                # Load y into t0
    lw t1, m                # Load m into t1
    lw t2, L                # Load L into t2
    lw t3, D                # Load D into t3
    lw t4, Z                # Load Z into t4
    lw t5, C                # Load C into t5

    add t6, t0, t1          # t6 = y + m
    sub x31, t2, t3          # Reuse t7 = L - D
    add t6, t6, t4          # Add Z to t6
    add t6, t6, t5          # Add C to t6
    sub t6, t6, t3          # Subtract D from t6
    la x31,x
    sw t6, 0(x31)               # Store result in x
    li a7, 10               # Exit the program
    