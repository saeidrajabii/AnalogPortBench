.subckt dut iref inp inn out
* Bias: iref into a stacked pair of diode-connected NMOS devices (vb3 over vb4)
XB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
R0 iref vb3 1
* First stage: NMOS differential pair with PMOS mirror load, single tail device
XT  tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XN1 n08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XN2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XP0 n08 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* Second stage: PMOS common source with cascoded NMOS current sink
XP2 out n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=5
XN5 out vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=15
XN4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=10
* Miller compensation with nulling resistor
RZ n08 nc 2k
CC nc out 0.5p
.ends dut
