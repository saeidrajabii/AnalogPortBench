.subckt dut iin out vb1 vb2 vb3 vb4
* ---- bias generator (reference 20 uA enters iin, mirrored by diodes) ----
RR0 iin vb3 1
XMB3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMB4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMB0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMB2 vb1 vb3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMP1B vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
* PMOS cascode gate bias from resistor divider (about 0.4 V)
RB1 vdd vb2 20k
RB2 vb2 0 10k

* ---- output stage ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=7 L=0.5 nf=1 m=1
.ends dut
