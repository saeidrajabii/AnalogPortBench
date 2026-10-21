.subckt dut iref inp inn out
* reference mirror and tail
XMb iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=7
* bias dividers
Rb3a vdd vb3 400k
Rb3b vb3 0 800k
Rb2a vdd vb2 800k
Rb2b vb2 0 400k
* input pair
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.3 nf=1 m=1
* nmos cascodes
XM3 d1 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.3 nf=1 m=1
XM4 out vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.3 nf=1 m=1
* pmos cascodes and mirror
XP1 d1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP2 out vb2 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP3 p1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XP4 p2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
