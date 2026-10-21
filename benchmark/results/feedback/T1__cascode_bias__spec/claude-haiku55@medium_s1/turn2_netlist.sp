.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* NMOS reference diode (carries Iref)
XMN1 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* NMOS cascode reference diode (stacked on MN1)
XMN3 Vbias_3 Vbias_3 Vbias_4 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* NMOS sink that generates the PMOS reference current from vdd through the PMOS diodes
XMNS Vbias_2 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS reference diodes stacked from vdd
XMP1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMP0 Vbias_2 Vbias_2 Vbias_1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
* Iin to cascode diode (1 ohm, effectively a short)
RR0 Iin Vbias_3 1
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
.ends dut
