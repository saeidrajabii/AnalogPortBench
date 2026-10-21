.subckt dut iref inp inn out
* 20 uA NMOS reference and PMOS bias mirror
XNREF    iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XNBSINK  pbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XPBREF   pbias pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* NMOS differential pair with 40 uA tail current
XTAIL    tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XINP     x1    inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XINN     xref  inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* PMOS mirror load
XPMREF   xref  xref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPLOAD   x1    xref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Second gain stage: 80 uA PMOS source and NMOS sink
XPSECOND out   pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=48 L=1.5 nf=1 m=1
XNSECOND out   iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Miller compensation with series nulling resistor
RZ x1 ncomp 2k
CC ncomp out 300f
.ends dut
