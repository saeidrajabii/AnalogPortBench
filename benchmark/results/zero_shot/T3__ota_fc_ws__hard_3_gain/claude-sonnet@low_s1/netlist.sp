.subckt dut iref inp inn out
* reference mirror
XMr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
* tail
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
* input pair
XM1 a inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 b inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror sources
XMs1 a net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=2
XMs2 b net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=2
* PMOS cascodes
XMc1 net1 vb2 a vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=4
XMc2 out vb2 b vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=4
* NMOS cascodes
XMn1 net1 vb3 s1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMn2 out vb3 s2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS sinks
XMk1 s1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMk2 s2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Vb3 bias stack
Rb3 vdd vb3 50k
XMbt vb3 vb3 x 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XMbb x iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Vb2 bias
Rb2 vdd vb2 60k
XMb2 vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
.ends dut
