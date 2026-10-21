.subckt dut iref inp inn out
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

XINN   xl   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XINP   n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XLOADD xl   xl   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1
XLOADM n1   xl   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1

XBIASP  pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1
XBIASN  pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

XOUTN  out  n1   0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XOUTP  out  pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=62.5 L=1.5 nf=1 m=1

RZ     n1   nzc  1k
CC     nzc  out  1.5p
.ends dut
