.subckt dut iin out vb1 vb2 vb3 vb4
* ---- NMOS self-biased wide-swing cascode reference ----
Rt   iin vb3 1
R1   vb3 vb4 10k
XMN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=12
XMN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=12
* ---- replica NMOS cascode sinking Iref from PMOS reference ----
XMN5 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=12
XMN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=12
* ---- PMOS self-biased wide-swing cascode reference ----
R2   vb1 vb2 10k
XMP0B vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=40
XMP1B p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=40
* ---- output NMOS cascode sink ----
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=12
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=12
* ---- output PMOS cascode source ----
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=40
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=40
.ends dut
