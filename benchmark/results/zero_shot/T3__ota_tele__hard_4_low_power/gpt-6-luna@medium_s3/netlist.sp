.subckt dut iref inp inn out
XREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XTAIL tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=2.75 L=0.5 nf=1 m=1
XBIAS nbias iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=3.75 L=0.5 nf=1 m=1

XBP   pbias pbias vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=5 L=0.7 nf=1 m=1
XPOUT out   pbias vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.7 nf=1 m=1

XINP  x1    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XINN  x2    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

XLOAD1 x1   x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XLOAD2 x2   x1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1

XOUT  out   x2    0     0     sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1

RZ    x2    ncomp 8k
CC    ncomp out   550f
.ends dut
