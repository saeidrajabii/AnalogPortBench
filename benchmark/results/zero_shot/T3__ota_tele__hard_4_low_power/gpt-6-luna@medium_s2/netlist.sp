.subckt dut iref inp inn out
* NMOS reference and mirrored bias currents
XNREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=0.7 nf=1 m=1
XTAIL   tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=0.7 nf=1 m=1
XBIASS  bp   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=1 L=0.7 nf=1 m=1
XNSINK  out  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=0.7 nf=1 m=1

* PMOS bias current source for the output stage
XPBIAS  bp   bp   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPOUT   out  bp   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load
XINP    n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XINN    n2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XPLD    n2   n2   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XPLM    x    n2   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ      x    xc   5k
CC      xc   out  0.8p
.ends dut
