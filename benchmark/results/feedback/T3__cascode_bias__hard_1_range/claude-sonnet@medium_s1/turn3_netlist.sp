.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference branch
RR0 Iin Vbias_3 1
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
* mirror leg 1: feeds PMOS replica stack (sets vb1), trimmed +0.5%
XMN0 Vbias_1 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60.3 L=1 nf=1 m=1
* PMOS replica stack
XMP1 xb Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP0 Vbias_1 Vbias_2 xb vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
* mirror leg 2: sets vb2 through resistor level shift
XMN0r Vbias_2 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
RS vdd sr 5k
XMP0r Vbias_2 Vbias_2 sr vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
.ends dut
