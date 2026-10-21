.subckt dut iref inp inn out
* NMOS reference and mirrored tail/bias currents
XMREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=5  L=2.0 nf=1 m=1
XMTAIL  tail  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=2.0 nf=1 m=1
XMBIAS  pbg   iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=5  L=2.0 nf=1 m=1

* PMOS reference for the second-stage load
XMPREF  pbg   pbg   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=2.0 nf=1 m=1
XMPOUT  out   pbg   vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=2.0 nf=1 m=5

* NMOS differential input stage with PMOS current-mirror load
XMNINP  n1    inp   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=2.0 nf=1 m=1
XMNINN  n2    inn   tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=2.0 nf=1 m=1
XMPL1   n1    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=2.0 nf=1 m=2
XMPL2   n2    n1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=2.0 nf=1 m=2

* Common-source second stage and Miller compensation
XMNS2   out   n2    0     0     sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1
RZ      n2    ncomp 1.5k
CC      ncomp out   650f
.ends dut
