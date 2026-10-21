.subckt dut iref inp inn out
* Reference and tail-current mirror
XREF    iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XTAIL   tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* Differential input pair and current-mirror load
XINP    n2   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XINN    n1   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XPLD1   n1   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPLD2   n2   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Second-stage load bias and gain stage
XBNB    vbp  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XPBREF  vbp  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XSTAGE2 out  n2   0    0    sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1
XPLOAD  out  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Miller compensation with series nulling resistor
RZ      n2   ncomp 8k
CC      ncomp out  0.6p
.ends dut
