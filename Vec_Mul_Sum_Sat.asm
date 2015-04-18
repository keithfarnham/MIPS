#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        341_proj1b.asm
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
	   li $a0, 0x230CF14D
	   li $a1, 0x5C7F191A
	   li $a2, 0xA30C5BFD
	   li $a3, 0xC5FFC9EE
	   li $t8, 0x609E19F7
	   li $t9, 0x45670766
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
	   srl $t5, $t8, 16
	   sw $t5, 0($t1)
	   sll $t5, $t8, 16
	   srl $t5, $t5, 16
	   sw $t5, 4($t1)
	   
	   srl $t5, $t9, 16
	   sw $t5, 8($t1)
	   sll $t5, $t9, 16
	   srl $t5, $t5, 16
	   sw $t5, 12($t1)
	   
	   la $t0, 0x10010000
	   la $t1, 0x10010020
	   la $t2, 0x10010040
	   
	   lw $t3, 0($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 0($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 0($t2)
	   sll $t7, $t7, 16	
	   mul $a0, $t4, $t3		
	   sll $a0, $a0, 16
	   lw $t3, 4($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 4($t1)	#load array slot 0 of $t1 into $t3
	   mul $a1, $t4, $t3		
	   sll $a1, $a1, 16
	   addu $a0, $a0, $a1
	   addu $t7, $t7, $a0
	   sltu $t8, $t7, $a0		#set carry flag
	   add $t5, $t7, $zero
	   beq $t8, $zero, noCarry1	#branch if no carry
	   addi $t5, $zero, 0xFFFF0000	#if carry, set value to FF
	   
noCarry1:   
	   lw $t3, 8($t0) 
	   lw $t4, 8($t1)
	   lw $t7, 4($t2)
	   sll $t7, $t7, 16		
	   mul $a0, $t4, $t3		
	   sll $a0, $a0, 16
	   lw $t3, 12($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 12($t1)	#load array slot 0 of $t1 into $t3
	   mul $a1, $t4, $t3		
	   sll $a1, $a1, 16
	   addu $a0, $a0, $a1
	   addu $t7, $t7, $a0
	   sltu $t8, $t7, $a0		#set carry flag
	   srl $t7, $t7, 16
	   add $t5, $t5, $t7
	   beq $t8, $zero, noCarry2	#branch if no carry
	   addi $t5, $t5, 0x0000FFFF	#if carry, set value to FF
	   
noCarry2:
	   lw $t3, 16($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 16($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 8($t2)
	   sll $t7, $t7, 16	
	   mul $a0, $t4, $t3		
	   sll $a0, $a0, 16
	   lw $t3, 20($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 20($t1)	#load array slot 0 of $t1 into $t3
	   mul $a1, $t4, $t3		
	   sll $a1, $a1, 16
	   addu $a0, $a0, $a1
	   addu $t7, $t7, $a0
	   sltu $t8, $t7, $a0		#set carry flag
	   add $t6, $t7, $zero
	   beq $t8, $zero, noCarry3	#branch if no carry
	   addi $t6, $zero, 0xFFFF0000	#if carry, set value to FF
	   
noCarry3:   
	   lw $t3, 24($t0) 
	   lw $t4, 24($t1)
	   lw $t7, 12($t2)
	   sll $t7, $t7, 16		
	   mul $a0, $t4, $t3		
	   sll $a0, $a0, 16
	   lw $t3, 28($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 28($t1)	#load array slot 0 of $t1 into $t3
	   mul $a1, $t4, $t3		
	   sll $a1, $a1, 16
	   addu $a0, $a0, $a1
	   addu $t7, $t7, $a0
	   sltu $t8, $t7, $a0		#set carry flag
	   srl $t7, $t7, 16
	   add $t6, $t6, $t7
	   beq $t8, $zero, noCarry4	#branch if no carry
	   addi $t6, $t6, 0x0000FFFF	#if carry, set value to FF  
noCarry4:   

	   
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
        
                      
