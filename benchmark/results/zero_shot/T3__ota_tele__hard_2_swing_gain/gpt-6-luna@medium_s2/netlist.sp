.subckt dut iref inp inn out
* Reference-current mirror and bias generation
XREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=1
XTAIL  tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=1
XNB    vbiasp iref 0     0     sky130_fd_pr__nfet_01v8_lvt W=1 L=1.2 nf=1 m=1
XPBIAS vbiasp vbiasp vdd vdd   sky130_fd_pr__pfet_01v8_lvt W=1 L=1.2 nf=1 m=1
XPOUT  out   vbiasp vdd vdd    sky130_fd_pr__pfet_01v8_lvt W=7 L=1.2 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XINP   n1    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XINN   n2    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XLOAD1 n1    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=4 L=1.2 nf=1 m=1
XLOAD2 n2    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=4 L=1.2 nf=1 m=1

* Second gain stage
XGAIN  out   n2    0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1

* Miller compensation and series nulling resistor
RZ     n2    ncomp 3k
CC     ncomp out   1.5p
.ends dut
