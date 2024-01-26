#include <stdio.h>
#include "bit_ops.h"

/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {

    // to return the nth bit of number x, we can use bit shift operator.    
    //right shift a number x by n to make it at the LSB, then AND it with 1 to get the LSB of a number x, finally the result is the nth bit of number x.
    //unsigned bit_shift = x>>n;
    // unsigned nth_bit = bit_shift & 0b1;
    
    return ((x>>n) & 0b1);
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    
    // to set the nth bit of a number x to v, we can use & and or operator. 
    // First we need to clear the bit, then set it to v.
    // *x = v ? *x|(1<<n): *x&~(1<<n);	//expression to set and reset a bit
   
    *x = *x & ~(1<<n); //clear/reset the bit.
    *x = *x | (v<<n);	// set the bit to v
}

/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {

    // to flip the nth bit of a number x, we can use XOR operator (^). we can XOR x with a number having nth bit 1. like 000100 has 2nd bit 1. 
    
    *x = *x^(1<<n);
}

