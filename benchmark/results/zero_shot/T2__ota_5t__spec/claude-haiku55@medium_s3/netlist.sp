.subckt dut iref inp inn out
* Reference: diode-connected NMOS sinks the 20 uA ideal current (drain/gate on iref)
XMnref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
* Half-size mirror: sinks 10 uA into the PMOS bias diode
XMnx vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
* PMOS bias diode, carries 10 uA from vdd
XMpb vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS tail, 2x the bias diode -> 20 uA
XMt vtail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
* PMOS input pair (10 uA per side, weak inversion)
XMp1 nmir inp vtail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMp2 out inn vtail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
* NMOS current-mirror active load
XMn1 nmir nmir 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMn2 out nmir 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
.ends dut
