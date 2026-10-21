.subckt dut iref inp inn out
* Reference-current sink and mirrored NMOS bias currents
XMREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5  L=0.5 nf=1 m=1
XMBIAS pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5  L=0.5 nf=1 m=1

* PMOS bias branch and second-stage pull-up
XMPREF pb   pb    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=5  L=0.5 nf=1 m=1
XMP2   out  pb    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=60 L=1.0 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XMTAIL ntail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN1   n1    inn   ntail 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMN2   x     inp   ntail 0   sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMP1   n1    n1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMP0   x     n1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Second gain stage and Miller compensation
XMN3   out   x     0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.0 nf=1 m=1
RCOMP  x     ncomp 1k
CCOMP  ncomp out   1p
.ends dut
