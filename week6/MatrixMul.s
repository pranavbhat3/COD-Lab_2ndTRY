.data
matrix1:   .word 1, 2, 3, 4      # Matrix 1 (2x2)
matrix2:   .word 5, 6, 7, 8      # Matrix 2 (2x2)
result:    .zero 16              # Reserve 16 bytes for Resultant Matrix (2x2)

.text
.global _start
_start:
    # Initialize matrix dimensions
    li t0, 2         # Rows of Matrix1 (N)
    li t1, 2         # Columns of Matrix1 / Rows of Matrix2 (M)
    li t2, 2         # Columns of Matrix2 (P)

    # Base addresses for matrices
    la t3, matrix1   # Address of Matrix1
    la t4, matrix2   # Address of Matrix2
    la t5, result    # Address of Resultant Matrix

    # Outer loop: Rows of Matrix1
    li s0, 0         # Row counter (i = 0)
row_loop:
    bge s0, t0, end  # Exit if i >= N

    # Middle loop: Columns of Matrix2
    li s1, 0         # Column counter (j = 0)
col_loop:
    bge s1, t2, next_row  # Exit if j >= P

    # Reset accumulator for result[i][j]
    li s2, 0         # Accumulator (sum = 0)

    # Inner loop: Columns of Matrix1 / Rows of Matrix2
    li s3, 0         # Element counter (k = 0)
element_loop:
    bge s3, t1, store_result  # Exit if k >= M

    # Calculate matrix1[i][k] * matrix2[k][j]
    mul s4, s0, t1         # s4 = i * M (row offset for Matrix1)
    add s4, s4, s3         # s4 = i * M + k
    slli s4, s4, 2         # s4 = (i * M + k) * 4 (byte offset)
    add s5, t3, s4         # Address of matrix1[i][k]
    lw s6, 0(s5)           # Load matrix1[i][k]

    mul s7, s3, t2         # s7 = k * P (row offset for Matrix2)
    add s7, s7, s1         # s7 = k * P + j
    slli s7, s7, 2         # s7 = (k * P + j) * 4 (byte offset)
    add s8, t4, s7         # Address of matrix2[k][j]
    lw s9, 0(s8)           # Load matrix2[k][j]

    mul s10, s6, s9        # Multiply matrix1[i][k] * matrix2[k][j]
    add s2, s2, s10        # Accumulate sum

    addi s3, s3, 1         # k++
    j element_loop

store_result:
    mul s4, s0, t2         # s4 = i * P (row offset for Result)
    add s4, s4, s1         # s4 = i * P + j
    slli s4, s4, 2         # s4 = (i * P + j) * 4 (byte offset)
    add s5, t5, s4         # Address of result[i][j]
    sw s2, 0(s5)           # Store result[i][j]

    addi s1, s1, 1         # j++
    j col_loop

next_row:
    addi s0, s0, 1         # i++
    j row_loop

end:
    # Exit program (loop indefinitely)
    j end