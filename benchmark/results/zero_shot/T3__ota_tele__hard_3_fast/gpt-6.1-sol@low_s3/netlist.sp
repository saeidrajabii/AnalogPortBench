.subckt dut iref inp inn out

* Reference mirror and bias branches.
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=2 nf=1 m=1
XB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* Tail current mirror.
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=528 L=1 nf=1 m=1

* Differential input pair.
X1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 m=1
X2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.5 nf=1 m=1

* NMOS cascodes.
X3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
X4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Cascoded PMOS current-mirror load.
X5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
X6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
X7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.7 nf=1 m=1
X8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.7 nf=1 m=1

* Candidate port; specification compliance requires model-based simulation.
.ends dut
