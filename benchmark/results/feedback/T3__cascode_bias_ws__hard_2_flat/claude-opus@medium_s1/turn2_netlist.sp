.subckt Cascode_Bias_WS Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* ---- input mirror: self-biased cascode mirror (all cascode gates at Iin) ----
* bottom devices (equal drain voltages -> accurate copies)
XMN4  n4    Iin  0  0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMN6  net1  Iin  0  0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMN7  net2  Iin  0  0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
* wide cascodes (gate = Iin)
XMN5  Iin     Iin n4   0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=4
XMN12 Vbias_2 Iin net1 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=4
XMN11 Vbias_1 Iin net2 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=4
* ---- PMOS cascode gate: degenerated diode, sources of MP2/MP0 sit at VDD-I*R ----
RP4   vdd   np4  6.5k
XMP4  Vbias_2 Vbias_2 np4 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
* ---- PMOS replica (Vbias_1) ----
XMP3  net13 Vbias_1 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
XMP2  Vbias_1 Vbias_2 net13 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
* ---- PMOS copies feeding NMOS bias branches ----
XMP7  net5  Vbias_1 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
XMP6  Vbias_3 Vbias_2 net5 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
XMP11 net6  Vbias_1 vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
XMP10 Vbias_4 Vbias_2 net6 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
* ---- NMOS cascode gate: degenerated diode, sources of MN9/MN2 sit at I*R ----
XMN8  Vbias_3 Vbias_3 nn8 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=3 nf=1 m=12
RN8   nn8   0    6.5k
* ---- NMOS replica (Vbias_4) ----
XMN9  Vbias_4 Vbias_3 net10 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=3 nf=1 m=12
XMN10 net10 Vbias_4 0     0 sky130_fd_pr__nfet_01v8_lvt W=50 L=3 nf=1 m=12
.ends Cascode_Bias_WS

.subckt dut iin out vb1 vb2 vb3 vb4
XI0 iin vb1 vb2 vb3 vb4 Cascode_Bias_WS
XMN0 nsrc vb4 0    0   sky130_fd_pr__nfet_01v8_lvt W=50 L=3 nf=1 m=12
XMN2 out  vb3 nsrc 0   sky130_fd_pr__nfet_01v8_lvt W=50 L=3 nf=1 m=12
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=12
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=36
.ends dut
