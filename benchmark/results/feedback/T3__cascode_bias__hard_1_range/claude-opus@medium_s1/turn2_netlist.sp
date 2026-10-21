.subckt dut iin out vb1 vb2 vb3 vb4
* iin -> vb4 tie (only gates on vb4, no current in R0)
R0 iin vb4 1

* NMOS reference stack (low-voltage cascode, bottom gates from cascode drain)
XNR1 nr  vb4 0  0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XNR2 iin vb3 nr 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24

* vb3 generator
R1   vdd vb3 36k
XNB3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=2 nf=1 m=1

* NMOS copy of Iref -> PMOS reference stack
XNC1 nc  vb4 0  0   sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XNC2 vb1 vb3 nc 0   sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XPR1 pr  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=40
XPR2 vb1 vb2 pr  vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=40

* vb2 generator
XNV1 nb  vb4 0  0   sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XNV2 vb2 vb3 nb 0   sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XPB2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=93 L=1 nf=1 m=1

* Output cascodes
XN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=24
XP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=40
XP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=40
.ends dut
