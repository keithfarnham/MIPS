#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        341_proj1b.asm
# Version:          1.0
# Date:             Apr. 12, 2015  
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
	   li $a0, 0x5AFB6C1D
	   li $a1, 0xA65FC040
	   li $a2, 0x52FBA415
	   li $a3, 0xAE5FC841
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
	   
	   
	   lw $t2, 0($t0) 		#load array slot 0 of $t0 into $t2
	   lw $t3, 0($t1)		#load array slot 0 of $t1 into $t3
	   beq $t2, $t3, else	#branch if no carry
	   addi $t4, $zero, 0x00	#if carry, set value to FF
	   j compare1
else:	   addi $t4, $zero, 0x000000FF
	   j compare1	   
compare1:  
	   sll $t4, $t4, 24
	   add $t5, $t5, $t4
	   lw $t2, 4($t0) 
	   lw $t3, 4($t1)	
	   beq $t2, $t3, else1
	   addi $t4, $zero, 0x00
	   j compare2
else1: 	   addi $t4, $zero, 0x000000FF
	   j compare2 
compare2:  
	   sll $t4, $t4, 16
	   add $t5, $t5, $t4	 
	   lw $t2, 8($t0) 
	   lw $t3, 8($t1)	
	   beq $t2, $t3, else2
	   addi $t4, $zero, 0x00
	   j compare3
else2: 	   addi $t4, $zero, 0x000000FF
	   j compare3
compare3: 
	   sll $t4, $t4, 08
	   add $t5, $t5, $t4
	   lw $t2, 12($t0) 
	   lw $t3, 12($t1)
	   beq $t2, $t3, else3
	   addi $t4, $zero, 0x00
	   j compare4
else3: 	   addi $t4, $zero, 0x000000FF
	   j compare4
compare4: 
	   add $t5, $t5, $t4
	   lw $t2, 16($t0) 
	   lw $t3, 16($t1)
	   beq $t2, $t3, else4
	   addi $t4, $zero, 0x00
	   j compare5
else4:     addi $t4, $zero, 0x000000FF
	   j compare5
compare5: 
	   sll $t4, $t4, 24
	   add $t6, $t6, $t4
	   lw $t2, 20($t0) 		
	   lw $t3, 20($t1)		
	   beq $t2, $t3, else5	
	   addi $t4, $zero, 0x00	
	   j compare6
else5:     addi $t4, $zero, 0x000000FF
	   j compare6
compare6: 
	   sll $t4, $t4, 16
	   add $t6, $t6, $t4	 
	   lw $t2, 24($t0) 
	   lw $t3, 24($t1)	
	   beq $t2, $t3, else6
	   addi $t4, $zero, 0x00
	   j compare7
else6:     addi $t4, $zero, 0x000000FF
	   j compare7
compare7:  sll $t4, $t4, 08
	   add $t6, $t6, $t4	 
	   lw $t2, 28($t0) 
	   lw $t3, 28($t1)	
	   beq $t2, $t3, else7
	   addi $t4, $zero, 0x00
	   j compare8
else7:     addi $t4, $zero, 0x000000FF
	   j compare8
compare8:  add $t6, $t6, $t4
	   

	   
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
        
                      
