.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS bias reference: iin feeds the diode-connected cascode device MN3 (vb3), which stacks on the diode MN1 (vb4)
RR0 iin vb3 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* PMOS bias reference: diode-connected PMOS stack (vb1, vb2) sunk by an NMOS copy of the mirror (gate vb4)
XMPR1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPR0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNR vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* NMOS cascode current sink to out
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* PMOS cascode current source from vdd to out
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
