        .data
a:      .dword  9,8,0,1,0,5,3,1,2,0
tam:    .dword 10		; Tamaño del vector
cont0:  .dword 0        ; Número de componentes == 0

        .text
start:	
        ld r5, tam(r0); Registro que almacenará el tamaño
        ld r15, cont0(r0) ; Registro que almacenará el contador

loop:
        ld r10, a(r7) ; Posición r7 del vector
        dadd r1, r1, #1 ; Número de iteraciones
        beqz r10, extra
        dadd r7, r7, #8 ; Pasa al siguiente elemento
        bne r1, r5, loop ; Niter != tam -> Go to loop
        sd r15, cont0(r0)
        trap 0
extra:
        dadd r15, r15, #1 ; Añade 1 al contador
        dadd r7, r7, #8 ; Pasa al siguiente elemento
        bne r1, r5, loop ; Niter != tam -> Go to loop
        sd r15, cont0(r0)
	trap 0