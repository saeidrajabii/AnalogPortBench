.subckt dut iref inp inn out

* Reference mirror and input-pair tail bias
XNREF   iref   iref   0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XNTAIL  tail   iref   0     0     sky130_fd_pr__nfet_01v8_lvt W=4  L=1.2 nf=1 m=1

* NMOS differential input pair
XM1     n1     inp    tail  0     sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XM2     n2     inn    tail  0     sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* PMOS current-mirror load for the input pair
XP1     n1     n1     vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=25 L=2 nf=1 m=1
XP2     n2     n1     vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=25 L=2 nf=1 m=1

* Second-stage current bias and common-source output stage
XNBIAS  nbias  iref   0     0     sky130_fd_pr__nfet_01v8_lvt W=4  L=1.2 nf=1 m=1
XPBIAS  nbias  nbias  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XPLOAD  out    nbias  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XNOUT   out    n1     0     0     sky130_fd_pr__nfet_01v8_lvt W=80 L=1   nf=1 m=1

* Miller compensation with a series nulling resistor
RZ      n1     ncomp  10k
CC      ncomp  out    600f

.ends dut
