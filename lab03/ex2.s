.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
fun:
    addi t0, a0, 1
    sub t1, x0, a0
    mul a0, t0, t1
    jr ra

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    # END PROLOGUE
    addi t0, x0, 0
    addi s0, x0, 0
    la s1, source
    la s2, dest
loop:
    slli s3, t0, 2      # shifting t0 by 2bits (multiplying by 4)
    add t1, s1, s3      # add shifted number to base address of source and store the result to t1
    lw t2, 0(t1)        # load the word from 0 offset of source array and store to t2
    beq t2, x0, exit    # if the word/element is 0 then goto exit label
    add a0, x0, t2      # if word/element from source is not 0, store it to a0 (argument)
    addi sp, sp, -8     # booked the stack for 2words(8 bytes)
    sw t0, 0(sp)        # store t0 to sp by 0 offset 
    sw t2, 4(sp)        # store t0 to sp by 4 offset
    jal fun             # jump and link to fun
    lw t0, 0(sp)        # restore t0 from stack
    lw t2, 4(sp)        # restore t1 from stack
    addi sp, sp, 8      # free up stack
    add t2, x0, a0      # move the function return value which is in a0 to t2
    add t3, s2, s3      # add the shifted number to base address of dest and store the result to t3
    sw t2, 0(t3)        # store the value retured by function which is now in t2 to 0 offset of dest array
    add s0, s0, t2      # add the t0 value returned by function to s0 which is sum
    addi t0, t0, 1      # increment the t0 which is k
    jal x0, loop        # jump and link to label loop
exit:
    add a0, x0, s0
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    # END EPILOGUE
    jr ra
