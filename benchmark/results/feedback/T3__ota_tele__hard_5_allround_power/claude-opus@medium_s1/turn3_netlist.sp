.subckt dut iref inp inn out
* ---- reference and current mirrors (iref = 20 uA) ----
XMB1 iref   iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMT  tail   iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=2
XMB6 vcpref iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XMB8 vcp    iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB4 vcn    vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
* ---- NMOS cascode bias: replica of M3 on IR = 0.30 V ----
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RBN  nb2 0 120k
* ---- PMOS cascode bias: replica of M5, IR = 0.20 V ----
XMB7 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RBP  pb vcp 80k
* ---- stage 1: telescopic cascode (20 uA per side) ----
XM1 x1 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XM2 x2 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XM3 d1 vcn x1   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM4 o1 vcn x2   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM6 o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* ---- stage 2: PMOS common source, ~50 uA ----
XM9  out o1   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM10 out iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* ---- Miller compensation with nulling resistor ----
RZ  out cz 2.5k
CC  cz  o1 1p
.ends dut
