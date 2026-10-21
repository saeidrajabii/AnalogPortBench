.subckt erramp_low vp vn vo pb
XPTAIL ps pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=4 nf=1 m=1
XP1 nd vn ps vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=4 nf=1 m=1
XP2 nx vp ps vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=4 nf=1 m=1
XN1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XN2 nx nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XN3 vo nx 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XP3 vo pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=4 nf=1 m=1
RCOMP nx nc 100k
CCOMP nc vo 10p
.ends erramp_low

.subckt erramp_high vp vn vo nb
XNTAIL ns nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=4 nf=1 m=1
XN1 pd vp ns 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=4 nf=1 m=1
XN2 px vn ns 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=4 nf=1 m=1
XP1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XP2 px pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XP3 vo px vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XN3 vo nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=4 nf=1 m=1
RCOMP px pc 100k
CCOMP pc vo 10p
.ends erramp_high

.subckt dut iin out vb1 vb2 vb3 vb4
XNREF iin iin nr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=20
RNREF nr 0 1k

* Independent amplifier bias, mirrored from the reference.
XNBAUX pb iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=2
XPBAUX pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=2

RNOUT nsense 0 1k
XNOUT0 nint vb4 nsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=20
XNOUT1 out vb3 nint 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=640

RNTRANSFER ntsense 0 1k
XNTRANSFER0 ntint vb4 ntsense 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=20
XNTRANSFER1 pref vb3 ntint 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=640

RPREF vdd pr 1k
XPREF pref pref pr vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=20

RPOUT vdd psense 1k
XPOUT0 pint vb1 psense vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=20
XPOUT1 out vb2 pint vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=640

RBN iin vb3 1
RBP pref vb2 1

XAN nr nsense vb4 pb erramp_low
XAP psense pr vb1 iin erramp_high
.ends dut
