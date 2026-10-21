.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: self-biased low-voltage cascode ----
R1 iin vb4 10k
XMR2 vb4 iin nr 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMR1 nr vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
Rvb3 iin vb3 1
* ---- PMOS bias branch: NMOS cascode copy sinks Iref ----
XMB2 vb2 vb3 nb 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMB1 nb vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
R2 vb1 vb2 12k
XMPB2 vb1 vb2 pb vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XMPB1 pb vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
* ---- Output cascode sink and source ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
.ends dut
