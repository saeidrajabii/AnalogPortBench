.subckt dut iin out vb1 vb2 vb3 vb4
* ---- bias generator (reference enters iin, 1 ohm link to vb3 as in source)
Rref iin vb3 1
XMB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB2 vb2 vb3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP1B vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMP0B vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
* ---- output stage: NMOS cascode sink and PMOS cascode source at out
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
.ends dut
