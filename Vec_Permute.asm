#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        Vector_Permute.asm
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

main:     
	   la $t0, array_1 				#load t0 with memory location 0x10010000 to store vec a
	   add $t1, $t0, 32 				#load t1 with memory location 0x10010020 to store vec b
	   li $a0, 0xA567013D				#initialize a0 with upper bits of vec a
	   li $a1, 0xAB45393C				#initialize a1 with lower bits of vec a
	   li $a2, 0xEFC54D23				#initialize a2 with upper bits of vec b
	   li $a3, 0x1277AACD				#initialize a3 with lower bits of vec b
	   li $t8, 0x04171002				#initialize t8 with upper bits of vec c
	   li $t9, 0x13050105				#initialize t9 with lower bits of vec c
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
	   srl $t5, $t8, 24				#shift to clear bits and store first 8 bits of upper vec c into t5
	   sw $t5, 0($t1)				#store first 8 bits of upper vec c into memory
	   sll $t5, $t8, 8				#shift to clear bits higher than second 8 bits of upper vec c
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits upper of vec c into t5
	   sw $t5, 4($t1)				#store second 8 bits of uppper vec c into memory
	   sll $t5, $t8, 16				#shift to clear bits higher than second 8 bits of upper vec c
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits upper of vec c into t5
	   sw $t5, 8($t1)				#store third 8 bits of uppper vec c into memory
	   sll $t5, $t8, 24				#shift to clear bits higher than second 8 bits of upper vec c	
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits of upper vec c into t5
	   sw $t5, 12($t1)				#store last 8 bits of uppper vec c into memory
	   						
	   srl $t5, $t9, 24				#shift to clear bits and store first 8 bits of lower vec c into t5	
	   sw $t5, 16($t1)				#store first 8 bits of lower vec c into memory
	   sll $t5, $t9, 8				#shift to clear bits higher than second 8 bits of lower vec c
	   srl $t5, $t5, 24				#shift to clear bits and store second 8 bits lower of vec c into t5
	   sw $t5, 20($t1)				#store second 8 bits of lower vec c into memory	
	   sll $t5, $t9, 16				#shift to clear bits higher than third 8 bits of lower vec c
	   srl $t5, $t5, 24				#shift to clear bits and store third 8 bits lower of vec c into t5
	   sw $t5, 24($t1)				#store third 8 bits of lower vec c into memory	
	   sll $t5, $t9, 24				#shift to clear bits higher than last 8 bits of lower vec c
	   srl $t5, $t5, 24				#shift to clear bits and store last 8 bits of lower vec c into t5
	   sw $t5, 28($t1)				#store last 8 bits of lower vec c into memory	
	   
	   addi $a0, $zero, 24				#set a0 to 24 for shift amount
	   add $a1, $zero, $zero			#initialize a0 to 0
	   add $a3, $zero, $zero			#initialize a3 to 0
	   add $t5, $zero, $zero			#initialize t5 to 0
	   la $t0, 0x10010040				#load address for vec 3 into t0
	   			
loop:	   lw $t2, ($t0)  	     			#load 8 bits of vec c
	   slti $t7, $t2, 0x10				#set t7 to 1 if first 8 bits are less than 10
	   beq $t7, $zero, vecb				#branch to vecb if t7 is 0
	  						#load from vec a
	   la $t1, 0x10010000				#load address for vec a into t1
	   add $a1, $t2, $zero				#move vec c value into a1
	   mul $a1, $a1, 4				#multiply vec c value by 4 for offset
	   add $t1, $t1, $a1				#add offset to t1
	   lw $t3, ($t1)				#load value from vec a and store into t3
	   j bskip					#vec a used, skip vec b
	   
vecb:	   						#load from vec b
	   la $t1, 0x10010020				#load address for vec b into t1
	   subi $t2, $t2, 0x10				#subtract 0x10 from vec c value
	   add $a1, $t2, $zero				#move vec c value into a1
	   mul $a1, $a1, 4				#multiply vec c value by 4 for offset
	   add $t1, $t1, $a1				#add offset to t1
	   lw $t3, ($t1)				#load value from vec b and store into t3

bskip:
	   sllv $t3, $t3, $a0				#shift resulting value by amount a0
	   add $t5, $t5, $t3				#move value into result vec
	   subi $a0, $a0, 8				#decrement a0 by 8
	   addi $t0, $t0, 4				#increment vec c to next memory location
	   addi $a1, $a1, 8				#increment a1 by 8
	   addi $a3, $a3, 1				#increment a3 by 1 for branch
	   beq $a3, 4, lowerbits			#after 4 loops, jump to lower bits
	   j loop					#jump to loop
lowerbits: 
	   addi $a0, $zero, 24				#set a0 to 24 for shift amount
	   add $a1, $zero, $zero			#initialize a0 to 0
	   add $a3, $zero, $zero			#initialize a3 to 0
loop2:
	   lw $t2, ($t0)  	     			#load 8 bits of vec c
	   slti $t7, $t2, 0x10				#set t7 to 1 if first 8 bits are less than 10
	   beq $t7, $zero, vecb2			#branch to vecb if t7 is 0
	   						#load from vec a
	   la $t1, 0x10010000				#load address for vec a into t1
	   add $a1, $t2, $zero				#move vec c value into a1
	   mul $a1, $a1, 4				#multiply vec c value by 4 for offset
	   add $t1, $t1, $a1				#add offset to t1
	   lw $t3, ($t1)				#load value from vec a and store into t3
	   j bskip2					#vec a used, skip vec b
	   
vecb2:	   						#load from vec b
	   la $t1, 0x10010020				#load address for vec b into t1
	   subi $t2, $t2, 0x10				#subtract 0x10 from vec c value
	   add $a1, $t2, $zero				#move vec c value into a1
	   mul $a1, $a1, 4				#multiply vec c value by 4 for offset
	   add $t1, $t1, $a1				#add offset to t1
	   lw $t3, ($t1)				#load value from vec b and store into t3

bskip2:
	   sllv $t3, $t3, $a0				#shift resulting value by amount a0
	   add $t6, $t6, $t3				#move value into result vec
	   subi $a0, $a0, 8				#decrement a0 by 8
	   addi $t0, $t0, 4				#increment vec c to next memory location
	   addi $a1, $a1, 8				#increment a1 by 8
	   addi $a3, $a3, 1				#increment a3 by 1 for branch
	   beq $a3, 4, exit				#after 4 loops, jump to lower bits
	   j loop2					#jump to loop
	   

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
        	
                      
