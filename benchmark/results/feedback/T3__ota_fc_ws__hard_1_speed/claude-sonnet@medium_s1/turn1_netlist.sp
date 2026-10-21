.subckt dut iref inp inn out
* bias: iref mirrored to tail / sinks
XB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XB1 nb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XB3 vb3 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.3 nf=1 m=1
R3 vb2 vb3 2k
XBP vb2 vb2 ns vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.35 nf=1 m=1
R1 vdd ns 10k
XBD vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* tail
XMT tail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* input pair (inp on diode side)
XN2 n10 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.3 nf=1 m=1
XN1 n16 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.3 nf=1 m=1
* PMOS sources
XP1 n10 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XP3 n16 net1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
* PMOS cascodes
XP4 net1 vb2 n10 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XP5 out vb2 n16 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
* NMOS cascodes and sinks
XN6 net1 vb3 s1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XN9 out vb3 s2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XN7 s1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XN8 s2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
