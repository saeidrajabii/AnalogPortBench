.subckt dut iref inp inn out
* Reference-current mirror and input-pair tail bias
XREF    iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4  L=1   nf=1 m=1
XTAIL   tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XINP    n2   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=1
XINN    n1   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1   nf=1 m=1
XPLD1   n1   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1   nf=1 m=1
XPLD2   n2   n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1   nf=1 m=1

* Mirrored bias for the second-stage PMOS load
XBNB    vbp  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=8  L=1   nf=1 m=1
XPBREF  vbp  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8  L=1   nf=1 m=1

* Common-source second stage and Miller compensation
XSTAGE2 out  n2   0    0    sky130_fd_pr__nfet_01v8_lvt W=80 L=1   nf=1 m=1
XPLOAD  out  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8  L=1   nf=1 m=1
RZ      n2   ncomp 3k
CC      ncomp out  2p
.ends dut
