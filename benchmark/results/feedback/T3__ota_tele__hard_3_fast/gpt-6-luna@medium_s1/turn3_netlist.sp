.subckt dut iref inp inn out
* NMOS reference sink and mirrored differential-pair tail current
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS bias reference and mirrored loads
XBIASN pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPBIAS  pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPL     x1   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12.5 L=2 nf=1 m=1
XPR     x2   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12.5 L=2 nf=1 m=1
XPOUT   out  pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1

* Differential input stage; x1 provides an inverting first-stage output
XINP    x1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XINN    x2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Inverting common-source output stage
XOUT    out  xz   0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
RZ      x1   xz   2k
CC      xz   out  0.25p
.ends dut
