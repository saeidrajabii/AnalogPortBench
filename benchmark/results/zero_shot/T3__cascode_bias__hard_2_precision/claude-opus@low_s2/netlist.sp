.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS reference: bottom gate taken from cascode drain (Vds matched to output) ----
XMN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
RIN iin vb4 1
* ---- NMOS cascode gate bias (weak diode) ----
RB3 vdd vb3 22k
XMN5 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* ---- NMOS copy feeding PMOS reference ----
XMN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN6 vb1 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* ---- PMOS reference: bottom gate taken from cascode drain ----
XMP2 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMP3 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
* ---- PMOS cascode gate bias (weak diode) ----
XMP5 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
RB2 vb2 0 22k
* ---- Output cascode sink and source ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
.ends dut
