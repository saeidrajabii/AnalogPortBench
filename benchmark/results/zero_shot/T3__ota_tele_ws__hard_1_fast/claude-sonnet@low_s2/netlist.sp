.subckt dut iref inp inn out
* reference mirror
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMtail nt iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
* NMOS cascode bias (two stacked diodes)
Rbn vdd vbn 12k
XMbn1 vbn vbn nb1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMbn2 nb1 nb1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode bias
Rbp vdd vbp 37k
XMbp vbp vbp 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* input pair
XM1 n1 inp nt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM3 n3 inn nt 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* NMOS cascodes
XM0 n82 vbn n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM2 out vbn n3 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* PMOS cascode mirror load
XP1 n82 vbp p1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP3 out vbp p2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP0 p1 n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XP2 p2 n82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
