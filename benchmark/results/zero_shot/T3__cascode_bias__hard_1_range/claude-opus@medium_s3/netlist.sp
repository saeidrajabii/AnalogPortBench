.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: low-voltage cascode, self-biased by R1 ----
* vb3 = vb4 + Iref*R1, so bottom device Vds = Iref*R1 - (Vgs3 - Vgs1) ~ 0.1 V
R0  iin vb3 1
R1  vb3 vb4 6.8k
XMN3 vb4 vb3 n1  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=5
XMN1 n1  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=5

* ---- NMOS copy that sinks Iref out of the PMOS reference branch ----
XMN5 vb2 vb3 n2  0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=5
XMN4 n2  vb4 0   0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=5

* ---- PMOS reference: same low-voltage cascode, self-biased by R2 ----
XMP3 p1  vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.8 nf=1 m=14
XMP4 vb1 vb2 p1  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.8 nf=1 m=14
R2  vb1 vb2 6.8k

* ---- Output NMOS cascode sink ----
XMN0 nsrc vb4 0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=5
XMN2 out  vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.8 nf=1 m=5

* ---- Output PMOS cascode source ----
XMP1 psrc vb1 vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.8 nf=1 m=14
XMP0 out  vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.8 nf=1 m=14
.ends dut
