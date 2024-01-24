#include <string.h>
#include "ex1.h"

/* Returns the number of times LETTER appears in STR.
There are two different ways to iterate through a string.
1st way hint: strlen() may be useful
2nd way hint: all strings end in a null terminator */
int num_occurrences(char *str, char letter) {
    /* TODO (DONE): implement num_occurances */ 
    
    // iterate through the string and see if there is a char with letter then do count++;
    int count=0;
    for(int i=0; str[i]!='\0'; i++){
    	if(str[i]==letter){
    		count++;
    	}
    }
    
    return count;
}

/* Populates DNA_SEQ with the number of times each nucleotide appears.
Each sequence will end with a NULL terminator and will have up to 20 nucleotides.
All letters will be upper case. */
void compute_nucleotide_occurrences(DNA_sequence *dna_seq) {
    /* TODO (DONE): implement compute_nucleotide_occurances */
    
    //use dna_seq struct and iterate through the dna_seq.sequence and see if there is a letter A 
    // then do count++ for dna_seq.A_count and similarly for C,G and T.
    
    dna_seq->A_count=0;
    dna_seq->C_count=0;
    dna_seq->G_count=0;
    dna_seq->T_count=0;
    for(int i=0; i<dna_seq->sequence[i]!='\0'; i++){
    	if(dna_seq->sequence[i]=='A'){
    		dna_seq->A_count++;
    	}
    	else if(dna_seq->sequence[i]=='C'){
    		dna_seq->C_count++;
    	}
    	else if(dna_seq->sequence[i]=='G'){
    		dna_seq->G_count++;
    	}
    	else if(dna_seq->sequence[i]=='T'){
    		dna_seq->T_count++;
    	}
    }
    
    return;
}
