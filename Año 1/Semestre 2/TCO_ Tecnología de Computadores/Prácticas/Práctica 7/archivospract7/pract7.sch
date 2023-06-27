*version 9.1 32476558
u 106
V? 4
M? 5
@libraries
@analysis
.LIB C:\Users\david\Downloads\archivospract7\pract7.lib
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 4136 
@status
n 0 119:04:20:15:00:17;1558357217 e 
s 0 119:04:20:15:00:18;1558357218 e 
*page 1 0 970 720 iA
@ports
port 2 EGND 110 300 h
port 3 EGND 200 300 h
port 5 EGND 570 300 h
port 4 EGND 420 300 h
port 63 EGND 140 140 h
@parts
part 15 MbreakN 110 120 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X1
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
part 17 MbreakP 420 60 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M3
a 0 ap 9 0 5 10 hln 100 REFDES=M3
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakP-X
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
part 18 MbreakP 530 60 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M4
a 0 ap 9 0 5 10 hln 100 REFDES=M4
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakP-X1
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
part 8 VDC 570 190 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDD
a 1 xp 9 0 24 7 hcn 100 REFDES=VDD
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 16 MbreakN 210 120 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M2
a 0 ap 9 0 5 10 hln 100 REFDES=M2
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
part 7 VDC 200 180 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=VB
a 1 xp 9 0 24 7 hcn 100 REFDES=VB
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 6 VDC 110 180 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=VA
a 1 xp 9 0 24 7 hcn 100 REFDES=VA
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 10
a 0 up 0:33 0 0 0 hln 100 V=
s 110 300 110 220 9
a 0 up 33 0 112 260 hlt 100 V=
w 12
a 0 up 0:33 0 0 0 hln 100 V=
s 200 300 200 220 11
a 0 up 33 0 202 260 hlt 100 V=
w 14
a 0 up 0:33 0 0 0 hln 100 V=
s 570 300 570 230 13
a 0 up 33 0 572 265 hlt 100 V=
w 30
a 0 up 0:33 0 0 0 hln 100 V=
s 150 140 180 140 29
s 180 140 180 60 31
s 180 60 340 60 33
s 250 140 340 140 25
s 420 140 420 300 27
a 0 up 33 0 422 220 hlt 100 V=
s 340 140 420 140 37
s 340 60 340 140 35
w 20
a 0 up 0:33 0 0 0 hln 100 V=
s 110 180 110 160 19
s 110 160 110 120 41
s 110 160 30 160 39
s 30 160 30 20 42
s 30 20 380 20 44
a 0 up 33 0 205 19 hct 100 V=
s 380 20 380 60 46
s 380 60 420 60 48
w 65
a 0 up 0:33 0 0 0 hln 100 V=
s 140 100 160 100 64
s 160 100 160 160 66
s 160 160 240 160 68
a 0 up 33 0 200 159 hct 100 V=
s 240 160 240 140 70
w 82
a 0 up 0:33 0 0 0 hln 100 V=
s 560 40 590 40 81
s 590 40 590 140 83
a 0 up 33 0 592 90 hlt 100 V=
s 450 40 510 40 76
s 460 80 480 80 50
s 480 80 480 130 52
s 480 130 510 130 54
s 570 130 570 140 56
s 510 130 570 130 80
s 510 40 510 130 78
s 570 140 570 190 87
s 590 140 570 140 85
s 570 80 570 130 88
w 91
a 0 up 0:33 0 0 0 hln 100 V=
s 560 80 560 90 90
s 240 100 430 100 72
a 0 up 33 0 335 99 hct 100 V=
s 450 100 450 90 74
s 450 90 450 80 94
s 560 90 450 90 92
s 430 100 450 100 97
s 430 100 430 130 95
w 100
a 0 up 0:33 0 0 0 hln 100 V=
s 530 60 490 60 99
s 490 60 490 170 101
s 200 180 200 170 21
s 200 120 210 120 23
s 200 170 200 120 105
s 490 170 200 170 103
a 0 up 33 0 345 169 hct 100 V=
@junction
j 110 300
+ s 2
+ w 10
j 200 220
+ p 7 -
+ w 12
j 200 300
+ s 3
+ w 12
j 570 300
+ s 5
+ w 14
j 110 120
+ p 15 g
+ w 20
j 150 140
+ p 15 b
+ w 30
j 420 300
+ s 4
+ w 30
j 340 140
+ w 30
+ w 30
j 110 160
+ w 20
+ w 20
j 570 230
+ p 8 -
+ w 14
j 140 140
+ s 63
+ p 15 s
j 140 100
+ p 15 d
+ w 65
j 510 130
+ w 82
+ w 82
j 570 190
+ p 8 +
+ w 82
j 570 140
+ w 82
+ w 82
j 570 130
+ w 82
+ w 82
j 450 90
+ w 91
+ w 91
j 430 100
+ w 91
+ w 91
j 200 180
+ p 7 +
+ w 100
j 200 170
+ w 100
+ w 100
j 420 60
+ p 17 g
+ w 20
j 460 80
+ p 17 b
+ w 82
j 450 80
+ p 17 s
+ w 91
j 450 40
+ p 17 d
+ w 82
j 210 120
+ p 16 g
+ w 100
j 250 140
+ p 16 b
+ w 30
j 240 140
+ p 16 s
+ w 65
j 240 100
+ p 16 d
+ w 91
j 560 40
+ p 18 d
+ w 82
j 570 80
+ p 18 b
+ w 82
j 560 80
+ p 18 s
+ w 91
j 530 60
+ p 18 g
+ w 100
j 110 220
+ p 6 -
+ w 10
j 110 180
+ p 6 +
+ w 20
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 98 t 5 440 115 470 131 0 6
Salida
