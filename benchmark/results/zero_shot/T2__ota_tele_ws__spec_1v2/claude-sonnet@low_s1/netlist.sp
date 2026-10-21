.subckt dut iref inp inn out
* reference mirror
XMr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* tail
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=7
* vb2 bias (pmos cascode gate)
Rb2 vdd vb2 32k
XMb2 vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vb5 bias (nmos cascode gate)
Rb5 vdd vb5 17k
XMd1 vb5 vb5 nd 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.3 nf=1 m=1
XMd2 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.3 nf=1 m=1
* input pair
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=2
XM3 n3 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=2
* nmos cascodes
XM0 d82 vb5 n1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=2
XM2 out vb5 n3 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=2
* pmos cascode mirror load
XP1 d82 vb2 p100 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XP3 out vb2 p97 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XP0 p100 d82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XP2 p97 d82 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
.ends dut
