.subckt dut iref inp inn out
* bias mirror
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1 nf=1 m=4
* input pair (inn -> mirror diode side, inp -> output side of stage 1)
XM1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* second stage
XM6 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* compensation
RZ n1 nz 1k
CC nz out 0.5p
.ends dut
