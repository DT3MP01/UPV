        ; z = a*x + y
        ; Tama�o de los vectores: 64 palabras
        ; Vector x

	.data
x:      .double 0,1,2,3,4,5,6,7,8,9
        .double 10,11,12,13,14,15,16,17,18,19
        .double 20,21,22,23,24,25,26,27,28,29
        .double 30,31,32,33,34,35,36,37,38,39
        .double 40,41,42,43,44,45,46,47,48,49
        .double 50,51,52,53,54,55,56,57,58,59

	; Vector y
y:      .double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100

        ; Vector z
	; 60 elementos son 480 bytes
z:      .space 480

        ; Escalar a
a:      .double 1

        ; El c�digo
	.text

start:
	dadd r1,r0,y     ; r1 contiene la direccion de y
        dadd r2,r0,z     ; r2 contiene la direccion de z
	dadd r3,r0,x     ; r2 contiene la direccion de x
        l.d f0,a(r0)     ; f0 contiene a
        dadd r4,r1,#480  ; 60 elementos son 480 bytes
loop:	
	l.d f3,0(r3)     ; componente del vector x
	l.d f7,8(r3)     ; componente del vector x
	l.d f11,16(r3)   ; componente del vector x
	l.d f15,24(r3)   ; componente del vector x
	
	l.d f2,0(r1)     ; componente del vector y
	l.d f6,8(r1)     ; componente del vector y
	l.d f10,16(r1)     ; componente del vector y
	l.d f14,24(r1)     ; componente del vector y
	
	mul.d f4,f0,f3
	mul.d f8,f0,f7
	mul.d f12,f0,f11
	mul.d f16,f0,f15
	
	add.d f5,f4,f2
	add.d f9,f8,f6
	add.d f13,f12,f10
	add.d f17,f16,f14
	s.d f5, 0(r2)
	s.d f9, 8(r2)
	s.d f13, 16(r2)
    s.d f17, 24(r2)
    
    dadd r1,r1,#32
    dadd r3,r3,#32
	dsub r5,r4,r1     ; r5 = num elementos (60) - elementos recorridos
    dadd r2,r2,#32
             
    bnez r5,loop

 	trap #0         ; Fin de programa



        


