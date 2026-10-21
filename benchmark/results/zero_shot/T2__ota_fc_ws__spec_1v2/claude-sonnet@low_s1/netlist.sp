.subckt dut iref inp inn out
* reference diode and mirrors
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4
XMs1 n18 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=3
XMs2 n17 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=3
* cascode bias generation
Rb3 vdd vb3 30k
XMb3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
Rb2 vdd vb2 40k
XMb2 vb2 vb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* input pair
XMin1 n10 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMin2 n16 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS current sources
XMp0 n10 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp1 n10 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp2 n16 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp3 n16 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascodes
XMp4 net1 vb2 n10 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XMp5 out vb2 n16 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
* NMOS cascodes
XMn6 net1 vb3 n18 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=1
XMn9 out vb3 n17 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.35 nf=1 m=1
.ends dut
