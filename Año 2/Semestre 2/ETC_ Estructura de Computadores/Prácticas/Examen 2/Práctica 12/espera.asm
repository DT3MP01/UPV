### PROGRAMA BASE PRACTICAS DE ENTRADA/SALIDA MIPS R2000

#-------------------------------------------------#
#
#  PRÁCTICA 12: SINCRONIZACIÓN POR PRUEBA DE ESTADO
# 
#-------------------------------------------------#

# ACTIVIDAD 2:  Añade la instrucción que lee el registro de datos
#               del teclado en el lugar indicado:


#------- Segmento de datos ---------#
	.data		
T1:	.asciiz "Esperando...\n"
T2:	.asciiz "\nFin\n"

#------- Segmento de código ---------#
	.text
    	.globl __start	

__start:
	# Escribe en consola mensaje T1
	li $v0, 4
	la $a0, T1
	syscall	
	
	# Carga dir base teclado
	la $t0, 0xffff0000

espera: # Espera bit R == 1
	lw $t1,0($t0)
	andi $t1,$t1,1
	beqz $t1, espera
	
### A COMPLETAR: lee el registro de datos del teclado
####
	
	# El registro $a1 contendrá el caracter elegido (en este caso, un punto)
	li $a1, 46
	
	# El registro $a2 contendrá una coma para separar los caracteres
	li $a2, 44
	
	# El registro $a3 contendrá una separación
	li $a3, 32
	
	# Leo el registro de datos del teclado
	lw $t2, 0xFFFF0004
	
	# Lo escribo por pantalla
	move $a0, $t2
	li $v0, 11
	syscall
	
	# Escribimos la coma
	move $a0, $a2
	li $v0, 11
	syscall
	
	# Escribimos el espacio
	move $a0, $a3
	li $v0, 11
	syscall
	
	# Comrprueba si caracter != caracter_elegido (.) 
	bne $t2, $a1, espera
	
	# Escribe en consola mensaje T2
	li $v0, 4
	la $a0, T2
	syscall

	# exit
	li $v0, 10
	syscall			

	.end