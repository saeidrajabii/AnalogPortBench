.subckt dut iref inp inn out
* Bias: iref is diode-connected NMOS MB1 (gate = iref = vbn).
* MB2 mirrors 10 uA into PMOS diode MPB, which sets vbp for the tail.
* Tail MT carries 20 uA. Input pair MP1/MP2 is PMOS, with 10 uA per side.
* Active load: NMOS mirror MN3/MN4 with NMOS cascodes MN5/MN6 (gate vbnc).
* PMOS cascodes MP8/MP9 have their gates at 0 V.
* Output stage: MP8 drain = out, MN6 drain = out.
* Non-inverting: inp drives MP1, whose drain side is the diode-connected mirror branch.
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMB2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMPB vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT s vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Input pair
XM1 p1 inp s vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 p2 inn s vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS cascodes (gate at 0 V)
XM9 d1 0 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM8 out 0 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* NMOS mirror load with NMOS cascodes
XM5 d1 vbnc n1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XM3 n1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XM6 out vbnc n2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XM4 n2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* Cascode gate bias for the NMOS cascodes (about 0.82 V)
RA vdd vbnc 470k
RB vbnc 0 1Meg
.ends dut
