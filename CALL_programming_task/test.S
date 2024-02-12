.globl _start;                                                  \
_start:

.text
main:
    la s0, n                # store the address of n in t0 
    lw a0, 0(s0)            #store number in a0
    jal factorial           # jump and link factorial
    
    sw a0, 4(s0)
    
    j exit
    #add a1, a0, x0      # store the result in a1 to print it through ecall
    #addi a0, x0, 1      # store 1 in a0 to print it through ecall
    #ecall # Print Result

    #addi a1, x0, '\n'
    #addi a0, x0, 11
    #ecall # Print newline

    #addi a0, x0, 10
    #ecall # Exit

factorial:
    addi sp, sp, -8
    sw ra, 4(sp)
    sw s0, 0(sp)
    add s0, a0, x0          #store the number from a0 to s0, becasue we are storing s0 into stack //(resursion)
    addi t0, x0, 1          # store 1 in t0
    ble a0, t0, return1     #check if the given number is <=1 then return 1
    addi a0, a0, -1
    
    jal factorial
    
    mul a0, a0, s0
    
    j epilogoue

    
return1:
    addi a0, x0, 1
    j epilogoue

epilogoue:
    lw s0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
    jr ra
    
exit:

write_tohost:
li x1, 1
sw x1, tohost, t5
j write_tohost

.data 
n: .word 4

.align 12
.section ".tohost","aw",@progbits;                            
.align 4; .global tohost; tohost: .dword 0;                     
.align 4; .global fromhost; fromhost: .dword 0;

