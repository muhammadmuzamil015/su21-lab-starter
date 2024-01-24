#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* TODO (DONE): Implement ll_has_cycle */
    
    // if head is null, return
    if (head == NULL){
    	return 0;
    }
    
    node *fast_ptr, *slow_ptr;
    // storing the address of head in fast_ptr and slow_ptr, so that
    // both pointers are at the head of the list.
    fast_ptr = head;
    slow_ptr = head;
    
    while (slow_ptr != NULL && fast_ptr != NULL && fast_ptr->next != NULL) {
	//advance fast_ptr by two nodes
	for (int i=0; i<2; i++) {
		fast_ptr = fast_ptr->next;
	}

	//advance slow_ptr by one nodes
	slow_ptr = slow_ptr->next;
	
	//check if slow_ptr and fast_ptr points to same node or no?
	// if yes then return true
	if (fast_ptr == slow_ptr){
		// list is cyclic
		return 1;
	}
	
     }
	return 0;     
}
