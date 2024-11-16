# Program 1: Addition of N Words

### Statement:
This program calculates the sum of N words (32-bit integers) stored in an array.

### Name of file:
`add_words.s`

### Observation - Explanation
- The program iterates through an array of 32-bit words, adding each element to a running total.
- It uses a loop controlled by a counter to traverse the array, updating the address and counter in each iteration.
- The result is stored in the `t2` register.

Documentation for All Remaining Programs

# Program 2: Addition of N Half Words

### Statement:
This program calculates the sum of N half-words (16-bit integers) stored in an array.

### Name of file:
`add_half_words.s`

### Observation - Explanation
- The program iterates through an array of half-words, adding each element to a running total.
- It uses a loop controlled by a counter to traverse the array, updating the address and counter in each iteration.
- The result is stored in the `t2` register.

# Program 3: Addition of N Bytes

### Statement:
This program calculates the sum of N bytes (8-bit integers) stored in an array.

### Name of file:
`add_bytes.s`

### Observation - Explanation
- The program iterates through an array of bytes, adding each element to a running total.
- It uses a loop controlled by a counter to traverse the array, updating the address and counter in each iteration.
- The result is stored in the `t2` register.

# Program 4: Calculation of x = (y + m) - (L - D) + (Z + C) - D

### Statement:
This program calculates the value of \(x = (y + m) - (L - D) + (Z + C) - D\), where x, y, m, L, D, Z, and C are 32-bit integers.

### Name of file:
`calculate_expression.s`

### Observation - Explanation
- The program loads values for y, m, L, D, Z, and C from memory into registers.
- It performs the arithmetic operations step-by-step, maintaining intermediate results in registers.
- The final result is stored in memory at the location of x.
