.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS bias: iin -> R -> vb3 (diode, cascode) -> vb4 (diode) -> 0
RR0 iin vb3 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* NMOS sink cascode (output)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS bias: vb1 diode-connected, sunk by an NMOS mirror of vb4
XMP1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNcur vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* vb2 set by resistive divider (about 0.45 V)
R1 vdd vb2 16.7k
R2 vb2 0 10k

* PMOS source cascode (output)
XMPo1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMPo0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
