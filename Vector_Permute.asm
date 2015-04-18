#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        Vec_Permute.asm
# Version:          1.0
# Date:             Feb. 25, 2015  
# Programmer:       Keith Farnham
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
	   la $t0, array_1 
	   add $t1, $t0, 32 
	   li $a0, 0xA567013D
	   li $a1, 0xAB45393C
	   li $a2, 0xEFC54D23
	   li $a3, 0x1277AACD
	   li $t8, 0x04171002
	   li $t9, 0x13050105
	   srl $t5, $a0, 24
	   sw $t5, 0($t0)
	   sll $t5, $a0, 8
	   srl $t5, $t5, 24
	   sw $t5, 4($t0)
	   sll $t5, $a0, 16
	   srl $t5, $t5, 24
	   sw $t5, 8($t0)
	   sll $t5, $a0, 24
	   srl $t5, $t5, 24
	   sw $t5, 12($t0)
	   
	   srl $t5, $a1, 24
	   sw $t5, 16($t0)
	   sll $t5, $a1, 8
	   srl $t5, $t5, 24
	   sw $t5, 20($t0)
	   sll $t5, $a1, 16
	   srl $t5, $t5, 24
	   sw $t5, 24($t0)
	   sll $t5, $a1, 24
	   srl $t5, $t5, 24
	   sw $t5, 28($t0)
	   
	   srl $t5, $a2, 24
	   sw $t5, 0($t1)
	   sll $t5, $a2, 8
	   srl $t5, $t5, 24
	   sw $t5, 4($t1)
	   sll $t5, $a2, 16
	   srl $t5, $t5, 24
	   sw $t5, 8($t1)
	   sll $t5, $a2, 24
	   srl $t5, $t5, 24
	   sw $t5, 12($t1)
	   
	   srl $t5, $a3, 24
	   sw $t5, 16($t1)
	   sll $t5, $a3, 8
	   srl $t5, $t5, 24
	   sw $t5, 20($t1)
	   sll $t5, $a3, 16
	   srl $t5, $t5, 24
	   sw $t5, 24($t1)
	   sll $t5, $a3, 24
	   srl $t5, $t5, 24
	   sw $t5, 28($t1)
	   
	   add $t1, $t1, 32 
	   srl $t5, $t8, 24
	   sw $t5, 0($t1)
	   sll $t5, $t8, 8
	   srl $t5, $t5, 24
	   sw $t5, 4($t1)
	   sll $t5, $t8, 16
	   srl $t5, $t5, 24
	   sw $t5, 8($t1)
	   sll $t5, $t8, 24
	   srl $t5, $t5, 24
	   sw $t5, 12($t1)
	   
	   srl $t5, $t9, 24
	   sw $t5, 16($t1)
	   sll $t5, $t9, 8
	   srl $t5, $t5, 24
	   sw $t5, 20($t1)
	   sll $t5, $t9, 16
	   srl $t5, $t5, 24
	   sw $t5, 24($t1)
	   sll $t5, $t9, 24
	   srl $t5, $t5, 24
	   sw $t5, 28($t1)
	   
	  # la $t0, array_3 	
	   addi $a0, $zero, 24
	   add $a1, $zero, $zero
	   add $a3, $zero, $zero
	   add $t5, $zero, $zero
	   la $t0, 0x10010040
	   			
loop:	   lw $t2, ($t0)  	     		
	   slti $t7, $t2, 0x10
	   beq $t7, $zero, vecb
	   #load from vec a
	   la $t1, 0x10010000
	   add $a1, $t2, $zero
	   mul $a1, $a1, 4
	   add $t1, $t1, $a1
	   lw $t3, ($t1)
	   j bskip
	   
vecb:	   #load from vec b
	   la $t1, 0x10010020
	   subi $t2, $t2, 0x10
	   add $a1, $t2, $zero
	   mul $a1, $a1, 4
	   add $t1, $t1, $a1
	   lw $t3, ($t1)

bskip:
	   sllv $t3, $t3, $a0
	   add $t5, $t5, $t3
	   subi $a0, $a0, 8
	   addi $t0, $t0, 4
	   addi $a1, $a1, 8
	   addi $a3, $a3, 1
	   beq $a3, 4, lowerbits
	   j loop
lowerbits: 
	   addi $a0, $zero, 24
	   add $a1, $zero, $zero
	   add $a3, $zero, $zero
loop2:
	   lw $t2, ($t0)  	     		
	   slti $t7, $t2, 0x10
	   beq $t7, $zero, vecb2
	   #load from vec a
	   la $t1, 0x10010000
	   add $a1, $t2, $zero
	   mul $a1, $a1, 4
	   add $t1, $t1, $a1
	   lw $t3, ($t1)
	   j bskip2
	   
vecb2:	   #load from vec b
	   la $t1, 0x10010020
	   subi $t2, $t2, 0x10
	   add $a1, $t2, $zero
	   mul $a1, $a1, 4
	   add $t1, $t1, $a1
	   lw $t3, ($t1)

bskip2:
	   sllv $t3, $t3, $a0
	   add $t6, $t6, $t3
	   subi $a0, $a0, 8
	   addi $t0, $t0, 4
	   addi $a1, $a1, 8
	   addi $a3, $a3, 1
	   beq $a3, 4, exit
	   j loop2
	   
	   
	 	
	   

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
        	
                      
