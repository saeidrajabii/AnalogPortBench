.subckt dut iref inp inn out
* ---- reference and current mirrors (iref = 20 uA) ----
XMB1 iref   iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XMT  tail   iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=4
XMB6 vcpref iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMB8 vcp    iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB4 vcn    vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---- NMOS cascode bias: replica of M3 on IR = 0.30 V ----
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RBN  nb2 0 60k
* ---- PMOS cascode bias: replica of M5, IR = 0.20 V ----
XMB7 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RBP  pb vcp 40k
* ---- telescopic core (40 uA per side) ----
XM1 x1  inp tail tail sky130_fd_pr__nfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM2 x2  inn tail tail sky130_fd_pr__nfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM3 d1  vcn x1   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM4 out vcn x2   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM5 d1  vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM7 y1  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XM8 y2  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.5 nf=1 m=1
.ends dut
