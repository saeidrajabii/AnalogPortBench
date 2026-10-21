.subckt dut iref inp inn out
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1 nf=1 m=1

XINN   xl   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XINP   n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=80 L=1.2 nf=1 m=1
XLOADD xl   xl   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2.5 nf=1 m=1
XLOADM n1   xl   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=2.5 nf=1 m=1

XBIASP pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1
XBIASN pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

XOUTN  out  n1   0    0    sky130_fd_pr__nfet_01v8_lvt W=100 L=1.2 nf=1 m=1
XOUTP  out  pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=90 L=1.5 nf=1 m=1

RZ     n1   nzc  3k
CC     nzc  out  0.9p
.ends dut
