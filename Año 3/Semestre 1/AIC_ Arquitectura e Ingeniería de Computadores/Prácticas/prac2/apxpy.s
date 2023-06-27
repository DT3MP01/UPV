	.data

; Vector x
x: 	.dword 0,1,2,3,4,5,6,7,8,9
	.dword 10,11,12,13,14,15

; Vector y
y:  .dword 100,100,100,100,100,100,100,100,100,100
	.dword 100,100,100,100,100,100

; Vector z
; 16 elementos son 64 bytes
z:  .space 128

; Escalar a
a:  .dword -10

; Código
    .text

start:
	dadd r1,r0,x
	dadd r4,r1,#128 ; 16 * 8, dependencia con anterior
	dadd r2,r0,y
	dadd r3,r0,z
	ld r10,a(r0)

loop:
	ld r12,0(r1)
	dadd r12,r10,r12 ; Dependencia con anterior
	ld r14,0(r2)
	dadd r14,r12,r14 ; Dependencia con anterior
	sd r14,0(r3) ; Dependencia con dos anteriores
	dadd r1,r1,#8
	dadd r2,r2,#8
	dadd r3,r3,#8
	seq r5,r4,r1
	beqz r5,loop ; Dependencia con anterior
	nop
	nop
	trap #0         ; Fin de programa
