#*********************** 3 4 1   T o p   L e v e l   M o d u l e *************************
#
# File name:        341_proj1b.asm
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

	   la $t0, array_1 				#load t0 with memory location 0x10010000 to store vec a
	   add $t1, $t0, 32 				#load t1 with memory location 0x10010020 to store vec b
	   li $a0, 0x120C1A0D				#initialize a0 with upper bits of vec a
	   li $a1, 0x23051912				#initialize a1 with lower bits of vec a
	   li $a2, 0x3D0C104D				#initialize a0 with upper bits of vec b
	   li $a3, 0x057F192B				#initialize a1 with lower bits of vec b
	   li $t8, 0x60091B05				#initialize a0 with upper bits of vec c
	   li $t9, 0x501E0660				#initialize a1 with lower bits of vec c
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
	   srl $t5, $t5, $zero				#initialize t5 to zero
	   
	   la $t0, 0x10010000
	   la $t1, 0x10010020
	   la $t2, 0x10010040
	   
	   lw $t3, 0($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 0($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 0($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   add $t5, $t5, $t3
	   
	   lw $t3, 4($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 4($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 4($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   srl $t3, $t3, 8
	   add $t5, $t5, $t3
	   
	   lw $t3, 8($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 8($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 8($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   srl $t3, $t3, 16
	   add $t5, $t5, $t3
	   
	   lw $t3, 12($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 12($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 12($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   srl $t3, $t3, 24
	   add $t5, $t5, $t3
	   
	   lw $t3, 16($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 16($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 16($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   add $t6, $t6, $t3
	   
	   lw $t3, 20($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 20($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 20($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   srl $t3, $t3, 8
	   add $t6, $t6, $t3

	   lw $t3, 24($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 24($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 24($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   srl $t3, $t3, 16
	   add $t6, $t6, $t3
	   
	   lw $t3, 28($t0) 	#load array slot 0 of $t0 into $t2
	   lw $t4, 28($t1)	#load array slot 0 of $t1 into $t3
	   lw $t7, 28($t2)	
	   mul $t4, $t4, $t3		
	   add $t3, $t4, $t7
	   sll $t3, $t3, 24
	   srl $t3, $t3, 24
	   add $t6, $t6, $t3

	   
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
        
                      
