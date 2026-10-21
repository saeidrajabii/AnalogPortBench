.subckt dut iref inp inn out

* NMOS reference mirror: 6 uA tail current and 16 uA second-stage bias
XNREF   iref   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XNTAIL  tail   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=3  L=1.2 nf=1 m=1
XNBIAS  pbias  iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=8  L=1.2 nf=1 m=1

* Differential pair with PMOS current-mirror load
XM1     n1     inn    tail   0      sky130_fd_pr__nfet_01v8_lvt W=30 L=2.5 nf=1 m=1
XM2     n2     inp    tail   0      sky130_fd_pr__nfet_01v8_lvt W=30 L=2.5 nf=1 m=1
XP1     n1     n1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=20 L=2.5 nf=1 m=1
XP2     n2     n1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=20 L=2.5 nf=1 m=1

* PMOS second-stage current source and NMOS common-source output stage
XPBIAS  pbias  pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XPLOAD  out    pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
XNOUT   out    n2     0      0      sky130_fd_pr__nfet_01v8_lvt W=4  L=2.5 nf=1 m=1

* Miller compensation
RZ      n2     ncomp  20k
CC      ncomp  out    500f

.ends dut
