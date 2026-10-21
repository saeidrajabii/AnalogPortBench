.subckt dut iref inp inn out
* Reference NMOS and current-mirror bias
XMREF  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNBIAS pb   iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPREF  pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

* Differential input stage; n1 is the diode-connected load branch
XMTAIL  ntail iref 0     0   sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XMINN   n1    inn  ntail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMINP   n2    inp  ntail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPD    n1    n1   vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
XMPM    n2    n1   vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1

* Common-source output stage
XMPOUT  out   pb  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMOUT   out   n2  0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* Miller compensation
RZ      n2    ncomp 2k
CC      ncomp out   500f
.ends dut
