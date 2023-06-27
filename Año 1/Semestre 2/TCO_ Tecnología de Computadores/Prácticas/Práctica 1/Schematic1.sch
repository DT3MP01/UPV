*version 9.1 1096886082
u 61
V? 3
R? 5
@libraries
@analysis
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
pageloc 1 0 2085 
@status
n 0 119:01:04:23:04:49;1549317889 e 
s 0 119:01:04:23:04:53;1549317893 e 
*page 1 0 970 720 iA
@ports
port 4 EGND 100 180 h
port 5 EGND 520 190 h
@parts
part 2 VDC 100 140 h
a 0 sp 0 0 22 37 hln 100 PART=VDC
a 0 a 0:13 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 24 7 hcn 100 REFDES=V1
a 1 u 13 0 -11 18 hcn 100 DC=15V
part 6 r 140 90 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=100
part 7 r 270 50 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 25 hln 100 VALUE=100
part 8 r 280 140 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 15 25 hln 100 VALUE=100
part 9 r 430 80 h
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 u 13 0 15 25 hln 100 VALUE=220
part 1 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A
a 1 s 13 0 180 60 hcn 100 PAGETITLE=
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
@conn
w 46
s 520 80 520 190 47
s 470 80 520 80 45
w 32
s 320 140 390 140 31
s 390 140 390 80 41
s 390 50 310 50 43
s 390 80 390 50 52
s 430 80 390 80 49
w 55
s 100 90 100 140 53
s 140 90 100 90 21
w 24
s 270 50 210 50 23
s 210 50 210 90 27
s 210 140 280 140 29
s 210 90 210 140 60
s 180 90 210 90 57
@junction
j 100 180
+ s 4
+ p 2 -
j 280 140
+ p 8 1
+ w 24
j 320 140
+ p 8 2
+ w 32
j 270 50
+ p 7 1
+ w 24
j 310 50
+ p 7 2
+ w 32
j 520 190
+ s 5
+ w 46
j 470 80
+ p 9 2
+ w 46
j 430 80
+ p 9 1
+ w 32
j 390 80
+ w 32
+ w 32
j 100 140
+ p 2 +
+ w 55
j 140 90
+ p 6 1
+ w 55
j 180 90
+ p 6 2
+ w 24
j 210 90
+ w 24
+ w 24
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
