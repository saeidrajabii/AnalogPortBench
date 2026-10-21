.subckt dut iin out vb1 vb2 vb3 vb4
* reference diode (Iin mirrored, not into a source)
XMN1 iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
R0 iin vb4 1
* vb2 branch: NMOS mirror sinks Iref from small PMOS diode (Vsg+Vov)
XMNq vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPq vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
* vb1 branch: low-voltage (Sooch) PMOS cascode bias
XMNm nb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPb nb1 vb2 pm vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XMPa pm vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
R1 nb1 vb1 1
* vb3 branch: PMOS mirror feeds small NMOS diode (Vgs+Vov)
XMPr vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XMNr vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* output cascode sink
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* output cascode source
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=4
.ends dut
