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

main:      
	   la $t0, array_1 #initialize $t1 to point to memory location with label "array_1"
	   add $t1, $t0, 32 #initialize $t0 to point to memory location with label "array_2"
	   li $a0, 0x5AFB6C1D
	   li $a1, 0xAE5FC041
	   li $a2, 0x52F3A415
	   li $a3, 0xA657C849
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
	   
	   #1st shift
	   lw $t2, 0($t0) 		
	   sll $t2, $t2, 28
	   add $t5, $t5, $t2		
	   #2nd shift   
	   lw $t2, 04($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 04
	   add $t5, $t5, $t2		
	   #3rd shift 
	   lw $t2, 08($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 08
	   add $t5, $t5, $t2 
	   #4th shift  
	   lw $t2, 12($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 12
	   add $t5, $t5, $t2
	   #5th shift
	   lw $t2, 16($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 16
	   add $t5, $t5, $t2
	   #6th shift
	   lw $t2, 20($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 20
	   add $t5, $t5, $t2 
	   #7th shift
	   lw $t2, 24($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 24
	   add $t5, $t5, $t2
	   #8th shift
	   lw $t2, 28($t0) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 28
	   add $t5, $t5, $t2
	   #9th shift
	   lw $t2, 0($t1) 
	   sll $t2, $t2, 28
	   add $t6, $t6, $t2
	   #10th shift
	   lw $t2, 04($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 04
	   add $t6, $t6, $t2
	   #11th shift
	   lw $t2, 08($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 08
	   add $t6, $t6, $t2
	   #12th shift
	   lw $t2, 12($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 12
	   add $t6, $t6, $t2
	   #13th shift
	   lw $t2, 16($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 16
	   add $t6, $t6, $t2
	   #14th shift
	   lw $t2, 20($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 20
	   add $t6, $t6, $t2
	   #15th shift
	   lw $t2, 24($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 24
	   add $t6, $t6, $t2
	   #16th shift
	   lw $t2, 28($t1) 
	   sll $t2, $t2, 28
	   srl $t2, $t2, 28
	   add $t6, $t6, $t2

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
        
                      
