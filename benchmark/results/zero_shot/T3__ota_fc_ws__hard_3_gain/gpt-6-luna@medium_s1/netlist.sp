.subckt dut iref inp inn out
* NMOS reference sink and mirrored tail current
XMREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMTAIL ntail iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* PMOS bias reference
XMBIAS pbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPBIAS pbias pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* NMOS differential input pair
XM1 nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 n1    inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS current-mirror load
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XMP2 n1    nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Second gain stage and its PMOS current-source load
XM3  out n1 0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XMP3 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Miller compensation
RZ n1 ncomp 2k
CC ncomp out 1p
.ends dut
