*version 9.1 1430754716
u 46
V? 4
M? 2
R? 2
? 3
C? 2
@libraries
@analysis
.DC 0 0 0 0 1 1
+ 0 0 Vi
+ 0 4 0
+ 0 5 5
+ 0 6 0.01
.TRAN 1 0 0 0
+0 1ns
+1 120ns
.LIB C:\Users\david\Downloads\archivospract5\pract5.lib
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
pageloc 1 0 3005 
@status
n 0 119:04:19:22:37:10;1558298230 e 
s 2832 119:04:19:22:37:11;1558298231 e 
*page 1 0 970 720 iA
@ports
port 2 EGND 150 290 h
port 4 EGND 650 290 h
port 3 EGND 360 290 h
port 44 EGND 540 280 h
@parts
part 6 VDC 650 200 h
a 1 u 13 0 -11 18 hcn 100 DC=5V
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDD
a 1 xp 9 0 24 7 hcn 100 REFDES=VDD
part 31 VPULSE 150 210 h
a 1 u 0 0 0 0 hcn 100 V1=0
a 1 u 0 0 0 0 hcn 100 V2=5
a 1 u 0 0 0 0 hcn 100 TD=10n
a 1 u 0 0 0 0 hcn 100 TR=2n
a 1 u 0 0 0 0 hcn 100 TF=2n
a 1 u 0 0 0 0 hcn 100 PW=40n
a 1 u 0 0 0 0 hcn 100 PER=100n
a 0 x 0:13 0 0 0 hln 100 PKGREF=Ve
a 1 xp 9 0 20 10 hcn 100 REFDES=Ve
part 7 MbreakN 430 160 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X
a 0 u 0 0 0 0 hln 100 L=1u
a 0 u 0 0 0 0 hln 100 W=2u
part 41 c 510 240 h
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 15 25 hln 100 VALUE=0.1pF
part 26 r 460 120 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=RD
a 0 xp 9 0 15 0 hln 100 REFDES=RD
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 u 13 0 15 25 hln 100 VALUE=90k
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 34 nodeMarker 150 200 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=V1:+
a 0 a 0 0 4 22 hlb 100 LABEL=2
part 32 nodeMarker 490 140 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=0
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 17
a 0 up 0:33 0 0 0 hln 100 V=
s 470 180 470 220 16
s 460 180 470 180 18
s 470 220 360 220 20
a 0 up 33 0 415 219 hct 100 V=
s 360 220 360 290 22
w 28
a 0 up 0:33 0 0 0 hln 100 V=
s 500 120 650 120 27
a 0 up 33 0 575 119 hct 100 V=
s 650 120 650 200 29
w 11
a 0 up 0:33 0 0 0 hln 100 V=
s 650 290 650 240 35
a 0 up 33 0 652 265 hlt 100 V=
w 13
a 0 up 0:33 0 0 0 hln 100 V=
s 150 210 150 200 12
s 150 160 430 160 14
a 0 up 33 0 290 159 hct 100 V=
s 150 200 150 160 36
w 43
a 0 up 0:33 0 0 0 hln 100 V=
s 540 240 540 280 42
a 0 up 33 0 542 260 hlt 100 V=
w 9
a 0 up 0:33 0 0 0 hln 100 V=
s 150 290 150 250 33
a 0 up 33 0 152 270 hlt 100 V=
w 25
a 0 up 0:33 0 0 0 hln 100 V=
s 460 140 460 120 24
a 0 up 33 0 462 130 hlt 100 V=
s 460 140 490 140 37
s 510 140 510 240 39
s 490 140 510 140 45
@junction
j 150 290
+ s 2
+ w 9
j 650 240
+ p 6 -
+ w 11
j 650 290
+ s 4
+ w 11
j 360 290
+ s 3
+ w 17
j 460 120
+ p 26 1
+ w 25
j 500 120
+ p 26 2
+ w 28
j 650 200
+ p 6 +
+ w 28
j 430 160
+ p 7 g
+ w 13
j 470 180
+ p 7 b
+ w 17
j 460 180
+ p 7 s
+ w 17
j 460 140
+ p 7 d
+ w 25
j 150 210
+ p 31 +
+ w 13
j 150 250
+ p 31 -
+ w 9
j 150 200
+ p 34 pin1
+ w 13
j 510 240
+ p 41 1
+ w 25
j 540 240
+ p 41 2
+ w 43
j 540 280
+ s 44
+ w 43
j 490 140
+ p 32 pin1
+ w 25
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
