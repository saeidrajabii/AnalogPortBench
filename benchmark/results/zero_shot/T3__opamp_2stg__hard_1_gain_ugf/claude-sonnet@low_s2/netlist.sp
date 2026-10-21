.subckt dut iref inp inn out
* bias: iref into diode stack (not into a source)
XB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
RB iref vb3 1
* first stage
XT  nt vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=3
XI2 n9 inn nt 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.3 nf=1 m=1
XI1 n8 inp nt 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.3 nf=1 m=1
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=3
XP0 n8 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=3
* second stage
XP2 out n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=8
XN4 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4
XN5 out vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=4
* compensation
RC n8 nc 3k
CC nc out 500f
.ends dut
