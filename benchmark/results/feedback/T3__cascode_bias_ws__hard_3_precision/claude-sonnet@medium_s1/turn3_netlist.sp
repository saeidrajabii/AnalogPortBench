.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference diode (bottom gate = Iin) and vb4 copy
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=8 nf=1 m=4
RV4 Iin Vbias_4 1
* NMOS cascode bias: diode + source resistor, fed from cascoded PMOS mirror
XMPm pm Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=8 nf=1 m=6
XMPmc Vbias_3 Vbias_2 pm vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
XMNd Vbias_3 Vbias_3 s3 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
R3 s3 0 11k
RST vdd Vbias_3 2Meg
* PMOS reference diode fed by replica of NMOS cascode stack
XMPd Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=8 nf=1 m=6
XMNc Vbias_1 Vbias_3 nc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMNcb nc Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=8 nf=1 m=4
* PMOS cascode bias: diode + source resistor to vdd, sunk by NMOS copy
XMPd2 Vbias_2 Vbias_2 s2 vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
R2 vdd s2 7.5k
XMNx Vbias_2 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=8 nf=1 m=4
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=8 nf=1 m=4
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=8 nf=1 m=6
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
.ends dut
