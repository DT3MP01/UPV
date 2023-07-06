          .globl __start
          .data 0x10000000
M:        .space 4
Q:		  .space 4
R:		  .space 4
        
          .text 0x00400000
__start:  li $a0,'M'
          la $a1, M
          jal InputV
		  
		  li $a0,'Q'
          la $a1, Q
          jal InputV
		  
		  la $a0, M
		  la $a1, Q
		  la $a2, R
		  jal MultV
	  
		  li $a0,'R'
          la $a1, R
          jal PromptV
		  
          li $v0,10
          syscall

InputV:   li $v0, 11  #Imprimes la M
          syscall		
          li $v0, 11	
          li $a0, '='	
          syscall		# Imprimes el Igual
          li $v0, 5
          syscall 			# Obtienes el entero
          sw $v0, 0($a1)	# Guardas en Memoria el valor introducido
          jr $ra
		  
		  
PromptV:   li $v0, 11  #Imprimes la "R"
          syscall		
          li $v0, 11	
          li $a0, '='	
          syscall		# Imprimes el Igual
		  
          li $v0, 1
          lw $a0, 0($a1)	#Imprimes el valor R guardada en memoria
          syscall
          jr $ra
MultV:
		lw $t0, 0($a0)
		lw $t1, 0($a1)
		li $t2 ,0
		bgez $t1, Mult 
		sub $t1 ,$zero ,$t1
		sub $t0 ,$zero ,$t0
	Mult:
		add $t2,$t2,$t0
		addi $t1,-1	
		bne $t1 ,$0, Mult
	
		sw $t2, 0($a2)
		 jr $ra