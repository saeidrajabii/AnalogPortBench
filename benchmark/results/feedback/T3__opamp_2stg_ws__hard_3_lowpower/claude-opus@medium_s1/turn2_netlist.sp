.subckt dut iref inp inn out
* ---------------- bias generation (iref mirrored via diode XMB) ----------------
XMB    iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=4
XMT    tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=6
XMB1   vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=3.5 L=1 nf=1 m=1
XMP8   vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB2   vcp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=2.1 L=1 nf=1 m=1
XMP9   vcp  vcp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=1.3 nf=1 m=1
XMP10  vcn  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN11  vcn  vcn  0    0   sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1.2 nf=1 m=1
* ---------------- stage 1: NMOS-input folded cascode ----------------
XM1    f1   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2    f2   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP1   f1   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=7
XMP2   f2   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=7
XMC1   o1   vcp  f1   vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMC2   x    vcp  f2   vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XMN3   o1   vcn  s1   0   sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMN4   x    vcn  s2   0   sky130_fd_pr__nfet_01v8_lvt W=16 L=0.6 nf=1 m=1
XMN5   s1   x    0    0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMN6   s2   x    0    0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
* ---------------- stage 2: NMOS common source, PMOS current load ----------------
XMN7   out  o1   0    0   sky130_fd_pr__nfet_01v8_lvt W=36 L=0.6 nf=1 m=1
XMP7   out  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=12
* ---------------- Miller compensation with nulling resistor ----------------
RZ     o1   nz   3.5k
CC     nz   out  0.5p
.ends dut
