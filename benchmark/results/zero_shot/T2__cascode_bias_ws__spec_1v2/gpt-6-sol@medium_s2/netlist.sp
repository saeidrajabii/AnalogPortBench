.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current mirror
Rgate iin vb4 1m
XNref iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=20

* PMOS current-reference bias
XNpb vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=20
XPref vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=60

* NMOS cascode bias
XPnb vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=60
XNcb vb3 vb3 nrep 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=20
RNbias nrep 0 6k

* PMOS cascode bias
RPbias vdd prep 6k
XPcb vb2 vb2 prep vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=60
XNpp vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=20

* Cascoded output sink and source
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=20
XN1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=3 nf=1 m=20
XP0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=60
XP1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=3 nf=1 m=60
.ends dut
