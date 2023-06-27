		.text 0x00400000 			# Dirección inicio código
		.globl __start 				# Etiqueta global
	__start:
		addi $8, $0, 43 			# Inicializa $8 con 43
		addi $9, $0, 12 			# Inicializa $9 con 12
		div $8, $9 					# Divide $8 entre $9
		mflo $10 					# LO -> $10
		mfhi $11 					# HI -> $11
		.end 					    # Final del programa