#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        Vec_Splat.asm
# Version:          1.0
# Date:             Apr. 28, 2015   
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
	   li $a0, 0x230C124D
	   li $a1, 0x057F192A

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

	   addi $a2, $zero, 5		#initialize $t3 to 5 (our b value for splat)
	   mul $a2, $a2, 4		#multiply b value by 4 to get offset amount
	   add $t0, $t0, $a2		#add offset to array pointer
	   lw $t2, ($t0)  		#load array slot of $t0 into $t2
	   addi $t4, $zero, 3
	   add $t5, $zero, $zero	#make sure $t5 is empty 
loop:	   
	   subi $t4, $t4, 1
	   add $t5, $t5, $t2
	   sll $t5, $t5, 8
	   bne $t4, $zero, loop
	   
	   add $t5, $t5, $t2
	   add $t6, $zero, $t5
	   
	   
	 	
	   

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
        	
                      
