.subckt dut iref inp inn out
* 20 uA NMOS reference; mirrored currents set the tail and output-stage bias.
XMREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=32 L=8 nf=1 m=1
XMNREF pref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=32 L=8 nf=1 m=1
XMPREF pref  pref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=32 L=8 nf=1 m=1

* NMOS differential pair and PMOS mirror load
XMTAIL ntail iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=64 L=8 nf=1 m=1
XMN1   nleft inn   ntail 0    sky130_fd_pr__nfet_01v8_lvt W=160 L=8 nf=1 m=1
XMN2   n1    inp   ntail 0    sky130_fd_pr__nfet_01v8_lvt W=160 L=8 nf=1 m=1
XMP1   nleft nleft vdd   vdd  sky130_fd_pr__pfet_01v8_lvt W=160 L=8 nf=1 m=1
XMP2   n1    nleft vdd   vdd  sky130_fd_pr__pfet_01v8_lvt W=160 L=8 nf=1 m=1

* Common-source second stage with mirrored PMOS load
XMOUT  out   n1    0     0    sky130_fd_pr__nfet_01v8_lvt W=96 L=8 nf=1 m=1
XMPLOAD out   pref  vdd   vdd  sky130_fd_pr__pfet_01v8_lvt W=96 L=8 nf=1 m=1

* Miller compensation
RZ n1 ncomp 2k
CC ncomp out 2.5p
.ends dut
