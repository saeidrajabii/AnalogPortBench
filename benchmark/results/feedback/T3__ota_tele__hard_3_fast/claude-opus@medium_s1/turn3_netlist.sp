.subckt dut iref inp inn out
* ---------------- bias ----------------
Rn    iref nb 20k
XMB1  nb   nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
* tail current source: 5.5x mirror, about 90 uA
XMT   tail nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=22
* PMOS cascode bias: replica of M5/M6 at the same current density
XMB8  vcp  nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
Rp    vdd  rp   30k
XMB7  vcp  vcp  rp   rp   sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
* ---------------- telescopic cascode core ----------------
XM1   x1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=140 L=0.5 nf=1 m=1
XM2   x2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=140 L=0.5 nf=1 m=1
XM3   d1   iref x1   0    sky130_fd_pr__nfet_01v8_lvt W=50 L=0.4 nf=1 m=1
XM4   out  iref x2   0    sky130_fd_pr__nfet_01v8_lvt W=50 L=0.4 nf=1 m=1
XM5   d1   vcp  y1   y1   sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XM6   out  vcp  y2   y2   sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XM7   y1   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=0.45 nf=1 m=1
XM8   y2   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=100 L=0.45 nf=1 m=1
.ends dut
