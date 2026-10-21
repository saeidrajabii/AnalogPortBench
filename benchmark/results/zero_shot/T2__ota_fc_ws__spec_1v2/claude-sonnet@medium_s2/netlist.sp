.subckt dut iref inp inn out
* ---- bias ----
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMB1 nm iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPm nm nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPm2 vb3 nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMBc vb3 vb3 sc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
Rn sc 0 10k
Rp vdd sp 10k
XMPc vb2 vb2 sp vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMB2 vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---- OTA ----
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XM2 n10 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM1 n16 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XP0 n10 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=2
XP2 n16 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=2
XP4 n1 vb2 n10 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP5 out vb2 n16 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XN6 n1 vb3 s1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XN7 s1 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XN9 out vb3 s2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XN8 s2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
.ends dut
