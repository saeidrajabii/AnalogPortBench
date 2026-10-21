.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS diode and its 1:1 sink mirror.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNOUT out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS diode-connected reference branch, biased by the NMOS mirror.
XMPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPBIAS vb1 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMP OUT out vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Unloaded bias outputs; provide the reference gate voltages.
XVB2 vb2 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XVB3 vb3 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XVB4 vb4 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
