.subckt dut iref inp inn out
* Reference current sink and NMOS bias mirror
XNREF   iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XNBIAS  pbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XPBIAS  pbias pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XTAIL   tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=8
XINP    x1    inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XINN    xref  inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPLOADREF xref xref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XPLOAD  x1    xref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Second gain stage and PMOS bias-current load
XSECOND out   x1    0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPSECOND out  pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=5

* Miller compensation
RZ x1 ncomp 750
CC ncomp out 1.5p
.ends dut
