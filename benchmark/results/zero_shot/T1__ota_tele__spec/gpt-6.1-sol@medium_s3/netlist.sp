* Candidate SKY130 port; specifications require verification with
* the testbench models and analyses.

.subckt dut iref inp inn out

* Reference-current mirror and bias generators
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.6 nf=1 m=1
XB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.7 nf=1 m=1
XB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* Mirrored tail current and differential input pair
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=2
X1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1
X2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1

* NMOS cascodes
X3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
X4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1

* PMOS cascodes and current-mirror load
X5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
X6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
X7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
X8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1

.ends dut
