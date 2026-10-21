.subckt dut in out
* reference branch: in = drain of cascode and gate of bottom mirror devices
XMc1 in vb d1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XM1  d1 in 0 0  sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
* output branch
XMc2 out vb d2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XM2  d2 in 0 0  sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
* cascode bias: vb = Vgs(diode at ~20uA) + 20uA*Rs
Rb vdd vb 30k
XMd vb vb sd 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
Rs sd 0 6k
.ends dut
