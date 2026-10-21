.subckt dut iref inp inn out
* Bias: MB1 is the diode-connected NMOS reference (gate = iref = vbn).
* MB2 mirrors 10 uA into PMOS diode MPB, which sets vbp for the tail.
* Tail MT carries about 24 uA. Input pair MP1/MP2 is PMOS, about 12 uA per side.
* Load: NMOS mirror MN3/MN4 with NMOS cascodes MN5/MN6 (gate vbnc = 0.8 V).
* PMOS cascodes MP8/MP9 (gate vbpc = 0.2 V) sit above the input drains.
* Non-inverting: inp drives MP1, whose drain is the diode-connected mirror branch.

XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMB2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT s vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Input pair
XM1 p1 inp s vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM2 p2 inn s vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* PMOS cascodes (gate at vbpc)
XM9 d1 vbpc p1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM8 out vbpc p2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* NMOS mirror load with NMOS cascodes
XM5 d1 vbnc n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM3 n1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XM6 out vbnc n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 n2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* Cascode gate biases
RA vdd vbnc 470k
RB vbnc 0 1Meg
RC vdd vbpc 1.5Meg
RD vbpc 0 300k
.ends dut
