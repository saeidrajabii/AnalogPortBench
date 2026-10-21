.subckt dut iref inp inn out
* reference diode and NMOS mirrors (5uA per unit)
XMr  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XMt  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
XMp  vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
XMs2 vb2  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* PMOS bias diode
XMpd vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Vb2 bias: resistor drop then diode-connected PMOS cascode replica
Rb2 vdd x2 11k
XMc2 vb2 vb2 x2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* Vb3 bias: PMOS source feeds diode NMOS cascode replica with source resistor
XMp3 vb3 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMc3 vb3 vb3 y3 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
Rb3 y3 0 11k
* input pair
XM1 a1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 a2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* top PMOS current sources
XMt1 a1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=2
XMt2 a2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=2
* PMOS cascodes
XMc1 b1  vb2 a1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMc4 out vb2 a2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS cascodes
XMn1 b1  vb3 c1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMn2 out vb3 c2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
* NMOS mirror
XMm1 c1 b1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XMm2 c2 b1 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
.ends dut
