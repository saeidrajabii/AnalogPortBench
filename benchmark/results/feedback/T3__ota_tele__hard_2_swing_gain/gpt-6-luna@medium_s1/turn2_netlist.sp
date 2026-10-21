.subckt dut iref inp inn out
* Reference-current mirrors
XMREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMTAIL  ntail iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS pvb   iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPBIAS pvb   pvb   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load
XMINP   n1    inp   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMINN   n2    inn   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMPL1   n1    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1
XMPL2   n2    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=15 L=0.7 nf=1 m=1

* Common-source output stage and PMOS current-source load
XMOUT   out   n2    0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMLOAD  out   pvb   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=1

* Miller compensation
RZ      n2    ncomp 2.2k
CC      ncomp out   0.8p
.ends dut
