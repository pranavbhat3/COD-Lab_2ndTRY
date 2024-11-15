# Program 1:

### Statement: 
This assembly program checks whether a given string is a palindrome. It compares the characters from the start and end of the string and prints whether the string is a palindrome or not.

### Name of file:
`palindrome_check.s`

### Observation - Explanation
- The program first loads the address of the string and calculates its length by iterating over the string until the null terminator is reached.
- The program then compares the first and last characters, moving towards the center. If all pairs match, the string is considered a palindrome.
- If any mismatch is found, the program prints "Not Palindrome", otherwise it prints "Palindrome".

### Observation - Single Cycle
- **Cycles:** 58 
- **Frequency:** 44.79Hz 
- **CPI:** 1 
- **IPC:** 1 

### Observation - 5 Stage
- **Cycles:** 97 
- **Frequency:** 144.99 GHz 
- **CPI:** 1.67 
- **IPC:** 0.598 

### Memory Mapping
- **str:** "racecar" (The string being checked)
- **msg1:** "Palindrome\n" (Message printed when the string is a palindrome)
- **msg2:** "Not Palindrome\n" (Message printed when the string is not a palindrome)

### Register Mapping
- **t0:** Holds the address of the string during the comparison.
- **t1:** Holds the string length.
- **t2:** Holds the current position in the string for both start and end comparisons.
- **t3:** Holds the current character at the start of the string.
- **t4:** Holds the current character at the end of the string.
- **a0:** Holds the address of the message to be printed ("Palindrome" or "Not Palindrome").

### Snapshot
![Screenshot of RIPES window](program1.png)


# Program 2: Search a Given Number in an Array

### Statement: 
This assembly program searches for a given number in an array. If the number is found, it prints "Number Found". If the number is not found, it prints "Number Not Found".

### Name of file:
`search_number.s`

### Observation - Explanation
- The program first loads the array and the target number into registers.
- It iterates through the array, comparing each element with the target number.
- If the number is found, it prints "Number Found", otherwise it prints "Number Not Found".

### Observation - Single Cycle
- **Cycles:** 61 
- **Frequency:** 1 29.54Hz 
- **CPI:** 1.61 
- **IPC:** 0.623 

### Observation - 5 Stage
- **Cycles:** 61
- **Frequency:** 57.73Hz 
- **CPI:** 1.61
- **IPC:** 0.623 

### Memory Mapping
- **arr:** Array of integers `{5, 8, 12, 14, 22, 25, 30}`
- **target:** The target number to search for, which is `22`.
- **msg1:** "Number Found\n" (Message printed when the number is found)
- **msg2:** "Number Not Found\n" (Message printed when the number is not found)

### Register Mapping
- **t0:** Holds the address of the current element in the array.
- **t1:** Holds the address of the target number.
- **t2:** Holds the target number for comparison.
- **t3:** Holds the index of the current array element being checked.
- **t4:** Holds the current array element being checked.
- **t5:** Holds the length of the array (7 in this case).
- **a0:** Holds the address of the message to be printed ("Number Found" or "Number Not Found").

### Snapshot
![Screenshot of RIPES window](program2.png)
