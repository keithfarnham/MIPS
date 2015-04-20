#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        Vec_Splat.asm
# Version:          1.0
# Date:             Apr. 28, 2015   
# Programmer:       Keith Farnham, Victor Tran
#
# Description: The “splat” instruction is used to copy any element from one vector into all of the elements of 
#	       another vector as shown in the diagram below. Each element of the result vector d is component b 
#	       of vector a.
# Register useage:  $a0-$a2, $t0-$t2, $t4-$t6, $t8, $v0
#
# 
# Notes:     
#
#******************************************************************************************

        

           #**********************************************************
           #             M A I N     C O D E S E G M E N T  
           #**********************************************************

           .text                        # main (must be global)
           .globl main

main:      
	   la $t0, array_1 				#load t0 with memory location 0x10010000 to store vec a
	   add $t1, $t0, 32 				#load t1 with memory location 0x10010020 to store vec b
	   li $a0, 0x230C124D				#initialize a0 with upper bits of vec a
	   li $a1, 0x057F192A				#initialize a1 with lower bits of vec a

	   srl $t8, $a0, 24				#shift to clear bits and store first 8 bits of upper vec a into t5
	   sw $t8, 0($t0)				#store first 8 bits of upper vec a into memory
	   sll $t8, $a0, 8				#shift to clear bits higher than second 8 bits of upper vec a
	   srl $t8, $t8, 24				#shift to clear bits and store second 8 bits upper of vec a into t8
	   sw $t8, 4($t0)				#store second 8 bits of uppper vec a into memory
	   sll $t8, $a0, 16				#shift to clear bits higher than third 8 bits of upper vec a
	   srl $t8, $t8, 24				#shift to clear bits and store third 8 bits of upper vec a into t8
	   sw $t8, 8($t0)				#store third 8 bits of upper vec a into memory
	   sll $t8, $a0, 24				#shift to clear bits higher than last 8 bits of upper vec a
	   srl $t8, $t8, 24				#shift to clear bits and store last 8 bits of upper vec a into t8
	   sw $t8, 12($t0)				#store last 8 bits of upper vec a into memory
	   
	   srl $t8, $a1, 24				#shift to clear bits and store first 8 bits of lower vec a into t8
	   sw $t8, 16($t0)				#store first 8 bits of lower vec a into memory
	   sll $t8, $a1, 8				#shift to clear bits higher than second 8 bits of lower vec a
	   srl $t8, $t8, 24				#shift to clear bits and store second 8 bits of lower vec a into t8
	   sw $t8, 20($t0)				#store second 8 bits of lower vec a into memory
	   sll $t8, $a1, 16				#shift to clear bits higher than third 8 bits of lower vec a
	   srl $t8, $t8, 24				#shift to clear bits and store third 8 bits of lower vec a into t8
	   sw $t8, 24($t0)				#store third 8 bits of lower vec a into memory
	   sll $t8, $a1, 24				#shift to clear bits higher than last 8 bits of lower vec a
	   srl $t8, $t8, 24				#shift to clear bits and store last 8 bits of lower vec a into t8
	   sw $t8, 28($t0)				#store last 8 bits of lower vec a into memory

	   addi $a2, $zero, 5				#initialize t3 to 5 (our b value for splat)
	   mul $a2, $a2, 4				#multiply b value by 4 to get offset amount
	   add $t0, $t0, $a2				#add offset to array pointer
	   lw $t2, ($t0)  				#load vec a value into $t2
	   addi $t4, $zero, 3				#initialize t4 with 3 for loop
	   add $t5, $zero, $zero			#make sure t5 is empty 
loop:	   
	   subi $t4, $t4, 1				#decrement t4 by 1
	   add $t5, $t5, $t2				#add vec a value to t5
	   sll $t5, $t5, 8				#shift t5 left 8
	   bne $t4, $zero, loop				#branch when t4 equals zero
	   
	   add $t5, $t5, $t2				#add final value to t5
	   add $t6, $zero, $t5				#copy t5 into t6
	   
           #-----------------------------------------------------------
           # "Due diligence" to return control to the kernel
           #-----------------------------------------------------------
exit:      ori        $v0, $zero, 10     # $v0 <-- function code for "exit"
           syscall                       # Syscall to exit


           #************************************************************
           #  P R O J E C T    R E L A T E D    S U B R O U T I N E S
           #************************************************************
proc1:     j         proc1               # "placeholder" stub



           #************************************************************
           # P R O J E C T    R E L A T E D    D A T A   S E C T I O N
           #************************************************************ 
           .data     
array_1:   .word	
        	
                      
