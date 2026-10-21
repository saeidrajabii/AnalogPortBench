.subckt Cascode_Bias_WS iin vb1 vb2 vb3 vb4
* reference: Iin into the cascode drain, bottom gate tied to Iin
R0    iin  vb4  1
XNC0  iin  vb3  n0   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNB0  n0   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* vb2: PMOS cascode gate bias (long diode fed by a simple NMOS mirror)
XPD2  vb2  vb2  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XNB2  vb2  vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* vb3: NMOS cascode gate bias (diode fed by a PMOS copy of the vb2 diode)
XPS3  vb3  vb2  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XND3  vb3  vb3  0    0   sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
* vb1: wide-swing PMOS reference, current set by a cascoded NMOS copy of Iref
XPB1  p1   vb1  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=6
XPC1  vb1  vb2  p1   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=6
XNC1  vb1  vb3  n1   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XNB1  n1   vb4  0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0  iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
* NMOS cascode sink
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS cascode source
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=6
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=6
.ends dut
