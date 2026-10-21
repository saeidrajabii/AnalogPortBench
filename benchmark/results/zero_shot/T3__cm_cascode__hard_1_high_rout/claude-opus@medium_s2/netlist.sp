.subckt dut in out
* ---------------- core mirror (weak/moderate inversion, low Vdsat) ----------------
* Input branch: Iref -> in -> M3 (cascode) -> A -> M1 (gate tied to in)
XM1 A  in 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=4
XM3 in C  A 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Output branch: out -> M4 (regulated cascode) -> B -> M2
XM2 B  in 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=4
XM4 out Y B 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---------------- cascode gate bias: replica of M3 sitting on ~0.13 V ----------------
R1  vdd C 300k
XMB C C D 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
R2  D 0 65k

* ---------------- amplifier bias ----------------
XPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
RB  pb 0 400k

* ---------------- two-stage boost amplifier: forces V(B) = V(A) ----------------
XPT tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XP1 d1 B tail tail sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XP2 X  A tail tail sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XN1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XN2 X  d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XN3 Y  X  0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XP3 Y  pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
CC  X Y 0.5p
.ends dut
