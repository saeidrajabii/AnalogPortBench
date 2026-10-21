.subckt dut iref inp inn out
* Reference sink and matched PMOS bias reference
XMREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=160 L=8 nf=1 m=1
XMNREF pref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=160 L=8 nf=1 m=1
XMPREF pref  pref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=160 L=8 nf=1 m=1

* Differential input stage: 40 uA tail current
XMTAIL ntail iref  0     0    sky130_fd_pr__nfet_01v8_lvt W=320 L=8 nf=1 m=1
XMN1   nleft inn   ntail 0    sky130_fd_pr__nfet_01v8_lvt W=160 L=8 nf=1 m=1
XMN2   n1    inp   ntail 0    sky130_fd_pr__nfet_01v8_lvt W=160 L=8 nf=1 m=1
XMP1   nleft nleft vdd   vdd  sky130_fd_pr__pfet_01v8_lvt W=160 L=8 nf=1 m=1
XMP2   n1    nleft vdd   vdd  sky130_fd_pr__pfet_01v8_lvt W=160 L=8 nf=1 m=1

* Second gain stage; bias current mirrored from the reference
XMOUT  out   n1    0     0    sky130_fd_pr__nfet_01v8_lvt W=320 L=8 nf=1 m=1
XMPLOAD out   pref  vdd   vdd  sky130_fd_pr__pfet_01v8_lvt W=320 L=8 nf=1 m=1

* Miller compensation
RZ n1 ncomp 2k
CC ncomp out 500f
.ends dut
