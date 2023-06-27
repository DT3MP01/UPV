*version 9.1 345874382
u 59
V? 4
M? 3
C? 2
@libraries
@analysis
.DC 1 0 0 0 1 1
+ 0 0 Ve
+ 0 4 0
+ 0 5 5
+ 0 6 0.01
.TRAN 1 0 0 0
+0 0ns
+1 1500ns
.LIB C:\Users\david\Downloads\archivospract8\pract8.lib
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
pageloc 1 0 3020 
@status
n 0 119:04:20:17:50:32;1558367432 e 
s 2832 119:04:20:17:50:32;1558367432 e 
*page 1 0 970 720 iA
@ports
port 6 GND_ANALOG 170 170 h
port 3 GND_ANALOG 390 270 h
port 4 GND_ANALOG 590 270 h
port 5 GND_ANALOG 790 270 h
port 2 GND_ANALOG 170 270 h
@parts
part 12 MbreakP 410 80 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M2
a 0 ap 9 0 5 10 hln 100 REFDES=M2
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakP-X
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
part 11 MbreakN 400 210 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=1u
part 9 VDC 170 100 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDD
a 1 xp 9 0 24 7 hcn 100 REFDES=VDD
a 1 u 13 0 -11 18 hcn 100 DC=5V
part 58 VPULSE 170 230 h
a 1 u 0 0 0 0 hcn 100 DC=0
a 1 u 0 0 0 0 hcn 100 AC=0
a 1 u 0 0 0 0 hcn 100 V1=0
a 1 u 0 0 0 0 hcn 100 V2=5
a 1 u 0 0 0 0 hcn 100 TD=200n
a 1 u 0 0 0 0 hcn 100 TR=10n
a 1 u 0 0 0 0 hcn 100 TF=10n
a 1 u 0 0 0 0 hcn 100 PW=700n
a 0 x 0:13 0 0 0 hln 100 PKGREF=Ve
a 1 xp 9 0 20 10 hcn 100 REFDES=Ve
part 27 c 790 200 v
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 20 40 hln 100 VALUE=10p
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 8
s 170 170 170 140 7
w 14
a 0 up 0:33 0 0 0 hln 100 V=
s 430 230 430 270 13
s 430 270 390 270 15
a 0 up 33 0 410 269 hct 100 V=
w 18
a 0 up 0:33 0 0 0 hln 100 V=
s 440 230 590 230 17
a 0 up 33 0 515 229 hct 100 V=
s 590 230 590 270 19
w 30
a 0 up 0:33 0 0 0 hln 100 V=
s 790 200 790 270 29
a 0 up 33 0 792 235 hlt 100 V=
w 22
a 0 up 0:33 0 0 0 hln 100 V=
s 430 190 430 150 21
s 430 150 440 150 23
s 790 150 790 170 25
s 790 170 790 180 28
s 440 150 790 150 39
a 0 up 33 0 615 149 hct 100 V=
s 440 100 440 150 37
w 41
a 0 up 0:33 0 0 0 hln 100 V=
s 450 100 480 100 40
s 480 100 480 30 42
s 480 30 440 30 44
s 440 60 440 30 46
s 440 30 170 30 49
a 0 up 33 0 305 29 hct 100 V=
s 170 30 170 100 51
w 54
a 0 up 0:33 0 0 0 hln 100 V=
s 170 230 170 200 53
s 400 210 350 210 31
s 350 210 350 200 33
s 350 80 410 80 35
s 350 200 350 80 57
s 170 200 350 200 55
a 0 up 33 0 260 199 hct 100 V=
@junction
j 170 170
+ s 6
+ w 8
j 170 140
+ p 9 -
+ w 8
j 430 230
+ p 11 s
+ w 14
j 390 270
+ s 3
+ w 14
j 440 230
+ p 11 b
+ w 18
j 590 270
+ s 4
+ w 18
j 430 190
+ p 11 d
+ w 22
j 790 170
+ p 27 2
+ w 22
j 790 200
+ p 27 1
+ w 30
j 790 270
+ s 5
+ w 30
j 440 150
+ w 22
+ w 22
j 440 30
+ w 41
+ w 41
j 170 100
+ p 9 +
+ w 41
j 400 210
+ p 11 g
+ w 54
j 350 200
+ w 54
+ w 54
j 410 80
+ p 12 g
+ w 54
j 440 100
+ p 12 s
+ w 22
j 450 100
+ p 12 b
+ w 41
j 440 60
+ p 12 d
+ w 41
j 170 270
+ p 58 -
+ s 2
j 170 230
+ p 58 +
+ w 54
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
