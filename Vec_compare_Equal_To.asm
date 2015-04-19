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

main:      
	   la $t0, array_1 				#load t0 with memory location 0x10010000 to store vec a
	   add $t1, $t0, 32 				#load t1 with memory location 0x10010020 to store vec b
	   li $a0, 0x5AFB6C1D				#initialize a0 with upper bits of vec a
	   li $a1, 0xA65FC040				#initialize a1 with lower bits of vec a
	   li $a2, 0x52FBA415				#initialize a0 with upper bits of vec b
	   li $a3, 0xAE5FC841				#initialize a1 with lower bits of vec b
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
	   
	  lw $t2, 0($t0) 				#load first 8 bits of vec a into t2
	   lw $t3, 0($t1)				#load first 8 bits of vec b into t3
	   beq $t2, $t3, else				#branch if equal to else
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare1
else:	   addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare1	   				#jump to compare1
compare1:  
	   sll $t4, $t4, 24				#shift result in t4 to first 24 bits
	   add $t5, $t5, $t4				#move and store result of t4 to t5
	   lw $t2, 4($t0) 				#load second 8 bits of vec a into t2
	   lw $t3, 4($t1)				#load second 8 bits of vec b into t3
	   beq $t2, $t3, else1				#branch if equal to else1
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00 
	   j compare2					#jump to compare2
else1: 	   addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare2 					#jump to compare2
compare2:  
	   sll $t4, $t4, 16				#shift result of t4 to first 16 bits
	   add $t5, $t5, $t4	 			#move and store result of t4 to t5
	   lw $t2, 8($t0) 				#load third 8 bits of vec a into t2
	   lw $t3, 8($t1)				#load third 8 bits of vec b into t3
	   beq $t2, $t3, else2				#branch if equal to else2
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare3					#jump to compare3
else2: 	   addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare3					#jump to compare3
compare3: 
	   sll $t4, $t4, 08				#shift result of t4 to first 8 bits
	   add $t5, $t5, $t4				#move and store result of t4 into t5
	   lw $t2, 12($t0) 				#load fourth 8 bits of vec a into t2
	   lw $t3, 12($t1)				#load fourth 8 bits of vec a into t3
	   beq $t2, $t3, else3				#branch if equal to else3
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare4					#jump to compare4
else3: 	   addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare4					#jump to compare4
compare4: 
	   add $t5, $t5, $t4				#move and store result into t5
	   lw $t2, 16($t0) 				#load fifth 8 bits of vec a into t2
	   lw $t3, 16($t1)				#load fifth 8 bits of vec b into t3
	   beq $t2, $t3, else4				#branch if equal to else4
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare5					#jump to compare5
else4:     addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare5					#jump to compare5
compare5: 
	   sll $t4, $t4, 24				#shift result of t4 to first 24 bits
	   add $t6, $t6, $t4				#move and store result of t4 to t6
	   lw $t2, 20($t0) 				#load sixth 8 bits of vec a into t2
	   lw $t3, 20($t1)				#load sixth 8 bits of vec b into t3
	   beq $t2, $t3, else5				#branch if equal to else5
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare6					#jump to compare6
else5:     addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare6					#jump to compare6
compare6: 
	   sll $t4, $t4, 16				#shift result of t4 to first 16 bits
	   add $t6, $t6, $t4	 			#move and store result of t4 to t6
	   lw $t2, 24($t0) 				#load seventh 8 bits of vec a into t2
	   lw $t3, 24($t1)				#load seventh 8 bits of vec b into t3
	   beq $t2, $t3, else6				#branch if equal to else 6
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare7					#jump to compare7
else6:     addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare7					#jump to compare7
compare7:  sll $t4, $t4, 08				#shift result of t4 to first 8 bits
	   add $t6, $t6, $t4	 			#move and store result of t4 to t6
	   lw $t2, 28($t0) 				#load eighth 8 bits of vec a into t2
	   lw $t3, 28($t1)				#load eighth 8 bits of vec b into t3
	   beq $t2, $t3, else7				#branch if equal to else7
	   addi $t4, $zero, 0x00			#if not equal, set t4 to 0x00
	   j compare8					#jump to compare8
else7:     addi $t4, $zero, 0x000000FF			#if equal add 0xFF to t4
	   j compare8					#jump to compare8
compare8:  add $t6, $t6, $t4				#move and store result of t6 to t4
	  
	   #LOWER BITS SAVED INTO $t6 UPPER BITS SAVED INTO $t5

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
	
        
           
