.subckt dut iref inp inn out
* Reference and mirrored tail/bias currents
XMREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XTAIL   tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=48 L=0.5 nf=1 m=1
XBIAS   pbias iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* PMOS bias reference and output-stage current source
XPBIAS  pbias pbias vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=36 L=1.0 nf=1 m=1
XPOUT   out   pbias vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=54 L=1.0 nf=1 m=1

* Differential pair and PMOS current-mirror load
XIN1    n1    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XIN2    n2    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XPL1    n1    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XPL2    n2    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* Output gain stage and Miller compensation
XGAIN   out   n2    0     0     sky130_fd_pr__nfet_01v8_lvt W=24 L=1.0 nf=1 m=1
RZ      n2    ncomp 5k
CC      ncomp out   1p
.ends dut
