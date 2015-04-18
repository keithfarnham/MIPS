#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        341_proj1b.asm
# Version:          1.0
# Date:             Feb. 25, 2015  
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


	   la $t0, array_1 				#load t0 with memory location 0x10010000 to store vec a
	   add $t1, $t0, 32 				#load t1 with memory location 0x10010020 to store vec b
	   li $a0, 0x233C475D				#initialize a0 with upper bits of vec a
	   li $a1, 0x087F196F				#initialize a1 with lower bits of vec a
	   li $a2, 0x981963C5				#initialize a2 with upper bits of vec b
	   li $a3, 0x5E80B36E				#initialize a3 with lower bits of vec b
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
	   
	   srl $t8, $a2, 24				#shift to clear bits and store first 8 bits of upper vec b into t8
	   sw $t8, 0($t1)				#store first 8 bits of upper vec b into memory
	   sll $t8, $a2, 8				#shift to clear bits higher than second 8 bits of upper vec b
	   srl $t8, $t8, 24				#shift to clear bits and store second 8 bits upper of vec b into t8
	   sw $t8, 4($t1)				#store second 8 bits of uppper vec b into memory
	   sll $t8, $a2, 16				#shift to clear bits higher than second 8 bits of upper vec b
	   srl $t8, $t8, 24				#shift to clear bits and store second 8 bits upper of vec b into t8
	   sw $t8, 8($t1)				#store third 8 bits of uppper vec b into memory
	   sll $t8, $a2, 24				#shift to clear bits higher than second 8 bits of upper vec b	
	   srl $t8, $t8, 24				#shift to clear bits and store second 8 bits of upper vec b into t8
	   sw $t8, 12($t1)				#store last 8 bits of uppper vec b into memory
	   						
	   srl $t8, $a3, 24				#shift to clear bits and store first 8 bits of lower vec b into t8	
	   sw $t8, 16($t1)				#store first 8 bits of lower vec b into memory
	   sll $t8, $a3, 8				#shift to clear bits higher than second 8 bits of lower vec b
	   srl $t8, $t8, 24				#shift to clear bits and store second 8 bits lower of vec b into t8
	   sw $t8, 20($t1)				#store second 8 bits of lower vec b into memory	
	   sll $t8, $a3, 16				#shift to clear bits higher than third 8 bits of lower vec b
	   srl $t8, $t8, 24				#shift to clear bits and store third 8 bits lower of vec b into t8
	   sw $t8, 24($t1)				#store third 8 bits of lower vec b into memory	
	   sll $t8, $a3, 24				#shift to clear bits higher than last 8 bits of lower vec b
	   srl $t8, $t8, 24				#shift to clear bits and store last 8 bits of lower vec b into t8
	   sw $t8, 28($t1)				#store last 8 bits of lower vec b into memory	
	   
	   lw $t2, 0($t1) 		#load array slot 0 of $t0 into $t2
	   lw $t3, 0($t0)		#load array slot 0 of $t1 into $t3
	   sll $t2, $t2, 24		#shift $t2 value left to highest bit
	   sll $t3, $t3, 24		#shift $t3 value left to highest bit
	   addu $t5, $t2, $t3		#add two values and store in $t5
	   sltu $t4, $t5, $t2		#set carry flag
	   beq $t4, $zero, noCarry1	#branch if no carry
	   addi $t5, $zero, 0xFF000000	#if carry, set value to FF
	   
noCarry1:   
	   lw $t2, 4($t1) 
	   lw $t3, 4($t0)	
	   sll $t2, $t2, 24
	   sll $t3, $t3, 24
	   addu $t7, $t2, $t3
	   sltu $t4, $t7, $t2
	   beq $t4, $zero, noCarry2
	   addi $t7, $zero, 0xFF000000
noCarry2:  
	   srl $t7, $t7, 8
	   add $t5, $t5, $t7	 
	   lw $t2, 8($t1) 
	   lw $t3, 8($t0)	
	   sll $t2, $t2, 24
	   sll $t3, $t3, 24
	   addu $t7, $t2, $t3
	   sltu $t4, $t7, $t2
	   beq $t4, $zero, noCarry3
	   addi $t7, $zero, 0xFF000000
noCarry3:  
	   srl $t7, $t7, 16
	   add $t5, $t5, $t7	 
	   lw $t2, 12($t1) 
	   lw $t3, 12($t0)	
	   sll $t2, $t2, 24
	   sll $t3, $t3, 24
	   addu $t7, $t2, $t3
	   sltu $t4, $t7, $t2
	   beq $t4, $zero, noCarry4
	   addi $t7, $zero, 0xFF000000
noCarry4:  
	   srl $t7, $t7, 24
	   add $t5, $t5, $t7	
 	   lw $t2, 16($t1) 		#load array slot 0 of $t0 into $t2
	   lw $t3, 16($t0)		#load array slot 0 of $t1 into $t3
	   sll $t2, $t2, 24		#shift $t2 value left to highest bit
	   sll $t3, $t3, 24		#shift $t3 value left to highest bit
	   addu $t6, $t2, $t3		#add two values and store in $t5
	   sltu $t4, $t6, $t2		#set carry flag
	   beq $t4, $zero, noCarry5	#branch if no carry
	   addi $t5, $zero, 0xFF000000	#if carry, set value to FF
	   
noCarry5:   
	   srl $t7, $t7, 24
	   add $t6, $t6, $t7
	   lw $t2, 20($t1) 
	   lw $t3, 20($t0)	
	   sll $t2, $t2, 24
	   sll $t3, $t3, 24
	   addu $t7, $t2, $t3
	   sltu $t4, $t7, $t2
	   beq $t4, $zero, noCarry6
	   addi $t7, $zero, 0xFF000000
noCarry6:  
	   srl $t7, $t7, 8
	   add $t6, $t6, $t7	 
	   lw $t2, 24($t1) 
	   lw $t3, 24($t0)	
	   sll $t2, $t2, 24
	   sll $t3, $t3, 24
	   addu $t7, $t2, $t3
	   sltu $t4, $t7, $t2
	   beq $t4, $zero, noCarry7
	   addi $t7, $zero, 0xFF000000
noCarry7:  
	   srl $t7, $t7, 16
	   add $t6, $t6, $t7	 
	   lw $t2, 28($t1) 
	   lw $t3, 28($t0)	
	   sll $t2, $t2, 24
	   sll $t3, $t3, 24
	   addu $t7, $t2, $t3
	   sltu $t4, $t7, $t2
	   beq $t4, $zero, noCarry8
	   addi $t7, $zero, 0xFF000000
noCarry8:  
	   srl $t7, $t7, 24
	   add $t6, $t6, $t7	
	   
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
        
                      
