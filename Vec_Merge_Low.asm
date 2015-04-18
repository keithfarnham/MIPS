#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        341_proj1b.asm
# Version:          1.0
# Date:             April 12, 2015  
# Programmer:       Keith Farnham, Victor Tran 
#
# Description:      Using a sequence of MIPS instructions......
#
# Register useage:  $t1, $t0, $v0
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

main:      #         ***** Your code begins here *****
	   
	   la $t0, array_1 #initialize $t1 to point to memory location with label "array_1"
	   add $t1, $t0, 32 #initialize $t0 to point to memory location with label "array_2"
	   li $a0, 0x5AF0A501
	   li $a1, 0xAB0155C3
	   li $a2, 0xA50F5A23
	   li $a3, 0xCD23AA3C
	   srl $t8, $a0, 24
	   sw $t8, 0($t0)
	   sll $t8, $a0, 8
	   srl $t8, $t8, 24
	   sw $t8, 4($t0)
	   sll $t8, $a0, 16
	   srl $t8, $t8, 24
	   sw $t8, 8($t0)
	   sll $t8, $a0, 24
	   srl $t8, $t8, 24
	   sw $t8, 12($t0)
	   
	   srl $t8, $a1, 24
	   sw $t8, 16($t0)
	   sll $t8, $a1, 8
	   srl $t8, $t8, 24
	   sw $t8, 20($t0)
	   sll $t8, $a1, 16
	   srl $t8, $t8, 24
	   sw $t8, 24($t0)
	   sll $t8, $a1, 24
	   srl $t8, $t8, 24
	   sw $t8, 28($t0)
	   
	   srl $t8, $a2, 24
	   sw $t8, 0($t1)
	   sll $t8, $a2, 8
	   srl $t8, $t8, 24
	   sw $t8, 4($t1)
	   sll $t8, $a2, 16
	   srl $t8, $t8, 24
	   sw $t8, 8($t1)
	   sll $t8, $a2, 24
	   srl $t8, $t8, 24
	   sw $t8, 12($t1)
	   
	   srl $t8, $a3, 24
	   sw $t8, 16($t1)
	   sll $t8, $a3, 8
	   srl $t8, $t8, 24
	   sw $t8, 20($t1)
	   sll $t8, $a3, 16
	   srl $t8, $t8, 24
	   sw $t8, 24($t1)
	   sll $t8, $a3, 24
	   srl $t8, $t8, 24
	   sw $t8, 28($t1)
	 

	   lw $t2, 16($t0) 		
	   sll $t4, $t2, 24		  
	   lw $t2, 16($t1) 			  
	   
	   sll $t2, $t2, 16
	   add $t4, $t4, $t2	 
	   lw $t2, 20($t0) 
	  
	   sll $t2, $t2, 08
	   add $t4, $t4, $t2	 
	   lw $t2, 20($t1) 
  
	   sll $t2, $t2,  0
	   add $t4, $t4, $t2	 
	   lw $t2, 24($t0) 
 
	   sll $t2, $t2, 24
	   add $t5, $t5, $t2	 
	   lw $t2, 24($t1) 

	   sll $t2, $t2, 16
	   add $t5, $t5, $t2	 
	   lw $t2, 28($t0) 
 
	   sll $t2, $t2, 08
	   add $t5, $t5, $t2	 
	   lw $t2, 28($t1) 
  
	   srl $t2, $t2, 0
	   add $t5, $t5, $t2		   
	   #LOWER BITS SAVED INTO $t5 UPPER BITS SAVED INTO $t6

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
           .data       # array[0]   array[1]    array[2]    array[3]    array[4]    array[5]
array_1:   .word	
array_2:   .word	
        
                      
