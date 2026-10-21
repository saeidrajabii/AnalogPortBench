.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS low-voltage cascode reference (Iref into drain of cascode)
XMN3 iin vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN1 n1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
Rv4 iin vb4 1
* vb3 generator: PMOS mirror feeds W/5 NMOS diode
XMPS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNB vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS reference branch: cascoded NMOS sink pulls Iref from PMOS LV cascode
XMN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN5 vb1 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP0 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* vb2 generator: NMOS mirror pulls from W/5 PMOS diode
XMNS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPB vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Output cascode sink and source
XMN0o nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2o out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMP1o psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XMP0o out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
