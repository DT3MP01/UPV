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
	
	# Carga dir base teclado
	la $t0, 0xffff0000
	li $s0, 0x2E

espera: # Espera bit R == 1
	lw $t1,0($t0)
	andi $t1,$t1,1
	beqz $t1, espera
	

### A COMPLETAR: lee el registro de datos del teclado

	li $v0, 1
	lb $a0,4($t0) ## lee el registro de datos del teclado
	syscall
	bne $s0, $a0, espera
	
	# exit
	li $v0, 10
	syscall			

	.end