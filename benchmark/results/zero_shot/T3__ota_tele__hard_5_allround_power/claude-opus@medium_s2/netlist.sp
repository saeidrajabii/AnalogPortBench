.subckt dut iref inp inn out
* ---------------- bias network (iref = 20 uA, mirrored) ----------------
XMB1 iref   iref   0    0   sky130_fd_pr__nfet_01v8_lvt W=4    L=1   nf=1 m=4
XMB6 vcpref iref   0    0   sky130_fd_pr__nfet_01v8_lvt W=4    L=1   nf=1 m=1
XMB5 vcpref vcpref vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4    L=1   nf=1 m=1
XMB4 vcn    vcpref vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4    L=1   nf=1 m=1
XMB2 vcn    vcn    nb2  0   sky130_fd_pr__nfet_01v8_lvt W=0.84 L=1   nf=1 m=1
XMB3 nb2    nb2    0    0   sky130_fd_pr__nfet_01v8_lvt W=5    L=0.5 nf=1 m=1
XMB8 vcp    iref   0    0   sky130_fd_pr__nfet_01v8_lvt W=4    L=1   nf=1 m=1
XMB7 vcp    vcp    vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=1.5  L=1   nf=1 m=1
* ---------------- tail current source (60 uA) ----------------
XMT  tail   iref   0    0   sky130_fd_pr__nfet_01v8_lvt W=4    L=1   nf=1 m=12
* ---------------- telescopic cascode core ----------------
XM1  x1     inp    tail 0   sky130_fd_pr__nfet_01v8_lvt W=30   L=0.5 nf=1 m=1
XM2  x2     inn    tail 0   sky130_fd_pr__nfet_01v8_lvt W=30   L=0.5 nf=1 m=1
XM3  d1     vcn    x1   0   sky130_fd_pr__nfet_01v8_lvt W=20   L=1   nf=1 m=1
XM4  out    vcn    x2   0   sky130_fd_pr__nfet_01v8_lvt W=20   L=1   nf=1 m=1
XM5  d1     vcp    y1   vdd sky130_fd_pr__pfet_01v8_lvt W=24   L=0.5 nf=1 m=1
XM6  out    vcp    y2   vdd sky130_fd_pr__pfet_01v8_lvt W=24   L=0.5 nf=1 m=1
XM7  y1     d1     vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=30   L=0.75 nf=1 m=1
XM8  y2     d1     vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=30   L=0.75 nf=1 m=1
* small extra output capacitance for phase-margin margin
C1   out    0      0.15p
.ends dut
