.subckt dut iref inp inn out
* Reference-current mirrors
XNREF   iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.0 nf=1 m=1
XNTAIL  tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.0 nf=1 m=2
XNBP    pbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.0 nf=1 m=4
XNSINK  out   iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.0 nf=1 m=4

* PMOS bias reference and first-stage active load
XPBIAS  pbias pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4 L=1.0 nf=1 m=4
XPL     d1    d1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=1
XPR     x     d1    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=1

* NMOS differential input pair
XMN1    d1    inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2    x     inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS common-source second stage
XMP2    out   x     vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=2 L=1.0 nf=1 m=4

* Miller compensation
CCOMP   x     out   1.5p
.ends dut
