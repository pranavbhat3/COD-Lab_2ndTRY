# Program: Check Divisibility by 9 in an Array

### Statement: 
This assembly program checks whether each element in an array is divisible by 9. If an element is divisible by 9, it prints "Number Divisible by 9". If an element is not divisible by 9, it prints "Number Not Divisible by 9".

### Name of file:
divisible_by_9_check.s

### Observation - Explanation
- The program loads each element of the array and checks if the number is divisible by 9 by using the remainder operation (`%`).
- It prints a message based on whether the number is divisible by 9 or not.
- The program continues iterating through the array until all elements have been checked.

### Observation - Single Cycle
- **Cycles:** 88 
- **Frequency:** 75.47 Hz 
- **CPI:** 1 
- **IPC:** 1 

### Observation - 5 Stage
- **Cycles:** 141 (example, depends on the actual execution in RIPES)
- **Frequency:** 201.43Hz (example, depends on RIPES configuration)
- **CPI:** 1.6 (example, depends on the pipeline stages)
- **IPC:** 0.624 (example, depends on pipeline utilization)

### Memory Mapping
- **arr:** Array of integers `{5, 8, 12, 18, 22, 27, 30}`
- **msg1:** "Number Divisible by 9\n" (Message printed when the number is divisible by 9)
- **msg2:** "Number Not Divisible by 9\n" (Message printed when the number is not divisible by 9)

### Register Mapping
- **t0:** Holds the address of the current element in the array.
- **t1:** Holds the index of the current array element being checked.
- **t2:** Holds the current array element being checked.
- **t3:** Holds the remainder when dividing the element by 9.
- **t4:** Holds the length of the array (7 in this case).
- **t5:** Holds the divisor value (9) to check divisibility.
- **a0:** Holds the address of the message to be printed ("Number Divisible by 9" or "Number Not Divisible by 9").

### Snapshot
![Screenshot of RIPES window](divisible_by_9_check.png)


# Program: Array Multiplication and Addition (RISC-V Assembly)

### Statement: 
This RISC-V assembly program multiplies corresponding elements from two arrays `a` and `b`, adds the previous element from array `c`, and stores the result in the current element of array `c`. This operation is repeated for 10 iterations.

### Name of file:
C_code_conversion.s`

### Observation - Explanation
- The program initializes arrays `a`, `b`, and `c` with 11 unsigned short integers each. The program then processes 10 iterations of these arrays, starting from `i = 0`.
- In each iteration, the program loads the current elements from arrays `a[i]` and `b[i]`, multiplies them, adds the previous value of `c[i-1]`, and stores the result in `c[i]`.
- The loop continues until all 10 iterations are completed, after which the program exits.

### Observation - Single Cycle
- **Cycles:** 141 
- **Frequency:** 122.29 Hz 
- **CPI:** 1 
- **IPC:**1 

### Observation - 5 Stage
- **Cycles:** 169 
- **Frequency:** 156.05Hz 
- **CPI:** 1.2
- **IPC:** 0.834

### Memory Mapping
- **a:** Array of 11 unsigned short integers `{0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777}`
- **b:** Array of 11 unsigned short integers `{0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777}`
- **c:** Array of 11 unsigned short integers `{0x1234, 0x5678, 0x9ABC, 0xDEF0, 0x1111, 0x2222, 0x3333, 0x4444, 0x5555, 0x6666, 0x7777}`
- **i:** Loop counter, initialized to 0.

### Register Mapping
- **t0:** Holds the loop counter `i`.
- **t1:** Holds the address of the current element in array `a`.
- **t2:** Holds the address of the current element in array `b`.
- **t3:** Holds the address of the current element in array `c`.
- **t4:** Holds the value of `a[i]`.
- **t5:** Holds the value of `b[i]`.
- **t6:** Holds the value of `c[i-1]` (previous value of `c`).
- **t7:** Used temporarily for calculations (if necessary).
- **x20:** Holds the product of `a[i] * b[i]`.
- **x21:** Holds the final result of `a[i] * b[i] + c[i-1]` to be stored in `c[i]`.

### Snapshot
![Screenshot of RIPES window](array_multiplication_addition_riscv.png)
