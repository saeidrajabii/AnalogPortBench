.subckt Cascode_Bias_WS iin vb1 vb2 vb3 vb4
* Reference diode (copy of iin reference)
XMN4 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
* vb1: PMOS diode sunk by an NMOS copy of the reference
XMNE vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XMPD1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* vb2: PMOS diode stacked on a PMOS copy of the vb1 device
XMNF vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XMPD2 vb2 vb2 y vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMPY y vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
* vb4: NMOS diode carrying the reference current
XMD4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
* vb3: NMOS diode stacked on vb4, fed by a PMOS copy
XMD3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XMPS3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.3 nf=1 m=1
* PMOS cascode source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
.ends dut
