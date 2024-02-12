.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    addi x6, x0, 1      # store 1 in x6
    jal ra, factorial

    add a1, a0, x6      # store the result in a1 to print it through ecall
    addi a0, x0, 1      # store 1 in a0 to print it through ecall
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    #to implement the factorial code we need to decrement the value of a0 which first have the n
    # then multiply each decremented value with the previous value.
    
    beq a0, x0, goto
    mul x6, x6, a0      # multiply x6 with a0 and save the result back to x6
    addi a0 , a0, -1    # decrement a0 by 1
    j factorial         # go back to factorial (iterate the loop again)
    
goto:
    jr ra               # jump to instruction whose address is saved in ra