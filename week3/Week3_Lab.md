# Program 1: 
### Statement: Convert a 32-bit value from Little Endian to Big Endian format using RISC-V assembly
### Name of file:
Week3Lab.s

### Observation - Single Cycle
Use the operation of AND to seperate out 2 bytes at a time
shift it with the calculated offset and then shift it to the left by that ammount
Finally add the contents in all registers to obtain the converted value
 
### Observation - Single Cycle
- **Cycles:** 17
- **Frequency:** 10.29Hz
- **CPI:** 1
- **IPC:** 1

### Observation - 5 Stage
- **Cycles:** 22
- **Frequency:** 8.56Hz
- **CPI:** 1.29
- **IPC:** 0.773

 
### Register Mapping
- **x11:** 0x12345678
- **x12:** 0x78563412
- **x13:** 0x00560000
- **x14:** 0x00003400
- **x15:** 0x00000012

### Data Mapping
- **0x10000000:** 0x12345678
- **0x10000008:** 0x78563412



# Program 2: 
### Statement: Write an assembly program to encode a number using Hamming Code (7,4).

### Name of file:
Hamming_Code.s

### Observation - Explanation
- The program takes a 4-bit input number and extracts its individual bits \(d_1, d_2, d_3, d_4\).
- It calculates three parity bits \(p_1, p_2, p_3\) based on Hamming Code (7,4) rules using XOR operations.
- Finally, the program assembles and stores the encoded 7-bit Hamming code in memory.

### Observation - Single Cycle
- **Cycles:** 33
- **Frequency:** 9.68Hz
- **CPI:** 1
- **IPC:** 1

### Observation - 5 Stage
- **Cycles:** 40
- **Frequency:** 20.10Hz
- **CPI:** 1.21
- **IPC:** 0.825

### Memory Mapping
- **0x00 (input):** 0xB (binary: 1011)
- **0x01 (encoded):** 0x7B (binary: 1111011)

### Register Mapping
- **x10:** Base address of the input and encoded result
- **x11:** Encoded 7-bit Hamming code
- **x12 - x18:** Intermediate bit calculations for \(d_1, d_2, d_3, d_4, p_1, p_2, p_3\)

### Snapshot
![Screenshot of RIPES window](program1.png)
