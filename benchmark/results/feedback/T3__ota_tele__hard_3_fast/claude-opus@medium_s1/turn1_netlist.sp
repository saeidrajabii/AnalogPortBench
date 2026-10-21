.subckt dut iref inp inn out
* ---------------- bias ----------------
* Iref flows through Rn into diode MB1: vcn = Vgs(MB1) + 20uA*21k (about 0.85 V)
Rn    iref nb 21k
XMB1  nb   nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
* tail current source: 5x mirror, about 100 uA
XMT   tail nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=20
* PMOS cascode bias: 5 uA through Rp and a replica of M5/M6
* sets y1 = y2 = VDD - 0.15 V, independent of the PMOS threshold
XMB8  vcp  nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
Rp    vdd  rp   30k
XMB7  vcp  vcp  rp   rp   sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
* ---------------- telescopic cascode core ----------------
XM1   x1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=120 L=0.25 nf=1 m=1
XM2   x2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=120 L=0.25 nf=1 m=1
XM3   d1   iref x1   0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.25 nf=1 m=1
XM4   out  iref x2   0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.25 nf=1 m=1
XM5   d1   vcp  y1   y1   sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM6   out  vcp  y2   y2   sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM7   y1   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
XM8   y2   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1
.ends dut
