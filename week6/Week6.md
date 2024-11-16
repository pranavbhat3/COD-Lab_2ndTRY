# Program: Bubble Sort Algorithm in Assembly (RISC-V)

### Statement:
This RISC-V assembly program implements the bubble sort algorithm to sort an array of `N` elements in ascending order. The array is sorted in place, and the sorted array is printed at the end.

### Name of file:
`bubble_sort_riscv.s`

### Observation - Explanation
- The program uses bubble sort, which repeatedly compares adjacent elements of the array and swaps them if they are in the wrong order. This process is repeated until no swaps are needed, indicating the array is sorted.
- The program sorts the array of integers `{29, 10, 14, 37, 13, 55, 32, 27, 8, 42}`. The number of elements (`N = 10`) is stored in memory, and the sorting operation is performed on this array.
- The sorted array is printed after the sorting process.

### Observation - Single Cycle
- **Cycles:** 167
- **Frequency:** 215.76Hz (example based on simulator configuration)
- **CPI:** 1 (depends on instruction mix, could be reduced with optimized code)
- **IPC:** 1 (example based on execution efficiency)

### Observation - 5 Stage
- **Cycles:** 245 
- **Frequency:** 264.29Hz
- **CPI:** 1.47
- **IPC:** 0.682

### Memory Mapping
- **arr:** Array of integers `{29, 10, 14, 37, 13, 55, 32, 27, 8, 42}`
- **n:** Integer `10` (number of elements in the array)

### Register Mapping
- **t0:** Holds the address of the array.
- **t1:** Holds the value of `n` (number of elements).
- **t2:** Outer loop counter (`i`), iterating over the elements.
- **t3:** Flag to indicate if a swap was made.
- **t4:** Holds the value of `arr[i]`.
- **t5:** Holds the value of `arr[i+1]`.
- **a0:** Used to load and print values (such as array elements and messages).
- **a7:** Holds the system call number for printing integers or strings.

### Snapshot
![Screenshot of RIPES window](bubble_sort_riscv.png)

# Program 3: 
### Statement: Write a RISC-V assembly program to multiply two matrices of dimensions \(N \times M\) and \(M \times P\), storing the result in an \(N \times P\) matrix.

### Name of file:
`matrix_multiplication.s`

### Observation - Explanation
- The program initializes two matrices (`matrix1` and `matrix2`) in memory, and reserves space for the resultant matrix (`result`).
- Nested loops iterate through the rows of the first matrix and columns of the second matrix, performing element-wise multiplication and summation for each position in the resultant matrix.
- The computed values are stored in the memory reserved for the resultant matrix.

### Observation - Single Cycle
- **Cycles:** 141
- **Frequency:** 91.74Hz
- **CPI:** 1
- **IPC:** 1

### Observation - 5 Stage
- **Cycles:** 169
- **Frequency:** 172.27
- **CPI:** 1.2
- **IPC:** 0.834

### Memory Mapping
- **matrix1:** Address: `0x10000000`, Values: `[1, 2, 3, 4]`
- **matrix2:** Address: `0x10000010`, Values: `[5, 6, 7, 8]`
- **result:** Address: `0x10000020`, Values: `0xa5b56212`

### Register Mapping
- **t0:** Stores the number of rows in matrix1.
- **t1:** Stores the number of columns in matrix1 (also rows in matrix2).
- **t2:** Stores the number of columns in matrix2.
- **t3:** Base address of matrix1.
- **t4:** Base address of matrix2.
- **t5:** Base address of the result matrix.
- **s0, s1, s2:** Loop counters and accumulators.

### Snapshot
![Screenshot of RIPES window](program1.png)

# Program 2a: Factorial of a Number (Without Recursion)

### Statement:
This RISC-V assembly program calculates the factorial of a given number iteratively.

### Name of file:
`factorial_no_recursion.s`

### Observation - Explanation
- The program prompts the user to input a number. In RIPES, this input is simulated and loaded into register `a0` (in this case, 5).
- The factorial calculation is performed in a loop. The result is stored in register `a1`, and the loop multiplies the result by the current number (`a0`) and decrements `a0` until it reaches 0.
- After calculating the factorial, the result is printed, and the program exits.

### Observation - Single Cycle
- **Cycles:** 41
- **Frequency:** 42.66
- **CPI:** 1
- **IPC:** 1

### Observation - 5 Stage
- **Cycles:** 65
- **Frequency:** 64.04Hz
- **CPI:** 1.59
- **IPC:** 0.631 

### Memory Mapping
- **Register a0 (input number):** 5
- **Register a1 (accumulated result):** 120 (for factorial of 5)

### Register Mapping
- **Register a0 (input):** 5
- **Register a1 (result):** 120

### Snapshot
![Screenshot of RIPES window](factorial_no_recursion.png)





