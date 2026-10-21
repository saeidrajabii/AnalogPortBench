.subckt dut iref inp inn out
* ---- bias: mirror Iref (20uA) -> 4uA PMOS reference ----
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=5
XMB2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMB3 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
* ---- stage 1: PMOS diff pair (bulk tied to source), NMOS mirror load ----
XMT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=5
XM1 d1 inn tail tail sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=8
XM2 o1 inp tail tail sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=8
XM3 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.5 nf=1 m=1
XM4 o1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1.5 nf=1 m=1
* ---- stage 2: NMOS common source, PMOS current-source load ----
XM6 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=34 L=1 nf=1 m=4
XM7 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=8
* ---- Miller compensation with nulling resistor ----
Rz o1 nc 3k
Cc nc out 1.1p
.ends dut
