.subckt dut iref inp inn out
* reference diode and tail mirror
XMN4 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=7
* PMOS cascode bias: 20uA copy -> resistor + pmos diode
XMS vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=0.5 nf=1 m=1
XMPD vb2 vb2 xr vdd sky130_fd_pr__pfet_01v8_lvt W=7.2 L=0.5 nf=1 m=1
Rb2 vdd xr 10k
* NMOS cascode bias: cascode-matched diode + source resistor
Rbn vdd vbn 18k
XMD1 vbn vbn vr 0 sky130_fd_pr__nfet_01v8_lvt W=8.4 L=0.3 nf=1 m=1
Rbn2 vr 0 15k
* input pair
XMI1 nl1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XMI2 nr1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
* NMOS cascodes
XMC1 net082 vbn nl1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XMC2 out vbn nr1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* PMOS cascode mirror load
XMP1 p1 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=42 L=0.7 nf=1 m=1
XMP2 p2 net082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=42 L=0.7 nf=1 m=1
XMPC1 net082 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=43 L=0.5 nf=1 m=1
XMPC2 out vb2 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=43 L=0.5 nf=1 m=1
.ends dut
