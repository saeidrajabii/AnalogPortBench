.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS bias branch: iin -> vb3 -> RN -> vb4 (diode MN1)
RN vb3 vb4 8k
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* second bias branch: mirrors current, feeds PMOS diode + resistor
XMN0b nb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2b vb2 vb3 nb4 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
RP vb1 vb2 8k
XMP1b vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* output stage
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
.ends dut
