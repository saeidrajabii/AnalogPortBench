.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS bias stack (diode stack, current from iin)
XN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
RR0 iin vb3 1
* mirror branch generating vb1 (PMOS diode)
XNa na vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XNe vb1 vb3 na 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPd vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS wide-swing cascode bias branch
XPb1 xb vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XPb0 vb2 vb2 xb vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
R0 vb2 0 29k
* output stage
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
