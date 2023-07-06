          .globl __start
          .data 0x10000000
demana:   .asciiz "Escriviu-me alguna cosa: "
escrito:  .asciiz "Ha Escrito: "
cadena:   .space 80             
longitud: .asciiz "La Longitud es: "
          .text 0x00400000
__start:  la $a0, demana        
          la $a1, cadena        
          li $a2, 80            
          jal InputS


		la $a0, escrito 	
		la $a1,cadena
		jal PropmtS
		  
		
		
          li $v0,10
          syscall

InputS:   li $v0, 4
          syscall
          li $v0, 8
          move $a0, $a1
          move $a1, $a2
          syscall
          jr $ra
		  
PropmtS:   li $v0, 4
          syscall
		  add $a0 ,$a1,$zero
          li $v0, 4
          syscall
          jr $ra
		  
 StrLength:
		  li $v0, 4
          syscall
bucle:		  
		  li $t0,0
		  lb $t1,$t0($a1)
		  addi $t0,1
		  bne $t1, $zero, bucle	  
		  
		  li $v0, 1
		  move $a0,$t1
		  syscall
		  jr $ra