.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS wide-swing self-biased cascode reference (Iref mirrored, enters drain node via R)
RN iin vb4 12k
XMN3 vb4 iin n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
RB3 iin vb3 1
* NMOS replica sinking current from PMOS bias branch
XMN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN5 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS wide-swing self-biased cascode bias
XMP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP0 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
RP vb1 vb2 15k
* Output cascode sink and source
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMP2 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMP3 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
