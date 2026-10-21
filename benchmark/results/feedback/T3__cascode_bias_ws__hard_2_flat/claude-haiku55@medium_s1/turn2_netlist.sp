.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Reference diode and NMOS copy that sinks 20 uA from the vb1 PMOS diode
XMN4 Iin Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNc1 Vbias_1 Iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS diode at vb1 (Vsg sets the PMOS bottom-source gate)
XMPb1 Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.5 nf=1 m=1
* PMOS copy sources 20 uA into the vb4 diode
XMPc4 Vbias_4 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.5 nf=1 m=1
* NMOS diode at vb4 (matches the sink device in dut)
XMNb4 Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Cascode gate voltages from ideal resistor dividers
Rb3t vdd Vbias_3 8.4k
Rb3b Vbias_3 0 11.8k
Rb2t vdd Vbias_2 15k
Rb2b Vbias_2 0 9.7k
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.5 nf=1 m=1
.ends dut
