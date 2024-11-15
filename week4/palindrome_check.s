 .data
str:    .asciz "racecar"      # String to check (change as needed)
msg1:   .asciz "Palindrome\n"  # Message for palindrome
msg2:   .asciz "Not Palindrome\n"  # Message for not palindrome

.text
    .globl _start

_start:
    la      a0, str          # Load address of the string into a0
    call    palindrome_check

    # Exit program
    li      a7, 10           # System call for exit
    ecall

# Function to check palindrome
palindrome_check:
    la      t0, str          # Load address of the string into t0
    li      t1, 0            # Initialize t1 to 0 (starting index)

    # Calculate length of the string
find_length:
    lb      t2, 0(t0)        # Load byte at address t0 into t2
    beq     t2, zero, done_length  # If null terminator, we're done
    addi    t0, t0, 1        # Increment address of string
    addi    t1, t1, 1        # Increment string length counter
    j       find_length

done_length:
    # Set t0 back to the start of the string
    la      t0, str

    # Find the last index of the string (length - 1)
    addi    t2, t1, -1       # t2 = length - 1

check_palindrome:
    lb      t3, 0(t0)        # Load byte at start of string (t0)
    lb      t4, 0(t2)        # Load byte at end of string (t2)
    beq     t3, t4, next_char # If characters match, move to the next pair
    la      a0, msg2         # Load message for not palindrome
    j       print_result

next_char:
    addi    t0, t0, 1        # Increment start index
    addi    t2, t2, -1       # Decrement end index
    blt     t0, t2, check_palindrome  # Continue checking until middle

    # If we finished loop, it's a palindrome
    la      a0, msg1         # Load message for palindrome

print_result:
    # Print the result
    li      a7, 4            # Syscall for print string
    ecall
    ret