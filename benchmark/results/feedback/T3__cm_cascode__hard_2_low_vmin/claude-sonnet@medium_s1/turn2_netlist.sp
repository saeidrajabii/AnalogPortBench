.subckt dut in out
* bottom mirror devices (gate = in)
XMN1 n1 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMN0 n2 in 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
* cascode devices (gate = vb)
XMN3 in vb n1 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XMN2 out vb n2 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
* bias branch: copy of Iref via PMOS mirror
XMN6 pd in 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XMP1 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
XMP2 vb pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=2 nf=1 m=1
XMN7 vb vb s 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
R1 s 0 4.5k
.ends dut
