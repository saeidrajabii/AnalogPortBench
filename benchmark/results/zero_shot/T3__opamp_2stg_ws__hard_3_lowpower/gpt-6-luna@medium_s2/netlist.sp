.subckt dut iref inp inn out
* 20 uA reference sink and scaled NMOS current mirrors
XNREF   iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XNTail  tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XNPBIAS p_ref iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1

* PMOS reference and current-source loads
XPPREF  p_ref p_ref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XPL1    dplus p_ref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XPL2    x     p_ref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XPLOAD  out   p_ref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=1.2 nf=1 m=1

* NMOS differential input stage
XNT1    tail  inp   dplus 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1
XNT2    tail  inn   x     0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1

* Second gain stage
XNOUT   out   x     0     0    sky130_fd_pr__nfet_01v8_lvt W=160 L=1.0 nf=1 m=1

* Miller compensation
RZ      x     ncomp 1k
CC      ncomp out   800f
.ends dut
