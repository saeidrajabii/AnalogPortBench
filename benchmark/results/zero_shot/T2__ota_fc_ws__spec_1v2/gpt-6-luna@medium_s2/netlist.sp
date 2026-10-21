.subckt dut iref inp inn out
* Reference-current sink and 1:1 NMOS mirror
XNR  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XNB  pb   iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* Diode-connected PMOS establishes the mirrored bias current
XPR  pb   pb   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Differential pair with PMOS current-mirror load
XTAIL tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XINP  na   inp  tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XINN  x    inn  tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPL1  na   na   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPL2  x    na   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Second gain stage
XLOAD out  pb   vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XOUT  out  x    0    0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* Miller compensation with a series nulling resistor
RCOMP x ncomp 2k
CCOMP ncomp out 1.2p
.ends dut
