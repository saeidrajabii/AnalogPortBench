.subckt dut iin out vb1 vb2 vb3 vb4
* Bias generator: NMOS stack (MN1/MN3) and PMOS stack (MP1/MP0), each diode-connected
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.4 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10.4 L=0.5 nf=1 m=1
RR0 iin vb3 1
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XMP0 vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1

* Output NMOS cascode current sink (to ground)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10.4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10.4 L=0.5 nf=1 m=1

* Output PMOS cascode current source (from vdd)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=0.5 nf=1 m=1
.ends dut
