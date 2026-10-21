.subckt dut iref inp inn out
* ---- reference and current mirrors (iref = 20 uA) ----
XMB1 iref   iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMT  tail   iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=3
XMB6 vcpref iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB8 vcp    iref   0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB4 vcn    vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---- NMOS cascode bias: replica of M3 sitting on IR = 0.36 V ----
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
RBN  nb2 0 72k
* ---- PMOS cascode bias: replica of M5, IR = 0.15 V below ----
XMB7 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.67 L=0.5 nf=1 m=1
RBP  pb vcp 30k
* ---- telescopic core (30 uA per side) ----
XM1 x1  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XM2 x2  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.35 nf=1 m=1
XM3 d1  vcn x1   0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM4 out vcn x2   0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM5 d1  vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM7 y1  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.8 nf=1 m=1
XM8 y2  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=0.8 nf=1 m=1
.ends dut
