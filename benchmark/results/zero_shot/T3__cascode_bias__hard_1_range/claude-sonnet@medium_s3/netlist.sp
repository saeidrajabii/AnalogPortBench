.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
RR0 iin vb3 1
* NMOS leg feeding PMOS cascode-bias diode (vb2)
XMN0 net4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMN2 vb2 vb3 net4 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
RB vdd nsc 7.5k
XMPc vb2 vb2 nsc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
* NMOS leg feeding PMOS mirror diode (vb1)
XMN4 net5 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMN5 vb1 vb3 net5 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMP1d vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
* Output stage
XMNo0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMNo2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMPo1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPo0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
.ends dut
