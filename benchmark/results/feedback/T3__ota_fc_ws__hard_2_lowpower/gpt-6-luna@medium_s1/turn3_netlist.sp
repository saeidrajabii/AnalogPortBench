.subckt dut iref inp inn out
* Reference-current diode and matched bias mirrors
XREF   iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XNB    nbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPBD   pbias pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XPN    pbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load
XTAIL  tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XINN   n1    inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XINP   n2    inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XPM1   n1    n1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1
XPM2   n2    n1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=3 nf=1 m=1

* Second gain stage; scaled PMOS mirror sets its quiescent current
XPMREF p2    pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=3 nf=1 m=1
XOUTN  out   n2    0    0    sky130_fd_pr__nfet_01v8_lvt W=12 L=3 nf=1 m=1

* Miller compensation
RZ     n2    ncomp 10k
CC     ncomp out   250f
.ends dut
