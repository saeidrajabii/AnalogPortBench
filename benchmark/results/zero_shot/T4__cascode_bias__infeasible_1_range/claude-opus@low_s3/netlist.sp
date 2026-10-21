.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference (low-voltage cascode), iin drives drain of cascode
RL iin vb4 1
XN3 iin vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* NMOS copy -> PMOS reference branch
XN8 nq vb3 n7 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN7 n7 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RQ nq vb1 1
XP3 nq vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
* vb2 generator: PMOS diode fed by NMOS cascode copy
XP5 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XN10 vb2 vb3 n9 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN9 n9 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* vb3 generator: NMOS diode fed by PMOS cascode copy
XP7 vb3 vb2 p6 vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XP6 p6 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XN5 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Output cascode sink and source
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPA psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XPB out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
.ends dut
