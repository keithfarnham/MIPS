#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        Vec_Merge_Pack.asm
# Version:          1.0
# Date:             April 28, 2015  
# Programmer:       Keith Farnham, Victor Tran 
#
# Description: Each high element of the result vector d is the truncation of the corresponding wider element of vector a. 
#	       Each low element of the result is the truncation of the corresponding wider element of vector b. 
#
# Register useage:  $a0-$a3, $t0-$t2, $t5, $t6, $t8, $v0
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
	   li $a1, 0xAE5FC041				#initialize a1 with lower bits of vec a
	   li $a2, 0x52F3A415				#initialize a0 with upper bits of vec b
	   li $a3, 0xA657C849				#initialize a1 with lower bits of vec b	
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
	   
	   lw $t2, 0($t0) 				#load first 8 bits of vec a to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   add $t5, $t5, $t2				#move and store result of t2 to t5
	    
	   lw $t2, 04($t0) 				#load second 8 bits of vec a to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit 
	   srl $t2, $t2, 04				#shift t2 to correct position 
	   add $t5, $t5, $t2				#move and store result of t2 to t5
	    
	   lw $t2, 08($t0) 				#load third 8 bits of vec a to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 08				#shift t2 to correct position 
	   add $t5, $t5, $t2 				#move and store result of t2 to t5
	
	   lw $t2, 12($t0) 				#load fourth 8 bits of vec a to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 12				#shift t2 to correct position
	   add $t5, $t5, $t2				#move and store result of t2 to t5
	 
	   lw $t2, 16($t0) 				#load fifth 8 bits of vec a to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 16				#shift t2 to correct position
	   add $t5, $t5, $t2				#move and store result of t2 to t5
	  
	   lw $t2, 20($t0)				#load sixth 8 bits of vec a to t2 
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 20				#shift t2 to correct position
	   add $t5, $t5, $t2 				#move and store result of t2 to t5
	   
	   lw $t2, 24($t0)				#load seventh 8 bits of vec a to t2 
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 24				#shift t2 to correct position
	   add $t5, $t5, $t2				#move and store result of t2 to t5
	   
	   lw $t2, 28($t0) 				#load eighth 8 bits of vec a to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 28				#shift t2 to correct position
	   add $t5, $t5, $t2				#move and store result of t2 to t5
	  
	   lw $t2, 0($t1) 				#load first 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   add $t6, $t6, $t2				#move and store result of t2 to t6
	  			
	   lw $t2, 04($t1) 				#load second 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit	
	   srl $t2, $t2, 04				#shift t2 to correct position
	   add $t6, $t6, $t2				#move and store result of t2 to t6
	   
	   lw $t2, 08($t1) 				#load third 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 08				#shift t2 to correct position
	   add $t6, $t6, $t2				#move and store result of t2 to t6
	   
	   lw $t2, 12($t1) 				#load fourth 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 12				#shift t2 to correct position
	   add $t6, $t6, $t2				#move and store result of t2 to t6
	 
	   lw $t2, 16($t1) 				#load fifth 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 16				#shift t2 to correct position
	   add $t6, $t6, $t2				#move and store reuslt of t2 to t6
	 =
	   lw $t2, 20($t1) 				#load sixth 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 20				#shift t2 to correct position
	   add $t6, $t6, $t2				#move and store result of t2 to t6
	  
	   lw $t2, 24($t1) 				#load seventh 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 24				#shift t2 to correct position
	   add $t6, $t6, $t2				#move and store result of t2 to t6
	   
	   lw $t2, 28($t1) 				#load eigthth 8 bits of vec b to t2
	   sll $t2, $t2, 28				#shift t2 to left most bit
	   srl $t2, $t2, 28				#shift t2 to correct position 
	   add $t6, $t6, $t2				#move and store result of t2 to t6

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
