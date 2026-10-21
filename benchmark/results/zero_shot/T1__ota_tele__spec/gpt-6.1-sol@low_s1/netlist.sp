* SKY130 LVT telescopic OTA.
* Candidate sizing; performance requires verification with the supplied
* SKY130 models and testbench.

.subckt dut iref inp inn out

* Reference-current mirror and cascode bias generation
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.6 nf=1 m=1
XB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* Mirrored tail current
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=2

* Differential input pair
X1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1
X2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.6 nf=1 m=1

* NMOS cascodes
X3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
X4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* PMOS cascodes
X5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1
X6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1

* PMOS current-mirror load
X7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
X8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1

.ends dut
