.subckt dut iref inp inn out
* Reference-current mirror and NMOS bias
XREF   iref  iref  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPBIAS vbn   iref  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XNBIAS vbn   vbn   0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load
XTAIL  ntail vbn   0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XN1    nd1   inn   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XN2    nd2   inp   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPLD   nd1   nd1   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XPLM   nd2   nd1   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* Second gain stage
XPOUT  out   iref  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XNOUT  out   nd2   0     0     sky130_fd_pr__nfet_01v8_lvt W=200 L=1.5 nf=1 m=1

* Miller compensation
RZ     nd2   ncomp 1k
CC     ncomp out   400f
.ends dut
