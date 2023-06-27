*version 9.1 889175433
u 32
M? 2
V? 3
@libraries
@analysis
.DC 1 1 0 0 0 0
+ 0 0 VDS
+ 0 4 0
+ 0 5 10
+ 0 6 0.1
+ 1 0 VGS
+ 1 4 0
+ 1 5 5
+ 1 6 1
.LIB C:\Users\david\Downloads\pract4\pract4.lib
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
pageloc 1 0 1797 
@status
n 0 119:04:20:13:52:20;1558353140 e 
s 2832 119:04:20:13:52:24;1558353144 e 
*page 1 0 970 720 iA
@ports
port 2 EGND 230 320 h
port 4 EGND 390 320 h
port 3 EGND 510 310 h
@parts
part 6 VDC 230 200 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=VGS
a 1 xp 9 0 24 7 hcn 100 REFDES=VGS
a 0 sp 0 0 22 37 hln 100 PART=VDC
part 7 VDC 520 200 h
a 0 x 0:13 0 0 0 hln 100 PKGREF=VDS
a 1 xp 9 0 24 7 hcn 100 REFDES=VDS
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 1 u 13 0 -11 18 hcn 100 DC=10V
part 5 MbreakN 430 150 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=M1
a 0 ap 9 0 5 10 hln 100 REFDES=M1
a 0 u 0 0 0 0 hln 100 L=1u
a 0 sp 13 0 -12 40 hln 100 MODEL=MbreakN-X
a 0 u 0 0 0 0 hln 100 W=2u
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 9
a 0 up 0:33 0 0 0 hln 100 V=
s 230 320 230 240 8
a 0 up 33 0 232 280 hlt 100 V=
w 11
a 0 up 0:33 0 0 0 hln 100 V=
s 230 200 230 150 10
s 230 150 430 150 12
a 0 up 33 0 330 149 hct 100 V=
w 15
a 0 up 0:33 0 0 0 hln 100 V=
s 460 170 460 180 14
s 460 180 470 180 16
s 470 180 470 170 18
s 470 180 470 320 20
a 0 up 33 0 472 250 hlt 100 V=
s 470 320 390 320 22
w 25
a 0 up 0:33 0 0 0 hln 100 V=
s 460 130 520 130 24
s 520 130 520 200 26
a 0 up 33 0 522 165 hlt 100 V=
w 29
a 0 up 0:33 0 0 0 hln 100 V=
s 520 240 520 310 28
a 0 up 33 0 522 275 hlt 100 V=
s 520 310 510 310 30
@junction
j 230 240
+ p 6 -
+ w 9
j 230 320
+ s 2
+ w 9
j 230 200
+ p 6 +
+ w 11
j 470 180
+ w 15
+ w 15
j 390 320
+ s 4
+ w 15
j 520 200
+ p 7 +
+ w 25
j 520 240
+ p 7 -
+ w 29
j 510 310
+ s 3
+ w 29
j 430 150
+ p 5 g
+ w 11
j 460 170
+ p 5 s
+ w 15
j 470 170
+ p 5 b
+ w 15
j 460 130
+ p 5 d
+ w 25
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
