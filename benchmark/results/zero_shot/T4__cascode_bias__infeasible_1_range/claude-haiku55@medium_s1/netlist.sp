.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generator (same topology as the source Cascode_Bias block)
RR0 iin vb3 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN0b net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2b vb2 vb3 net4 net4 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP1b vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP0b vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Output cascode sink (to ground)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Output cascode source (from vdd)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
