.data
input:      .byte 0xB       # Input 4-bit number (e.g., 1011 in binary)
encoded:    .byte 0         # Placeholder for encoded Hamming code

.text
.globl _start
_start:
    # Load the input number (4 bits)
    la x10, input           # Address of input
    lb x11, 0(x10)          # Load input byte into x11

    # Extract the data bits: d1, d2, d3, d4
    andi x12, x11, 0x1      # d4 = input & 0b0001
    srli x11, x11, 1        # Shift input right by 1 bit
    andi x13, x11, 0x1      # d3 = input & 0b0001
    srli x11, x11, 1        # Shift input right by 1 bit
    andi x14, x11, 0x1      # d2 = input & 0b0001
    srli x11, x11, 1        # Shift input right by 1 bit
    andi x15, x11, 0x1      # d1 = input & 0b0001

    # Calculate parity bits
    xor x16, x15, x14       # x16 = d1 ^ d2
    xor x16, x16, x12       # p1 = d1 ^ d2 ^ d4

    xor x17, x15, x13       # x17 = d1 ^ d3
    xor x17, x17, x12       # p2 = d1 ^ d3 ^ d4

    xor x18, x14, x13       # x18 = d2 ^ d3
    xor x18, x18, x12       # p3 = d2 ^ d3 ^ d4

    # Assemble the encoded Hamming code: p1, p2, d1, p3, d2, d3, d4
    slli x19, x16, 6        # p1 << 6
    or x19, x19, x17        # Add p2 (shifted to position 5)
    slli x19, x19, 1        # Shift left for d1
    or x19, x19, x15        # Add d1
    slli x19, x19, 1        # Shift left for p3
    or x19, x19, x18        # Add p3
    slli x19, x19, 1        # Shift left for d2
    or x19, x19, x14        # Add d2
    slli x19, x19, 1        # Shift left for d3
    or x19, x19, x13        # Add d3
    slli x19, x19, 1        # Shift left for d4
    or x19, x19, x12        # Add d4

    # Store the encoded result
    la x10, encoded         # Address of encoded result
    sb x19, 0(x10)          # Store the encoded byte

    # Exit program (optional for simulation purposes)
    li x17, 10              # Syscall for exit
    ecall