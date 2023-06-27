*version 9.1 381387105
u 103
M? 8
V? 2
@libraries
@analysis
.TRAN 1 0 0 0
+0 1us
+1 1u
.LIB C:\Users\david\Downloads\archivospract7\ej2\ej2pract7.lib
.STMLIB ej2pract7.stl
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
pageloc 1 0 4261 
@status
n 0 119:04:20:15:40:18;1558359618 e 
s 2832 119:04:20:15:40:21;1558359621 e 
*page 1 0 970 720 iA
@ports
port 2 EGND 390 280 h
port 4 IF_IN 220 240 h
a 1 xr 3 0 19 8 hcn 100 LABEL=B
port 6 IF_IN 450 220 h
a 1 xr 3 0 19 8 hcn 100 LABEL=C
port 3 IF_IN 300 170 h
a 1 xr 3 0 19 8 hcn 100 LABEL=A
port 7 IF_IN 240 80 h
a 1 xr 3 0 19 8 hcn 100 LABEL=A
a 0 s 0:13 0 0 0 hln 100 STIMULUS=A
port 5 IF_IN 380 150 u
a 1 xr 3 0 19 8 hcn 100 LABEL=F
a 0 s 0:13 0 0 0 hln 100 STIMULUS=F
port 57 IF_IN 350 100 h
a 1 xr 3 0 19 8 hcn 100 LABEL=B
a 0 s 0:13 0 0 0 hln 100 STIMULUS=B
port 8 IF_IN 350 50 h
a 1 xr 3 0 19 8 hcn 100 LABEL=C
a 0 s 0:13 0 0 0 hln 100 STIMULUS=C
@parts
part 92 VDC 700 260 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDD
a 1 xp 9 0 24 7 hcn 100 REFDES=VDD
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 9 MbreakN 240 240 h
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X
part 11 MbreakN 450 220 h
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M3
a 0 ap 9 0 5 10 hln 100 REFDES=M3
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X1
part 41 MbreakN 300 170 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M7
a 0 ap 9 0 5 10 hln 100 REFDES=M7
a 0 u 0 0 0 0 hln 100 W=1u
a 0 u 0 0 0 0 hln 100 L=1u
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X2
part 12 MbreakP 240 80 h
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M4
a 0 ap 9 0 5 10 hln 100 REFDES=M4
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakP-X
part 13 MbreakP 370 100 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M5
a 0 ap 9 0 5 10 hln 100 REFDES=M5
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakP-X1
part 14 MbreakP 370 50 h
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
a 0 a 0:13 0 0 0 hln 100 PKGREF=M6
a 0 ap 9 0 5 10 hln 100 REFDES=M6
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakP-X2
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 16
s 220 240 240 240 15
s 240 240 250 240 17
w 27
s 270 220 270 200 26
s 270 200 330 200 40
s 330 200 480 200 44
s 330 190 330 200 42
w 65
s 350 50 370 50 64
s 370 50 380 50 66
w 68
s 350 100 370 100 67
w 78
s 400 70 400 80 77
s 400 80 400 90 79
w 86
s 400 120 400 130 85
s 400 130 370 130 87
s 270 100 270 150 52
s 270 150 330 150 54
s 330 150 370 150 56
s 370 150 380 150 91
s 370 130 370 150 89
w 94
s 700 300 430 300 93
s 340 190 530 190 45
s 530 190 530 270 47
s 490 240 490 250 34
s 480 240 480 250 30
s 280 260 390 260 22
s 270 260 270 280 18
s 270 280 390 280 20
s 390 260 390 280 24
s 480 280 430 280 32
s 480 250 480 270 38
s 490 250 480 250 36
s 480 270 480 280 51
s 530 270 480 270 49
s 430 280 390 280 97
s 430 300 430 280 95
w 99
s 280 100 290 100 98
s 410 120 540 120 80
s 410 70 450 70 72
s 270 60 270 10 58
s 270 10 290 10 60
s 700 10 700 260 62
s 400 10 450 10 71
s 400 30 400 10 69
s 450 10 540 10 76
s 450 70 450 10 74
s 540 10 700 10 84
s 540 120 540 10 82
s 290 10 400 10 102
s 290 100 290 10 100
@junction
j 240 240
+ p 9 g
+ w 16
j 220 240
+ s 4
+ w 16
j 270 220
+ p 9 d
+ w 27
j 480 250
+ w 94
+ w 94
j 330 200
+ w 27
+ w 27
j 480 270
+ w 94
+ w 94
j 370 50
+ p 14 g
+ w 65
j 350 50
+ s 8
+ w 65
j 370 100
+ p 13 g
+ w 68
j 350 100
+ s 57
+ w 68
j 400 10
+ w 99
+ w 99
j 450 10
+ w 99
+ w 99
j 400 80
+ p 13 d
+ w 78
j 400 70
+ p 14 s
+ w 78
j 540 10
+ w 99
+ w 99
j 400 120
+ p 13 s
+ w 86
j 380 150
+ s 5
+ w 86
j 370 150
+ w 86
+ w 86
j 700 300
+ p 92 -
+ w 94
j 280 260
+ p 9 b
+ w 94
j 270 260
+ p 9 s
+ w 94
j 390 280
+ s 2
+ w 94
j 430 280
+ w 94
+ w 94
j 410 120
+ p 13 b
+ w 99
j 410 70
+ p 14 b
+ w 99
j 400 30
+ p 14 d
+ w 99
j 700 260
+ p 92 +
+ w 99
j 290 10
+ w 99
+ w 99
j 480 200
+ p 11 d
+ w 27
j 480 240
+ p 11 s
+ w 94
j 490 240
+ p 11 b
+ w 94
j 450 220
+ s 6
+ p 11 g
j 300 170
+ s 3
+ p 41 g
j 330 190
+ p 41 s
+ w 27
j 340 190
+ p 41 b
+ w 94
j 330 150
+ p 41 d
+ w 86
j 240 80
+ s 7
+ p 12 g
j 270 100
+ p 12 s
+ w 86
j 270 60
+ p 12 d
+ w 99
j 280 100
+ p 12 b
+ w 99
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
