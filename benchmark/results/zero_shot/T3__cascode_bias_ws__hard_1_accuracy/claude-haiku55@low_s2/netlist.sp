.subckt dut iin out vb1 vb2 vb3 vb4
* ---- Reference sink: diode-connected NMOS sinks the 20 uA from iin
XMref iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- vb1 (PMOS current-source gate): PMOS diode sources, NMOS mirror sinks
XMPd1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNm1 vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- vb2 (PMOS cascode gate): PMOS mirror copy, stacked PMOS diode, NMOS sink
XMPc1 n1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPc2 vb2 vb2 n1 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNc2 vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- vb3 (NMOS cascode gate): PMOS mirror source, stacked NMOS diode, NMOS sink
XMPc3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNc3 vb3 vb3 n3 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNc4 n3 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- vb4 (bottom NMOS gate): PMOS mirror source, NMOS diode
XMPb4 vb4 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNb4 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- Output NMOS cascode sink (to ground)
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---- Output PMOS cascode source (from vdd)
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
