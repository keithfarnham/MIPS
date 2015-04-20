#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        341_proj1b.asm
# Version:          1.0
# Date:             Apr. 28, 2015   
# Programmer:       Keith Farnham, Victor Tran
#
# Description: Each element of vector d is the 16-bit sum of the corresponding elements of vector c and the 
#	       16-bit “temp” product of the 8-bit elements of vector a and vector b which overlap the positions of 
#	       that element in c. The sum is performed with 16-bit saturating addition (no-wrap). 
# Register useage:  $a0-$a3, $t0-$t9, $v0
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
	   li $a0, 0x230CF14D				#initialize a0 with upper bits of vec a
	   li $a1, 0x5C7F191A				#initialize a1 with lower bits of vec a
	   li $a2, 0xA30C5BFD				#initialize a2 with upper bits of vec b
	   li $a3, 0xC5FFC9EE				#initialize a3 with lower bits of vec b
	   li $t8, 0x609E19F7				#initialize t8 with upper bits of vec c
	   li $t9, 0x45670766				#initialize t9 with lower bits of vec c
	   srl $t5, $a0, 24				#shift to clear bits and store first 8 bits of upper vec a into t5
	   sw $t5, 0($t0)				#store first 8 bits of upper vec a into memory
	   sll $t5, $a0, 8				#shift to clear bits higher than second 8 bits of upper vec a
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits upper of vec a into t5
	   sw $t5, 4($t0)				#store second 8 bits of uppper vec a into memory
	   sll $t5, $a0, 16				#shift to clear bits higher than third 8 bits of upper vec a
	   srl $t5, $t5, 24				#shift to clear bits and store third 8 bits of upper vec a into t5
	   sw $t5, 8($t0)				#store third 8 bits of upper vec a into memory
	   sll $t5, $a0, 24				#shift to clear bits higher than last 8 bits of upper vec a
	   srl $t5, $t5, 24				#shift to clear bits and store last 8 bits of upper vec a into t5
	   sw $t5, 12($t0)				#store last 8 bits of upper vec a into memory
	   
	   srl $t5, $a1, 24				#shift to clear bits and store first 8 bits of lower vec a into t5
	   sw $t5, 16($t0)				#store first 8 bits of lower vec a into memory
	   sll $t5, $a1, 8				#shift to clear bits higher than second 8 bits of lower vec a
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits of lower vec a into t5
	   sw $t5, 20($t0)				#store second 8 bits of lower vec a into memory
	   sll $t5, $a1, 16				#shift to clear bits higher than third 8 bits of lower vec a
	   srl $t5, $t5, 24				#shift to clear bits and store third 8 bits of lower vec a into t5
	   sw $t5, 24($t0)				#store third 8 bits of lower vec a into memory
	   sll $t5, $a1, 24				#shift to clear bits higher than last 8 bits of lower vec a
	   srl $t5, $t5, 24				#shift to clear bits and store last 8 bits of lower vec a into t5
	   sw $t5, 28($t0)				#store last 8 bits of lower vec a into memory
	   
	   srl $t5, $a2, 24				#shift to clear bits and store first 8 bits of upper vec b into t5
	   sw $t5, 0($t1)				#store first 8 bits of upper vec b into memory
	   sll $t5, $a2, 8				#shift to clear bits higher than second 8 bits of upper vec b
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits upper of vec b into t5
	   sw $t5, 4($t1)				#store second 8 bits of uppper vec b into memory
	   sll $t5, $a2, 16				#shift to clear bits higher than second 8 bits of upper vec b
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits upper of vec b into t5
	   sw $t5, 8($t1)				#store third 8 bits of uppper vec b into memory
	   sll $t5, $a2, 24				#shift to clear bits higher than second 8 bits of upper vec b	
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits of upper vec b into t5
	   sw $t5, 12($t1)				#store last 8 bits of uppper vec b into memory
	   						
	   srl $t5, $a3, 24				#shift to clear bits and store first 8 bits of lower vec b into t5	
	   sw $t5, 16($t1)				#store first 8 bits of lower vec b into memory
	   sll $t5, $a3, 8				#shift to clear bits higher than second 8 bits of lower vec b
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits lower of vec b into t5
	   sw $t5, 20($t1)				#store second 8 bits of lower vec b into memory	
	   sll $t5, $a3, 16				#shift to clear bits higher than third 8 bits of lower vec b
	   srl $t5, $t5, 24				#shift to clear bits and store third 8 bits lower of vec b into t5
	   sw $t5, 24($t1)				#store third 8 bits of lower vec b into memory	
	   sll $t5, $a3, 24				#shift to clear bits higher than last 8 bits of lower vec b
	   srl $t5, $t5, 24				#shift to clear bits and store last 8 bits of lower vec b into t5
	   sw $t5, 28($t1)				#store last 8 bits of lower vec b into memory	
	   
	   add $t1, $t1, 32 				#load t1 with memory location 0x10010040 to store vec c
	   srl $t5, $t8, 16				#shift to clear bits and store first 16 bits of upper vec c
	   sw $t5, 0($t1)				#store first 16 bits of upper vec c into memory
	   sll $t5, $t8, 16				#shift to clear bits higher than second 16 bits of upper vec c
	   srl $t5, $t5, 16				#shift to clear bits and store second 16 bits of upper vec c into t5
	   sw $t5, 4($t1)				#store second 16 bits of upper vec c into memory
	   
	   srl $t5, $t9, 16				#shift to clear bits and store first 16 bits of lower vec c
	   sw $t5, 8($t1)				#store first 16 bits of lower vec c into memory
	   sll $t5, $t9, 16				#shift to clear bits higher than second 16 bits of lower vec c
	   srl $t5, $t5, 16				#shift to clear bits and store second 16 bits of lower vec c into t5
	   sw $t5, 12($t1)				#store second 16 bits of lower vec c into memory
	   
	   la $t0, 0x10010000				#initialize t0 with memory location 0x10010000 to load vec a
	   la $t1, 0x10010020				#initialize t1 with memory location 0x10010020 to store vec b
	   la $t2, 0x10010040				#initialize t2 with memory location 0x10010040 to store vec c
	   
	   lw $t3, 0($t0) 				#load first 8 bits of upper vec a into t3
	   lw $t4, 0($t1)				#load first 8 bits of upper vec b into t4
	   lw $t7, 0($t2)				#load first 16 bits of upper vec c into t7
	   sll $t7, $t7, 16				#shift from lower 16 bits to upper 16 bits
	   mul $a0, $t4, $t3				#multiply first 8 bits from vec a and b and store into a0
	   sll $a0, $a0, 16				#shift from lower 16 bits to upper 16 bits
	   lw $t3, 4($t0) 				#load second 8 bits of upper vec a into t3
	   lw $t4, 4($t1)				#load second 8 bits of upper vec b into t4
	   mul $a1, $t4, $t3				#multiply second 8 bits from vec a and b and store into a1
	   sll $a1, $a1, 16				#shift from lower 16 bits to upper 16 bits
	   addu $a0, $a0, $a1				#add the products of the first and second 8 bits from vec a and b
	   addu $t7, $t7, $a0				#move sum to t7
	   sltu $t8, $t7, $a0				#set t8 to 1 if there is overflow
	   add $t5, $t7, $zero				#move sum to t5
	   beq $t8, $zero, noCarry1			#branch if no carry
	   addi $t5, $zero, 0xFFFF0000			#if carry, set result of sum to 0xFFFF0000
	   
noCarry1:   
	   lw $t3, 8($t0) 				#load third 8 bits of upper vec a into t3
	   lw $t4, 8($t1)				#load third 8 bits of upper vec b into t4
	   lw $t7, 4($t2)				#load second 16 bits of upper vec c into t7
	   sll $t7, $t7, 16				#shift from lower 16 bits to upper 16 bits
	   mul $a0, $t4, $t3				#multiply third 8 bits from vec a and b and store into a0
	   sll $a0, $a0, 16				#shift from lower 16 bits to upper 16 bits
	   lw $t3, 12($t0) 				#load last 8 bits of upper vec a into t3
	   lw $t4, 12($t1)				#load last 8 bits of upper vec b into t4
	   mul $a1, $t4, $t3				#multiply last 8 bits from vec a and b and store into a1
	   sll $a1, $a1, 16				#shift from lower 16 bits to upper 16 bits
	   addu $a0, $a0, $a1				#add the products of the third and last 8 bits from vec a and b
	   addu $t7, $t7, $a0				#move sum to t7
	   sltu $t8, $t7, $a0				#set t8 to 1 if there is overflow
	   srl $t7, $t7, 16				#shift from upper 16 bits to lower 16 bits
	   add $t5, $t5, $t7				#move sum to t5
	   beq $t8, $zero, noCarry2			#branch if no carry
	   addi $t5, $t5, 0x0000FFFF			#if carry, set result of sum to 0x0000FFFF
	   						
noCarry2:						
	   lw $t3, 16($t0) 				#load first 8 bits of lower vec a into t3
	   lw $t4, 16($t1)				#load first 8 bits of lower vec b into t4
	   lw $t7, 8($t2)				#load first 16 bits of lower vec c into t7
	   sll $t7, $t7, 16				#shift from lower 16 bits to lower 16 bits
	   mul $a0, $t4, $t3				#multiply first 8 bits from vec a and b and store into a0
	   sll $a0, $a0, 16				#shift from lower 16 bits to lower 16 bits
	   lw $t3, 20($t0) 				#load second 8 bits of lower vec a into t3
	   lw $t4, 20($t1)				#load second 8 bits of lower vec b into t4
	   mul $a1, $t4, $t3				#multiply second 8 bits from vec a and b and store into a1
	   sll $a1, $a1, 16				#shift from lower 16 bits to lower 16 bits
	   addu $a0, $a0, $a1				#add the products of the first and second 8 bits from vec a and b
	   addu $t7, $t7, $a0				#move sum to t7
	   sltu $t8, $t7, $a0				#set t8 to 1 if there is overflow
	   add $t6, $t7, $zero				#move sum to t6
	   beq $t8, $zero, noCarry3			#branch if no carry
	   addi $t6, $zero, 0xFFFF0000			#if carry, set result of sum to 0xFFFF0000
	   
noCarry3:   
	   lw $t3, 24($t0) 				#load third 8 bits of lower vec a into t3
	   lw $t4, 24($t1)				#load third 8 bits of lower vec b into t4
	   lw $t7, 12($t2)				#load second 16 bits of lower vec c into t7
	   sll $t7, $t7, 16				#shift from lower 16 bits to lower 16 bits
	   mul $a0, $t4, $t3				#multiply third 8 bits from vec a and b and store into a0
	   sll $a0, $a0, 16				#shift from lower 16 bits to lower 16 bits
	   lw $t3, 28($t0) 				#load last 8 bits of lower vec a into t3
	   lw $t4, 28($t1)				#load last 8 bits of lower vec b into t4
	   mul $a1, $t4, $t3				#multiply last 8 bits from vec a and b and store into a1
	   sll $a1, $a1, 16				#shift from lower 16 bits to lower 16 bits
	   addu $a0, $a0, $a1				#add the products of the third and last 8 bits from vec a and b
	   addu $t7, $t7, $a0				#move sum to t7
	   sltu $t8, $t7, $a0				#set t8 to 1 if there is overflow
	   srl $t7, $t7, 16				#shift from upper 16 bits to lower 16 bits
	   add $t6, $t6, $t7				#move sum to t6
	   beq $t8, $zero, noCarry4			#branch if no carry
	   addi $t6, $t6, 0x0000FFFF			#if carry, set result of sum to 0x0000FFFF
noCarry4:   

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
        
                      
