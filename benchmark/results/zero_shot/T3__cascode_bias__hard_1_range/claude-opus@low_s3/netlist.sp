.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference (low-voltage cascode), Iref into drain of MN3
XMN1 nx vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN3 iin vb3 nx 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
* NMOS replica sinks 20uA from PMOS reference branch
XMN5 ny vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN6 vb1 vb3 ny 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
* PMOS reference (low-voltage cascode)
XMP1 py vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=4
XMP3 vb1 vb2 py vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=4
* vb3 generator: narrow NMOS diode fed by PMOS copy
XMPC3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=4
XMNB3 vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
* vb2 generator: narrow PMOS diode fed by NMOS copy
XMNC2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMPB2 vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Output cascode sink and source
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMP0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=4
XMP2 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=4
.ends dut
