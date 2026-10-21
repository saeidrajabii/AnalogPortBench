.subckt dut iref inp inn out
* bias mirror
XMb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMt  tl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* input pair
XM1 dl inp tl 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 dr inn tl 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* nmos cascodes
XM3 a  vbn dl 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vbn dr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* wide-swing pmos cascode mirror
XM5 ya a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XM6 yb a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XM7 a  vbp ya vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM8 out vbp yb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* nmos cascode bias
Rbn vdd vbn 22k
XMd1 vbn vbn vn1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMd2 vn1 vn1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* pmos cascode bias
XMp vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.35 nf=1 m=1
Rbp vbp 0 70k
.ends dut
