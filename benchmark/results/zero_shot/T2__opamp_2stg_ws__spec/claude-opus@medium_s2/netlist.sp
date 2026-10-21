.subckt dut iref inp inn out
* ---------------- bias generation (iref mirrored) ----------------
XMr   iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMb1  vbp  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPb1  vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMb2  vbpc iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPb2  vbpc vbpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.8 L=0.4 nf=1 m=1
XPb3  vbnc vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMb3  vbnc vbnc 0   0   sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.65 nf=1 m=1
* ---------------- stage 1: NMOS-input folded cascode ----------------
XMt   tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XM1   f1   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XM2   f2   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XPs1  f1   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XPs2  f2   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XPc1  o1   vbpc f1   vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
XPc2  nd   vbpc f2   vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.35 nf=1 m=1
* wide-swing cascode NMOS mirror (diode side = nd, output side = o1)
XMn7  s1   nd   0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMn9  nd   vbnc s1   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMn8  s2   nd   0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMn10 o1   vbnc s2   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* ---------------- stage 2: NMOS common source, PMOS current-source load ----------------
XMd   out  o1   0    0   sky130_fd_pr__nfet_01v8_lvt W=34 L=0.3 nf=1 m=1
XPl   out  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8.5 L=0.5 nf=1 m=16
* ---------------- Miller compensation with nulling resistor ----------------
Rz    o1   nc   1.2k
Cc    nc   out  0.5p
.ends dut
