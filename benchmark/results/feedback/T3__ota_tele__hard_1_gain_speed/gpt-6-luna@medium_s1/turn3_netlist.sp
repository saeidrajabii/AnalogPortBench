.subckt dut iref inp inn out
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

XINP   dp   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XINN   dn   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XPLD   dn   dn   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1
XPLM   n1   dn   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=2 nf=1 m=1

XBN    pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=50 L=1.5 nf=1 m=1
XPBD   pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPL    out  pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XNS    out  n1   0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

RZ     n1   nzc  1k
CC     nzc  out  0.4p
.ends dut
