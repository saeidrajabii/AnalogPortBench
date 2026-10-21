.subckt dut iref inp inn out
* ---------------- bias network ----------------
XMR   iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=4
XMT   ts   iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=4
XMS1  vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMS2  vbpc iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMPB  vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMPN  vbnc vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
R1    vbnc nb1  45k
XMNB  nb1  nb1  0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
R2    vdd  sp1  60k
XMPC  vbpc vbpc sp1  vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* ---------------- stage 1: NMOS-input folded cascode ----------------
XM1   fa   inp  ts   ts  sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2   fb   inn  ts   ts  sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMTA  fa   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=4
XMTB  fb   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=4
XMCA  o1   vbpc fa   vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=2
XMCB  nd   vbpc fb   vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=2
XMBCB nd   vbnc xd   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMBCA o1   vbnc xo   0   sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMBB  xd   nd   0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMBA  xo   nd   0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* ---------------- stage 2: NMOS common source + Miller compensation ----------------
XM6   out  o1   0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=14
XM7   out  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=14
Rz    o1   nc   3k
Cc    nc   out  0.8p
.ends dut
