.subckt dut iref inp inn out
* ---- bias ----
XMN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=8
XMNB vb2 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPD vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.84 L=0.7 nf=1 m=1
XMPE vb5 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.84 L=0.7 nf=1 m=1
XMNA vb5 vb5 mid 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMNC mid mid 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* ---- input pair ----
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.4 nf=1 m=2
XM2 d2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.4 nf=1 m=2
* ---- NMOS cascodes ----
XM3 n082 vb5 d1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.4 nf=1 m=2
XM4 out vb5 d2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.4 nf=1 m=2
* ---- PMOS cascode mirror load ----
XP0 s0 n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP1 n082 vb2 s0 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP2 s2 n082 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XP3 out vb2 s2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
