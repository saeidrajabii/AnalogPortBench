.subckt dut iref inp inn out
* ---------------- Bias: cascode NMOS reference (20 uA mirrored) ----------------
* iref only enters drain/gate of XMB1 (cascode gate ~1.0 V); x is the bottom-mirror gate
XMB1 iref iref x 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB0 x x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* ---------------- Stage 1: NMOS differential pair, PMOS mirror load ----------------
* tail = 5 x 20 uA = 100 uA
XMT tail x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5
XM1 n8 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM3 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 n8 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* ---------------- Stage 2: PMOS common source, cascoded NMOS sink (200 uA) ----------------
XM6 out n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XM7 out iref nc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=10
XM8 nc x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=10

* ---------------- Miller compensation with nulling resistor ----------------
RZ n8 nz 1.1k
CC nz out 0.7p
.ends dut
