.data
prompt:  .asciz "Enter a number: "
result:  .asciz "The factorial is: %d\n"

 .text
    .globl _start

_start:
    # Prompt user to input a number (simulated in RIPES)
    la a0, prompt          # Load address of prompt string
    li a7, 4               # System call for print string
    ecall

    # Read input number (simulated in RIPES, use a0 for input)
    li a0, 5               # Load input number, e.g., 5
    li a1, 1               # Initialize result to 1

factorial_loop:
    beq a0, x0, end_factorial # If number is 0, end loop
    mul a1, a1, a0   
    addi x31,x0,1      # Multiply result by current number
    sub a0, a0, x31 
    j factorial_loop       # Jump to the next iteration

end_factorial:
    # Print the result
    la a0, result          # Load address of result string
    li a7, 4               # System call for print string
    ecall
    mv a0, a1              # Move result to a0 for print
    li a7, 1               # System call for print integer
    ecall

    # Exit the program
    li a7, 10              # Exit system call
    ecall